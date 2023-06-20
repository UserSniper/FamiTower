// the background
#include "include.h"

#ifndef SPRITE_DEBUG
#define SPRITE_DEBUG 0
#endif

//
// Global Variables (zeropage) 
// Small, frequently-used variables should go in this space. There are only 256 bytes to go around, so choose wisely!
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
unsigned char direction;
unsigned char c_map[240];
unsigned char songid;
unsigned char rand;
unsigned char which_bg;
unsigned char peppino_anim;
unsigned char peppino_taunt_timer;
unsigned char peppino_previous_taunt_anim;
unsigned char j;
unsigned char k;
unsigned char l;
struct BoxGuy {
	unsigned char x;
	unsigned char y;
	unsigned char width;
	unsigned char height;
};

struct BoxGuy Hitbox1 = {20,24,7,31};
struct BoxGuy Hitbox2 = {70,24,7,31};
struct BoxGuy Hitbox3 = {120,24,15,15};

//
// Constant variables
// Anything with const in front of it will go into write-only prg instead of the very limited ram we have.
//
const unsigned char * const Collision_Maps[] = {c1};
const unsigned char * const Peppino_ANIM[] = {Peppino_idle08, Peppino_taunt01, Peppino_taunt02, Peppino_taunt04, Peppino_taunt05, Peppino_taunt06, Peppino_taunt07, Peppino_taunt12};

const unsigned char welcomeMessage[] = "Pizza Tower";

// Color palette for the screen to use
const unsigned char palette[32]={
#if SPRITE_DEBUG==0
    0x0f,0x03,0x13,0x24,
    0x0f,0x00,0x10,0x30,
    0x0f,0x16,0x16,0x16,
    0x0f,0x16,0x16,0x16,

    0x0f,0x0f,0x37,0x30,
#else
    0x10,0x10,0x10,0x10,
    0x10,0x10,0x10,0x10,
    0x10,0x10,0x10,0x10,
    0x10,0x10,0x10,0x10,
    
    0x10,0x0f,0x37,0x30,
#endif
    0x0f,0x16,0x15,0x27,
    0x0f,0x16,0x16,0x16,
    0x0f,0x16,0x16,0x16
    };





// PROTOTYPES
void draw_bg(void);
void draw_sprites(void);
void movement(void);
void bg_collision(void);
void check_start(void);
unsigned char check_collision(void * object1, void * object2);
void detect_animation(void);
void waste_time_lol(void);