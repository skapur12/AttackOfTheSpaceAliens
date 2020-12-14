#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "spritesheet.h"

//Include sound files
#include "levelSong.h"
#include "crashSound.h"
#include "fireball.h"
#include "bump.h"
#include "winSound.h"
#include "finalWinSound.h"
#include "loseSound.h"
#include "ghostSound.h"
#include "slowGhostSound.h"
#include "sound.h"


//Variables
PLAYER player;
BULLET bullets[BULLETCOUNT];
OZI ozi;
SMALLALIEN smallalien[SMALLALIENCOUNT];
LIVES playerLife[PLAYERLIFECOUNT];
LIVES oziLife[OZILIFECOUNT];
SMALLALIEN secondHalf[SMALLALIENCOUNT];
LIVES secondVersion[OZILIFECOUNT];
STAR stars[STARCOUNT];
BULLET megabullets[MEGABULLETCOUNT];
OZI leftOzi;

int counter;
int numberOfStars;
int playerLives;
int oziLives;
int secondOziLives;
int isLevel2Active;
int isLevel3Active;
unsigned short hoff;
int prevButton;
int theTracker;
int ourVar;
int secondOurVar;


enum { FACINGFRONT, FACINGBACK, FACINGRIGHT, FACINGLEFT, IDLESTATE};

//Initialize the game and all of its components
void initGame() {
	ourVar = 0;
	secondOurVar = 0;
	counter = 0;
	playerLives = 3;
	oziLives = 3;
	if (isLevel2Active) {
		secondOziLives = 3; 
	}

	numberOfStars = 30; 

	DMANow(3, spritesheetPal, SPRITEPALETTE, 16);
	DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);

	hideSprites();
	
	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

	initPlayer();
	initBullets();
	initOzi();
	initSmallAliens();
	initPlayerLives();
	initOziLives();
	initMegaBullets();

	if (isLevel2Active) {
		initSecondOzi();
		initSecondOziLives();
	}

	if (isLevel3Active) {
		initStars();
	}
}

//Update the game and all of its components
void updateGame() {
	counter++;
	updatePlayer();

	for (int i = 0; i < BULLETCOUNT; i++) {
		updateBullet(&bullets[i]);
	}

	for (int i = 0; i < MEGABULLETCOUNT; i++) {
		updateBullet(&megabullets[i]);
	}

	updateOzi();

	fireSmallAliens();

	for (int i = 0; i < SMALLALIENCOUNT; i++) {
		updateSmallAliens(&smallalien[i]);
	}

	if (isLevel2Active) {
		for (int i = 0; i < SMALLALIENCOUNT; i++) {
			updateSmallAliens(&secondHalf[i]);
		}
	}

	playerCollision();

	for (int i = 0 ; i < BULLETCOUNT; i++) {
		oziCollision(&bullets[i]);
	}

	for (int i = 0; i < MEGABULLETCOUNT; i++) {
		oziCollision(&megabullets[i]);
	}


	for (int i = 0; i < BULLETCOUNT; i++) {
		bulletAndSmallAlienCollision(&bullets[i]);
	}

	for (int i = 0; i < MEGABULLETCOUNT; i++) {
		bulletAndSmallAlienCollision(&megabullets[i]);
	}

	if (isLevel2Active) {
		updateSecondOzi();
	}

	if (isLevel3Active) {

		for (int i = 0; i < BULLETCOUNT; i++) {
			starAndBulletCollision(&bullets[i]);
		}

		for (int i = 0; i < MEGABULLETCOUNT; i++) {
			starAndBulletCollision(&megabullets[i]);
		}
		
		starAndPlayerCollision();
	}

}

//draw the game and all of its components
void drawGame() {
	drawBullet();
	drawOzi();
	drawSmallAliens();
	drawPlayerLives();
	drawOziLives();
	drawMegaBullets();

	if (isLevel2Active) {
		drawSecondOzi();
		drawSecondOziLives();
	}

	if (isLevel3Active) {
		drawStars();
	}

	REG_BG1HOFF = hoff3;
    REG_BG2HOFF = hoff3 / 4;

	REG_BG1VOFF = voff3;
    REG_BG2VOFF = voff3 / 4;
}

//Player functions
//Initialize the player (spaceship)
void initPlayer() {
	player.width = 16;
	player.height = 16;
	player.col = (rand() % 90) + 50 ; //(rand() % 120) + 50
	player.row = (rand() % 80) + 20; //(rand() % 90) + 20

	player.currentAnimationState = FACINGRIGHT; 
	player.currentFrame = 0;
	player.numberOfFrames = 3;
	player.direction = 0;
	player.specificColDel = 0;
	player.specificRowDel = 0;

}

//Update the player's position and frame of animation
//Set boundaries for player's location
//Draw the player
void updatePlayer() {
	player.row += player.specificRowDel;
	player.col += player.specificColDel;

	player.lastAnimationState = player.currentAnimationState;
	if (theTracker == 0) {
		player.currentAnimationState = IDLESTATE;
	} else {
		if (prevButton == 1) {
			player.currentAnimationState = FACINGBACK;
			voff3--;

		} else if (prevButton == 2) {
			player.currentAnimationState = FACINGFRONT;
			voff3++;

		} else if (prevButton == 3) {
			player.currentAnimationState = FACINGLEFT;
			hoff3--;

		} else if (prevButton == 4) {
			player.currentAnimationState = FACINGRIGHT;
			hoff3++;

		}

	} 


	if(player.frameCounter % 10 == 0) { 
		if (player.currentFrame < player.numberOfFrames - 1) { 
			player.currentFrame++;
		} else {
			player.currentFrame = 0;
		}
	}


	if(BUTTON_HELD(BUTTON_UP)) {
			player.currentAnimationState = FACINGBACK;
			theTracker = 1;
			prevButton = 1;
			player.direction = 1;
			player.specificColDel = 0;
			player.specificRowDel = -1;
		}
		if(BUTTON_HELD(BUTTON_DOWN)) {
			player.currentAnimationState = FACINGFRONT;
			theTracker = 1;
			prevButton = 2;
			player.direction = 2;
			player.specificColDel = 0;
			player.specificRowDel = 1;
		}
		if(BUTTON_HELD(BUTTON_LEFT)) {
			player.currentAnimationState = FACINGLEFT;
			theTracker = 1;
			prevButton = 3;
			player.direction = 3;
			player.specificColDel = -1;
			player.specificRowDel = 0;
		}
		if(BUTTON_HELD(BUTTON_RIGHT)) {
			player.currentAnimationState = FACINGRIGHT;
			theTracker = 1;
			prevButton = 4;
			player.direction = 4;
			player.specificColDel = 1;
			player.specificRowDel = 0;
		}



		if (player.currentAnimationState == IDLESTATE) {
			player.currentFrame = 0;
			player.currentAnimationState = player.lastAnimationState;
		} else {
			player.frameCounter++;
		}   


		if (player.row < 16 && player.col < 57) {
			player.row = 16;

		} else if (player.row < 0) {
			player.row = 0;
		}
		

		if (!isLevel2Active) {
			if (player.row > 128 && player.col > 132 && player.col < 203) { //135, 200
				player.row = 128;
			} else if (player.row > 144) {
				player.row = 144;
			}
		} else {

			if (player.row > 128 && player.col > 135 && player.col < 200) {
				player.row = 128;
			} else if (player.row > 128 && player.col > 40 && player.col < 105) {
				player.row = 128;
			} else if (player.row > 144) {
				player.row = 144;
			}

		}
		
		 

		if (oziLives > 0 && player.col > 194) { //224
			player.col = 194;
		} else if (player.col > 224) {
			player.col = 224;
		} 

		if (isLevel2Active) {
			if (secondOziLives > 0 && player.col < 30) {
				player.col = 30;
			} else if (player.col < 0) {
				player.col = 0;
			}  
		} else {
			if (player.col < 0) {
				player.col = 0;
			}  

		}



		if (BUTTON_PRESSED(BUTTON_A) && player.setNormalBullet >= 15) {
			fireBullet();
			player.setNormalBullet = 0;
		}

		player.setNormalBullet++;


		if (BUTTON_PRESSED(BUTTON_B) && player.setMegaBullet >= 40) { //30
			fireMegaBullet();
			player.setMegaBullet = 0;
		}

		player.setMegaBullet++;


	shadowOAM[0].attr0 = (player.row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;  
	shadowOAM[0].attr1 = (player.col & COLMASK) | ATTR1_SMALL; 
	shadowOAM[0].attr2 = ATTR2_TILEID(player.currentAnimationState * 2, player.currentFrame * 2) | ATTR2_PALROW(0);  //col, then row 

}


//Regular Bullet functions
//Initialize pool of regular bullets
void initBullets() {
	for (int i = 0; i < BULLETCOUNT; i++) {
		if (player.currentAnimationState == FACINGLEFT) {
			bullets[i].row = player.row + (player.height / 2 - 2); 
			bullets[i].col = player.col;
			bullets[i].height =  3;
			bullets[i].width = 7;
			bullets[i].direction = 0;
		} 
		if (player.currentAnimationState == FACINGRIGHT) {
			bullets[i].row = player.row + (player.height / 2 - 2); 
			bullets[i].col = player.col + player.width;
			bullets[i].height =  3;
			bullets[i].width = 7;
			bullets[i].direction = 1;
		}

		if (player.currentAnimationState == FACINGBACK) {
			bullets[i].row = player.row;
			bullets[i].col = player.col + (player.width / 2 - 2); 
			bullets[i].height =  7;
			bullets[i].width = 3;
			bullets[i].direction = 2;
		}

		if (player.currentAnimationState == FACINGFRONT) {
			bullets[i].row = player.row + player.height;
			bullets[i].col = player.col + (player.width / 2 - 2); 
			bullets[i].height =  7;
			bullets[i].width = 3;
			bullets[i].direction = 3;
		}
		bullets[i].active = 0;
		bullets[i].definer = 0;
	}

}

//Fire a regular bullet
void fireBullet() {
	for (int i = 0; i < BULLETCOUNT; i++) {
		if (!bullets[i].active) {
			if (player.currentAnimationState == FACINGLEFT) {
			bullets[i].row = player.row + (player.height / 2 - 2); 
			bullets[i].col = player.col;
			bullets[i].height =  3;
			bullets[i].width = 7;
			bullets[i].direction = 0;
		} 
		if (player.currentAnimationState == FACINGRIGHT) {
			bullets[i].row = player.row + (player.height / 2 - 2); 
			bullets[i].col = player.col + player.width - 4;
			bullets[i].height =  3;
			bullets[i].width = 7;
			bullets[i].direction = 1;
		}

		if (player.currentAnimationState == FACINGBACK) {
			bullets[i].row = player.row;
			bullets[i].col = player.col + (player.width / 2 - 2); 
			bullets[i].height =  7;
			bullets[i].width = 3;
			bullets[i].direction = 2;
		}

		if (player.currentAnimationState == FACINGFRONT) {
			bullets[i].row = player.row + player.height - 2;
			bullets[i].col = player.col + (player.width / 2 - 2); 
			bullets[i].height =  7;
			bullets[i].width = 3;
			bullets[i].direction = 3;
		}

		bullets[i].active = 1;
		break;
		}
	}

}

//Update on-screen position of a regular bullet
void updateBullet(BULLET* b) {

	if (b->active) { 
		if (b->direction == 0) {
			if (b->row + b->height > 0 && b->col + b->width > 0 && b->row  < 160 && b->col  < 240) {
				b->col -= 2; 
			} else {
				b->active = 0;
			}
		} 
		
		else if (b->direction == 1) {
			if (b->row +  b->height > 0 && b->col + b->width > 0 && b->row < 160 && b->col < 240) {
				b->col += 2; 
			} else {
				b->active = 0;
			}
		}

		 else if (b->direction == 2) {
			if (b->row + 2* b->height > 0 && b->col + b->width > 0 && b->row  < 160 && b->col < 240) {
				b->row -= 2; 
			} else {
				b->active = 0;
			}
		}

		else if (b->direction == 3) {
			if (b->row + b->height > 0 && b->col + b->width > 0 && b->row < 160 && b->col < 240) {
				b->row += 2; 
			} else {
				b->active = 0;
			}
		}
	}

}

//Draw a regular bullet
void drawBullet() {

	for (int i = 0; i < BULLETCOUNT; i++) {
		if (bullets[i].active) {

			if (bullets[i].direction == 0){ //left
				shadowOAM[i+1].attr0 = (bullets[i].row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;  
				shadowOAM[i+1].attr1 = (bullets[i].col & COLMASK) | ATTR1_TINY; 
				shadowOAM[i+1].attr2 = ATTR2_TILEID(0, 6) | ATTR2_PALROW(0); //14

			} else if (bullets[i].direction == 1) { //right
				shadowOAM[i+1].attr0 = (bullets[i].row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;  
				shadowOAM[i+1].attr1 = (bullets[i].col & COLMASK) | ATTR1_TINY; 
				shadowOAM[i+1].attr2 = ATTR2_TILEID(0, 7) | ATTR2_PALROW(0); //14

			} else if (bullets[i].direction == 2) { //up
				shadowOAM[i+1].attr0 = (bullets[i].row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;  
				shadowOAM[i+1].attr1 = (bullets[i].col & COLMASK) | ATTR1_TINY; 
				shadowOAM[i+1].attr2 = ATTR2_TILEID(0, 8) | ATTR2_PALROW(0);

			} else if (bullets[i].direction == 3) { //down
				shadowOAM[i+1].attr0 = (bullets[i].row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;  
				shadowOAM[i+1].attr1 = (bullets[i].col & COLMASK) | ATTR1_TINY; 
				shadowOAM[i+1].attr2 = ATTR2_TILEID(0, 9) | ATTR2_PALROW(0);

			}
	
		}
	} 
}



//Functions for first Ozi (big alien) on the right side of the screen
//Initialize first Ozi
void initOzi() {
	ozi.row = 100;
	ozi.col = 210; //205
	ozi.height = 26;
	ozi.width = 26;

	if (isLevel3Active) {
		ozi.rdel = 3;
	} else if (isLevel2Active) {
		ozi.rdel = 2;
	} else {
		ozi.rdel = 2; //1
	}

}

//Update first Ozi's position and set boundaries
void updateOzi() {

	if (ozi.row >= 134 || ozi.row <= 1 ){
		ozi.rdel *= -1;
	} 
	ozi.row += ozi.rdel; 
	
}

//Draw first Ozi and animate it
void drawOzi() {

	if (oziLives > 0) {
		shadowOAM[11].attr0 = (ozi.row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;  
		shadowOAM[11].attr1 = (ozi.col & COLMASK) | ATTR1_MEDIUM;  

		//int ourVar = 0;
		if (counter % 50 == 0) {
			ourVar++;
		}

		if (ourVar % 3 == 0) {
			shadowOAM[11].attr2 = ATTR2_TILEID(0, 12) | ATTR2_PALROW(0);
		} else if (ourVar % 2 == 0) {
			shadowOAM[11].attr2 = ATTR2_TILEID(4, 12) | ATTR2_PALROW(0);
		} else {
			shadowOAM[11].attr2 = ATTR2_TILEID(8, 12) | ATTR2_PALROW(0);
		}


	} else {
		shadowOAM[11].attr0 = ATTR0_HIDE;
	}

}

//Small Alien functions [sort of like bullets for Ozi]
//Initialize pool of small aliens (for one Ozi if level 1, for two Ozis if Level 2 or 3)
void initSmallAliens() {
	for (int i = 0; i < SMALLALIENCOUNT; i++) {
		smallalien[i].row = ozi.row + 8;
		smallalien[i].col = ozi.col;
		smallalien[i].cdel = -2; //-2
		smallalien[i].height = 12; //16
		smallalien[i].width = 12; //16
		smallalien[i].active = 0;

		if (isLevel2Active) {
			secondHalf[i].row = leftOzi.row + 8;
			secondHalf[i].col = leftOzi.col;
			secondHalf[i].cdel = 2; //2
			secondHalf[i].height = 16;
			secondHalf[i].width = 16;
			secondHalf[i].active = 0;
		}
	}

}

//Update small alien position on screen
void updateSmallAliens(SMALLALIEN* s) {
	if (s->col >= 240 || s->col <= -16) {
		s->active = 0;
	}

	if (s->active) {
		if ((s->row + s->height-1 >= 0) && (s->col > -16) && (s->col < SCREENWIDTH-1)) {
			s->col += s->cdel; 
		} else {
			s->active = 0;
		}
	} 

} 

//Fire small aliens from Ozi
void fireSmallAliens() {

	for (int i = 0; i < SMALLALIENCOUNT; i++) {
		if (!smallalien[i].active && counter % 40 == 0) {
			smallalien[i].row = ozi.row + 8;
			smallalien[i].col = ozi.col;
			smallalien[i].active = 1;
			break;
		}

		if (isLevel2Active) {
			if (!secondHalf[i].active && counter % 40 == 0) {
				secondHalf[i].row = leftOzi.row + 8;
				secondHalf[i].col = leftOzi.col;
				secondHalf[i].active = 1;
				break;
			}
		}
	}

}

//Draw small aliens on screen
void drawSmallAliens() {
	for (int i = 0; i < SMALLALIENCOUNT; i++) {

		if (oziLives > 0) {
			if (smallalien[i].active) {
				shadowOAM[i + 12].attr0 = (smallalien[i].row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;  
				shadowOAM[i + 12].attr1 = (smallalien[i].col & COLMASK) | ATTR1_SMALL;  
				shadowOAM[i + 12].attr2 = ATTR2_TILEID(0, 21) | ATTR2_PALROW(0);
			}
		} else {
			shadowOAM[i + 12].attr0 = ATTR0_HIDE; 

		}
		

		if (isLevel2Active) {
			if (secondOziLives > 0) {
				if (secondHalf[i].active) {
					shadowOAM[i + 16].attr0 = (secondHalf[i].row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;  
					shadowOAM[i + 16].attr1 = (secondHalf[i].col & COLMASK) | ATTR1_SMALL;  
					shadowOAM[i + 16].attr2 = ATTR2_TILEID(0, 21) | ATTR2_PALROW(0);
				}
			} else {
				shadowOAM[i + 16].attr0 = ATTR0_HIDE;
			}
			
		}

	}

}

//Life functions (red hearts at the top of the screen)
void initPlayerLives() {
	for (int i = 0; i < 3; i++) {
		playerLife[i].col = 20* i + 2;
		playerLife[i].row = 1;
		playerLife[i].height = 16;
		playerLife[i].width = 16;
	}
}

//Draw player lives and decrement accordingly
void drawPlayerLives() {

	shadowOAM[19].attr0 = (1 & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;  
	shadowOAM[19].attr1 = (0 & COLMASK) | ATTR1_LARGE;  
	shadowOAM[19].attr2 = ATTR2_TILEID(11, 22) | ATTR2_PALROW(0); 

	
	for (int i = 0; i < playerLives; i++) {
		shadowOAM[i+20].attr0 = playerLife[i].row | ATTR0_4BPP | ATTR0_SQUARE; 
		shadowOAM[i+20].attr1 = playerLife[i].col | ATTR1_SMALL;  
	}


	if (playerLives == 3) {
		for (int i = 0; i < playerLives; i++) {
			shadowOAM[i+20].attr2 = ATTR2_TILEID(0, 18) | ATTR2_PALROW(0);
		}
	} else if (playerLives <= 2) {
		shadowOAM[2+20].attr2 = ATTR2_TILEID(20, 0) | ATTR2_PALROW(0);
		if (playerLives == 1) {
			shadowOAM[1+20].attr2 = ATTR2_TILEID(20, 0) | ATTR2_PALROW(0);
		}
	} 

	
}

//Initialize Ozi's lives (green hearts on bottom-right of the screen)
void initOziLives() {
	for (int i = 0; i < 3; i++) {
		oziLife[i].col = 20* i + 145; //130
		oziLife[i].row = 143;
		oziLife[i].height = 16;
		oziLife[i].width = 16;
	}
}

//Draw Ozi's lives and decrement accordingly
void drawOziLives() {

	shadowOAM[24].attr0 = (143 & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;  
	shadowOAM[24].attr1 = (143 & COLMASK) | ATTR1_LARGE;  
	shadowOAM[24].attr2 = ATTR2_TILEID(11, 22) | ATTR2_PALROW(0); 

	if (oziLives == 3) {
		for (int i = 0; i < 3; i ++) {
			shadowOAM[i + 25].attr0 = (oziLife[i].row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;  
			shadowOAM[i + 25].attr1 = (oziLife[i].col & COLMASK) | ATTR1_SMALL;  
			shadowOAM[i + 25].attr2 = ATTR2_TILEID(0, 16) | ATTR2_PALROW(0); 
		}

	} else if (oziLives == 2) {
		for (int i = 0; i < 2; i ++) {
			shadowOAM[i + 25].attr0 = (oziLife[i].row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;  
			shadowOAM[i + 25].attr1 = (oziLife[i].col & COLMASK) | ATTR1_SMALL;  
			shadowOAM[i + 25].attr2 = ATTR2_TILEID(0, 16) | ATTR2_PALROW(0); 
		}
		shadowOAM[25 + 2].attr0 = ATTR0_HIDE;

	} else if (oziLives == 1) {
		shadowOAM[25].attr0 = (oziLife[0].row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;  
		shadowOAM[25].attr1 = (oziLife[0].col & COLMASK) | ATTR1_SMALL;  
		shadowOAM[25].attr2 = ATTR2_TILEID(0, 16) | ATTR2_PALROW(0); 

		shadowOAM[25 + 1].attr0 = ATTR0_HIDE;
		shadowOAM[25 + 2].attr0 = ATTR0_HIDE;

	} else if (oziLives <= 0) {
		shadowOAM[25].attr0 = ATTR0_HIDE;
		shadowOAM[25 + 1].attr0 = ATTR0_HIDE;
		shadowOAM[25 + 2].attr0 = ATTR0_HIDE;

	}


}

//Level Two Ozi Lives
//Initialize second Ozi's lives (bottom-left green hearts on the screen)
void initSecondOziLives() {
	for (int i = 0; i < 3; i++) {
		secondVersion[i].col = 20 * i + 50;
		secondVersion[i].row = 143;	
		secondVersion[i].height = 16;
		secondVersion[i].width = 16;
	}

}

//Draw second Ozi's lives and decrement accordingly
void drawSecondOziLives() {

	shadowOAM[28].attr0 = (143 & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;  
	shadowOAM[28].attr1 = (48 & COLMASK) | ATTR1_LARGE;  
	shadowOAM[28].attr2 = ATTR2_TILEID(11, 22) | ATTR2_PALROW(0); 

	if (secondOziLives == 3) {
		for (int i = 0; i < 3; i ++) {
			shadowOAM[i + 29].attr0 = (secondVersion[i].row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;  
			shadowOAM[i + 29].attr1 = (secondVersion[i].col & COLMASK) | ATTR1_SMALL;  
			shadowOAM[i + 29].attr2 = ATTR2_TILEID(0, 16) | ATTR2_PALROW(0); 
		}

	} else if (secondOziLives == 2) {
		for (int i = 0; i < 2; i ++) {
			shadowOAM[i + 29].attr0 = (secondVersion[i].row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;  
			shadowOAM[i + 29].attr1 = (secondVersion[i].col & COLMASK) | ATTR1_SMALL;  
			shadowOAM[i + 29].attr2 = ATTR2_TILEID(0, 16) | ATTR2_PALROW(0); 
		}
		shadowOAM[29 + 2].attr0 = ATTR0_HIDE;

	} else if (secondOziLives == 1) {
		shadowOAM[29].attr0 = (secondVersion[0].row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;  
		shadowOAM[29].attr1 = (secondVersion[0].col & COLMASK) | ATTR1_SMALL;  
		shadowOAM[29].attr2 = ATTR2_TILEID(0, 16) | ATTR2_PALROW(0); 

		shadowOAM[29 + 1].attr0 = ATTR0_HIDE;
		shadowOAM[29 + 2].attr0 = ATTR0_HIDE;

	} else if (secondOziLives <= 0) {
		shadowOAM[29].attr0 = ATTR0_HIDE;
		shadowOAM[29 + 1].attr0 = ATTR0_HIDE;
		shadowOAM[29 + 2].attr0 = ATTR0_HIDE;

	}

}

//Check for collision between player and small aliens
void playerCollision() {
	for (int i = 0; i < SMALLALIENCOUNT; i++) {
		if (oziLives > 0) {
			if (collision(player.col, player.row, player.width, player.height, smallalien[i].col, smallalien[i].row, smallalien[i].width, smallalien[i].height)) {
				playSoundB(crashSound_data, crashSound_length, 0);
				playerLives--;
				smallalien[i].col = -20;
			}
		}
		
		//Added Level 2 functionality
		if (isLevel2Active){
			if (secondOziLives > 0) {
				if (collision(player.col, player.row, player.width, player.height, secondHalf[i].col, secondHalf[i].row, secondHalf[i].width, secondHalf[i].height)) {
					playSoundB(crashSound_data, crashSound_length, 0);
					playerLives--;
					secondHalf[i].col = -20;
				}
			}	
		}
	}
}

//Check for collision between Ozis and bullets
void oziCollision(BULLET* b) {

		if (collision(ozi.col, ozi.row, ozi.width, ozi.height, b->col, b->row, b->width, b->height)) {
			playSoundB(fireball_data, fireball_length, 0);
			if (b->definer == 0) {
				oziLives--;
			} else if (b->definer == 1) {
				oziLives-= 3;
			}
			
			b->col = -30; //260
		}

		//Added Level 2 functionality
		if (isLevel2Active) {		//removed this to test state transitions
			if (collision(leftOzi.col, leftOzi.row, leftOzi.width, leftOzi.height, b->col, b->row, b->width, b->height)) {
				playSoundB(fireball_data, fireball_length, 0);

				if (b->definer == 0) {
					secondOziLives--;
				} else if (b->definer == 1) {
					secondOziLives-= 3;
				}
				
				b->col = -30;
			}
		}

}

//Check for collision between bullet and small alien
void bulletAndSmallAlienCollision(BULLET* b) {
		for (int j = 0; j < SMALLALIENCOUNT; j++) {
			if (b->active && smallalien[j].active) {
					if (collision(b->col, b->row, b->width, b->height, smallalien[j].col, smallalien[j].row, smallalien[j].width, smallalien[j].height)) {
						playSoundB(fireball_data, fireball_length, 0);
						b->col = -60; //300
				
						smallalien[j].col = -40;
					}

					//Added Level 2 functionality
					if (collision(b->col, b->row, b->width, b->height, secondHalf[j].col, secondHalf[j].row, secondHalf[j].width, secondHalf[j].height)) {
						playSoundB(fireball_data, fireball_length, 0);
						b->col = -60; //300
				
						secondHalf[j].col = -40;
					}

			}
		}

}

//Initialize second Ozi (left side of screen)
//Used in Levels 2 and 3
void initSecondOzi() {
	leftOzi.row = 30;
	leftOzi.col = 5; //10
	leftOzi.height = 26;
	leftOzi.width = 26;

	if (isLevel3Active) {
		leftOzi.rdel = 3;
	} else if (isLevel2Active) {
		leftOzi.rdel = 2;
	} else {
		leftOzi.rdel = 2;
	}
	
}

//Update position of second Ozi and set boundaries
void updateSecondOzi() {
	if (leftOzi.row >= 134 || leftOzi.row <= 18 ){
		leftOzi.rdel *= -1;
	} 
	leftOzi.row += leftOzi.rdel; 
}

//Draw and animate the second Ozi so that it changes colors
void drawSecondOzi() {

	if (secondOziLives > 0) {
		shadowOAM[32].attr0 = (leftOzi.row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;  //originally 4 in all of these
		shadowOAM[32].attr1 = (leftOzi.col & COLMASK) | ATTR1_MEDIUM; 

		if (counter % 50 == 0) {
			secondOurVar++;
		}

		if (secondOurVar % 3 == 0) {
			shadowOAM[32].attr2 = ATTR2_TILEID(4, 12) | ATTR2_PALROW(0);
		} else if (secondOurVar % 2 == 0) {
			shadowOAM[32].attr2 = ATTR2_TILEID(8, 12) | ATTR2_PALROW(0);
		} else {
			shadowOAM[32].attr2 = ATTR2_TILEID(0, 12) | ATTR2_PALROW(0);
		}


	} else {
		shadowOAM[32].attr0 = ATTR0_HIDE; 

	}
}

//Used only in Level 3
//Initialize pool of stars
void initStars() {
	for (int i = 0; i < numberOfStars; i++) { //STARCOUNT

	if (player.col > 120) {
		stars[i].col = player.col + player.width + 2 - (rand() % 150) - 10;

	} else {
		stars[i].col = player.col + player.width + 2 + (rand() % 150);

	}

	if (player.row > 80) {
		stars[i].row = player.row + player.height + 2 - (rand() % 90);

	} else {
		stars[i].row = player.row + player.height + 2 + (rand() % 80);

	}  

		//stars[i].row = player.row + player.height + 2 + (rand() % 130);
		//stars[i].col = player.col + player.width + 2 - (rand() % 220);

		stars[i].height = 8;
		stars[i].width = 8;
		stars[i].active = 1;
	}
}

//Draw stars to the screen
void drawStars() {
	for (int i = 0; i < numberOfStars; i++) {
		shadowOAM[i+34].attr0 = (stars[i].row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;  //originally 4 in all of these
		shadowOAM[i+34].attr1 = (stars[i].col & COLMASK) | ATTR1_TINY; 
		shadowOAM[i+34].attr2 = ATTR2_TILEID(0, 28) | ATTR2_PALROW(0);
	}


}

//If a star and the player collide, we want to subtract a life from the player and erase the star
void starAndPlayerCollision() {
	for (int i = 0; i <numberOfStars; i++) {
		if (collision(player.col, player.row, player.width, player.height, stars[i].col, stars[i].row, stars[i].width, stars[i].height)) {
			playSoundB(bump_data, bump_length, 0);
			playerLives--;
			stars[i].row = -30;
		}
	}
}

//If a star and bullet collide, we want to erase the star
void starAndBulletCollision(BULLET* b) {
		for (int j = 0; j < numberOfStars; j++) {
			if (collision(b->col, b->row, b->width, b->height, stars[j].col, stars[j].row, stars[j].width, stars[j].height)) { 
				playSoundB(fireball_data, fireball_length, 0);
				stars[j].row = -30;
				b->col = -30;
			}
		}
}

//Cheat
//Initialize pool of mega bullets
void initMegaBullets() {

	for (int i = 0; i < MEGABULLETCOUNT; i++) {
		if (player.currentAnimationState == FACINGLEFT) {
			megabullets[i].row = player.row + (player.height / 2 - 4); //12
			megabullets[i].col = player.col;
			megabullets[i].height = 6; 
			megabullets[i].width = 14;
			megabullets[i].direction = 0;
		} 
		if (player.currentAnimationState == FACINGRIGHT) {
			megabullets[i].row = player.row + (player.height / 2 - 4); //12
			megabullets[i].col = player.col + player.width;
			megabullets[i].height = 6; 
			megabullets[i].width = 14;
			megabullets[i].direction = 1;
		}

		if (player.currentAnimationState == FACINGBACK) {
			megabullets[i].row = player.row;
			megabullets[i].col = player.col + (player.width / 2 - 4); //12
			megabullets[i].height = 14; 
			megabullets[i].width = 6;
			megabullets[i].direction = 2;
		}

		if (player.currentAnimationState == FACINGFRONT) {
			megabullets[i].row = player.row + player.height;
			megabullets[i].col = player.col + (player.width / 2 - 4); //12
			megabullets[i].height = 14; 
			megabullets[i].width = 6;
			megabullets[i].direction = 3;
		}
		megabullets[i].active = 0;
		megabullets[i].definer = 1;
	}

}

//Function when mega bullet is fired in any direction
void fireMegaBullet() {

	for (int i = 0; i < MEGABULLETCOUNT; i++) {
		if (!megabullets[i].active) {
			if (player.currentAnimationState == FACINGLEFT) {
			megabullets[i].row = player.row + (player.height / 2 - 4); //12
			megabullets[i].col = player.col;
			megabullets[i].height = 6; 
			megabullets[i].width = 14;
			megabullets[i].direction = 0;
		} 
		if (player.currentAnimationState == FACINGRIGHT) {
			megabullets[i].row = player.row + (player.height / 2 - 4); //12
			megabullets[i].col = player.col + player.width - 4;
			megabullets[i].height = 6; 
			megabullets[i].width = 14;
			megabullets[i].direction = 1;
		}

		if (player.currentAnimationState == FACINGBACK) {
			megabullets[i].row = player.row;
			megabullets[i].col = player.col + (player.width / 2 - 4); //12
			megabullets[i].height = 14; 
			megabullets[i].width = 6;
			megabullets[i].direction = 2;
		}

		if (player.currentAnimationState == FACINGFRONT) {
			megabullets[i].row = player.row + player.height - 2;
			megabullets[i].col = player.col + (player.width / 2 - 6); //12
			megabullets[i].height = 14; 
			megabullets[i].width = 6;
			megabullets[i].direction = 3;
		}

		megabullets[i].active = 1;
		break;
		}
	}

}

//Draw mega bullet to the screen
void drawMegaBullets() {

		for (int i = 0; i < MEGABULLETCOUNT; i++) {
		if (megabullets[i].active) {

			if (megabullets[i].direction == 0){ //left
				shadowOAM[i+100].attr0 = (megabullets[i].row & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;  
				shadowOAM[i+100].attr1 = (megabullets[i].col & COLMASK) | ATTR1_TINY; 
				shadowOAM[i+100].attr2 = ATTR2_TILEID(0, 23) | ATTR2_PALROW(0); //14

			} else if (megabullets[i].direction == 1) { //right
				shadowOAM[i+100].attr0 = (megabullets[i].row & ROWMASK) | ATTR0_4BPP | ATTR0_WIDE;  
				shadowOAM[i+100].attr1 = (megabullets[i].col & COLMASK) | ATTR1_TINY; 
				shadowOAM[i+100].attr2 = ATTR2_TILEID(0, 20) | ATTR2_PALROW(0); //14

			} else if (megabullets[i].direction == 2) { //up
				shadowOAM[i+100].attr0 = (megabullets[i].row & ROWMASK) | ATTR0_4BPP | ATTR0_TALL;  
				shadowOAM[i+100].attr1 = (megabullets[i].col & COLMASK) | ATTR1_TINY; 
				shadowOAM[i+100].attr2 = ATTR2_TILEID(0, 24) | ATTR2_PALROW(0);

			} else if (megabullets[i].direction == 3) { //down
				shadowOAM[i+100].attr0 = (megabullets[i].row & ROWMASK) | ATTR0_4BPP | ATTR0_TALL;  
				shadowOAM[i+100].attr1 = (megabullets[i].col & COLMASK) | ATTR1_TINY; 
				shadowOAM[i+100].attr2 = ATTR2_TILEID(0, 26) | ATTR2_PALROW(0);

			}
	
		}
	} 

}

