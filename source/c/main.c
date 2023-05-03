// Include defines for various pieces of the NES hardware
#include "main.h"









//
// The fucking nametable
// screw you, ld65. here's the nametable.














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



    

    // Set the address of the ppu to $3f00 to set the background palette
    vram_adr(0x3F00);



    // Write the background palette, byte-by-byte.
    for (i = 0; i != 32; ++i) {
        vram_put(palette[i]);
    }



    // Write the address $2064 to the ppu, where we can start drawing text on the screen
    vram_adr(0x2064);

    i = 0;
    while (welcomeMessage[i]) {
        //Add 0x60 to the ascii value of each character, to get it to line up with where the ascii table is in our chr file
        vram_put(welcomeMessage[i] + 0x80);
        ++i;
    }




    // Set the scroll to 0,0
    scroll(0, 0);

    draw_sprites();

    // Turn the screen back on
    ppu_on_all();



    // Update variable used in unit tests
    testVariable = 0;
    songid = 0;


    // Play the first song built into the rom. By default it is the title song from Shiru's game, Lan Master
    music_play(testVariable);


    // Infinite loop to end things
    while (1) {
        ppu_wait_nmi();
        
        // Get Controller 1
        pad1_new = pad_trigger(0);
        pad1 = pad_state(0);

        if (pad1_new & PAD_A) { // If the user is pressing A, make a sound!
            // Play sound effect 0 on channel 0 (second argument can be 0-3, lower is higher priority)
            ++songid;
            if (songid > 0x07) {
                songid = 0x00;
            }
            music_stop();
            music_play(songid);
        }
        if (pad1_new & PAD_B) {
            sfx_play(0,0);
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







































