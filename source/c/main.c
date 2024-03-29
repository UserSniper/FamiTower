// Include defines for various pieces of the NES hardware
#include "main.h"



//
// Main entrypoint
// This is where your game will start running. It should essentially be an endless loop in most
// cases. The name "main" tells the runtime to run this. You can add more methods in this file
// or others and call them as your game expands. 
// 
void main(void) {
    // Turn off the screen
    ppu_off();


    // Set the address of the ppu to $3f00 to set the background palette
    vram_adr(0x3F00);
    // Write the background palette, byte-by-byte.
    for (i = 0; i != 32; ++i) {
        POKE(PPU_DATA,palette[i]);
    }
    
    //Do a CHR ROM equivalent (TODO: actual usefulness for CHR RAM)
    mmc3_set_2kb_chr_bank_0(0);
    mmc3_set_2kb_chr_bank_1(2);
    mmc3_set_1kb_chr_bank_0(4);
    mmc3_set_1kb_chr_bank_1(5);
    mmc3_set_1kb_chr_bank_2(6);
    mmc3_set_1kb_chr_bank_3(7);
    mmc3_set_prg_bank_1(1);
    vram_adr(0x0000);
    unpack_tiles ((unsigned char *) background_graphics);
    vram_adr(0x1000);
    unpack_tiles ((unsigned char *) sprite_graphics);

    mmc3_set_prg_bank_1(0);
    which_bg = 0;
    vram_adr(NAMETABLE_A);
    vram_write((unsigned char *)Collision_Maps[which_bg], 1024);

    // Set the scroll to 0,0
    scroll(0, 0);

    // Turn the screen back on
    ppu_on_all();

    songid = 0;
    // Play the first song built into the rom.
    music_play(0);
    // Infinite loop to end things
    while (1) {
        if (peppino_taunt_timer > 0) --peppino_taunt_timer;

        ppu_wait_nmi();

        pad1_new = pad_trigger(0);
        pad1 = pad_state(0);
        
        if (pad1_new & PAD_A) { // If the user is pressing A, make a sound!
            // Play sound effect 0 on channel 0 (second argument can be 0-3, lower is higher priority)
            ++songid;
            if (songid > 0x12) {
                songid = 0x00;
            }
            famistudio_music_stop();
            music_play(songid);
        }



        if (pad1_new & PAD_B) {
            if (peppino_taunt_timer == 0){
                rand = rand8();
                sfx_sample_play(0x36);
                peppino_taunt_timer = 15;
            }
        }
        if (pad1_new & PAD_START) {
            if (peppino_taunt_timer == 0){
                ++temp3;
            }
        }
        if (pad1_new & PAD_SELECT) {
            if (peppino_taunt_timer == 0){
                --temp3;
            }
        }










        movement();
        collision = check_collision(&Hitbox1,&Hitbox2);
        // change the BG color, if sprites are touching
        if (collision){
            enable_grayscale();
        }
        else{
            disable_grayscale();
        }
        detect_animation();
        draw_sprites();
        temp4=0;
        for(temp4=temp3; temp4!=0; ++temp4) {
            waste_time_lol();
        };
        gray_line();
    }
}












void waste_time_lol() {
    i = 0;
    j = 0;
    k = 0;
    for(i = 255; i != 0; i++) {
        for(j = 255; j != 0; j++) {
            for(k = 255; k != 0; k++) {
                l = l+0x7D;
                l = l/3;
            };
        };
    };
}




void draw_sprites(void){
    mmc3_set_prg_bank_1(0);
    //Draw Peppino
    oam_clear();
    oam_size(1);
    bank_spr(1);
    if (direction & 0x01)
    oam_meta_spr_hflipped(Hitbox1.x+Hitbox1.width, Hitbox1.y, 0x04, Peppino_ANIM[peppino_anim]);
    else
    oam_meta_spr(Hitbox1.x, Hitbox1.y, 0x04, Peppino_ANIM[peppino_anim]);

	oam_meta_spr(Hitbox2.x, Hitbox2.y, 0x48, Peppino_idle08);
    oam_meta_spr(Hitbox3.x, Hitbox3.y, 0x5C, Peppino_idle08);
}





void draw_bg(void){
    ppu_off();

    p_maps = Collision_Maps[which_bg];


    vram_adr(NAMETABLE_A);
    temp1 = 0;
	// draw a row of tiles
	for(temp_y = 30; temp_y != 0; --temp_y){
		for(temp_x = 32; temp_x != 0; --temp_x){
			++temp1;

			vram_put(p_maps[temp1]);
		}
	}
    ppu_on_all();
}




// player movement scripts
void movement(void){
    
    if(peppino_taunt_timer > 0) return;
    if(pad1 & PAD_LEFT){
		--Hitbox1.x;
        direction |= 0x01;
	}
	else if (pad1 & PAD_RIGHT){
		++Hitbox1.x;
        direction &= ~0x01;
	}
    bg_collision();
    if(collision_R) --Hitbox1.x;
	if(collision_L) ++Hitbox1.x;

	if(pad1 & PAD_UP){
		--Hitbox1.y;
	}
	else if (pad1 & PAD_DOWN){
		++Hitbox1.y;
	}
    bg_collision();
    if(collision_U) --Hitbox1.y;
	if(collision_D) ++Hitbox1.y;

}

void bg_collision(){
	// sprite collision with backgrounds
	
	collision_L = 0;
	collision_R = 0;
	collision_U = 0;
	collision_D = 0;
	
	temp_x = Hitbox1.x; // left side
	temp_y = Hitbox1.y; // top side
	
	if(temp_y >= 0xf0) return;
	// y out of range
	
	coordinates = (temp_x >> 4) + (temp_y & 0xf0); // upper left
	if(c_map[coordinates]){ // find a corner in the collision map
		++collision_L;
		++collision_U;
	}
	
	temp_x = Hitbox1.x + Hitbox1.width; // right side
	
	coordinates = (temp_x >> 4) + (temp_y & 0xf0); // upper right
	if(c_map[coordinates]){
		++collision_R;
		++collision_U;
	}
	
	temp_y = Hitbox1.y + Hitbox1.height; // bottom side
	if(temp_y >= 0xf0) return;
	// y out of range
	
	coordinates = (temp_x >> 4) + (temp_y & 0xf0); // bottom right
	if(c_map[coordinates]){
		++collision_R;
		++collision_D;
	}
	
	temp_x = Hitbox1.x; // left side
	
	coordinates = (temp_x >> 4) + (temp_y & 0xf0); // bottom left
	if(c_map[coordinates]){
		++collision_L;
		++collision_D;
	}
}



//doesnt' work fsr

void test_collision(void){
	collision = check_collision(&Hitbox1,&Hitbox2);
	// change the BG color, if sprites are touching
	if (collision){
		pal_col(0,0x30); 
	}
	else{
		pal_col(0,0x00);
	}
}




void detect_animation(void){
    
    if (peppino_taunt_timer == 15) 
    {
        temp1 = (rand & 0x01) | ((rand & 0x08) | ((rand & 0xA0) >> 3) >> 1);
        if (temp1 >= 11) {temp1 = ((temp1 - 10) << 1) | ((rand & 0x02) >> 1);}
        if (temp1 == peppino_previous_taunt_anim) {temp1 ^= 0x07;}
        peppino_previous_taunt_anim = temp1;
        ++temp1;
        if (temp1 >= 8) {temp1 = 0;}
        peppino_anim = temp1;
        return;
    } 
    else if (peppino_taunt_timer == 0) peppino_anim = 0;

}














