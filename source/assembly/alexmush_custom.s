    .export _enable_grayscale, _toggle_grayscale, _disable_grayscale
    .export _draw_bg_asm
    .import _which_bg, _temp_y, _temp2, _Collision_Maps

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

;void __fastcall__ draw_bg_asm(void);

_draw_bg_asm:
;
; ppu_off();
;
	jsr     _ppu_off
; p_maps = Collision_Maps[which_bg];
	ldx     #$00
	lda     <_which_bg
	asl     a
	bcc     @lt256
	inx
	clc
@lt256:	adc     #<(_Collision_Maps)
	sta     <ptr1
	txa
	adc     #>(_Collision_Maps)
	sta     <ptr1+1
	ldy     #$01
	lda     (ptr1),y
	sta     <_temp2
	dey
	lda     (ptr1),y
	STA     <ptr1
    LDA     <_temp2
    sta     <ptr1+1
; vram_adr(NAMETABLE_A);
	ldx     #$20
    stx PPU_ADDR
    sty PPU_ADDR
; temp1 = 0;
	sty     <_temp2
; for(temp_y = 4; temp_y != 0; --temp_y){
    lda     #$04
    sta <_temp_y
; for(temp_x = 0; temp_x != 0; ++temp_x){{
@LoopL0:	ldy     #$00
@LoopL1:
	lda     (ptr1),y
	sta     PPU_DATA
; for(temp_x = 256; temp_x != 0; --temp_x){{
	iny
	bne     @LoopL1
; for(temp_y = 4; temp_y != 0; --temp_y){
    inc     <ptr1+1
	dec     <_temp_y
	bne     @LoopL0
; ppu_on_all();
	jmp     _ppu_on_all
    rts