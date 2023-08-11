;
; CHR ROM data
;
; The files below will be loaded into the game's chr banks directly, and available for your
; use.
;

; First chr bank, this is used by default.
; Each segment is 8kb, but we store data in 4kb tilesets. Each segment thus contains 2 tilesets. 
.segment "ROM_BANK_01"
    _background_graphics:
    .incbin "temp/background.rle"
    _sprite_graphics:
    .incbin "temp/sprite.rle"

; Other chr banks need some data in them - repeated chr data can be replaced.

.export _background_graphics, _sprite_graphics
