    .export _enable_grayscale, _toggle_grayscale, _disable_grayscale
    .export famistudio_dpcm_bank_callback

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
    TAY
    LDA @lookup_table, y
    LDX #MMC3_REG_SEL_PRG_BANK_0
    JMP mmc3_internal_set_bank
@lookup_table:
    .byte $04, $05