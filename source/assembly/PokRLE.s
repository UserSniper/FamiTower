; =============================================================
; POKRLENES 1.0
; Copyright (c) 2023 alexmush
; Loosely based on the algorithm with
; Copyright (c) 1996 Game Freak Inc.
;
; Copying and distribution of this file, with or without
; modification, are permitted in any medium without royalty
; provided the copyright notice and this notice are preserved
; in all source code copies. This file is offered as-is,
; without any warranty.
; =============================================================

; =============================================================
; This is the Pokemon-based RLE graphics decompressor for the
; NES. It is made to be used for games, and 1 feature is
; toggleable to save CPU time.
;
; The compression algorithm is based on the 2-bit RLE packet
; principle used by the Pokemon Generation 1 games (Red, Green,
; Blue and Yellow), but features differences in encoding modes
; compared to the original algorithm.
;
; My massive thanks go out to whoever of the programmers made
; this algorithm in the original games, as well as to IsoFrieze
; at Retro Game Mechanics Explained for thoroughly explaining
; the original games' algorithm, without him this project would
; not be possible.
;
; I expect users to figure this out by just reading these
; comments. If anything is left unclear to you, contact me
; through the contacts provided at my GitHub
; (https://github.com/ADM228).
; =============================================================

; ========================= INTERFACE =========================
; If you only select one data destination option below, there
; will only be one function to call - unpack_tiles, which does
; the decompression work into the selected data destination.
; If you select both data destination options, you have to
; either call unpack_tiles_ram or unpack_tiles_vram, which
; decompress the data into the specified destination. You can
; also call these functions from cc65 C code, as long as you
; use the provided header file.
;
; Note that when piping into VRAM you are responsible for
; setting the address AND turning the PPU off for the data to
; go through, while when saving to RAM (and not calling it from
; C code) you must store the output pointer to pokrle_outptr.
; =============================================================

; ======================= CONFIGURATION =======================
; There are 2 main ways of configuring the decompressor.
;
;   1) The simplest way is right here, in the section below.
;      Simply comment/uncomment these defines, and move on with
;      your life.
;
;   2) The second way is "externally", using definitions coming
;      from elsewhere in your app or the command line. If you
;      wish do so, simply define POKRLE_CFG_EXTERNAL=1 and this
;      whole section will be ignored. You are then responsible
;      for providing all configuration. This is useful if you
;      have multiple projects that need different configurations
;      configurations, while pointing to the same code file.
;
; There are 4 main things to configure, each of them will be
; detailed below.
;
;   1) Segments (ZP/RAM/PRG)
;   2) Data destination
;   3) Encoding modes
;   4) C bindings
; =============================================================

.ifndef POKRLE_CFG_EXTERNAL 
    POKRLE_CFG_EXTERNAL = 0
.endif

; Set this to configure the sound engine from outside (in your
; app, or from the command line)
.if !POKRLE_CFG_EXTERNAL

; ================= 1) SEGMENT CONFIGURATION ==================
; You need to tell where you want to allocate the zeropage, RAM
; and code.
; =============================================================

.define POKRLE_CFG_ZP_SEGMENT ZEROPAGE
.define POKRLE_CFG_RAM_SEGMENT BSS
.define POKRLE_CFG_CODE_SEGMENT CODE

; ==================== 2) DATA DESTINATION ====================
; The decompressed data can either be saved to RAM via a
; pointer, or piped directly into VRAM. You must enable at
; least one of these options.
; =============================================================

; POKRLE_CFG_DESTINATION_RAM = 1

POKRLE_CFG_DESTINATION_VRAM = 1

; ===================== 3) ENCODING MODES =====================
; Enable or disable extended encoding modes here.
; If defined, the decompressor will have 8 encoding modes after
; RLE as follows:
; 000 - do nothing
; 001 - delta decode both bitplanes
; 01X - bitplane X ^= bitplane ~X; delta decode both bitplanes
; 1XY - bitplane X ^= bitplane ~X; delta decode bitplane Y
; If not defined, will only have the first 2 modes, using up 2
; less bits per tile in the header, but may have worse 
; compression ratio.
; This setting MUST match how you call the compressor, or else
; the data will not be processed correctly.
; =============================================================

; POKRLE_CFG_EXTENDED_ENCODING = 1

; ======================= 4) C BINDINGS =======================
; Enable to use the CC65 compatible entrypoints via the
; provided header file.
; =============================================================

POKRLE_CFG_C_BINDINGS   = 1

.endif
; =============================================================
; END OF CONFIGURATION
;
; Ideally, you should not have to change anything below this
; line.
; =============================================================

; =============================================================
; INTERNAL DEFINES (Do not touch)
; =============================================================

.ifndef POKRLE_CFG_DESTINATION_RAM
    POKRLE_CFG_DESTINATION_RAM = 0
.endif

.ifndef POKRLE_CFG_DESTINATION_VRAM
    POKRLE_CFG_DESTINATION_RAM = 0
.endif

.if (POKRLE_CFG_DESTINATION_RAM + POKRLE_CFG_DESTINATION_VRAM) = 0
    .error "You must specify at least 1 data destination."
.endif

.if POKRLE_CFG_DESTINATION_RAM && POKRLE_CFG_DESTINATION_VRAM
    POKRLE_CFG_DESTINATION_DUAL = 1
.else
    POKRLE_CFG_DESTINATION_DUAL = 0
.endif

.ifndef POKRLE_CFG_EXTENDED_ENCODING
    POKRLE_CFG_EXTENDED_ENCODING = 0
.endif

; This is the best way Mathieu at FamiStudio found to test if a C-style macro is defined or not... 
.if .xmatch(.string(POKRLE_CFG_ZP_SEGMENT), "POKRLE_CFG_ZP_SEGMENT")
    .error "You must .define POKRLE_CFG_ZP_SEGMENT with the name of your zeropage segment."
.endif

.if .xmatch(.string(POKRLE_CFG_RAM_SEGMENT), "POKRLE_CFG_RAM_SEGMENT")
    .error "You must .define POKRLE_CFG_RAM_SEGMENT with the name of your RAM/BSS segment."
.endif

.if .xmatch(.string(POKRLE_CFG_CODE_SEGMENT), "POKRLE_CFG_CODE_SEGMENT")
    .error "You must .define POKRLE_CFG_CODE_SEGMENT with the name of your CODE/PRG segment."
.endif



; =============================================================
; DECOMPRESSION BUFFER IN RAM
;
; It is only used as a temporary buffer during the RLE
; decompression. Feel free to alias this with other RAM values
; in your project to save a few bytes.
; =============================================================

.segment .string(POKRLE_CFG_RAM_SEGMENT)
    pokrle_decomp_buffer: .res 16

; =============================================================
; ZEROPAGE VARIABLES
;
; These are only used as temporary variables during the
; unpack_tiles routine. Feel free to alias those with other ZP
; values in your programs to save a few bytes.
; =============================================================

.segment .string(POKRLE_CFG_ZP_SEGMENT) : zeropage

pokrle_tile_count:      .res 1
pokrle_flag_count:      .res 1
pokrle_flags:           .res 1
pokrle_byte:            .res 1
pokrle_tempA:           .res 1
pokrle_tempB:           .res 1
pokrle_ptr:             .res 2
.if POKRLE_CFG_DESTINATION_RAM
    pokrle_outptr:      .res 2
.endif

pokrle_delta_bit        = pokrle_tempA
pokrle_zeropacket_count = pokrle_tempB

pokrle_ptr_lo           = pokrle_ptr
pokrle_ptr_hi           = pokrle_ptr+1

.if POKRLE_CFG_DESTINATION_RAM
    pokrle_outptr_lo    = pokrle_outptr
    pokrle_outptr_hi    = pokrle_outptr+1
.endif

;==============================================================
; CODE
;==============================================================


.SEGMENT .string(POKRLE_CFG_CODE_SEGMENT)

.if POKRLE_CFG_C_BINDINGS
    .if POKRLE_CFG_DESTINATION_DUAL
        .export _unpack_tiles_vram, _unpack_tiles_ram
    .else
        .export _unpack_tiles
    .endif
.endif

.if POKRLE_CFG_DESTINATION_DUAL
    .export unpack_tiles_vram, unpack_tiles_ram
.else
    .export unpack_tiles
.endif

.if POKRLE_CFG_DESTINATION_RAM
    .exportzp pokrle_outptr
.endif

.MACRO incw addr
.SCOPE
    INC <addr
    BNE Skip
        INC <addr+1
    Skip:
.ENDSCOPE
.ENDMACRO

;Format:
;1 byte - amount of 8x8 tiles
;   Repeat amount of tiles / 8 times:
;1 byte - flags whether the tile is stored as raw data or RLE encoded
;X bytes - actual data

;void __fastcall__ unpack_tiles(const unsigned char* data);
_unpack_tiles:

unpack_tiles:
    LDY #$00
    STA pokrle_ptr_lo
    STX pokrle_ptr_hi
    ; Get total tile count
    LDA (pokrle_ptr), Y
    STA pokrle_tile_count
    INC pokrle_ptr_lo
    BNE @GetRLEFlags
        INC pokrle_ptr_hi

@GetRLEFlags:
    LDA #$08
    LDY #$00
    STA pokrle_flag_count
    LDA (pokrle_ptr), Y
    STA pokrle_flags
    INC pokrle_ptr_lo
    BNE @NewTile
        INC pokrle_ptr_hi

@NewTile:
    ASL pokrle_flags
    BCS @RLEDecompress
    LDX #$10
    LDY #$00
    
@NotCompressedLoop:
    LDA (pokrle_ptr), Y
    STA PPU_DATA
    INC pokrle_ptr_lo
    BNE :+
    INC pokrle_ptr_hi
    :
    DEX
    BNE @NotCompressedLoop

    DEC pokrle_tile_count
    BEQ @End
    DEC pokrle_flag_count
    BNE @NewTile

    JMP @GetRLEFlags

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
    LDX #$01
    STX pokrle_byte
    LDX #$0F
    LDY #$00
    LDA (pokrle_ptr), Y    ; Get new byte
    LDY #$03
    INC pokrle_ptr_lo
    BNE @RLEParseHeader
        INC pokrle_ptr_hi

@RLEParseHeader:
    PHA
    ASL             ;Delta encoding bit
    ASL             ;Get initial packet type
    BCC @RLEZeroPacket

@RLEDataPacketLoop:
    PHA
    AND #$C0
    BEQ @RLEZeroPacketFromData
    PLA
    ASL             ;
    ROL pokrle_byte   ;   Get the bit pair
    ASL             ;
    ROL pokrle_byte   ;

    BCC :+
    ;Write the byte to the buffer
    STA pokrle_tempA   ;Same as PHA
    LDA pokrle_byte
    STA pokrle_decomp_buffer, X
    ;Update counter
    LDA #$01
    STA pokrle_byte
    LDA pokrle_tempA   ;Cheaper than PLA
    DEX
    BPL :+
        DEY
        JMP @RLEnd
    :
    DEY
    BNE @RLEDataPacketLoop
        ;Get new byte
        LDA (pokrle_ptr), Y    ; Get new byte
        LDY #$04    ; Update counter
        INC pokrle_ptr_lo
        BNE @RLEDataPacketLoop
            INC pokrle_ptr_hi
            JMP @RLEDataPacketLoop


@RLEZeroPacketFromData:
    PLA
    ;Coming from data packet, remove the terminating 00 pair
    ASL
    ASL
    DEY
    BNE @RLEZeroPacket
        LDA (pokrle_ptr), Y    ; Get new byte
        LDY #$04    ; Update counter
        INC pokrle_ptr_lo
        BNE @RLEZeroPacket
            INC pokrle_ptr_hi
@RLEZeroPacket:
    ;The IN counter used to count *pairs* of bits
    ;That's why this adjustment exists
    STY pokrle_tempA
    ASL pokrle_tempA
    LDY pokrle_tempA
    STX pokrle_tempA   ;X is used for other purposes here
    LDX #$00
@RLEZeroPacketLengthLoop:
    DEY
    BPL :+
        INY
        LDA (pokrle_ptr), Y    ; Get new byte
        LDY #07    ; Update counter
        INC pokrle_ptr_lo
        BNE :+
            INC pokrle_ptr_hi
    :
    ASL
    INX
    BCS @RLEZeroPacketLengthLoop

@RLEZeroPacketAddition:
    PHA
    LDA #$01
    STA pokrle_zeropacket_count
    PLA

@RLEZeroPacketAdditionLoop:
    DEY
    BPL :+
        INY
        LDA (pokrle_ptr), Y    ; Get new byte
        LDY #$07    ; Update counter
        INC pokrle_ptr_lo
        BNE :+
            INC pokrle_ptr_hi
    :
    ASL
    ROL pokrle_zeropacket_count
    DEX
    BNE @RLEZeroPacketAdditionLoop

    TSX ; Useful if needed to cancel PHA, X is already unused
    PHA
    TYA
    LSR A
    TAY
    BNE @RLEZeroPacketZeroInsertion
        TXS ; Cancel the PHA
        LDA (pokrle_ptr), Y    ; Get new byte
        PHA
        LDY #$04    ; Update counter
        INC pokrle_ptr_lo
        BNE @RLEZeroPacketZeroInsertion
            INC pokrle_ptr_hi
@RLEZeroPacketZeroInsertion:
    LDX pokrle_tempA ;Recover X
    DEC pokrle_zeropacket_count
    BEQ @RLEZeroPacketToData
    LDA pokrle_byte
;Loop 1, possibly containing old data
@RLEZeroPacketLoop1:
    ASL
    DEC pokrle_zeropacket_count
    BEQ @RLEZeroPacketToDataFromLoop1
    ASL
    BCC @RLEZeroPacketLoop1
;Before Loop 2
    ;Write the byte to the buffer
    STA pokrle_decomp_buffer, X
    ;Update counter
    LDA #$01
    STA pokrle_byte
    DEX
    BMI @EndPLA
;Loop 2, just writing zeros:
@RLEZeroPacketLoop2:
    LDA pokrle_zeropacket_count
    SEC
    SBC #$04
    BMI @RLEZeroPacketLoop3
    STA pokrle_zeropacket_count
    LDA #$00
    STA pokrle_decomp_buffer, X
    DEX
    BPL @RLEZeroPacketLoop2

@EndPLA:
    PLA
@RLEnd:
    CPY #$04
    BNE :+
        DEC pokrle_ptr_lo
        LDA pokrle_ptr_lo
        CMP #$FF
        BNE :+
            DEC pokrle_ptr_hi
    :
    ; Delta decode if necessary
    LDX #$0F
    PLA
.if POKRLE_CFG_EXTENDED_ENCODING

.else
    BMI @DeltaDecode
.endif
@DataOut:
    ;Put da data into VRAM
    LDA pokrle_decomp_buffer, X
    STA PPU_DATA
    DEX
    BPL @DataOut
    DEC pokrle_tile_count
    BEQ :+
    DEC pokrle_flag_count
    BNE @NewTileJMP
    JMP @GetRLEFlags
    :
    RTS
@NewTileJMP:
    JMP @NewTile


;Loop 3, the remaining bits
@RLEZeroPacketLoop3:
    TYA
    LDY pokrle_zeropacket_count
    STA pokrle_zeropacket_count
    LDA @RemainBitsTable, Y
    STA pokrle_byte
    LDY pokrle_zeropacket_count
@RLEZeroPacketToData:
    PLA
    JMP @RLEDataPacketLoop

@RLEZeroPacketToDataFromLoop1:
    ASL
    STA pokrle_byte
    BCC @RLEZeroPacketToData
    ;Write the byte to the buffer
    STA pokrle_decomp_buffer, X
    ;Update counter
    LDA #$01
    STA pokrle_byte
    DEX
    BMI @EndPLA
    JMP @RLEZeroPacketToData

@DeltaDecode:
    LDA #$00
    STA pokrle_delta_bit
    @DeltaBigLoop:
        LDA pokrle_decomp_buffer, X
        STA pokrle_byte
        LDA #$01
        @DeltaLoop:
            ASL pokrle_byte
            BCC :+
                STA pokrle_tempB
                LDA pokrle_delta_bit
                EOR #$01
                STA pokrle_delta_bit
                LDA pokrle_tempB
            :
            ASL A
            ORA pokrle_delta_bit
            BCC @DeltaLoop
            STA pokrle_decomp_buffer, X
            DEX
            BPL @DeltaBigLoop
    LDX #$0F
    JMP @DataOut

@RemainBitsTable:
    .byte $01, $04, $10, $40
