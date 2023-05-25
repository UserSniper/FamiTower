    .export _enable_grayscale, _toggle_grayscale, _disable_grayscale
    .export famistudio_dpcm_bank_callback
    .export _oam_meta_spr_hflipped
    .export _unpack_tiles

.SEGMENT "CODE"

;alexmush's debug additions

;void __fastcall__ enable_grayscale(void);

_enable_grayscale:
    lda <PPU_MASK_VAR
    ora #%00000001
    sta <PPU_MASK_VAR
    sta PPU_MASK
    rts

;void __fastcall__ toggle_grayscale(void);

_toggle_grayscale:
    lda <PPU_MASK_VAR
    eor #%00000001
    sta <PPU_MASK_VAR
    sta PPU_MASK
    rts

;void __fastcall__ disable_grayscale(void);

_disable_grayscale:
    lda <PPU_MASK_VAR
    and #%11111110
    sta <PPU_MASK_VAR
    sta PPU_MASK
    rts

famistudio_dpcm_bank_callback:
    CLC
    ADC #$0C
    LDX #MMC3_REG_SEL_PRG_BANK_0
    JMP mmc3_internal_set_bank

;unsigned char __fastcall__ oam_meta_spr_hflipped(unsigned char x,unsigned char y,unsigned char sprid,const unsigned char *data);

_oam_meta_spr_hflipped:

    sta <PTR
    stx <PTR+1

    ldy #2      ;three popa calls replacement, performed in reversed order
    lda (sp),y
    dey
    sta <SCRX
    lda (sp),y
    dey
    sta <SCRY
    lda (sp),y
    tax

@1:

    lda (PTR),y     ;x offset
    cmp #$80
    beq @2
    iny
    eor #$FF
    clc
    ADC <SCRX
    SEC
    sbc #$08
    sta OAM_BUF+3,x
    lda (PTR),y     ;y offset
    iny
    clc
    adc <SCRY
    sta OAM_BUF+0,x
    lda (PTR),y     ;tile
    iny
    sta OAM_BUF+1,x
    lda (PTR),y     ;attribute
    INY
    ora #$40
    sta OAM_BUF+2,x
    inx
    inx
    inx
    inx
    jmp @1

@2:

    lda <sp
    adc #2          ;carry is always set here, so it adds 3
    sta <sp
    bcc @3
    inc <sp+1

@3:

    txa
    rts

;Format:
;1 byte - amount of 8x8 tiles
;   Repeat amount of tiles / 8 times:
;1 byte - flags whether the tile is stored as raw data or RLE encoded
;X bytes - actual data

;void __fastcall__ unpack_tiles(const unsigned char* data);
_unpack_tiles:
    TAY
    LDA #$00
    STA <PTR
    STX <PTR+1
    ; Get total tile count
    LDA (PTR), Y
    STA <TILE_CNT
    INY
    BNE @GetRLEFlags
    INC <PTR+1

@GetRLEFlags:
    LDA #$08
    STA <FLAG_CNT
    LDA (PTR), Y
    STA <RLE_FLAGS
    INY
    BNE @NewTile
    INC <PTR+1

@NewTile:
    ASL <RLE_FLAGS
    BCS @RLEDecompress
    LDX #$10
    
@NotCompressedLoop1:
    LDA (PTR), Y
    STA PPU_DATA
    INY
    BNE @NotCompressedLoop2
    INC <PTR+1
@NotCompressedLoop2:
    DEX
    BNE @NotCompressedLoop1
    DEC <TILE_CNT
    BEQ @End
    DEC <FLAG_CNT
    BNE @NewTile
    BEQ @GetRLEFlags

@End:
    RTS

;RLE Format (based on 1st Gen Pokemon):
;1 bit - whether the data is delta-encoded
;1 bit - starting packet type (0 if zero, 1 if data)
;variable - actual data:
;   Zero packet:
;   x bits - 1s ending with a 0, specifies the length of the following number
;   x bits - amount of 00 pairs + 1 with the leading bit stripped
;   Data packet:
;   2x bits - data in bit pairs
;   2 bits - terminating 00 pair
@RLEDecompress:
    RTS
;     LDX #$06
;     STX <BIT_CNT
;     LDX #$00
;     STX <RLE_DELTA
;     STX <RLE_PTYPE
;     LDA (PTR), Y
;     INY
;     BNE @RLEParseHeader
;     INC <PTR+1

; @RLEParseHeader:
;     ASL             ;Get delta encoding bit
;     ROL <RLE_DELTA
;     ASL             ;Get initial packet type
;     BCC @RLEZeroPacket

; @RLEDataPacket:
    