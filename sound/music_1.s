; This file for the FamiStudio Sound Engine was copied from music.s and modified manually

.if FAMISTUDIO_CFG_C_BINDINGS
.export _music_data_1_=music_data_1_
.endif

music_data_1_:
	.byte 8
	.word @instruments
	.word @samples-5
	.word @song0ch0,@song0ch1,@song0ch2,@song0ch3,@song0ch4,307,256 ; 00 : Time for a Smackdown! 1
	.word @song1ch0,@song1ch1,@song1ch2,@song1ch3,@song1ch4,307,256 ; 01 : Pizza Deluxe! 1
	.word @song2ch0,@song2ch1,@song2ch2,@song2ch3,@song2ch4,307,256 ; 02 : Mondays 1
	.word @song3ch0,@song3ch1,@song3ch2,@song3ch3,@song3ch4,307,256 ; 03 : Funiculi Holiday 1
	.word @song4ch0,@song4ch1,@song4ch2,@song4ch3,@song4ch4,307,256 ; 04 : hmm look what u done did you found a secret :) V2 1
	.word @song5ch0,@song5ch1,@song5ch2,@song5ch3,@song5ch4,307,256 ; 05 : It's Pizza Time! 1
	.word @song6ch0,@song6ch1,@song6ch2,@song6ch3,@song6ch4,307,256 ; 06 : The Death That I Deservioli 1
	.word @song7ch0,@song7ch1,@song7ch2,@song7ch3,@song7ch4,307,256 ; 07 : Oregano Mirage 1

.export music_data_1_
.global FAMISTUDIO_DPCM_PTR

@instruments:
	.word @env23,@env21,@env27,@env0 ; 00 : main 1
	.word @env14,@env21,@env27,@env0 ; 01 : blank 1
	.word @env14,@env22,@env1,@env0 ; 02 : bass 1
	.word @env18,@env6,@env4,@env0 ; 03 : funny guitar 1
	.word @env38,@env26,@env27,@env0 ; 04 : noise (get it) kick 1
	.word @env15,@env8,@env27,@env0 ; 05 : noise hat 1
	.word @env19,@env25,@env27,@env0 ; 06 : noise snare 1
	.word @env16,@env37,@env27,@env0 ; 07 : 0 12 arp 1
	.word @env33,@env21,@env30,@env0 ; 08 : secret square 1
	.word @env17,@env8,@env27,@env0 ; 09 : noise open hat 1
	.word @env7,@env21,@env3,@env0 ; 0a : secret bell 1
	.word @env29,@env21,@env30,@env0 ; 0b : funnyclick.mp4 1
	.word @env20,@env21,@env12,@env0 ; 0c : distort guitar 1
	.word @env35,@env21,@env27,@env0 ; 0d : ah 1
	.word @env32,@env21,@env27,@env0 ; 0e : Instrument 1
	.word @env10,@env21,@env1,@env0 ; 0f : Instrument 2
	.word @env14,@env21,@env27,@env0 ; 10 : Orchestral Hits 1
	.word @env11,@env24,@env28,@env0 ; 11 : electric guit 1
	.word @env39,@env21,@env2,@env0 ; 12 : New instrument 1
	.word @env14,@env21,@env27,@env0 ; 13 : NOT REAL 1

@env0:
	.byte $00,$c0,$7f,$00,$02
@env1:
	.byte $c2,$c3,$00,$01
@env2:
	.byte $c3,$7f,$00,$00
@env3:
	.byte $c2,$c1,$00,$01
@env4:
	.byte $c2,$c0,$00,$01
@env5:
	.byte $00,$c0,$be,$bd,$bd,$be,$bf,$c1,$c2,$c3,$c3,$c2,$00,$01
@env6:
	.byte $c7,$c0,$00,$01
@env7:
	.byte $00,$c3,$c5,$c4,$c3,$c2,$c2,$c1,$c1,$c0,$00,$09
@env8:
	.byte $be,$c0,$00,$01
@env9:
	.byte $00,$c0,$bf,$be,$be,$bf,$c1,$c2,$c2,$c1,$00,$01
@env10:
	.byte $00,$cf,$ce,$cd,$cc,$cb,$ca,$c9,$c8,$c7,$c6,$c5,$c4,$c3,$c2,$c1,$c0,$00,$10
@env11:
	.byte $06,$c1,$c2,$c5,$00,$03,$c3,$c2,$c1,$c1,$c0,$00,$0a
@env12:
	.byte $c3,$07,$c2,$07,$c1,$07,$c0,$07,$c1,$07,$c2,$06,$c2,$00,$00
@env13:
	.byte $00,$c0,$bf,$03,$c0,$c0,$c1,$02,$c1,$00,$01
@env14:
	.byte $00,$cf,$7f,$00,$02
@env15:
	.byte $00,$c5,$c4,$c3,$c2,$c1,$c0,$00,$06
@env16:
	.byte $00,$c2,$c4,$00,$02
@env17:
	.byte $00,$c5,$c4,$c3,$00,$03
@env18:
	.byte $06,$c7,$c5,$c4,$00,$03,$c3,$c2,$c1,$c0,$00,$09
@env19:
	.byte $00,$ca,$c7,$c5,$c4,$c3,$c3,$c2,$c2,$c1,$02,$c0,$00,$0b
@env20:
	.byte $06,$cf,$cb,$c8,$00,$03,$c5,$c3,$c2,$c2,$c1,$02,$c0,$c0,$00,$0d
@env21:
	.byte $c0,$7f,$00,$01
@env22:
	.byte $c5,$c0,$00,$01
@env23:
	.byte $07,$c2,$c4,$c3,$c2,$00,$04,$c1,$02,$c0,$c0,$00,$0a
@env24:
	.byte $c0,$b4,$b8,$c0,$00,$03
@env25:
	.byte $c6,$ca,$00,$01
@env26:
	.byte $c6,$cd,$00,$01
@env27:
	.byte $7f,$00,$00
@env28:
	.byte $c2,$7f,$00,$00
@env29:
	.byte $06,$c3,$c6,$c4,$00,$03,$c2,$c1,$c1,$c0,$00,$09
@env30:
	.byte $c0,$c2,$00,$01
@env31:
	.byte $00,$c0,$bf,$be,$02,$bf,$c1,$c2,$02,$c1,$00,$01
@env32:
	.byte $00,$cf,$cf,$ce,$ce,$cd,$cd,$cc,$cc,$cb,$cb,$ca,$ca,$c9,$c9,$c8,$c8,$c7,$c7,$c6,$c6,$c5,$c5,$c4,$c4,$c3,$c3,$c2,$c2,$c1,$c1,$c0,$00,$1f
@env33:
	.byte $0a,$c2,$c3,$c4,$02,$c3,$c3,$c2,$00,$07,$c2,$04,$c1,$07,$c0,$04,$c0,$00,$10
@env34:
	.byte $00,$c0,$be,$bc,$bc,$bd,$bf,$c1,$c3,$c4,$c4,$c2,$00,$01
@env35:
	.byte $07,$c2,$c4,$c5,$c4,$00,$04,$c4,$c4,$c3,$04,$c2,$07,$c1,$0a,$c0,$00,$0f
@env36:
	.byte $00,$c0,$bf,$be,$02,$bf,$c0,$c0,$c1,$c2,$02,$c1,$00,$01
@env37:
	.byte $c0,$c0,$cc,$cc,$00,$00
@env38:
	.byte $00,$c7,$c5,$c4,$c3,$c2,$c2,$c1,$02,$c0,$00,$09
@env39:
	.byte $06,$c5,$c8,$c6,$00,$03,$c5,$c4,$c3,$c3,$c2,$03,$c1,$06,$c0,$00,$0e
@env40:
	.byte $00,$c0,$bd,$bc,$bd,$bf,$c1,$c3,$c4,$c3,$00,$01

@samples:
	.byte $37+.lobyte(FAMISTUDIO_DPCM_PTR),$65,$44,$40,$00 ; 00 b1 bass.dmc (Pitch:4)
	.byte $37+.lobyte(FAMISTUDIO_DPCM_PTR),$65,$45,$40,$00 ; 01 b1 bass.dmc (Pitch:5)
	.byte $37+.lobyte(FAMISTUDIO_DPCM_PTR),$65,$46,$40,$00 ; 02 b1 bass.dmc (Pitch:6)
	.byte $37+.lobyte(FAMISTUDIO_DPCM_PTR),$65,$47,$40,$00 ; 03 b1 bass.dmc (Pitch:7)
	.byte $37+.lobyte(FAMISTUDIO_DPCM_PTR),$65,$4a,$40,$00 ; 04 b1 bass.dmc (Pitch:10)
	.byte $51+.lobyte(FAMISTUDIO_DPCM_PTR),$5f,$44,$40,$00 ; 05 b2 bass.dmc (Pitch:4)
	.byte $51+.lobyte(FAMISTUDIO_DPCM_PTR),$5f,$45,$40,$00 ; 06 b2 bass.dmc (Pitch:5)
	.byte $51+.lobyte(FAMISTUDIO_DPCM_PTR),$5f,$47,$40,$00 ; 07 b2 bass.dmc (Pitch:7)
	.byte $51+.lobyte(FAMISTUDIO_DPCM_PTR),$5f,$48,$40,$00 ; 08 b2 bass.dmc (Pitch:8)
	.byte $51+.lobyte(FAMISTUDIO_DPCM_PTR),$5f,$4a,$40,$00 ; 09 b2 bass.dmc (Pitch:10)
	.byte $69+.lobyte(FAMISTUDIO_DPCM_PTR),$5a,$47,$40,$00 ; 0a b3 bass.dmc (Pitch:7)
	.byte $44+.lobyte(FAMISTUDIO_DPCM_PTR),$29,$4a,$40,$01 ; 0b dash.dmc (Pitch:10)
	.byte $44+.lobyte(FAMISTUDIO_DPCM_PTR),$29,$4d,$40,$01 ; 0c dash.dmc (Pitch:13)
	.byte $33+.lobyte(FAMISTUDIO_DPCM_PTR),$0d,$0f,$40,$00 ; 0d Hebereke Kick.dmc (Pitch:15)
	.byte $61+.lobyte(FAMISTUDIO_DPCM_PTR),$20,$0c,$40,$01 ; 0e Hebereke Snare.dmc (Pitch:12)
	.byte $61+.lobyte(FAMISTUDIO_DPCM_PTR),$20,$0d,$40,$01 ; 0f Hebereke Snare.dmc (Pitch:13)
	.byte $61+.lobyte(FAMISTUDIO_DPCM_PTR),$20,$0e,$40,$01 ; 10 Hebereke Snare.dmc (Pitch:14)
	.byte $61+.lobyte(FAMISTUDIO_DPCM_PTR),$20,$0f,$40,$01 ; 11 Hebereke Snare.dmc (Pitch:15)
	.byte $32+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$07,$40,$01 ; 12 OrchHitA.dmc (Pitch:7)
	.byte $32+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$08,$40,$01 ; 13 OrchHitA.dmc (Pitch:8)
	.byte $32+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$0a,$40,$01 ; 14 OrchHitA.dmc (Pitch:10)
	.byte $32+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$0b,$40,$01 ; 15 OrchHitA.dmc (Pitch:11)
	.byte $32+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$0c,$40,$01 ; 16 OrchHitA.dmc (Pitch:12)
	.byte $32+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$0e,$40,$01 ; 17 OrchHitA.dmc (Pitch:14)
	.byte $32+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$0f,$40,$01 ; 18 OrchHitA.dmc (Pitch:15)
	.byte $0f+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$0e,$40,$00 ; 19 OrchHitF.dmc (Pitch:14)
	.byte $0f+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$0f,$40,$00 ; 1a OrchHitF.dmc (Pitch:15)
	.byte $0e+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$0d,$40,$01 ; 1b OrchHitF#.dmc (Pitch:13)
	.byte $0e+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$0e,$40,$01 ; 1c OrchHitF#.dmc (Pitch:14)
	.byte $0e+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$0f,$40,$01 ; 1d OrchHitF#.dmc (Pitch:15)
	.byte $21+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$01,$40,$00 ; 1e OrchHitG.dmc (Pitch:1)
	.byte $21+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$02,$40,$00 ; 1f OrchHitG.dmc (Pitch:2)
	.byte $21+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$03,$40,$00 ; 20 OrchHitG.dmc (Pitch:3)
	.byte $21+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$04,$40,$00 ; 21 OrchHitG.dmc (Pitch:4)
	.byte $21+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$05,$40,$00 ; 22 OrchHitG.dmc (Pitch:5)
	.byte $21+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$06,$40,$00 ; 23 OrchHitG.dmc (Pitch:6)
	.byte $21+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$07,$40,$00 ; 24 OrchHitG.dmc (Pitch:7)
	.byte $21+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$09,$40,$00 ; 25 OrchHitG.dmc (Pitch:9)
	.byte $21+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$0a,$40,$00 ; 26 OrchHitG.dmc (Pitch:10)
	.byte $21+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$0c,$40,$00 ; 27 OrchHitG.dmc (Pitch:12)
	.byte $21+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$0d,$40,$00 ; 28 OrchHitG.dmc (Pitch:13)
	.byte $21+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$0e,$40,$00 ; 29 OrchHitG.dmc (Pitch:14)
	.byte $21+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$0f,$40,$00 ; 2a OrchHitG.dmc (Pitch:15)
	.byte $20+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$01,$40,$01 ; 2b OrchHitG#.dmc (Pitch:1)
	.byte $20+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$03,$40,$01 ; 2c OrchHitG#.dmc (Pitch:3)
	.byte $20+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$04,$40,$01 ; 2d OrchHitG#.dmc (Pitch:4)
	.byte $20+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$06,$40,$01 ; 2e OrchHitG#.dmc (Pitch:6)
	.byte $20+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$07,$40,$01 ; 2f OrchHitG#.dmc (Pitch:7)
	.byte $20+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$08,$40,$01 ; 30 OrchHitG#.dmc (Pitch:8)
	.byte $20+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$09,$40,$01 ; 31 OrchHitG#.dmc (Pitch:9)
	.byte $20+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$0a,$40,$01 ; 32 OrchHitG#.dmc (Pitch:10)
	.byte $20+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$0b,$40,$01 ; 33 OrchHitG#.dmc (Pitch:11)
	.byte $20+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$0c,$40,$01 ; 34 OrchHitG#.dmc (Pitch:12)
	.byte $20+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$0e,$40,$01 ; 35 OrchHitG#.dmc (Pitch:14)
	.byte $20+.lobyte(FAMISTUDIO_DPCM_PTR),$45,$0f,$40,$01 ; 36 OrchHitG#.dmc (Pitch:15)
	.byte $0c+.lobyte(FAMISTUDIO_DPCM_PTR),$0a,$0e,$40,$00 ; 37 Rgimm kick.dmc (Pitch:14)
	.byte $0c+.lobyte(FAMISTUDIO_DPCM_PTR),$0a,$0f,$40,$00 ; 38 Rgimm kick.dmc (Pitch:15)
	.byte $4f+.lobyte(FAMISTUDIO_DPCM_PTR),$44,$0f,$40,$01 ; 39 taunt.dmc (Pitch:15)
	.byte $00+.lobyte(FAMISTUDIO_DPCM_PTR),$2f,$07,$40,$00 ; 3a untitled.dmc (Pitch:7)
	.byte $00+.lobyte(FAMISTUDIO_DPCM_PTR),$34,$08,$40,$01 ; 3b untitled1.dmc (Pitch:8)

@song0ch0:
	.byte $45, $19
@song0ch0loop:
	.byte $81, $42
	.word @song0ch0loop
@song0ch1:
@song0ch1loop:
	.byte $81, $42
	.word @song0ch1loop
@song0ch2:
@song0ch2loop:
	.byte $81, $42
	.word @song0ch2loop
@song0ch3:
@song0ch3loop:
	.byte $81, $42
	.word @song0ch3loop
@song0ch4:
@song0ch4loop:
	.byte $81, $42
	.word @song0ch4loop
@song1ch0:
	.byte $45, $06
@song1ch0loop:
	.byte $ff, $42
	.word @song1ch0loop
@song1ch1:
@song1ch1loop:
	.byte $ff, $42
	.word @song1ch1loop
@song1ch2:
@song1ch2loop:
	.byte $ff, $42
	.word @song1ch2loop
@song1ch3:
@song1ch3loop:
	.byte $ff, $42
	.word @song1ch3loop
@song1ch4:
@song1ch4loop:
	.byte $ff, $42
	.word @song1ch4loop
@song2ch0:
	.byte $45, $02
@song2ref3:
	.byte $4d, $00, $4e, $00, $80, $28, $9d, $2b, $9d, $2f, $9d, $2e, $9d, $44, $d1, $28, $81, $28, $81, $28, $81, $28, $8d, $43
	.byte $4f, $08, $34, $26
@song2ref31:
	.byte $8d, $44, $ad, $4e, $02, $3b, $85, $44, $95, $36, $85, $44, $8d, $3b, $85, $3a, $85, $44, $85, $8f, $36, $85, $44, $8d
	.byte $77, $3b, $85, $3a, $85, $44, $8d, $36, $85, $44, $8d, $74, $3b, $85, $3a, $85, $44, $8d, $7f, $4e, $00, $27, $9d, $2a
	.byte $9d, $2e, $9d, $2d, $9d, $44, $d1, $27, $81, $27, $81, $27, $81, $27, $8d, $43, $4f, $09, $33, $25
	.byte $41, $26
	.word @song2ref31
@song2ch0loop:
	.byte $7f
@song2ref104:
	.byte $4e, $00, $86, $15, $81, $00, $81, $7d, $15, $81, $00, $81, $7b, $15, $81, $00, $81, $79, $15, $81, $00, $81, $7f, $15
	.byte $95, $44, $85, $15, $81, $00, $81, $15, $81, $15, $81, $15, $81, $00, $81, $15, $81, $00, $81, $15, $95, $43, $4f, $7f
	.byte $21, $16, $85, $80, $32, $85, $46, $01, $34, $89, $46, $00, $32, $89, $30, $85, $32, $85, $30, $85, $2d, $85, $2b, $85
	.byte $2d, $85, $28, $85, $29, $85, $28, $85, $44, $95, $7a, $50, $fc, $00, $84, $03, $a5, $d7, $7f, $4d, $00, $4e, $00, $80
@song2ref200:
	.byte $26, $85, $28, $81, $44, $81, $2b, $85, $2d, $81, $44, $81, $30, $81, $2d, $81, $2f, $81, $30, $81, $35, $85, $37, $85
	.byte $39, $85, $44, $85, $00, $ad
	.byte $41, $28
	.word @song2ref104
@song2ref233:
	.byte $80, $2f, $85, $46, $01, $30, $89, $46, $00, $2f, $89, $2d, $85, $2f, $85, $2d, $85, $2b, $85, $28, $85, $2b, $85, $27
	.byte $85, $28, $85, $27, $85, $44, $95, $8f, $72, $4e, $03, $82, $02, $bd, $71, $af, $7f, $4d, $00, $4e, $00, $80
@song2ref279:
	.byte $26, $85, $28, $81, $44, $81, $28, $85, $2b, $81, $44, $81, $2d, $81, $2b, $81, $2d, $81, $2f, $81, $2f, $85, $30, $85
	.byte $2f, $85, $44, $85, $00, $ad
	.byte $41, $63
	.word @song2ref104
	.byte $41, $28
	.word @song2ref104
	.byte $41, $3c
	.word @song2ref233
	.byte $75, $4d, $00, $84, $09, $9d, $74, $9f, $73, $9f, $72, $9f, $75, $4d, $00, $10, $9d, $74, $9f, $73, $9f, $72, $9f, $75
	.byte $4d, $00, $0f, $9d, $74, $9f, $73, $9f, $72, $9f, $75, $4d, $00, $0e, $9d, $74, $9f, $73, $9f, $72, $9f, $75, $4d, $00
	.byte $08, $9d, $74, $9f, $73, $9f, $72, $9f, $75, $4d, $00, $0f, $9d, $74, $9f, $73, $9f, $72, $9f, $75, $4d, $00, $0e, $9d
	.byte $74, $9f, $73, $9f, $72, $9f, $75, $4d, $00, $0d, $9d, $74, $9f, $73, $9f, $7f, $8e, $1c, $8b, $00, $8f, $73, $4d, $00
	.byte $82, $1c, $bd, $1e, $bd, $4d, $00, $21, $bd, $4d, $ff, $87, $4d, $fe, $87, $4d, $fd, $87, $4d, $fc, $87, $4d, $fb, $87
	.byte $4d, $fa, $87, $4d, $f9, $87, $4d, $f8, $87, $4d, $f7, $87, $4d, $f6, $87, $4d, $f5, $87, $4d, $f4, $87, $4d, $f3, $87
	.byte $4d, $f2, $87, $4d, $f1, $87, $4d, $f0, $87, $4d, $ef, $87, $4d, $ee, $87, $4d, $ed, $87, $4d, $ec, $87, $4d, $eb, $87
	.byte $4d, $ea, $87, $4d, $e9, $87, $4d, $e8, $87, $4d, $e7, $87, $4d, $e6, $87, $4d, $e5, $87, $4d, $e4, $87, $4d, $e3, $87
	.byte $4d, $e2, $87, $4d, $e1, $87, $4d, $e0, $87, $4d, $df, $87, $4d, $de, $87, $4d, $dd, $87, $4d, $dc, $87, $4d, $db, $87
	.byte $4d, $da, $87, $4d, $d9, $87, $4d, $d8, $87, $4d, $00, $1b, $bd, $1c, $bd, $20, $bd, $4d, $00, $87, $4d, $01, $87, $4d
	.byte $02, $87, $4d, $03, $87, $4d, $04, $87, $4d, $05, $87, $4d, $06, $87, $4d, $07, $87, $4d, $08, $87, $4d, $09, $87, $4d
	.byte $0a, $87, $4d, $0b, $87, $4d, $0c, $87, $4d, $0d, $87, $4d, $0e, $87, $4d, $0f, $87, $4d, $10, $87, $4d, $11, $87, $4d
	.byte $12, $87, $4d, $13, $87, $4d, $14, $87, $4d, $15, $87, $4d, $16, $87, $4d, $17, $87, $4d, $18, $87, $4d, $19, $87, $4d
	.byte $1a, $87, $4d, $1b, $87, $4d, $1c, $87, $4d, $1d, $87, $4d, $1e, $87, $4d, $1f, $87, $4d, $20, $87, $4d, $21, $87, $4d
	.byte $22, $87, $4d, $23, $87, $4d, $24, $87, $4d, $25, $87, $4d, $26, $87, $4d, $27, $87, $7f
	.byte $41, $4c
	.word @song2ref3
	.byte $41, $26
	.word @song2ref31
	.byte $42
	.word @song2ch0loop
@song2ch1:
@song2ref681:
	.byte $4e, $00, $00, $95, $71, $4d, $01, $82, $28, $9d, $2b, $9d, $2f, $9d, $2e, $85, $9b, $4d, $00, $00, $b5, $7f, $80, $27
	.byte $81, $27, $81, $27, $81, $27, $8d, $43, $4f, $07, $33, $25
@song2ref717:
	.byte $8d, $44, $bd, $71, $4e, $02, $82, $3b, $85, $00, $95, $36, $85, $00, $8d, $3b, $85, $3a, $85, $00, $95, $36, $85, $00
	.byte $8d, $3b, $85, $3a, $85, $00, $8d, $36, $85, $00, $8d, $3b, $85, $3a, $85, $4e, $00, $00, $95, $4d, $01, $27, $9d, $2a
	.byte $9d, $2e, $9d, $2d, $85, $9b, $4d, $00, $00, $b5, $7f, $80, $26, $81, $26, $81, $26, $81, $26, $8d, $43, $4f, $07, $32
	.byte $25
	.byte $41, $23
	.word @song2ref717
@song2ch1loop:
@song2ref794:
	.byte $7f, $4e, $00, $86, $10, $81, $00, $81, $7d, $10, $81, $00, $81, $7b, $10, $81, $00, $81, $79, $10, $81, $00, $81, $7f
	.byte $10, $95, $44, $85, $10, $81, $00, $81, $10, $81, $10, $81, $10, $81, $00, $81, $10, $81, $00, $81, $10, $95, $43, $4f
	.byte $7f, $1c, $13, $85, $7a, $50, $fc, $30, $84, $04, $99, $71, $82, $32, $85, $34, $89, $32, $89, $30, $85, $32, $85, $30
	.byte $85, $2d, $85, $2b, $85, $2d, $85, $28, $85, $29, $85, $28, $81, $8f, $72, $4e, $03, $03, $bd, $71, $af, $7a, $50, $fc
	.byte $40, $84, $02, $95, $71, $4e, $00, $82
	.byte $41, $1d
	.word @song2ref200
	.byte $95
	.byte $41, $28
	.word @song2ref794
@song2ref905:
	.byte $7a, $50, $fc, $30, $84, $03, $99, $71, $82, $2f, $85, $46, $01, $30, $89, $46, $00, $2f, $89, $2d, $85, $2f, $85, $2d
	.byte $85, $2b, $85, $28, $85, $2b, $85, $27, $85, $28, $85, $27, $81, $7a, $50, $fc, $00, $84, $02, $a5, $d7, $7a, $50, $fc
	.byte $40, $01, $95, $71, $82
	.byte $41, $1d
	.word @song2ref279
	.byte $95
	.byte $41, $48
	.word @song2ref794
	.byte $71, $4e, $00, $82
	.byte $41, $1d
	.word @song2ref200
	.byte $95
	.byte $41, $28
	.word @song2ref794
	.byte $41, $1f
	.word @song2ref905
	.byte $71, $82
	.byte $41, $1d
	.word @song2ref279
	.byte $95, $bf, $7f, $8e, $10, $8d, $13, $8d, $18, $8d, $17, $8d, $df, $13, $9d, $16, $dd, $10, $9d, $0f, $bd, $17, $b5, $16
	.byte $81, $15, $81, $14, $f5, $17, $81, $19, $81, $1b, $f5, $19, $81, $1b, $81, $1c, $b5, $1c, $81, $1f, $81, $21, $b5, $23
	.byte $81, $21, $81, $20, $bd, $00, $9d, $21, $8d, $00, $8d, $75, $84, $09, $9d, $74, $9f, $73, $9f, $72, $9f, $ff, $75, $09
	.byte $9d, $74, $9f, $73, $9f, $72, $9f, $ff, $75, $08, $9d, $74, $9f, $73, $9f, $72, $9f, $ff, $75, $08, $9d, $74, $9f, $73
	.byte $9f, $72, $9f, $ff
	.byte $41, $4f
	.word @song2ref681
	.byte $41, $23
	.word @song2ref717
	.byte $42
	.word @song2ch1loop
@song2ch2:
	.byte $84, $09, $fd, $ff, $09, $fd, $ff, $08, $fd, $ff, $08, $fd, $ff
@song2ch2loop:
	.byte $82
@song2ref1108:
	.byte $1d, $15, $bb, $25, $15, $bb, $1d, $15, $bb, $25, $15, $bb, $1d, $15, $bb, $25, $15, $bb, $1d, $15, $bb, $25, $15, $bb
	.byte $1d, $14, $bb, $25, $14, $bb, $1d, $14, $bb, $25, $14, $bb, $1d, $14, $bb, $25, $14, $bb, $1d, $14, $bb, $25, $14, $bb
	.byte $41, $30
	.word @song2ref1108
	.byte $41, $30
	.word @song2ref1108
	.byte $84, $09, $fd, $09, $fd, $09, $fd, $09, $fd, $08, $fd, $08, $fd, $08, $fd, $08, $fd, $09, $fd, $ff, $09, $fd, $ff, $08
	.byte $fd, $ff, $08, $fd, $08, $fd, $42
	.word @song2ch2loop
@song2ch3:
	.byte $ff, $ff, $ff, $ff, $ff, $ff, $ff, $bf, $70, $50, $02, $80, $82, $20, $bd
@song2ch3loop:
	.byte $7f
@song2ref1212:
	.byte $88, $14, $85, $8a, $23, $85, $23, $85, $21, $85, $23, $85, $23, $85, $21, $8d, $8c, $14, $9d, $8a, $21, $85, $23, $85
	.byte $23, $85, $23, $85, $88, $14, $85, $8a, $23, $85, $23, $85, $21, $85, $23, $85, $23, $85, $21, $8d, $8c, $14, $9d, $8a
	.byte $21, $85, $23, $85, $23, $85, $23, $85
	.byte $41, $30
	.word @song2ref1212
	.byte $41, $30
	.word @song2ref1212
	.byte $41, $30
	.word @song2ref1212
	.byte $41, $30
	.word @song2ref1212
	.byte $41, $30
	.word @song2ref1212
	.byte $41, $30
	.word @song2ref1212
	.byte $41, $30
	.word @song2ref1212
	.byte $41, $30
	.word @song2ref1212
	.byte $41, $30
	.word @song2ref1212
	.byte $41, $30
	.word @song2ref1212
	.byte $41, $30
	.word @song2ref1212
	.byte $75, $50, $fc, $40, $82, $1e, $81, $83, $50, $fc, $30, $83, $83, $50, $fc, $20, $83, $83, $50, $fc, $10, $83, $83, $50
	.byte $fc, $00, $83, $db, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $bf, $50, $02, $80, $20, $bd
	.byte $42
	.word @song2ch3loop
@song2ch4:
	.byte $51, $00, $38, $bd, $38, $9d, $38, $9d, $d3, $3c, $a9, $51, $80, $ff, $51, $80, $ff, $51, $00, $38, $bd, $38, $9d, $38
	.byte $9d, $d3, $3b, $a9, $51, $80, $ff, $51, $80, $ff
@song2ch4loop:
@song2ref1387:
	.byte $39, $85, $38, $85, $38, $85, $39, $85, $38, $85, $38, $85, $39, $8d, $38, $8d, $38, $8d, $39, $85, $38, $85, $38, $85
	.byte $38, $85, $39, $85, $38, $85, $38, $85, $39, $85, $38, $85, $38, $85, $39, $8d, $38, $8d, $38, $8d, $39, $85, $38, $85
	.byte $38, $85, $38, $85
	.byte $41, $34
	.word @song2ref1387
	.byte $41, $34
	.word @song2ref1387
	.byte $41, $34
	.word @song2ref1387
	.byte $41, $34
	.word @song2ref1387
	.byte $41, $34
	.word @song2ref1387
	.byte $41, $34
	.word @song2ref1387
	.byte $41, $34
	.word @song2ref1387
	.byte $41, $34
	.word @song2ref1387
	.byte $41, $34
	.word @song2ref1387
	.byte $41, $34
	.word @song2ref1387
	.byte $41, $34
	.word @song2ref1387
	.byte $41, $34
	.word @song2ref1387
	.byte $41, $34
	.word @song2ref1387
	.byte $41, $34
	.word @song2ref1387
	.byte $41, $34
	.word @song2ref1387
	.byte $41, $2b
	.word @song2ref1387
	.byte $81, $3c, $a1, $38, $85
	.byte $41, $34
	.word @song2ref1387
	.byte $41, $2b
	.word @song2ref1387
	.byte $81, $3b, $a1, $38, $85
	.byte $41, $34
	.word @song2ref1387
	.byte $42
	.word @song2ch4loop
@song3ch0:
	.byte $45, $06
@song3ch0loop:
	.byte $ff, $42
	.word @song3ch0loop
@song3ch1:
@song3ch1loop:
	.byte $ff, $42
	.word @song3ch1loop
@song3ch2:
@song3ch2loop:
	.byte $ff, $42
	.word @song3ch2loop
@song3ch3:
@song3ch3loop:
	.byte $ff, $42
	.word @song3ch3loop
@song3ch4:
@song3ch4loop:
	.byte $ff, $42
	.word @song3ch4loop
@song4ch0:
	.byte $45, $02
@song4ch0loop:
	.byte $7f, $4d, $01
@song4ref7:
	.byte $90
@song4ref8:
	.byte $19, $83, $44, $89, $20, $83, $44, $89, $1f, $83, $44, $89, $19, $83, $44, $83, $1c, $83, $44, $89, $1c, $83, $44, $89
	.byte $1c, $83, $44, $89, $1c, $83, $1e, $83, $44, $89, $4d, $01
	.byte $41, $22
	.word @song4ref8
@song4ref47:
	.byte $17, $83, $44, $89, $20, $83, $44, $89, $1e, $83, $44, $89, $17, $83, $44, $83, $1b, $83, $44, $89, $1b, $83, $44, $89
	.byte $1b, $83, $44, $89, $1c, $83, $1e, $83, $44, $89
	.byte $41, $14
	.word @song4ref47
	.byte $1e, $83, $44, $89, $20, $83, $44, $89, $23, $83, $25, $83, $44, $89, $4d, $01
	.byte $41, $22
	.word @song4ref8
	.byte $4d, $01
	.byte $41, $22
	.word @song4ref8
	.byte $41, $22
	.word @song4ref47
	.byte $41, $14
	.word @song4ref47
@song4ref114:
	.byte $1e, $83, $44, $89, $20, $83, $4f, $7f, $2c, $14, $89, $00, $95, $ff, $8f, $ff, $8f, $ff, $8f, $ff, $8f, $ff, $8f, $ff
	.byte $8f, $ff, $8f, $ff, $8f, $8b, $76, $4d, $ff
@song4ref147:
	.byte $94
@song4ref148:
	.byte $2c, $8f, $33, $8f, $32, $8f, $2c, $89, $2f, $8f, $2f, $8f, $2f, $8f, $2f, $83, $31, $83, $8b, $4d, $ff
	.byte $41, $13
	.word @song4ref148
@song4ref172:
	.byte $2a, $8f, $33, $8f, $31, $8f, $2a, $89, $2e, $8f, $2e, $8f, $2e, $8f, $2f, $83, $31, $83, $8b
	.byte $41, $13
	.word @song4ref172
	.byte $4d, $ff
	.byte $41, $13
	.word @song4ref148
	.byte $4d, $ff
	.byte $41, $13
	.word @song4ref148
	.byte $41, $13
	.word @song4ref172
@song4ref207:
	.byte $2a, $8f, $33, $8f, $31, $8f, $2a, $89, $2e, $8f, $31, $8f, $33, $8f, $36, $83, $38, $83, $8b, $4d, $ff
	.byte $41, $13
	.word @song4ref148
	.byte $4d, $ff
	.byte $41, $13
	.word @song4ref148
	.byte $41, $13
	.word @song4ref172
	.byte $41, $12
	.word @song4ref207
	.byte $42
	.word @song4ch0loop
@song4ch1:
@song4ch1loop:
	.byte $7f, $4d, $ff
	.byte $41, $22
	.word @song4ref7
	.byte $4d, $ff
	.byte $41, $22
	.word @song4ref8
	.byte $41, $22
	.word @song4ref47
	.byte $41, $14
	.word @song4ref47
	.byte $1e, $83, $44, $89, $20, $83, $44, $89, $23, $83, $25, $83, $44, $89, $4d, $ff
	.byte $41, $22
	.word @song4ref8
	.byte $4d, $ff
	.byte $41, $22
	.word @song4ref8
	.byte $41, $22
	.word @song4ref47
	.byte $41, $14
	.word @song4ref47
	.byte $41, $1a
	.word @song4ref114
	.byte $4d, $00
	.byte $41, $11
	.word @song4ref147
	.byte $8f, $4d, $00
	.byte $41, $11
	.word @song4ref148
	.byte $8f
	.byte $41, $11
	.word @song4ref172
	.byte $8f
	.byte $41, $11
	.word @song4ref172
	.byte $8f, $4d, $00
	.byte $41, $11
	.word @song4ref148
	.byte $8f, $4d, $00
	.byte $41, $11
	.word @song4ref148
	.byte $8f
	.byte $41, $11
	.word @song4ref172
	.byte $8f
	.byte $41, $11
	.word @song4ref207
	.byte $8f, $4d, $00
	.byte $41, $11
	.word @song4ref148
	.byte $8f, $4d, $00
	.byte $41, $11
	.word @song4ref148
	.byte $8f
	.byte $41, $11
	.word @song4ref172
	.byte $8f
	.byte $41, $11
	.word @song4ref207
	.byte $8f, $42
	.word @song4ch1loop
@song4ch2:
@song4ch2loop:
	.byte $82
@song4ref361:
	.byte $1d, $0d, $87, $00, $83, $0d, $89, $00, $83, $47, $02, $25, $00, $8d, $0b, $8f, $1d, $0d, $87, $00, $83, $84, $0d, $89
	.byte $00, $83, $47, $02, $82, $25, $00, $9f
	.byte $41, $13
	.word @song4ref361
@song4ref396:
	.byte $10, $8f, $25, $12, $8d, $14, $8f, $1d, $0b, $87, $00, $83, $0b, $89, $00, $83, $47, $02, $25, $00, $8d, $0a, $8f, $1d
	.byte $0b, $87, $00, $83, $0b, $89, $00, $83, $47, $02, $25, $00, $9f, $1d, $0b, $87, $00, $83, $0b, $89, $00, $83, $47, $02
	.byte $25, $00, $8d, $0a, $8f, $1d, $0b, $8d, $0f, $8f, $25, $12, $8d, $14, $8f
	.byte $41, $1a
	.word @song4ref361
	.byte $41, $13
	.word @song4ref361
	.byte $41, $39
	.word @song4ref396
	.byte $41, $1a
	.word @song4ref361
	.byte $41, $13
	.word @song4ref361
	.byte $41, $39
	.word @song4ref396
	.byte $41, $1a
	.word @song4ref361
	.byte $41, $13
	.word @song4ref361
	.byte $41, $39
	.word @song4ref396
	.byte $41, $1a
	.word @song4ref361
	.byte $41, $13
	.word @song4ref361
	.byte $41, $39
	.word @song4ref396
	.byte $41, $1a
	.word @song4ref361
	.byte $41, $13
	.word @song4ref361
	.byte $41, $39
	.word @song4ref396
@song4ref504:
	.byte $1d, $00, $9f, $25, $00, $9f, $1d, $00, $9f, $25, $00, $9f, $1d, $00, $9f, $25, $00, $9f
	.byte $41, $12
	.word @song4ref504
	.byte $1d, $00, $9f, $25, $00, $9f, $1d, $00, $9f, $25, $00, $9f, $42
	.word @song4ch2loop
@song4ch3:
@song4ch3loop:
@song4ref541:
	.byte $88, $14, $89, $8a, $23, $83, $21, $89, $23, $83, $8c, $14, $89, $8a, $23, $83, $21, $89, $23, $83, $88, $14, $89, $8a
	.byte $23, $83, $92, $21, $89, $8a, $23, $83, $8c, $14, $89, $8a, $23, $83, $92, $21, $89, $8a, $23, $83
	.byte $41, $20
	.word @song4ref541
	.byte $41, $20
	.word @song4ref541
	.byte $41, $20
	.word @song4ref541
	.byte $41, $20
	.word @song4ref541
	.byte $41, $20
	.word @song4ref541
	.byte $41, $20
	.word @song4ref541
	.byte $41, $19
	.word @song4ref541
	.byte $a1
	.byte $41, $20
	.word @song4ref541
	.byte $41, $20
	.word @song4ref541
	.byte $41, $20
	.word @song4ref541
	.byte $41, $20
	.word @song4ref541
	.byte $41, $20
	.word @song4ref541
	.byte $41, $20
	.word @song4ref541
	.byte $41, $20
	.word @song4ref541
	.byte $41, $20
	.word @song4ref541
	.byte $41, $20
	.word @song4ref541
	.byte $41, $20
	.word @song4ref541
	.byte $41, $20
	.word @song4ref541
	.byte $41, $20
	.word @song4ref541
	.byte $41, $20
	.word @song4ref541
	.byte $41, $20
	.word @song4ref541
	.byte $41, $20
	.word @song4ref541
	.byte $41, $20
	.word @song4ref541
	.byte $41, $20
	.word @song4ref541
	.byte $41, $20
	.word @song4ref541
	.byte $41, $20
	.word @song4ref541
	.byte $41, $19
	.word @song4ref541
	.byte $a1, $42
	.word @song4ch3loop
@song4ch4:
@song4ch4loop:
@song4ref672:
	.byte $ff, $8f, $ff, $8f, $ff, $8f, $ff, $8f, $ff, $8f, $ff, $8f, $ff, $8f, $ff, $8f, $ff, $8f
	.byte $41, $12
	.word @song4ref672
	.byte $41, $12
	.word @song4ref672
	.byte $ff, $8f, $42
	.word @song4ch4loop
@song5ch0:
	.byte $45, $02
@song5ch0loop:
	.byte $7f, $4d, $ff, $96
@song5ref8:
	.byte $28, $83, $44, $91, $77, $28, $83, $44, $81, $7f, $23, $83, $44, $91, $77, $23, $83, $44, $81, $7f, $27, $83, $44, $91
	.byte $77, $27, $83, $44, $91, $74, $27, $83, $44, $8b, $7f, $4d, $ff
	.byte $41, $1c
	.word @song5ref8
	.byte $7f, $4d, $ff
	.byte $41, $1c
	.word @song5ref8
	.byte $7f, $4d, $ff
	.byte $41, $1c
	.word @song5ref8
	.byte $ff, $9f, $7f, $29, $81, $00, $83, $2b, $81, $00, $83, $4d, $ff, $29, $81, $00, $83, $2b, $81, $00, $83, $29, $81, $00
	.byte $83, $27, $81, $00, $83, $25, $81, $00, $83, $24, $81, $00, $83, $25, $87, $48, .lobyte(@env34), .hibyte(@env34), $9d
	.byte $43, $4f, $02, $31, $2f, $a3, $48, .lobyte(@env0), .hibyte(@env0), $49, $43, $23, $00, $ff, $9d, $00, $ff, $9d, $9a
@song5ref122:
	.byte $24, $91, $1f, $91, $22, $91, $44, $91, $24, $91, $1f, $91, $22, $91, $44, $91
@song5ref138:
	.byte $24, $87, $26, $87, $24, $87, $26, $87, $24, $87, $22, $87, $1f, $87, $1d, $87, $1f, $c3, $44, $87
	.byte $41, $20
	.word @song5ref122
	.byte $20, $87, $4d, $00, $43, $4f, $fb, $2c, $37, $c1, $4e, $03, $43, $2b, $75, $48, .lobyte(@env0), .hibyte(@env0), $49
	.byte $82
@song5ref181:
	.byte $30, $87, $72, $89, $75, $4f, $0e, $3c, $37, $83, $43, $2b, $81, $72, $89, $75, $4f, $f2, $37, $3a, $81, $43, $2e, $83
	.byte $72, $93, $00, $87, $75, $4e, $03, $30, $87, $72, $89, $75, $4f, $0e, $3c, $37, $83, $43, $2b, $81, $72, $89, $75, $4f
	.byte $f2, $37, $3a, $81, $43, $2e, $83, $72, $93, $00, $87, $75, $48, .lobyte(@env0), .hibyte(@env0), $49, $30, $87, $4f
	.byte $f9, $3c, $3e, $81, $43, $32, $83, $4f, $07, $3e, $3c, $81, $43, $30, $83
@song5ref263:
	.byte $4f, $f9, $3c, $3e, $81, $43, $32, $83, $4f, $07, $3e, $3c, $81, $43, $30, $83, $4f, $08, $3c, $3a, $81, $43, $2e, $83
	.byte $4f, $07, $3a, $37, $85, $43, $2b, $4f, $06, $37, $36, $81, $43, $2a, $83, $4f, $fa, $36, $37, $81, $43, $2b, $8d, $48
	.byte .lobyte(@env34), .hibyte(@env34), $b1, $43, $4f, $03, $37, $36, $87, $48, .lobyte(@env0), .hibyte(@env0), $49
	.byte $41, $42
	.word @song5ref181
	.byte $48, .lobyte(@env0), .hibyte(@env0), $49
	.byte $41, $1e
	.word @song5ref181
	.byte $75, $48, .lobyte(@env0), .hibyte(@env0), $49, $4f, $f5, $36, $37, $43, $2b, $85, $4f, $f9, $37, $3b, $87, $4f, $f8
	.byte $3b, $3c, $43, $30, $85
	.byte $41, $13
	.word @song5ref263
	.byte $00, $cd, $48, .lobyte(@env0), .hibyte(@env0), $49
	.byte $41, $42
	.word @song5ref181
	.byte $48, .lobyte(@env0), .hibyte(@env0), $49
	.byte $41, $1e
	.word @song5ref181
	.byte $42
	.word @song5ch0loop
@song5ch1:
@song5ch1loop:
	.byte $ff, $8f, $c7, $70, $50, $02, $90, $98, $04, $c5, $7f, $04, $83, $44, $89, $04, $83, $44, $f5, $c7, $70, $50, $02, $90
	.byte $04, $c5, $7f, $04, $83, $44, $89, $04, $83, $44, $ff, $85, $ff, $9f, $ff, $9f, $ff, $9f, $85, $7a, $50, $02, $f0, $4d
	.byte $00, $9a
@song5ref431:
	.byte $24, $91, $1f, $91, $22, $91, $44, $91, $24, $91, $1f, $91, $22, $91, $44, $8b, $85
	.byte $41, $13
	.word @song5ref138
	.byte $81, $85, $7a, $50, $02, $f0, $4d, $00
	.byte $41, $11
	.word @song5ref431
	.byte $41, $10
	.word @song5ref138
	.byte $20, $87, $43, $4f, $fb, $2c, $35, $bb, $43, $29, $4d, $01, $4e, $03, $8d, $71, $82, $30, $91, $2b, $91, $2e, $9b, $00
	.byte $87, $30, $91, $2b, $91, $2e, $97, $8f, $30, $87, $32, $87, $30, $87, $32, $87, $30, $87, $2e, $87, $2b, $87, $2a, $87
	.byte $2b, $91, $48, .lobyte(@env34), .hibyte(@env34), $ab, $7c, $4d, $00, $98
@song5ref523:
	.byte $40, $0c, $87, $40, $0c, $87, $00, $87, $40, $0c, $9b, $40, $0a, $91, $40, $0c, $87, $40, $0c, $87, $00, $87, $03, $9b
	.byte $05, $91, $4d, $00
	.byte $41, $14
	.word @song5ref523
	.byte $4d, $00
	.byte $41, $14
	.word @song5ref523
	.byte $4d, $00
	.byte $41, $14
	.word @song5ref523
	.byte $4d, $00
	.byte $41, $14
	.word @song5ref523
	.byte $4d, $00
	.byte $41, $14
	.word @song5ref523
	.byte $4d, $00
	.byte $41, $14
	.word @song5ref523
	.byte $42
	.word @song5ch1loop
@song5ch2:
@song5ch2loop:
	.byte $ff, $8f, $ff, $8f, $82, $10, $83, $00, $89, $10, $83, $00, $f5, $ff, $8f, $10, $83, $00, $89, $10, $83, $00, $ff, $85
	.byte $ff, $9f
@song5ref609:
	.byte $1d, $47, $01, $2a, $00, $83, $47, $01, $2a, $00, $85, $1d, $47, $01, $31, $00, $8d, $1d, $47, $01, $2a, $00, $83, $47
	.byte $01, $2a, $00, $85, $1d, $47, $01, $31, $00, $83, $47, $01, $23, $00, $85
	.byte $41, $19
	.word @song5ref609
	.byte $41, $19
	.word @song5ref609
@song5ref654:
	.byte $1d, $47, $01, $2a, $00, $83, $47, $01, $2a, $00, $85, $1d, $47, $01, $2a, $00, $83, $47, $01, $2a, $00, $85, $1d, $47
	.byte $01, $2a, $00, $83, $1d, $47, $01, $2a, $46, $00, $1d, $46, $00, $2a, $00, $1d, $47, $01, $2a, $00, $83, $1d, $47, $01
	.byte $23, $00, $83
	.byte $41, $19
	.word @song5ref609
	.byte $41, $19
	.word @song5ref609
	.byte $41, $19
	.word @song5ref609
	.byte $41, $1f
	.word @song5ref654
	.byte $41, $19
	.word @song5ref609
	.byte $41, $19
	.word @song5ref609
	.byte $41, $19
	.word @song5ref609
	.byte $41, $19
	.word @song5ref609
	.byte $ff, $9f, $ff, $9f, $7f
@song5ref734:
	.byte $4d, $00, $0c, $87, $0c, $87, $00, $87, $0c, $9b, $0a, $91, $0c, $87, $0c, $87, $00, $87, $0f, $9b, $11, $91
	.byte $41, $14
	.word @song5ref734
	.byte $41, $14
	.word @song5ref734
	.byte $41, $14
	.word @song5ref734
	.byte $ff, $9f, $ff, $9f, $ff, $9f, $42
	.word @song5ch2loop
@song5ch3:
@song5ch3loop:
	.byte $ff, $8f, $ff, $8f, $ff, $8f, $ff, $8f, $ff, $9f, $ff, $9f, $88
@song5ref788:
	.byte $14, $91, $14, $91, $14, $91, $14, $91, $14, $91, $14, $91, $14, $91, $14, $91, $14, $91, $14, $91, $14, $91, $14, $91
	.byte $14, $91, $14, $91, $14, $87, $14, $81, $46, $00, $14, $83, $14, $87, $14, $87
	.byte $41, $26
	.word @song5ref788
	.byte $41, $1d
	.word @song5ref788
	.byte $91, $14, $91, $ff, $9f, $ff, $9f, $ff, $9f, $ff, $9f, $ff, $9f, $cf, $70, $50, $02, $f0, $82, $21, $cd, $00, $a5, $f7
	.byte $00, $a5, $f7, $00, $a5, $f7, $42
	.word @song5ch3loop
@song5ch4:
@song5ch4loop:
	.byte $ff, $8f, $ff, $8f, $ff, $8f, $ff, $8f
@song5ref876:
	.byte $ff, $9f, $ff, $9f, $ff, $9f, $ff, $9f, $ff, $9f, $ff, $9f, $ff, $9f, $ff, $9f
	.byte $41, $10
	.word @song5ref876
	.byte $ff, $9f, $42
	.word @song5ch4loop
@song6ch0:
	.byte $45, $02
@song6ch0loop:
	.byte $74, $9c
@song6ref6:
	.byte $1b, $89
@song6ref8:
	.byte $4f, $80, $27, $2e, $43, $22, $87, $4f, $b9, $2e, $33, $43, $27, $87, $4f, $6b, $33, $27, $81, $43, $1b, $85
	.byte $41, $0a
	.word @song6ref8
	.byte $4f, $80, $27, $2e, $43, $22, $87
	.byte $41, $0c
	.word @song6ref6
	.byte $41, $0a
	.word @song6ref8
	.byte $4f, $80, $27, $2e, $43, $22, $87
	.byte $41, $0c
	.word @song6ref6
	.byte $41, $0a
	.word @song6ref8
@song6ref59:
	.byte $4f, $80, $27, $2e, $43, $22, $87, $4f, $7f, $2e, $25, $43, $19, $87, $4f, $80, $25, $2c, $43, $20, $87, $4f, $b0, $2c
	.byte $31, $43, $25, $87, $4f, $77, $31, $25, $81, $43, $19, $85, $4f, $89, $25, $31, $81, $43, $25, $85, $4f, $50, $31, $2c
	.byte $43, $20, $87, $4f, $7f, $2c, $25, $43, $19, $87, $4f, $80, $25, $2c, $43, $20, $87
	.byte $41, $0c
	.word @song6ref6
	.byte $41, $0a
	.word @song6ref8
	.byte $4f, $80, $27, $2e, $43, $22, $87
	.byte $41, $0c
	.word @song6ref6
	.byte $41, $0a
	.word @song6ref8
	.byte $4f, $80, $27, $2e, $43, $22, $87
	.byte $41, $0c
	.word @song6ref6
	.byte $41, $0a
	.word @song6ref8
	.byte $41, $1d
	.word @song6ref59
	.byte $4f, $6b, $2c, $27, $43, $1b, $87
	.byte $41, $0a
	.word @song6ref8
	.byte $41, $0a
	.word @song6ref8
	.byte $4f, $80, $27, $2e, $43, $22, $87, $4f, $7f, $2e, $27, $43, $1b, $85, $46, $00, $4f, $9a, $27, $2e, $81, $43, $22, $85
	.byte $4f, $b9, $2e, $33, $43, $27, $85, $46, $00, $4f, $7f, $33, $27, $81, $43, $1b, $85, $4f, $80, $27, $2e, $43, $22, $85
	.byte $46, $00, $4f, $80, $2e, $33, $43, $27, $87, $4f, $6b, $33, $27, $81, $43, $1b, $83, $46, $00, $4f, $9a, $27, $2e, $81
	.byte $43, $22, $85, $4f, $7f, $2e, $27, $43, $1b, $85
@song6ref254:
	.byte $4f, $80, $27, $2e, $43, $22, $85, $4f, $b9, $2e, $33, $43, $27, $85, $4f, $6b, $33, $27, $81, $43, $1b, $83
	.byte $41, $0a
	.word @song6ref254
	.byte $4f, $80, $27, $2e, $43, $22, $85, $4f, $7f, $2e, $25, $43, $19, $83, $46, $00, $4f, $8e, $25, $2c, $81, $43, $20, $83
	.byte $4f, $b0, $2c, $31, $43, $25, $83, $46, $00, $4f, $7f, $31, $25, $81, $43, $19, $83, $4f, $89, $25, $31, $81, $43, $25
	.byte $81, $46, $00, $4f, $7f, $31, $2c, $43, $20, $85, $4f, $7f, $2c, $25, $43, $19, $83, $46, $00, $4f, $8e, $25, $2c, $81
	.byte $43, $20, $83, $4f, $6b, $2c, $27, $43, $1b, $83
@song6ref361:
	.byte $4f, $80, $27, $2e, $43, $22, $83, $4f, $b9, $2e, $33, $43, $27, $83, $4f, $6b, $33, $27, $81, $43, $1b, $81
	.byte $41, $0a
	.word @song6ref361
	.byte $4f, $80, $27, $2e, $43, $22, $83, $4f, $7f, $2e, $27, $43, $1b, $81, $46, $00, $4f, $9a, $27, $2e, $81, $43, $22, $81
	.byte $4f, $b9, $2e, $33, $43, $27, $81, $46, $00, $4f, $7f, $33, $27, $81
@song6ref424:
	.byte $43, $1b, $81, $4f, $80, $27, $2e, $43, $22, $81, $46, $00, $4f, $80, $2e, $33, $43, $27, $83, $4f, $6b, $33, $27, $81
	.byte $43, $1b, $4f, $80, $27, $2e, $43, $22, $83, $4f, $7f, $2e, $27
	.byte $41, $0d
	.word @song6ref424
	.byte $81, $46, $00, $4f, $80, $2e, $33, $43, $27, $83, $4f, $6b, $33, $27, $81, $43, $1b, $46, $00, $4f, $9a, $27, $2e, $81
	.byte $43, $22, $73, $82, $4f, $7f, $2e, $25, $43, $19, $81, $72, $4f, $80, $25, $2c, $43, $20, $81, $71, $4f, $b0, $2c, $31
	.byte $43, $25, $81, $4f, $77, $31, $25, $81, $43, $19, $4f, $89, $25, $31, $81, $43, $25, $4f, $50, $31, $2c, $43, $20, $81
	.byte $72, $4f, $7f, $2c, $25, $43, $19, $81, $73
@song6ref545:
	.byte $4f, $80, $25, $2c, $43, $20, $81
@song6ref552:
	.byte $4f, $6b, $2c, $27
@song6ref556:
	.byte $43, $1b, $46, $00, $4f, $80, $27, $2e, $43, $22, $81, $4f, $b9, $2e, $33, $43, $27, $46, $00, $4f, $7f, $33, $27, $43
	.byte $1b, $81, $4f, $80, $27, $2e, $43, $22, $46, $00, $4f, $80, $2e, $33, $43, $27, $81, $4f, $7f, $33, $27, $43, $1b, $46
	.byte $00, $4f, $80, $27, $2e, $43, $22, $81, $4f, $7f, $2e, $27
	.byte $41, $14
	.word @song6ref556
	.byte $41, $13
	.word @song6ref556
@song6ref622:
	.byte $4f, $7f, $2e, $25, $43, $19, $46, $00, $4f, $80, $25, $2c, $43, $20, $81, $4f, $b0, $2c, $31, $43, $25, $46, $00, $4f
	.byte $7f, $31, $25, $43, $19, $81, $4f, $80, $25, $31, $43, $25, $46, $00, $4f, $7f, $31, $2c, $43, $20, $81, $4f, $7f, $2c
	.byte $25, $43, $19, $46, $00
	.byte $41, $18
	.word @song6ref545
	.byte $41, $14
	.word @song6ref556
	.byte $41, $13
	.word @song6ref556
	.byte $41, $11
	.word @song6ref622
	.byte $46, $00
	.byte $41, $18
	.word @song6ref545
	.byte $41, $14
	.word @song6ref556
	.byte $41, $13
	.word @song6ref556
	.byte $41, $11
	.word @song6ref622
	.byte $46, $00
	.byte $41, $18
	.word @song6ref545
	.byte $41, $14
	.word @song6ref556
	.byte $41, $13
	.word @song6ref556
	.byte $41, $11
	.word @song6ref622
	.byte $46, $00
	.byte $41, $18
	.word @song6ref545
	.byte $41, $14
	.word @song6ref556
	.byte $41, $13
	.word @song6ref556
	.byte $41, $11
	.word @song6ref622
	.byte $46, $00
	.byte $41, $18
	.word @song6ref545
	.byte $41, $14
	.word @song6ref556
	.byte $41, $13
	.word @song6ref556
	.byte $41, $11
	.word @song6ref622
	.byte $46, $00
	.byte $41, $18
	.word @song6ref545
	.byte $41, $14
	.word @song6ref556
	.byte $41, $13
	.word @song6ref556
	.byte $41, $11
	.word @song6ref622
@song6ref757:
	.byte $46, $00, $4f, $80, $25, $2c, $43, $20, $81, $75, $9c, $4f, $80, $2c, $3a, $43, $2e, $85, $4f, $12, $3a, $38, $43, $2c
	.byte $85, $4f, $ee, $38, $3a, $43, $2e, $85, $4f, $12, $3a, $38, $43, $2c, $85, $4f, $1e, $38, $35, $43, $29, $85, $4f, $f5
	.byte $35, $36, $43, $2a, $85, $4f, $0b, $36, $35, $43, $29, $85, $4f, $32, $35, $31, $43, $25, $85, $4f, $e5, $31, $33, $43
	.byte $27, $85, $4f, $1b, $33, $31, $43, $25, $85, $74, $4f, $e5, $31, $33, $43, $27, $85, $4f, $1b, $33, $31, $43, $25, $85
	.byte $73, $4f, $e5, $31, $33, $43, $27, $85, $4f, $1b, $33, $31, $43, $25, $85, $72, $4f, $e5, $31, $33, $43, $27, $85, $4f
	.byte $1b, $33, $31, $43, $25, $85, $73, $82
	.byte $41, $15
	.word @song6ref552
	.byte $41, $14
	.word @song6ref556
	.byte $41, $13
	.word @song6ref556
	.byte $41, $11
	.word @song6ref622
	.byte $46, $00
	.byte $41, $18
	.word @song6ref545
	.byte $41, $14
	.word @song6ref556
	.byte $41, $13
	.word @song6ref556
	.byte $41, $11
	.word @song6ref622
	.byte $46, $00
	.byte $41, $18
	.word @song6ref545
	.byte $41, $14
	.word @song6ref556
	.byte $41, $13
	.word @song6ref556
	.byte $41, $11
	.word @song6ref622
	.byte $46, $00
	.byte $41, $18
	.word @song6ref545
	.byte $41, $14
	.word @song6ref556
	.byte $41, $13
	.word @song6ref556
	.byte $41, $11
	.word @song6ref622
	.byte $46, $00
	.byte $41, $18
	.word @song6ref545
	.byte $41, $14
	.word @song6ref556
	.byte $41, $13
	.word @song6ref556
	.byte $41, $11
	.word @song6ref622
	.byte $46, $00
	.byte $41, $18
	.word @song6ref545
	.byte $41, $14
	.word @song6ref556
	.byte $41, $13
	.word @song6ref556
	.byte $41, $11
	.word @song6ref622
	.byte $46, $00
	.byte $41, $18
	.word @song6ref545
	.byte $41, $14
	.word @song6ref556
	.byte $41, $13
	.word @song6ref556
	.byte $41, $11
	.word @song6ref622
	.byte $41, $33
	.word @song6ref757
	.byte $7c, $98
@song6ref986:
	.byte $4f, $7f, $31, $11, $87, $43, $05
@song6ref993:
	.byte $44, $85, $05, $43, $05, $85, $44, $87, $05, $43, $05, $85, $05, $43, $05, $85, $4f, $7f, $11, $0f, $43, $03, $85, $4f
	.byte $80, $0f, $11, $43, $05, $85, $44, $87, $4f, $7f, $11, $0f, $43, $03, $85, $4f, $80, $0f, $11, $43, $05, $85, $4f, $80
	.byte $11, $14, $43, $08, $ad, $4f, $7f, $14, $11, $43, $05, $87
	.byte $41, $1b
	.word @song6ref993
	.byte $4f, $80, $11, $16, $43, $0a, $99, $4f, $84, $16, $18, $43, $0c, $8f
	.byte $41, $21
	.word @song6ref986
	.byte $42
	.word @song6ch0loop
@song6ch1:
@song6ch1loop:
	.byte $89, $71
@song6ref1079:
	.byte $4d, $01, $9c
@song6ref1082:
	.byte $1b, $89, $22, $89, $27, $89, $1b, $89, $22, $89, $27, $89, $1b, $89, $22, $89, $4d, $01
	.byte $41, $10
	.word @song6ref1082
	.byte $4d, $01
	.byte $41, $10
	.word @song6ref1082
@song6ref1108:
	.byte $82, $19, $89, $20, $89, $25, $89, $19, $89, $25, $89, $20, $89, $19, $89, $20, $89
	.byte $41, $10
	.word @song6ref1079
	.byte $4d, $01
	.byte $41, $10
	.word @song6ref1082
	.byte $4d, $01
	.byte $41, $10
	.word @song6ref1082
	.byte $41, $10
	.word @song6ref1108
	.byte $41, $10
	.word @song6ref1079
	.byte $4d, $01
	.byte $41, $0d
	.word @song6ref1082
	.byte $83, $85, $00, $81, $4d, $01
	.byte $41, $0b
	.word @song6ref1082
	.byte $87, $81, $00, $85, $4d, $01
	.byte $41, $0c
	.word @song6ref1082
	.byte $4d, $01
	.byte $41, $09
	.word @song6ref1082
@song6ref1172:
	.byte $83, $85, $00, $81, $4d, $01, $1b, $89, $22, $89, $27, $89, $1b, $87, $81, $00, $85, $4d, $01, $1b, $89, $22, $89, $27
	.byte $89, $1b
	.byte $41, $0b
	.word @song6ref1172
	.byte $7c, $4e, $00, $98
@song6ref1205:
	.byte $03, $4d, $00
@song6ref1208:
	.byte $89, $44, $85, $03, $87, $44, $87, $03, $87, $03, $87, $01, $87, $03, $87, $44, $87, $01, $87, $03, $87, $06, $af, $03
	.byte $41, $15
	.word @song6ref1208
	.byte $08, $9b, $0a, $91, $4e, $00
	.byte $41, $18
	.word @song6ref1205
	.byte $75, $48, .lobyte(@env0), .hibyte(@env0), $49, $9c, $1e, $87, $1d, $87, $1b, $83, $48, .lobyte(@env5), .hibyte(@env5)
	.byte $a1, $48, .lobyte(@env0), .hibyte(@env0), $49, $1e, $87, $1d, $87, $1e, $87, $1d, $87, $1b, $83, $48, .lobyte(@env5)
	.byte .hibyte(@env5), $8d, $48, .lobyte(@env0), .hibyte(@env0), $49, $1e, $87, $1d, $87, $1b, $83, $48, .lobyte(@env5), .hibyte(@env5)
	.byte $8b, $48, .lobyte(@env0), .hibyte(@env0), $49, $81, $4e, $03, $9e
@song6ref1300:
	.byte $27, $87, $2e, $87, $27, $87, $2e, $87, $72, $27, $87, $2e, $87, $27, $87, $2e, $87, $75, $31, $87, $2e, $87, $31, $87
	.byte $2e, $87, $72, $31, $87, $2e, $87, $31, $87, $2e, $87, $75, $31, $87, $72, $2e, $87, $75, $31, $87, $72, $31, $87, $75
	.byte $2e, $87, $72, $31, $87, $75, $2e, $87, $72, $2e, $87, $75, $33, $87, $72, $2e, $87, $75, $33, $87, $72, $33, $87, $71
	.byte $3f, $81, $46, $00, $72, $3f, $83, $73, $3f, $81, $46, $00, $74, $3f, $83, $75, $3f, $81, $46, $00, $76, $3f, $83, $77
	.byte $3f, $81, $46, $00, $78, $3f, $83, $75, $4e, $03
	.byte $41, $20
	.word @song6ref1300
	.byte $75, $4e, $03, $9c, $22, $87, $20, $87, $22, $87, $20, $87, $1d, $87, $1e, $87, $1d, $87, $19, $87, $82, $1b, $87, $48
	.byte .lobyte(@env34), .hibyte(@env34), $89, $74, $93, $73, $93, $72, $8f, $48, .lobyte(@env0), .hibyte(@env0), $49, $81
	.byte $4e, $02, $81, $7f, $4d, $ff, $a2
@song6ref1454:
	.byte $1b
@song6ref1455:
	.byte $87, $22, $87, $44, $87, $22, $91, $48, .lobyte(@env9), .hibyte(@env9), $93, $48, .lobyte(@env0), .hibyte(@env0), $49
	.byte $44, $87, $25
	.byte $41, $0b
	.word @song6ref1455
@song6ref1476:
	.byte $87, $44, $87, $25, $87, $44, $87, $22, $87, $44, $87, $22, $87, $44, $87, $26, $87, $43, $4f, $fe, $32, $33, $87, $48
	.byte .lobyte(@env40), .hibyte(@env40), $81, $43, $27, $ad, $48, .lobyte(@env0), .hibyte(@env0), $49, $44, $87, $4d, $ff
	.byte $41, $0c
	.word @song6ref1454
	.byte $41, $0a
	.word @song6ref1455
@song6ref1520:
	.byte $28, $81, $43, $4f, $fd, $34, $35, $83, $48, .lobyte(@env40), .hibyte(@env40), $83, $43, $29, $83, $48, .lobyte(@env0)
	.byte .hibyte(@env0), $49, $44, $87, $2a, $87, $44, $87, $29, $87, $44, $87, $27, $91, $48, .lobyte(@env40), .hibyte(@env40)
	.byte $bb, $48, .lobyte(@env0), .hibyte(@env0), $49, $44, $87, $4d, $ff
	.byte $41, $0c
	.word @song6ref1454
	.byte $41, $0b
	.word @song6ref1455
	.byte $41, $18
	.word @song6ref1476
	.byte $4d, $ff
	.byte $41, $0c
	.word @song6ref1454
	.byte $41, $0a
	.word @song6ref1455
	.byte $41, $16
	.word @song6ref1520
	.byte $4e, $00, $9a
@song6ref1586:
	.byte $20, $87, $1e, $87, $1d, $87, $1b, $87, $1d, $87, $48, .lobyte(@env34), .hibyte(@env34), $89, $44, $91, $48, .lobyte(@env0)
	.byte .hibyte(@env0), $49, $20, $87, $1e, $87, $1d, $87, $24, $87, $48, .lobyte(@env34), .hibyte(@env34), $93, $44, $87, $48
	.byte .lobyte(@env0), .hibyte(@env0), $49, $27, $87, $ff, $9f, $4e, $00
	.byte $41, $1a
	.word @song6ref1586
	.byte $42
	.word @song6ch1loop
@song6ch2:
@song6ch2loop:
	.byte $00, $dd, $df, $00, $dd, $df, $00, $dd, $df, $00, $dd, $df, $82, $1d, $00, $ab, $25, $00, $ab, $1d, $00, $a7, $25, $00
	.byte $a7, $1d, $00, $a3, $25, $00, $a3, $1d, $00, $9f, $25, $00, $9f, $1d, $00, $9b, $25, $00, $9b, $1d, $00, $97, $25, $00
	.byte $97, $1d, $00, $95, $25, $00, $95, $1d, $00, $ab
@song6ref1695:
	.byte $1d, $0f, $87, $00, $85, $25, $0f, $87, $00, $85, $1d, $0f, $83, $00, $0f, $87, $25, $0d, $85, $0f, $87, $1d, $00, $85
	.byte $0d, $87, $25, $0f, $85, $12, $87, $1d, $12, $8f, $25, $12, $8f
	.byte $41, $1d
	.word @song6ref1695
	.byte $14, $87, $1d, $14, $8f, $25, $16, $8f
	.byte $41, $25
	.word @song6ref1695
@song6ref1746:
	.byte $1d, $0d, $a3, $1d, $0d, $a3, $1d, $0c, $8f, $1d, $0c, $8f, $1d, $0b, $85, $1d, $0b, $85, $1d, $0b, $85, $1d, $0b, $85
	.byte $41, $25
	.word @song6ref1695
	.byte $41, $23
	.word @song6ref1695
	.byte $14, $8f
	.byte $41, $25
	.word @song6ref1695
	.byte $41, $18
	.word @song6ref1746
	.byte $41, $25
	.word @song6ref1695
	.byte $41, $23
	.word @song6ref1695
	.byte $14, $8f
	.byte $41, $25
	.word @song6ref1695
	.byte $1d, $0d, $8f, $25, $0d, $8f, $1d, $0d, $8f, $25, $0d, $8f, $1d, $0c, $8f, $25, $0c, $8f, $1d, $0b, $8f, $25, $0b, $8f
	.byte $41, $25
	.word @song6ref1695
	.byte $41, $23
	.word @song6ref1695
	.byte $14, $8f
	.byte $41, $25
	.word @song6ref1695
	.byte $41, $18
	.word @song6ref1746
@song6ref1833:
	.byte $1d, $11, $87, $00, $85, $25, $11, $87, $00, $85, $1d, $11, $83, $00, $11, $87, $25, $0f, $85, $11, $87, $1d, $00, $85
	.byte $0f, $87, $25, $11, $85, $14, $87, $1d, $14, $8f, $25, $14, $8f
	.byte $41, $20
	.word @song6ref1833
	.byte $16, $8f, $25, $18, $8f
	.byte $41, $25
	.word @song6ref1833
	.byte $42
	.word @song6ch2loop
@song6ch3:
@song6ch3loop:
	.byte $00, $dd, $00, $dd, $00, $dd, $00, $dd, $00, $dd, $00, $dd, $00, $dd, $00, $dd, $88, $14, $ad, $8c, $14, $ad, $88, $14
	.byte $a9, $8c, $14, $a9, $88, $14, $a5, $8c, $14, $a5, $88, $14, $a1, $8c, $14, $a1, $88, $14, $9d, $8c, $14, $9d, $88, $14
	.byte $99, $8c, $14, $99, $88, $14, $97, $8c, $14, $97, $88, $14, $95, $70, $50, $06, $90, $82, $23, $95, $7f
@song6ref1954:
	.byte $88, $14, $91, $8c, $14, $91, $88, $14, $91, $8c, $14, $91, $88, $14, $91, $8c, $14, $91
	.byte $41, $0c
	.word @song6ref1954
	.byte $41, $0c
	.word @song6ref1954
	.byte $41, $0c
	.word @song6ref1954
	.byte $88, $14, $a5, $14, $a5, $14, $91, $14, $91, $14, $87, $14, $87, $14, $87, $14, $87
@song6ref1998:
	.byte $14, $87, $8a, $21, $87, $8c, $14, $87, $8a, $21, $87, $88, $14, $81, $46, $00, $8a, $1f, $83, $21, $81, $46, $00, $1f
	.byte $83, $8c, $14, $87, $8a, $21, $87, $88
	.byte $41, $14
	.word @song6ref1998
	.byte $88
	.byte $41, $14
	.word @song6ref1998
	.byte $88
	.byte $41, $14
	.word @song6ref1998
	.byte $88
	.byte $41, $14
	.word @song6ref1998
	.byte $88
	.byte $41, $14
	.word @song6ref1998
	.byte $77, $50, $fe, $00, $a0, $1b, $b5, $bf, $50, $04, $a0, $82, $21, $a5, $7f, $88
	.byte $41, $14
	.word @song6ref1998
	.byte $88
	.byte $41, $14
	.word @song6ref1998
	.byte $88
	.byte $41, $14
	.word @song6ref1998
	.byte $88
	.byte $41, $14
	.word @song6ref1998
	.byte $88
	.byte $41, $14
	.word @song6ref1998
	.byte $88
	.byte $41, $14
	.word @song6ref1998
	.byte $88
	.byte $41, $14
	.word @song6ref1998
	.byte $88
	.byte $41, $14
	.word @song6ref1998
	.byte $88
	.byte $41, $14
	.word @song6ref1998
	.byte $88
	.byte $41, $14
	.word @song6ref1998
	.byte $88
	.byte $41, $14
	.word @song6ref1998
	.byte $88
	.byte $41, $14
	.word @song6ref1998
	.byte $88
	.byte $41, $14
	.word @song6ref1998
	.byte $88
	.byte $41, $14
	.word @song6ref1998
	.byte $77, $50, $fe, $00, $a0, $1b, $b5, $bf, $50, $04, $a0, $82, $21, $a5, $7f, $88
	.byte $41, $14
	.word @song6ref1998
	.byte $88
	.byte $41, $14
	.word @song6ref1998
	.byte $88
	.byte $41, $14
	.word @song6ref1998
	.byte $88
	.byte $41, $14
	.word @song6ref1998
	.byte $88
	.byte $41, $14
	.word @song6ref1998
	.byte $88
	.byte $41, $14
	.word @song6ref1998
	.byte $42
	.word @song6ch3loop
@song6ch4:
@song6ch4loop:
@song6ref2163:
	.byte $39, $a1, $39, $a1, $39, $95, $c7, $39, $95
	.byte $41, $09
	.word @song6ref2163
	.byte $41, $09
	.word @song6ref2163
	.byte $41, $09
	.word @song6ref2163
	.byte $df, $d7, $cf, $c7, $bf, $b7, $b3, $af
@song6ref2189:
	.byte $ff, $9f, $ff, $9f, $ff, $9f, $ff, $9f, $ff, $9f
	.byte $41, $0a
	.word @song6ref2189
	.byte $41, $0a
	.word @song6ref2189
	.byte $ff, $9f, $ff, $9f, $ff, $9f, $ff, $9f, $42
	.word @song6ch4loop
@song7ch0:
@song7ch0loop:
	.byte $81, $75
@song7ref4:
	.byte $a4
@song7ref5:
	.byte $08
@song7ref6:
	.byte $00, $08, $81, $0f, $81, $08, $81, $0f, $81, $14, $85, $17, $00, $17, $81, $0b, $81, $17, $81, $00, $81, $17, $00, $17
	.byte $89, $12, $81, $06, $81, $00, $81, $17, $81, $00, $81, $0b, $81, $06, $81, $00, $81, $19, $81, $0d, $81, $08, $81, $10
	.byte $85, $00, $81, $12, $81, $00
@song7ref60:
	.byte $81, $08, $83, $0b, $83, $0f, $81, $09, $83, $0d, $83, $10
	.byte $41, $0c
	.word @song7ref60
	.byte $41, $0c
	.word @song7ref60
@song7ref78:
	.byte $81, $0f, $81, $10, $81, $0f, $81, $0d, $81, $0f, $81, $10, $81, $0f, $81, $0d, $7f, $98
@song7ref96:
	.byte $08, $85, $44, $81, $08, $85, $44, $89, $0b, $85, $44, $81, $0b, $85, $44, $89, $06, $85, $44, $81, $06, $85, $44, $89
	.byte $01, $85, $44, $81, $01, $85, $44, $89
	.byte $41, $0f
	.word @song7ref96
	.byte $85, $06, $85, $44, $85, $0b, $85, $44, $85, $0d, $85, $44, $85, $10, $89, $12, $85, $42
	.word @song7ch0loop
@song7ch1:
@song7ch1loop:
	.byte $7c
	.byte $41, $43
	.word @song7ref4
	.byte $41, $0c
	.word @song7ref60
	.byte $41, $0c
	.word @song7ref60
	.byte $41, $10
	.word @song7ref78
	.byte $81, $7f, $00, $85, $a2, $27, $81, $44, $81, $27, $81, $2c, $81, $44, $81, $2a, $81, $44, $81, $27, $25, $23, $85, $20
	.byte $81, $23, $81, $44, $81, $25, $81, $27, $81, $25, $81, $23, $81, $20, $81, $44, $81, $23, $81, $27, $81, $25, $85, $2a
	.byte $81, $2a, $44, $2a, $89, $44, $85, $87, $2c, $83, $4f, $40, $38, $2c, $43, $20, $81, $2c, $89, $2a, $99, $00, $c1, $42
	.word @song7ch1loop
@song7ch2:
@song7ch2loop:
	.byte $ff, $7f, $47, $02, $82
@song7ref245:
	.byte $1d, $00, $83, $47, $02, $25, $00, $83, $47, $02, $1d, $00, $83, $47, $02, $25, $00, $83, $47, $02
	.byte $41, $0c
	.word @song7ref245
	.byte $47, $02
	.byte $41, $0b
	.word @song7ref245
	.byte $a3, $86
	.byte $41, $39
	.word @song7ref5
	.byte $41, $37
	.word @song7ref6
	.byte $42
	.word @song7ch2loop
@song7ch3:
@song7ch3loop:
	.byte $7f
@song7ref286:
	.byte $8a, $21, $23, $92, $20, $81, $8a, $21, $23, $92, $20, $81, $8a, $21, $23, $92, $20, $81
	.byte $41, $0c
	.word @song7ref286
	.byte $41, $0c
	.word @song7ref286
	.byte $41, $0c
	.word @song7ref286
	.byte $41, $0c
	.word @song7ref286
	.byte $8a, $21
@song7ref318:
	.byte $23, $92, $20, $81, $88, $14, $8a, $23, $92, $20, $81, $8c, $14, $8a, $23, $92, $20, $81, $88, $14, $8a, $23, $92, $20
	.byte $81, $8c, $14, $8a
	.byte $41, $10
	.word @song7ref318
	.byte $8a
	.byte $41, $10
	.word @song7ref318
	.byte $8a, $23, $92, $20, $81, $00, $9d
@song7ref360:
	.byte $88, $14, $8a, $23, $92, $20, $8a, $23, $8c, $14, $81, $8a, $23, $92, $20, $88, $14, $8a, $23, $92, $20, $8a, $23, $8c
	.byte $14, $81, $8a, $23, $92, $20
	.byte $41, $10
	.word @song7ref360
	.byte $41, $10
	.word @song7ref360
	.byte $41, $10
	.word @song7ref360
	.byte $41, $10
	.word @song7ref360
	.byte $41, $10
	.word @song7ref360
	.byte $41, $10
	.word @song7ref360
	.byte $41, $10
	.word @song7ref360
	.byte $42
	.word @song7ch3loop
@song7ch4:
	.byte $45, $05
@song7ch4loop:
	.byte $45, $05, $ff, $45, $05, $ff, $ff, $45, $05, $ff, $42
	.word @song7ch4loop