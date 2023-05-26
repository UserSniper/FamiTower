; This file for the FamiStudio Sound Engine was copied from music.s and modified manually

.if FAMISTUDIO_CFG_C_BINDINGS
.export _music_data_2_=music_data_2_
.endif

music_data_2_:
	.byte 4
	.word @instruments
	.word @samples-5
	.word @song8ch0,@song8ch1,@song8ch2,@song8ch3,@song8ch4,307,256 ; 08 : A Grain of Bread in a Grain of Sand 1
	.word @song9ch0,@song9ch1,@song9ch2,@song9ch3,@song9ch4,307,256 ; 09 : Unexpectancy (3) 1
	.word @song10ch0,@song10ch1,@song10ch2,@song10ch3,@song10ch4,307,256 ; 0a : bye bye there! 1
	.word @song11ch0,@song11ch1,@song11ch2,@song11ch3,@song11ch4,307,256 ; 0b : Hip to be Italian 1

.export music_data_2_
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

@song8ch0:
	.byte $45, $02
@song8ch0loop:
	.byte $7f, $4d, $ff
@song8ref7:
	.byte $48, .lobyte(@env0), .hibyte(@env0), $49, $90
@song8ref12:
	.byte $20, $89, $48, .lobyte(@env36), .hibyte(@env36), $9d, $44, $89, $48, .lobyte(@env0), .hibyte(@env0), $49, $1e, $83
	.byte $44, $83, $48, .lobyte(@env36), .hibyte(@env36), $85, $48, .lobyte(@env0), .hibyte(@env0), $49, $21, $89, $48, .lobyte(@env36)
	.byte .hibyte(@env36), $9d, $44, $89, $48, .lobyte(@env0), .hibyte(@env0), $49, $1e, $83, $44, $83, $48, .lobyte(@env36)
	.byte .hibyte(@env36), $85, $4d, $ff, $48, .lobyte(@env0), .hibyte(@env0), $49
	.byte $41, $14
	.word @song8ref12
	.byte $4d, $ff, $48, .lobyte(@env0), .hibyte(@env0), $49
	.byte $41, $14
	.word @song8ref12
@song8ref74:
	.byte $48, .lobyte(@env0), .hibyte(@env0), $49, $27, $83, $44, $83, $48, .lobyte(@env36), .hibyte(@env36), $85, $48, .lobyte(@env0)
	.byte .hibyte(@env0), $49, $28, $83, $44, $83, $48, .lobyte(@env36), .hibyte(@env36), $85, $48, .lobyte(@env0), .hibyte(@env0)
	.byte $49, $27, $83, $44, $83, $48, .lobyte(@env36), .hibyte(@env36), $85, $48, .lobyte(@env0), .hibyte(@env0), $49, $25
	.byte $83, $44, $83, $48, .lobyte(@env36), .hibyte(@env36), $85
	.byte $41, $14
	.word @song8ref74
	.byte $4d, $ff, $48, .lobyte(@env0), .hibyte(@env0), $49
	.byte $41, $14
	.word @song8ref12
	.byte $4d, $ff, $48, .lobyte(@env0), .hibyte(@env0), $49
	.byte $41, $14
	.word @song8ref12
	.byte $4d, $ff, $48, .lobyte(@env0), .hibyte(@env0), $49
	.byte $41, $14
	.word @song8ref12
	.byte $41, $14
	.word @song8ref74
	.byte $41, $0a
	.word @song8ref74
@song8ref158:
	.byte $48, .lobyte(@env0), .hibyte(@env0), $49, $a3, $00, $ff, $8d, $00, $ff, $8d, $00, $ff, $8d, $00, $ff, $8d, $42
	.word @song8ch0loop
@song8ch1:
@song8ch1loop:
	.byte $7f, $4d, $01
	.byte $41, $14
	.word @song8ref7
	.byte $4d, $01, $48, .lobyte(@env0), .hibyte(@env0), $49
	.byte $41, $14
	.word @song8ref12
	.byte $4d, $01, $48, .lobyte(@env0), .hibyte(@env0), $49
	.byte $41, $14
	.word @song8ref12
	.byte $41, $14
	.word @song8ref74
	.byte $41, $14
	.word @song8ref74
	.byte $4d, $01, $48, .lobyte(@env0), .hibyte(@env0), $49
	.byte $41, $14
	.word @song8ref12
	.byte $4d, $01, $48, .lobyte(@env0), .hibyte(@env0), $49
	.byte $41, $14
	.word @song8ref12
	.byte $4d, $01, $48, .lobyte(@env0), .hibyte(@env0), $49
	.byte $41, $14
	.word @song8ref12
	.byte $41, $14
	.word @song8ref74
	.byte $41, $0a
	.word @song8ref74
	.byte $41, $0d
	.word @song8ref158
	.byte $42
	.word @song8ch1loop
@song8ch2:
@song8ch2loop:
	.byte $82
@song8ref250:
	.byte $1d, $08, $99, $0c, $83, $25, $0c, $8d, $0f, $8f, $1d, $09, $99, $0d, $83, $25, $0d, $8d, $10, $8f
	.byte $41, $14
	.word @song8ref250
	.byte $41, $14
	.word @song8ref250
@song8ref276:
	.byte $1d, $0f, $8d, $0f, $8f, $25, $0a, $8d, $0a, $8f, $1d, $03, $8d, $03, $8f, $25, $09, $8d, $09, $8f
	.byte $41, $14
	.word @song8ref250
	.byte $41, $14
	.word @song8ref250
	.byte $41, $14
	.word @song8ref250
	.byte $41, $10
	.word @song8ref276
	.byte $00, $9f
	.byte $41, $14
	.word @song8ref250
	.byte $41, $14
	.word @song8ref250
	.byte $41, $14
	.word @song8ref250
	.byte $41, $14
	.word @song8ref276
	.byte $42
	.word @song8ch2loop
@song8ch3:
@song8ch3loop:
@song8ref326:
	.byte $88, $14, $89, $8a, $23, $83, $21, $89, $23, $83, $8c, $14, $89, $8a, $23, $83, $21, $89, $23, $83, $88, $14, $89, $8a
	.byte $23, $83, $92, $21, $89, $8a, $23, $83, $8c, $14, $89, $8a, $23, $83, $92, $21, $89, $8a, $23, $83
	.byte $41, $20
	.word @song8ref326
	.byte $41, $20
	.word @song8ref326
	.byte $41, $20
	.word @song8ref326
	.byte $41, $20
	.word @song8ref326
	.byte $41, $20
	.word @song8ref326
	.byte $41, $20
	.word @song8ref326
	.byte $41, $19
	.word @song8ref326
	.byte $a1
	.byte $41, $20
	.word @song8ref326
	.byte $41, $20
	.word @song8ref326
	.byte $41, $20
	.word @song8ref326
	.byte $41, $20
	.word @song8ref326
	.byte $42
	.word @song8ch3loop
@song8ch4:
@song8ch4loop:
@song8ref408:
	.byte $ff, $8f, $ff, $8f, $ff, $8f, $ff, $8f, $ff, $8f
	.byte $41, $0a
	.word @song8ref408
	.byte $ff, $8f, $ff, $8f, $42
	.word @song8ch4loop
@song9ch0:
	.byte $45, $02
@song9ch0loop:
	.byte $74, $9c
@song9ref6:
	.byte $25, $87, $4f, $e5, $31, $33, $43, $27, $8f, $4f, $1b, $33, $31, $43, $25, $85, $4f, $e5, $31, $33, $43, $27, $8f, $4f
	.byte $1b, $33, $31, $43, $25, $85, $4f, $e5, $31, $33, $43, $27, $8f, $4f, $1b, $33, $31, $43, $25, $85, $4f, $e5, $31, $33
	.byte $43, $27, $8f, $4f, $1b, $33, $31, $43, $25, $85, $4f, $e5, $31, $33, $43, $27, $85, $4f, $1b, $33, $31, $43, $25, $85
	.byte $4f, $e5, $31, $33, $43, $27, $85
	.byte $41, $23
	.word @song9ref6
	.byte $41, $23
	.word @song9ref6
	.byte $41, $23
	.word @song9ref6
	.byte $41, $23
	.word @song9ref6
	.byte $41, $23
	.word @song9ref6
	.byte $41, $23
	.word @song9ref6
	.byte $41, $23
	.word @song9ref6
	.byte $41, $23
	.word @song9ref6
	.byte $41, $23
	.word @song9ref6
	.byte $41, $23
	.word @song9ref6
	.byte $41, $23
	.word @song9ref6
	.byte $41, $23
	.word @song9ref6
	.byte $41, $23
	.word @song9ref6
	.byte $41, $23
	.word @song9ref6
	.byte $41, $23
	.word @song9ref6
	.byte $41, $23
	.word @song9ref6
	.byte $41, $23
	.word @song9ref6
	.byte $82, $1b, $4f, $dc, $27, $2e, $85, $43, $22, $9b, $48, .lobyte(@env13), .hibyte(@env13), $f7, $72, $ff, $9b, $48, .lobyte(@env0)
	.byte .hibyte(@env0), $49, $83, $7f, $4e, $02, $a2
@song9ref162:
	.byte $1b, $87, $1e, $83, $7c, $4e, $02, $1b, $87, $1e, $81, $7f, $1e, $87, $20, $83, $7c, $1e, $87, $20, $81, $7f, $20, $87
	.byte $22, $83, $7c, $20, $87, $22, $81, $7f, $22, $87, $23, $83, $7c, $22, $87, $23, $81, $7f, $22, $8d, $7c, $22, $95, $7f
	.byte $4e, $02
	.byte $41, $24
	.word @song9ref162
	.byte $7f, $4e, $02
	.byte $41, $24
	.word @song9ref162
	.byte $7f, $4e, $02
	.byte $41, $20
	.word @song9ref162
	.byte $7f, $25, $8d, $7c, $25, $95, $7f, $4e, $02
	.byte $41, $24
	.word @song9ref162
	.byte $7f, $4e, $02
	.byte $41, $24
	.word @song9ref162
	.byte $7f, $4e, $02
	.byte $41, $24
	.word @song9ref162
	.byte $7f, $4e, $02, $1b, $87, $1e, $83, $77, $4e, $02, $1b, $87, $1e, $81, $7f, $1e, $87, $20, $83, $77, $1e, $87, $20, $81
	.byte $7f, $20, $87, $22, $83, $77, $20, $87, $22, $81, $7f, $22, $87, $23, $83, $77, $22, $87, $23, $81, $7f, $25, $8d, $77
	.byte $25, $81, $75, $4e, $00, $82
@song9ref305:
	.byte $25, $87, $27, $87, $2a, $91, $48, .lobyte(@env31), .hibyte(@env31), $9d, $48, .lobyte(@env0), .hibyte(@env0), $49
	.byte $89, $25, $87, $27, $87, $2c, $91, $48, .lobyte(@env31), .hibyte(@env31), $9d, $48, .lobyte(@env0), .hibyte(@env0)
	.byte $49, $89, $25, $87, $27, $87, $2e, $8b, $2c, $89, $2a, $8b, $2c, $8b, $2a, $89, $27, $8b, $2a, $91, $48, .lobyte(@env31)
	.byte .hibyte(@env31), $9d, $48, .lobyte(@env0), .hibyte(@env0), $49, $89
	.byte $41, $1f
	.word @song9ref305
	.byte $91, $48, .lobyte(@env31), .hibyte(@env31), $ab, $48, .lobyte(@env0), .hibyte(@env0), $49, $89
	.byte $41, $24
	.word @song9ref305
	.byte $41, $15
	.word @song9ref305
	.byte $91, $48, .lobyte(@env31), .hibyte(@env31), $bb, $72, $cd, $48, .lobyte(@env0), .hibyte(@env0), $49, $81, $73
@song9ref394:
	.byte $4f, $7f, $3a, $27
@song9ref398:
	.byte $43, $1b, $46, $00, $4f, $80, $27, $2e, $43, $22, $81, $4f, $b9, $2e, $33, $43, $27, $46, $00, $4f, $7f, $33, $27, $43
	.byte $1b, $81, $4f, $80, $27, $2e, $43, $22, $46, $00, $4f, $80, $2e, $33, $43, $27, $81, $4f, $7f, $33, $27, $43, $1b, $46
	.byte $00, $4f, $80, $27, $2e, $43, $22, $81, $4f, $7f, $2e, $27
	.byte $41, $14
	.word @song9ref398
	.byte $41, $13
	.word @song9ref398
@song9ref464:
	.byte $4f, $7f, $2e, $25, $43, $19, $46, $00, $4f, $80, $25, $2c, $43, $20, $81, $4f, $b0, $2c, $31, $43, $25, $46, $00, $4f
	.byte $7f, $31, $25, $43, $19, $81, $4f, $80, $25, $31, $43, $25, $46, $00, $4f, $7f, $31, $2c, $43, $20, $81, $4f, $7f, $2c
	.byte $25, $43, $19, $46, $00, $4f, $80, $25, $2c, $43, $20, $81
	.byte $41, $15
	.word @song9ref394
	.byte $41, $14
	.word @song9ref398
	.byte $41, $13
	.word @song9ref398
	.byte $41, $14
	.word @song9ref464
	.byte $41, $15
	.word @song9ref394
	.byte $41, $14
	.word @song9ref398
	.byte $41, $13
	.word @song9ref398
	.byte $41, $14
	.word @song9ref464
	.byte $41, $15
	.word @song9ref394
	.byte $41, $14
	.word @song9ref398
	.byte $41, $13
	.word @song9ref398
	.byte $41, $14
	.word @song9ref464
	.byte $41, $15
	.word @song9ref394
	.byte $41, $14
	.word @song9ref398
	.byte $41, $13
	.word @song9ref398
	.byte $41, $14
	.word @song9ref464
	.byte $41, $15
	.word @song9ref394
	.byte $41, $14
	.word @song9ref398
	.byte $41, $13
	.word @song9ref398
	.byte $41, $14
	.word @song9ref464
	.byte $41, $15
	.word @song9ref394
	.byte $41, $14
	.word @song9ref398
	.byte $41, $13
	.word @song9ref398
	.byte $41, $14
	.word @song9ref464
	.byte $41, $15
	.word @song9ref394
	.byte $41, $14
	.word @song9ref398
	.byte $41, $13
	.word @song9ref398
	.byte $41, $14
	.word @song9ref464
	.byte $42
	.word @song9ch0loop
@song9ch1:
@song9ch1loop:
	.byte $ff, $9f, $ff, $9f, $ff, $9f, $ff, $9f, $98
@song9ref621:
	.byte $03, $ff, $9d, $40, $0c, $ff, $9d, $40, $0b, $ff, $9d, $40, $0b, $ff, $9d, $03, $ff, $9d, $40, $0c, $ff, $9d, $40, $0b
	.byte $ff, $9d, $40, $0b, $ff, $9d
	.byte $41, $15
	.word @song9ref621
	.byte $ff, $9f
@song9ref656:
	.byte $03, $8b, $44, $83, $03, $8b, $44, $83, $03, $81, $44, $83, $03, $81, $44, $83, $03, $81, $44, $83, $03, $81, $44, $83
	.byte $03, $81, $44, $83, $03, $81, $44, $83, $03, $81, $44, $83, $03, $81, $44, $83, $01, $a5
	.byte $41, $2a
	.word @song9ref656
	.byte $41, $2a
	.word @song9ref656
	.byte $41, $2a
	.word @song9ref656
	.byte $41, $2a
	.word @song9ref656
	.byte $41, $2a
	.word @song9ref656
	.byte $41, $2a
	.word @song9ref656
	.byte $41, $2a
	.word @song9ref656
@song9ref719:
	.byte $40, $0b, $91, $44, $87, $40, $0b, $91, $44, $9b, $01, $91, $44, $87, $01, $91, $44, $9b, $40, $0a, $91, $44, $87, $40
	.byte $0a, $91, $44, $9b, $03, $91, $44, $87, $03, $87, $01, $91, $44, $87, $01, $87
	.byte $41, $24
	.word @song9ref719
	.byte $41, $24
	.word @song9ref719
	.byte $41, $17
	.word @song9ref719
	.byte $87, $40, $0a, $91, $44, $87, $40, $0a, $91, $44, $87, $40, $0a, $87, $44, $87, $40, $0a, $87, $44, $87, $7f, $a2
@song9ref791:
	.byte $1b, $87, $22, $87, $44, $87, $22, $91, $48, .lobyte(@env9), .hibyte(@env9), $93, $48, .lobyte(@env0), .hibyte(@env0)
	.byte $49, $44, $87, $25, $87, $22, $87, $44, $87, $22, $91, $48, .lobyte(@env9), .hibyte(@env9), $93, $48, .lobyte(@env0)
	.byte .hibyte(@env0), $49, $44, $87, $25, $87, $44, $87, $25, $87, $44, $87, $22, $87, $44, $87, $22, $87, $44, $87, $26
	.byte $87, $43, $4f, $fe, $32, $33, $87, $48, .lobyte(@env40), .hibyte(@env40), $81, $43, $27, $ad, $48, .lobyte(@env0), .hibyte(@env0)
	.byte $49, $44, $87
	.byte $41, $16
	.word @song9ref791
	.byte $28, $81, $43, $4f, $fd, $34, $35, $83, $48, .lobyte(@env40), .hibyte(@env40), $83, $43, $29, $83, $48, .lobyte(@env0)
	.byte .hibyte(@env0), $49, $44, $87, $2a, $87, $44, $87, $29, $87, $44, $87, $27, $91, $48, .lobyte(@env40), .hibyte(@env40)
	.byte $97, $48, .lobyte(@env0), .hibyte(@env0), $49, $44, $83, $19, $a5, $1b, $9b, $1d, $9b, $1e, $9b, $20, $9b, $22, $a5
	.byte $22, $9b, $20, $9b, $1e, $9b, $20, $9b, $1e, $91, $1d, $91, $1b, $9b, $1d, $9b, $1e, $9b, $20, $9b, $22, $a5, $27, $9b
	.byte $25, $9b, $27, $91, $29, $9b, $2a, $9b, $29, $91, $42
	.word @song9ch1loop
@song9ch2:
@song9ch2loop:
@song9ref958:
	.byte $00, $ff, $9d, $00, $ff, $9d, $00, $ff, $9d, $00, $ff, $9d, $00, $ff, $9d, $00, $ff, $9d, $00, $ff, $9d
	.byte $41, $15
	.word @song9ref958
	.byte $98, $12, $ff, $9d, $12, $ff, $9d, $0f, $ff, $9d, $82, $0c, $ff, $9d, $0b, $ff, $9d, $ff, $9f
@song9ref1001:
	.byte $1d, $00, $85, $1d, $00, $85, $25, $00, $85, $1d, $00, $85, $1d, $00, $85, $1d, $00, $85, $25, $00, $85, $1d, $00, $85
	.byte $41, $18
	.word @song9ref1001
	.byte $41, $18
	.word @song9ref1001
	.byte $41, $18
	.word @song9ref1001
	.byte $41, $18
	.word @song9ref1001
	.byte $41, $18
	.word @song9ref1001
	.byte $41, $18
	.word @song9ref1001
	.byte $41, $18
	.word @song9ref1001
	.byte $41, $18
	.word @song9ref1001
	.byte $41, $18
	.word @song9ref1001
	.byte $41, $18
	.word @song9ref1001
	.byte $41, $18
	.word @song9ref1001
	.byte $41, $18
	.word @song9ref1001
	.byte $41, $18
	.word @song9ref1001
	.byte $41, $18
	.word @song9ref1001
	.byte $41, $18
	.word @song9ref1001
	.byte $41, $18
	.word @song9ref1001
	.byte $41, $18
	.word @song9ref1001
	.byte $41, $18
	.word @song9ref1001
	.byte $41, $18
	.word @song9ref1001
	.byte $41, $18
	.word @song9ref1001
	.byte $41, $18
	.word @song9ref1001
	.byte $41, $18
	.word @song9ref1001
	.byte $41, $18
	.word @song9ref1001
	.byte $41, $18
	.word @song9ref1001
	.byte $41, $18
	.word @song9ref1001
	.byte $41, $18
	.word @song9ref1001
	.byte $41, $18
	.word @song9ref1001
	.byte $41, $18
	.word @song9ref1001
	.byte $41, $18
	.word @song9ref1001
	.byte $1d, $00, $ff, $9b
@song9ref1116:
	.byte $1d, $0f, $87, $00, $85, $25, $0f, $87, $00, $85, $1d, $0f, $83, $00, $0f, $87, $25, $0d, $85, $0f, $87, $1d, $00, $85
	.byte $0f, $87, $25, $0f, $85, $0f, $87, $1d, $0d, $8f, $25, $0d, $8f
	.byte $41, $25
	.word @song9ref1116
	.byte $41, $25
	.word @song9ref1116
	.byte $41, $25
	.word @song9ref1116
	.byte $41, $25
	.word @song9ref1116
	.byte $41, $25
	.word @song9ref1116
	.byte $41, $25
	.word @song9ref1116
	.byte $41, $25
	.word @song9ref1116
	.byte $42
	.word @song9ch2loop
@song9ch3:
@song9ch3loop:
	.byte $41, $15
	.word @song9ref958
	.byte $41, $15
	.word @song9ref958
	.byte $00, $ff, $9d, $00, $ff, $9d, $00, $ff, $9d, $f7, $70, $50, $04, $a0, $82, $21, $a5, $77, $50, $fe, $00, $1c, $b5, $e7
	.byte $cf, $7f, $88, $14, $81, $00, $83, $14, $81, $00, $8d, $14, $81, $00, $83, $14, $81, $00, $8d, $14, $81, $00, $83, $14
	.byte $81, $00, $83
@song9ref1235:
	.byte $14, $87, $14, $87, $8c, $14, $87, $88, $14, $87, $14, $87, $14, $87, $8c, $14, $87, $88, $14, $87, $14, $87, $14, $87
	.byte $8c, $14, $87, $88, $14, $87
	.byte $41, $18
	.word @song9ref1235
	.byte $41, $18
	.word @song9ref1235
	.byte $41, $18
	.word @song9ref1235
	.byte $41, $18
	.word @song9ref1235
	.byte $41, $18
	.word @song9ref1235
	.byte $41, $18
	.word @song9ref1235
	.byte $41, $18
	.word @song9ref1235
	.byte $41, $18
	.word @song9ref1235
	.byte $41, $18
	.word @song9ref1235
	.byte $41, $18
	.word @song9ref1235
	.byte $41, $18
	.word @song9ref1235
	.byte $41, $18
	.word @song9ref1235
	.byte $41, $18
	.word @song9ref1235
	.byte $41, $18
	.word @song9ref1235
	.byte $41, $18
	.word @song9ref1235
	.byte $41, $18
	.word @song9ref1235
	.byte $41, $18
	.word @song9ref1235
	.byte $41, $18
	.word @song9ref1235
	.byte $41, $18
	.word @song9ref1235
	.byte $14, $f5, $70, $50, $04, $a0, $82, $21, $a5, $7f
@song9ref1332:
	.byte $88, $14, $87, $8a, $21, $87, $8c, $14, $87, $8a, $21, $87, $88, $14, $81, $46, $00, $8a, $1f, $83, $21, $81, $46, $00
	.byte $1f, $83, $8c, $14, $87, $8a, $21, $87
	.byte $41, $14
	.word @song9ref1332
	.byte $41, $14
	.word @song9ref1332
	.byte $41, $14
	.word @song9ref1332
	.byte $41, $14
	.word @song9ref1332
	.byte $41, $14
	.word @song9ref1332
	.byte $41, $14
	.word @song9ref1332
	.byte $41, $14
	.word @song9ref1332
	.byte $41, $14
	.word @song9ref1332
	.byte $41, $14
	.word @song9ref1332
	.byte $41, $14
	.word @song9ref1332
	.byte $41, $14
	.word @song9ref1332
	.byte $41, $14
	.word @song9ref1332
	.byte $41, $14
	.word @song9ref1332
	.byte $41, $14
	.word @song9ref1332
	.byte $41, $14
	.word @song9ref1332
	.byte $42
	.word @song9ch3loop
@song9ch4:
@song9ch4loop:
	.byte $41, $15
	.word @song9ref958
	.byte $41, $15
	.word @song9ref958
	.byte $00, $ff, $9d, $00, $ff, $9d, $00, $ff, $9d, $00, $ff, $9d, $00, $ff, $9d, $cf, $12, $87, $12, $91, $11, $87, $11, $91
	.byte $0f, $87, $0f, $87
@song9ref1447:
	.byte $0b, $f5, $04, $a5, $0b, $f5, $04, $a5, $0b, $f5, $04, $a5, $0b, $f5, $04, $a5, $0b, $f5, $04, $a5, $0b, $f5, $04, $a5
	.byte $0b, $f5, $04, $a5, $0b, $f5, $04, $a5
@song9ref1479:
	.byte $07, $9b, $07, $af, $04, $9b, $04, $af, $02, $9b, $02, $af, $0b, $9b, $0b, $87, $04, $9b, $04, $87
	.byte $41, $14
	.word @song9ref1479
	.byte $41, $14
	.word @song9ref1479
	.byte $07, $9b, $07, $af, $04, $9b, $04, $af, $02, $9b, $02, $9b, $02, $9b, $02, $9b, $02, $91, $02, $91
	.byte $41, $20
	.word @song9ref1447
	.byte $42
	.word @song9ch4loop
@song10ch0:
	.byte $45, $02
@song10ch0loop:
	.byte $4d, $ff, $91, $77, $4e, $03
@song10ref10:
	.byte $a4
@song10ref11:
	.byte $0d, $81, $00, $85, $0d, $81, $00, $81, $0d, $81, $00, $85, $0d, $81, $00, $81, $0d, $81, $44, $89, $0d, $81, $44, $89
	.byte $0b, $81, $44, $89, $0b, $81, $44, $81, $0d, $81, $00, $85, $0d, $81, $00, $81, $0d, $81, $00, $85, $0d, $81, $00, $81
	.byte $10, $91, $44, $81, $12, $8b, $4d, $ff, $91, $4e, $03
	.byte $41, $37
	.word @song10ref11
	.byte $4e, $03
	.byte $41, $37
	.word @song10ref11
	.byte $4e, $03
	.byte $41, $37
	.word @song10ref11
	.byte $4e, $03
	.byte $41, $37
	.word @song10ref11
	.byte $4e, $03
	.byte $41, $36
	.word @song10ref11
	.byte $42
	.word @song10ch0loop
@song10ch1:
@song10ch1loop:
	.byte $41, $31
	.word @song10ref10
	.byte $89, $44, $89, $12, $97, $44, $83
	.byte $41, $31
	.word @song10ref11
	.byte $89, $44, $89, $12, $97, $44, $83
	.byte $41, $31
	.word @song10ref11
	.byte $89, $44, $89, $12, $97, $44, $83
	.byte $41, $31
	.word @song10ref11
	.byte $89, $44, $89, $12, $97, $44, $83
	.byte $41, $31
	.word @song10ref11
	.byte $89, $44, $89, $12, $97, $44, $83
	.byte $41, $31
	.word @song10ref11
	.byte $89, $44, $89, $12, $97, $44, $83, $42
	.word @song10ch1loop
@song10ch2:
@song10ch2loop:
	.byte $a6
@song10ref162:
	.byte $0d, $81, $00, $85, $82, $0d, $81, $00, $81, $0d, $81, $a6, $0d, $00, $83, $82, $0d, $81, $00, $81, $0d, $85, $a6, $0d
	.byte $83, $00, $82, $0d, $8d, $a6, $0b, $8b, $00, $82, $0b, $85, $a6, $0d, $81, $00, $85, $82, $0d, $81, $00, $81, $0d, $81
	.byte $a6, $0d, $00, $83, $82, $0d, $81, $00, $81, $10, $85, $a6, $10, $8d, $82, $12, $85, $a6, $12, $95
	.byte $41, $36
	.word @song10ref162
	.byte $41, $36
	.word @song10ref162
	.byte $41, $36
	.word @song10ref162
	.byte $41, $36
	.word @song10ref162
	.byte $41, $36
	.word @song10ref162
	.byte $42
	.word @song10ch2loop
@song10ch3:
@song10ch3loop:
	.byte $88
@song10ref250:
	.byte $14, $95, $14, $95, $14, $95, $14, $95, $14, $95, $14, $95, $14, $95, $14, $95, $14, $95, $14, $95
	.byte $41, $14
	.word @song10ref250
	.byte $41, $14
	.word @song10ref250
	.byte $14, $95, $14, $95
@song10ref280:
	.byte $1c, $89, $8a, $21, $83, $23, $83, $88, $1c, $89, $8a, $21, $83, $23, $83, $88, $1c, $89, $8a, $21, $89, $88, $1c, $83
	.byte $8a, $21, $83, $22, $89, $88
	.byte $41, $16
	.word @song10ref280
	.byte $88
	.byte $41, $16
	.word @song10ref280
	.byte $88
	.byte $41, $16
	.word @song10ref280
	.byte $42
	.word @song10ch3loop
@song10ch4:
@song10ch4loop:
	.byte $df, $df, $df, $df, $df, $df, $df, $df, $df, $df, $df, $df, $42
	.word @song10ch4loop
@song11ch0:
	.byte $45, $02
@song11ch0loop:
	.byte $ff, $ff, $ff, $ff, $ff, $42
	.word @song11ch0loop
@song11ch1:
@song11ch1loop:
	.byte $ff, $8e, $11, $fd, $10, $fd, $11, $8d, $00, $ed, $ff, $42
	.word @song11ch1loop
@song11ch2:
@song11ch2loop:
	.byte $82, $1d, $00, $9b, $1d, $00, $9b, $1d, $00, $9b, $1d, $00, $9b, $ff, $ff, $ff, $ff, $42
	.word @song11ch2loop
@song11ch3:
@song11ch3loop:
@song11ref49:
	.byte $88, $14, $8d, $8a, $21, $8d, $88, $14, $8d, $8a, $21, $8d
	.byte $41, $08
	.word @song11ref49
	.byte $ff, $ff, $ff, $ff, $42
	.word @song11ch3loop
@song11ch4:
@song11ch4loop:
	.byte $ff, $ff, $ff, $ff, $18, $85, $18, $a5, $18, $85, $18, $a5, $18, $85, $18, $95, $42
	.word @song11ch4loop
