// the background
#include "include.h"


//
// Global Variables (zeropage) 
// Small, frequently-used variables should go in this space. There are only around 250 bytes to go around, so choose wisely!
//
#pragma bss-name(push, "ZEROPAGE")
    unsigned char i;
    unsigned char pad1;
    unsigned char pad1_new;
    unsigned char collision;
    unsigned char collision_L;
    unsigned char collision_R;
    unsigned char collision_U;
    unsigned char collision_D;
    unsigned char which_bg;
    const unsigned char * p_maps;
    unsigned char coordinates;
    unsigned char temp1;
    unsigned char temp2;
    unsigned char temp3;
    unsigned char temp4;
    unsigned char temp_x;
    unsigned char temp_y;




#pragma bss-name(pop)
//
// Normal Variables
// You can define larger, less frequently accessed variables here. You have about 1.5k to work with.
//
// EXAMPLE: 
// unsigned char myBigBufferArray[32];
unsigned char testVariable;
unsigned char c_map[240];
unsigned char songid;



//
// Constant variables
// Anything with const in front of it will go into write-only prg instead of the very limited ram we have.
//
const unsigned char * const Collision_Maps[] = {c1};

const unsigned char welcomeMessage[] = "Pizza Tower";

// Color palette for the screen to use
const unsigned char palette[32]={ 
    0x2d,0x03,0x13,0x24,0x0f,0x00,0x10,0x30,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,
    0x2d,0x0f,0x37,0x30,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f,0x0f
};





// PROTOTYPES
void draw_bg(void);
void draw_sprites(void);
void movement(void);
void bg_collision(void);
void check_start(void);