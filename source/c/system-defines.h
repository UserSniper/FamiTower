
// NES System Defines
// Contains various register definitions commonly used in NES development
// NOTE: These are also available in Assembly in a similarly named .asm file


//
// PPU Registers            
//

#define PPU_CTRL 0x2000
#define PPU_MASK 0x2001
#define PPU_STATUS 0x2002
#define OAM_ADDR 0x2003
#define OAM_DATA 0x2004
#define PPU_SCROLL 0x2005
#define PPU_ADDR 0x2006
#define PPU_DATA 0x2007
#define OAM_DMA 0x4014


//
// APU Registers            
//

#define APU_PULSE_1_DUTY 0x4000
#define APU_PULSE_1_SWEEP 0x4001
#define APU_PULSE_1_TIMER_LOW 0x4002
#define APU_PULSE_1_LEN_TIMER 0x4003
#define APU_PULSE_2_DUTY 0x4004
#define APU_PULSE_2_SWEEP 0x4005
#define APU_PULSE_2_TIMER_LOW 0x4006
#define APU_PULSE_2_LEN_TIMER 0x4007
#define APU_TRIANGLE_LEN 0x4008
#define APU_TRIANGLE_TIMER_LOW 0x400a
#define APU_TRIANGLE_LEN_TIMER 0x400b
#define APU_NOISE_LEN 0x400f
#define APU_NOISE_LOOP 0x400e
#define APU_DMC_IRQ 0x4010
#define APU_DMC_DIRECT_LOAD 0x4011
#define APU_DMC_SAMPLE_ADDR 0x4012
#define APU_DMC_SAMPLE_LEN 0x4013
#define APU_STATUS 0x4015
#define APU_FRAME_COUNTER 0x4017


//
// Controller Registers            
//

#define CTRL_PORT_1 0x4016
#define CTRL_PORT_2 0x4017

//
// Internal use variables
// Some variables used by the engine. You probably don't need to understand these. Just skip
// over them unless you know what you're doing!

// Used in "read_register" below, to make sure the call isn't optimized away. If you avoid calling
// read_register entirely, you can get rid of this. (It's defined in system-runtime.asm)

extern volatile unsigned char junk;
#pragma zpsym ("junk")

// 
// Shortcuts 
// These are shortcuts to writing and reading raw registers on the NES. This seems a little bit
// easier to read as a newbie. You could also replace a lot of these with a library. Neslib eliminates
// the need for most/all of these.
//
#define write_register(name, val) ((*(unsigned char*)name) = val)
#define read_register(name) junk = (*(unsigned char*)name)
    