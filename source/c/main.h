// the background
#include "include.h"


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
unsigned char testVariable;
unsigned char c_map[240];
unsigned char songid;
unsigned char rand;
unsigned char which_bg;
unsigned char peppino_anim;
unsigned char peppino_taunt_timer;
unsigned char peppino_previous_taunt_anim;
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
const unsigned char * const Peppino_ANIM[] = {Peppino_Idle, Peppino_Taunt05, Peppino_Taunt06, Peppino_Taunt12};

const unsigned char welcomeMessage[] = "Pizza Tower";

// Color palette for the screen to use
const unsigned char palette[32]={
    0x0f,0x03,0x13,0x24,
    0x0f,0x00,0x10,0x30,
    0x0f,0x16,0x16,0x16,
    0x0f,0x16,0x16,0x16,
    
    0x0f,0x0f,0x37,0x30,
    0x0f,0x16,0x16,0x16,
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