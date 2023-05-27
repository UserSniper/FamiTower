    .export _enable_grayscale, _toggle_grayscale, _disable_grayscale
    .export famistudio_dpcm_bank_callback, _music_play, _sfx_sample_play
    .export _oam_meta_spr_hflipped
    .export _unpack_tiles

.SEGMENT "ZEROPAGE"

TILE_CNT    =TEMP+2
;RLE_BYTE    =TEMP+3
FLAG_CNT    =TEMP+4
BIT_IN_CNT  =TEMP+5
BIT_OUT_CNT =TEMP+6
RLE_FLAGS   =TEMP+7
RLE_DELTA   =TEMP+8
RLE_TEMPA   =TEMP+9
RLE_TEMPB   =TEMP+10

.segment "BSS"
    decomp_buffer: .res 16  ;For GFX RLE

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

;void __fastcall__ music_play(unsigned char song);
_music_play:
    PHA
    LSR
    LSR
    LSR
    PHA
    CLC
    ADC #$0A
    LDX #MMC3_REG_SEL_PRG_BANK_1
    JSR mmc3_internal_set_bank
    PLA
    CMP current_song_bank
    BEQ :+
    ;If different bank than before reinitalize FS
        STA current_song_bank
        TAY
        LDX @music_data_locations_lo, Y
        LDA @music_data_locations_hi, Y
        TAY
        LDA #$01
        JSR famistudio_init
    :
    PLA
    AND #$07
    JSR famistudio_music_play
    
    LDA mmc3PRG1Bank
    LDX #MMC3_REG_SEL_PRG_BANK_1
    JMP mmc3_internal_set_bank


@music_data_locations_lo:
.byte <music_data_1_, <music_data_2_
@music_data_locations_hi:
.byte >music_data_1_, >music_data_2_

;void __fastcall__ sfx_sample_play(unsigned char index);
_sfx_sample_play:
    PHA
    LDA current_song_bank
    CLC
    ADC #$0A
    LDX #MMC3_REG_SEL_PRG_BANK_1
    JSR mmc3_internal_set_bank
    PLA
    JSR famistudio_sfx_sample_play
    LDA mmc3PRG1Bank
    LDX #MMC3_REG_SEL_PRG_BANK_1
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
    LDX #$03
    STX BIT_IN_CNT
    LDX #$04
    STX BIT_OUT_CNT
    LDX #$00
    STX <RLE_DELTA
    LDA (PTR), Y
    INY
    BNE @RLEParseHeader
    INC PTR+1

@RLEParseHeader:
    ASL             ;Get delta encoding bit
    ROL <RLE_DELTA
    ASL             ;Get initial packet type
    BCC @RLEZeroPacket

@RLEDataPacketLoop:
    PHA
    AND #$C0
    BEQ @RLEZeroPacketFromData
    PLA
    ASL             ;
    ROL <RLE_BYTE   ;   Get the bit pair
    ASL             ;
    ROL <RLE_BYTE   ;
    
    DEC BIT_IN_CNT
    BNE :+
    ;Update counter
    LDA #$04
    STA BIT_IN_CNT
    ;Get new byte
    LDA (PTR), Y
    INY
    BNE :+
    INC PTR+1
    :

    DEC BIT_OUT_CNT
    BNE @RLEDataPacketLoop
    ;Write the byte to the buffer
    STA <RLE_TEMPA   ;Same as PHA
    LDA <RLE_BYTE
    STA decomp_buffer, X
    ;Update counter
    LDA #$04
    STA BIT_OUT_CNT
    LDA <RLE_TEMPA   ;Cheaper than PLA
    INX
    CPX #$10
    BNE @RLEDataPacketLoop
    RTS

@RLEZeroPacketFromData:
    PLA
    ;Coming from data packet, remove the terminating 00 pair
    ASL
    ASL
@RLEZeroPacket:
    ;The IN counter used to count *pairs* of bits
    ;That's why this adjustment exists
    ASL BIT_IN_CNT
    INC BIT_IN_CNT
    STX <RLE_TEMPA   ;X is used for other purposes here
    LDX #$00
@RLEZeroPacketLengthLoop:
    DEC BIT_IN_CNT
    BNE :+
    ;
    ;Update counter
    LDA #$09
    STA BIT_IN_CNT
    ;Get new byte
    LDA (PTR), Y
    INY
    BNE :+
    INC PTR+1
    
    :
    ASL
    INX
    BCS @RLEZeroPacketLengthLoop

@RLEZeroPacketAddition:
    STY PTR
    LDY #$01
    STY <RLE_TEMPB
    LDY PTR
    PHA
    LDA #$00
    STA PTR
    PLA

@RLEZeroPacketAdditionLoop:
    DEC BIT_IN_CNT
    BNE :+
    ;
    ;Update counter
    LDA #$09
    STA BIT_IN_CNT
    ;Get new byte
    LDA (PTR), Y
    INY
    BNE :+
    INC PTR+1
    
    :
    ASL
    ROL <RLE_TEMPB
    DEX
    BNE @RLEZeroPacketAdditionLoop
@RLEZeroPacketZeroInsertion:
    DEC BIT_IN_CNT
    LSR BIT_IN_CNT
    DEC <RLE_TEMPB ;Decrement amount of bit pairs 
    LDX <RLE_TEMPA ;Recover X
    PHA
;Loop 1, possibly containing old data
@RLEZeroPacketLoop1:
    ASL <RLE_BYTE
    ASL <RLE_BYTE
    DEC <RLE_TEMPB
    BEQ @RLEZeroPacketToData
    DEC BIT_OUT_CNT
    BNE @RLEZeroPacketLoop1
;Before Loop 2
    ;Write the byte to the buffer
    LDA <RLE_BYTE
    STA decomp_buffer, X
    ;Update counter
    LDA #$04
    STA BIT_OUT_CNT
    INX
    CPX #$10
    BEQ @EndPLA
;Loop 2, just writing zeros:
@RLEZeroPacketLoop2:
    LDA <RLE_TEMPB
    CMP #$04
    BMI @RLEZeroPacketLoop3
    SEC
    SBC #$04
    STA <RLE_TEMPB
    LDA #$00
    STA decomp_buffer, X
    INX
    CPX #$10
    BNE @RLEZeroPacketLoop2

@EndPLA:
    PLA
    RTS
;Loop 3, the remaining bits
@RLEZeroPacketLoop3:
    LDA #$00
    STA <RLE_BYTE
    LDA <RLE_TEMPB
    STA BIT_OUT_CNT
@RLEZeroPacketToData:
    PLA
    JMP @RLEDataPacketLoop
        


