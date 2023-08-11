    .export _enable_grayscale, _toggle_grayscale, _disable_grayscale
    .export famistudio_dpcm_bank_callback, _music_play, _sfx_sample_play
    .export _oam_meta_spr_hflipped


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
    LDY #$00
    TSX
@bank_loop:
    PHA
    SEC
    SBC @music_counts, Y
    BCC @found_bank
    INY
    TXS ;Act as if no PHA happened
    JMP @bank_loop
    
@found_bank:
    TYA
    PHA
    CLC
    ADC #$09
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
    CLC
    ADC #$01 ;DPCM aligner
    JSR famistudio_music_play
    
    LDA mmc3PRG1Bank
    LDX #MMC3_REG_SEL_PRG_BANK_1
    JMP mmc3_internal_set_bank


@music_data_locations_lo:
.byte <music1_data_, <music2_data_, <music3_data_
@music_data_locations_hi:
.byte >music1_data_, >music2_data_, >music3_data_
@music_counts:
.byte $07, $09, $FF  ;last bank is marked with an FF to always stop bank picking

;void __fastcall__ sfx_sample_play(unsigned char index);
_sfx_sample_play:
    PHA
    LDA current_song_bank
    CLC
    ADC #$09
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
