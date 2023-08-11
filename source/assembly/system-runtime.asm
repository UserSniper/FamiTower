;
; system-runtime.asm
;
; This sets up the C compiler for your use.
; In most cases you probably won't want to edit this file! Nothing is stopping you, of course ;)
; NOTE: This gets compiled to a file named `crt0.o` that is special to cc65. 
; 

; Enable the c comment feature /* */ in case you want it
.feature c_comments

; System defines for various registers on the console
.include "./system-defines.asm"
.include "./mapper.asm"
.include "./alexmush_custom.s"
.include "./PokRLE.s"

;
; iNES header
; 
; This declares basic information about your game. You probably don't want
; to change it.
;
.segment "HEADER"

    NES2_0_IDENTIFIER = %00001000
    MAPPER = 4 ; 4 = MMC3
    SUBMAPPER = 0 ; Standard
    MIRRORING = 8 ; 0 = horizontal mirroring, 1 = vertical mirroring, 8 = hardwired 4-screen 
    PRG_BANK_COUNT = 8 ; 16k PRG chunk count
    CHR_BANK_COUNT = 0 ; 8k CHR chunk count
    SRAM   = 1 ; 1 = battery backed SRAM at $6000-7FFF
    TRAINER = 0 ; unneeded
    CONSOLE_TYPE = 0 ; Standard NES/Famicom
    PRG_RAM_COUNT = 0 ;
    PRG_NVRAM_COUNT = 7 ; 64 << 7 = 8KB - the standard for MMC3
    CHR_RAM_COUNT =  12 ; 64 << 12 = 256KB - exactly 32 banks
    CHR_NVRAM_COUNT = 0 ; 
    CPU_PPU_TIMING = 0 ; NTSC NES/Famicom
    HARDWARE_TYPE = 0; Unused
    MISC_ROMS = 0 ; No misc ROMs
    DEF_EXP_DEVICE = 0 ; Unspecified

    .byte 'N', 'E', 'S', $1A ; ID
    .byte (PRG_BANK_COUNT & $FF)
    .byte (CHR_BANK_COUNT & $FF)
    .byte MIRRORING | (SRAM << 1) | (TRAINER << 2) | ((MAPPER & $00F) << 4)
    .byte (MAPPER & $0F0) | CONSOLE_TYPE | NES2_0_IDENTIFIER
    .byte ((MAPPER & $F00) >> 8) | SUBMAPPER << 4
    .byte ((PRG_BANK_COUNT & $F00) >> 8) | ((CHR_BANK_COUNT & $F00) >> 4)
    .byte PRG_RAM_COUNT | (PRG_NVRAM_COUNT << 4)
    .byte CHR_RAM_COUNT | (CHR_NVRAM_COUNT << 4)
    .byte CPU_PPU_TIMING, HARDWARE_TYPE, MISC_ROMS, DEF_EXP_DEVICE

;
; C Symbols from the engine and linker
;
.export FAMISTUDIO_DPCM_OFF

.export _init, _exit,__STARTUP__:absolute=1
.export _junk
.export _reset
.import initlib,push0,popa,popax,_main,zerobss,copydata
.import __RAM_START__   ,__RAM_SIZE__
.import __ROM0_START__  ,__ROM0_SIZE__
.import __STARTUP_LOAD__,__STARTUP_RUN__,__STARTUP_SIZE__
.import __CODE_LOAD__   ,__CODE_RUN__   ,__CODE_SIZE__
.import __RODATA_LOAD__ ,__RODATA_RUN__ ,__RODATA_SIZE__
.import __DMC_LOAD__

; Zeropage variables required by cc65's engine
.include "tools/cc65/asminc/zeropage.inc"

;
; Graphics
; 
; Includes chr files for the graphics -see the included file for more details.
;

.include "../../graphics/graphics.config.asm"

;
; Vectors
; 
; These definitions have to be kept here so the NES knows how to reset the game, and what to call when
; it's time to redraw the screen. 
;

.segment "VECTORS"
    .word nmi
    .word reset
    .word irq

;
; ZeroPage variables 
; 
; This is a section of "special" variables that can be accessed faster than the rest, because they are in the first "page" of
; memory. It can have up to 256 bytes worth of variables in it. They otherwise work the same as all other variables.
; You can access this via C using the `zpsym` pragma
;

.segment "ZEROPAGE"
    nmiFrameCount: .res 1          ; 256 byte counter, will increment every time nmi is called. Used to wait for vblank
    vblankPreviousFrame: .res 1    ; Used to track when we started waiting for vblank
    _junk: .res 1                  ; Used to make register writes not get optimized away. Kinda silly
;
; OAM Memory
; 
; This is the sprite memory for your game. IT is used for "hardware" sprites (you might create more information for your)
; sprites elsewhere. Don't add anything here.

.segment "OAM"
    oam: .res 256        ; sprite OAM data to be uploaded by DMA

;
; BSS variables
; 
; This is the "rest" of the memory for your game. There are 1536 bytes available in total. 
; This is where variables you add in C are put by default.
;

.segment "BSS"
    current_song_bank: .res 1 


; 
; Main Code area
; 
; You know this one! This is the primary code bank for your game. There may be more banks available, but this 
; one will always be loaded. 
;

; The reset code MUST live in the last bank, because of how mmc3 works. Don't move this unless you know what
; you're doing!
.segment "CODE_2"


    ;
    ; reset routine
    ;
    ; This is used to reset the NES (and sometimes memory on your cartridge) to a known state, so the game
    ; can play consistently. Don't change this unless you know what you're doing!
    ; Note: It should be the first thing written to the CODE segment, so it's always the first thing the console runs!
    ;
    start:
    _init:
    _exit:
    _reset:
    reset:
        sei       ; mask interrupts
        lda #0
        sta PPU_CTRL    ; disable NMI
        sta PPU_MASK    ; disable rendering
        sta APU_STATUS  ; disable APU sound
        sta APU_DMC_IRQ ; disable DMC IRQ
        lda #$40
        sta APU_FRAME_COUNTER ; disable APU IRQ
        cld                   ; disable decimal mode
        ldx #$FF
        txs       ; initialize stack
        ; wait for first vblank
        bit PPU_STATUS
        :
            bit PPU_STATUS
            bpl :-
        ; clear all RAM to 0
        lda #0
        ldx #0
        :
            sta $0000, x
            sta $0100, x
            sta $0200, x
            sta $0300, x
            sta $0400, x
            sta $0500, x
            sta $0600, x
            sta $0700, x
            inx
            bne :-
        ; place all sprites offscreen at Y=255
        lda #255
        ldx #0
        :
            sta oam, X
            inx
            inx
            inx
            inx
            bne :-
        ; wait for second vblank
        :
            bit PPU_STATUS
            bpl :-
        ; NES is initialized, ready to begin!
        ; enable the NMI for graphical updates, and jump to our main program
        lda #%10001000
        sta PPU_CTRL

        ; Do any initialization the mapper needs
        jsr initialize_mapper

        ; Do some C engine init
        jsr zerobss
        jsr copydata

        lda #<(__RAM_START__+__RAM_SIZE__)
        sta sp
        lda #>(__RAM_START__+__RAM_SIZE__)
        sta sp+1            ; Set argument stack ptr

        jsr initlib

        ; Initialize our library
        jsr initialize_library
        ; The main() function in your C
        jmp _main

    ;
    ; NMI Handler
    ; 
    ; This will run once every frame, and give you a chance to update graphics. Keep it short!
    ; You can call a C method here by calling jsr _your_c_method. 
    ;

    nmi:
        ; Store all registers - since this can run at any time, and any changes we make to the registers
        ; will impact whatever code was running before otherwise. 
        pha
        txa
        pha
        tya
        pha

        ; Tell the ppu to draw sprites from $0200 to the screen
        lda #$02
        sta OAM_DMA

        ; Keep track of how many frames have run (note: this loops over to 0 after 255.)
        inc nmiFrameCount

        ; Call neslib's nmi methods
        jsr neslib_nmi

        ; Add your custom code or calls here!

        ; Restore all registers from the stack
        pla
        tay
        pla
        tax
        pla

        rti ; Return from interrupt 


    ; 
    ; Helper function: Wait for a vblank to happen
    ; 
    ; Waits until the frame count is incremented by the nmi method
    ; 

    vblankwait:
        lda nmiFrameCount
        sta vblankPreviousFrame

        @vblank_wait:
            cmp nmiFrameCount
            beq @vblank_wait
        rts
    ;
    ; IRQ Handler
    ;
    ; Empty - we don't need to use them, but a handler must be present.
    irq:
        rti


    

;
; Library data
; 
; Includes all initialization for the used library (neslib)
;

.include "./neslib-system.asm"
.include "./neslib.asm"

.include "./nesdoug.s"



; Store music a switchable PRG bank
; .s files, as generated by FamiStudio through the export menu

.segment "ROM_BANK_09"
.include "../../sound/music_1.s"
.segment "ROM_BANK_0A"
.include "../../sound/music_2.s"
.segment "ROM_BANK_0B"
.include "../../sound/music_3.s"

.segment "RODATA_2"
.include "../../sound/sfx.s"
