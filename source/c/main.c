// Include defines for various pieces of the NES hardware
#include "main.h"
#include "metasprites.h"
#include "system-defines.h"
#include "neslib.h"









//
// The fucking nametable
// screw you, ld65. here's the nametable.










//Write the funny Italian man here
const unsigned char Peppino_Idle[]={

    -10,-24,0x05,0,
    - 2,-24,0x07,0,
      6,-24,0x09,0,
    -21,- 8,0x0b,0,

    -13,- 8,0x0d,0,
    - 5,- 8,0x0f,0,
      3,- 8,0x11,0,
     11,- 8,0x13,0,

    -21,  8,0x15,0,
    -13,  8,0x17,0,
    - 5,  8,0x19,0,
      3,  8,0x1b,0,

     11,  8,0x1d,0,
    -16, 24,0x1f,0,
    - 8, 24,0x21,0,
      0, 24,0x23,0,
    
      8, 24,0x25,0,
    0x80
};



//
// Main entrypoint
// This is where your game will start running. It should essentially be an endless loop in most
// cases. The name "main" tells the runtime to run this. You can add more methods in this file
// or others and call them as your game expands. 
// 
void main(void) {
    // Turn off the screen
    ppu_off();

    draw_bg();



    // Get Controller 1
    pad1 = pad_poll(0);


    // Set the address of the ppu to $3f00 to set the background palette
    vram_adr(0x3f00);



    // Write the background palette, byte-by-byte.
    for (i = 0; i != 32; ++i) {
        vram_put(palette[i]);
    }



    // Write the address $2064 to the ppu, where we can start drawing text on the screen
    vram_adr(0x2064);

    i = 0;
    //while (welcomeMessage[i]) {
        // Add 0x60 to the ascii value of each character, to get it to line up with where the ascii table is in our chr file
        //vram_put(welcomeMessage[i] + 0x80);
        //++i;
    //}




    


    // Set the scroll to 0,0
    scroll(0, 0);

    draw_sprites();

    // Turn the screen back on
    ppu_on_all();



    // Update variable used in unit tests
    testVariable = 1;



    // Play the first song built into the rom. By default it is the title song from Shiru's game, Lan Master
    music_play(0);



    // Infinite loop to end things
    while (1) {
        ppu_wait_nmi();
        
        if (pad1 & PAD_A) { // If the user is pressing A, make a sound!
            // Play sound effect 0 on channel 0 (second argument can be 0-3, lower is higher priority)
            sfx_play(0, 0);
        }


        
        
    }
}








void draw_sprites(void){
    //Draw Peppino
    oam_clear();
    oam_size(1);
    bank_spr(1);

    oam_meta_spr(0x7F,0x97,0x04,Peppino_Idle);


}








void draw_bg(void){
    ppu_off();



}







































