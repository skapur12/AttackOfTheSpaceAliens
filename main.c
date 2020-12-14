
#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "game.h"
#include "menu.h"
#include "win.h"
#include "lose.h"
#include "pause.h"
#include "instructions.h"
#include "background.h"
#include "levelTwoStartScreen.h"
#include "levelThreeStartScreen.h"
#include "levelTwoWin.h"
#include "levelThreeWin.h"

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
#include "layerOne.h"
#include "layerTwo.h"
#include "sound.h"

//Variables
unsigned short hoff3;
int voff3;
int pauseCounter = 1;

//Sounds
SOUND soundA;
SOUND soundB;

// State Prototypes
void initialize();
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();
void goToInstructions();
void instructions();
void goToLevelTwoStart();
void levelTwoStart();
void goToLevelTwoGame();
void levelTwoGame();
void goToLevelThreeStart();
void levelThreeStart();
void goToLevelThreeGame();
void levelThreeGame();
void goToLevelTwoWin();
void levelTwoWin();
void goToLevelThreeWin();
void levelThreeWin();


// States
enum
{
    START,
    INSTRUCTIONS,
    GAME,
    LEVEL2START,
    LEVEL2GAME,
    LEVEL2WIN,
    LEVEL3START,
    LEVEL3GAME,
    LEVEL3WIN,
    PAUSE,
    WIN,
    LOSE
};
int state;

//Seed for random generator
int seed;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Shadow OAM
OBJ_ATTR shadowOAM[128];

int main()
{
    initialize();

    while (1)
    {
        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine
        switch (state)
        {
        case START:
            start();
            break;
        case INSTRUCTIONS:
            instructions();
            break;
        case GAME:
            game();
            break;
        case LEVEL2START:
            levelTwoStart();
            break;
        case LEVEL2GAME:
            levelTwoGame();
            break;
        case LEVEL2WIN:
            levelTwoWin();
            break;
        case LEVEL3START:
            levelThreeStart();
            break;
        case LEVEL3GAME:
            levelThreeGame();
            break;
        case LEVEL3WIN:
            levelThreeWin();
            break;
        case PAUSE:
            pause();
            break;
        case WIN:
            win();
            break;
        case LOSE:
            lose();
            break;
        }

        //waitForVBlank();

        //DMANow(3, shadowOAM, OAM, 512);

    }
}

// Sets up GBA
void initialize()
{
    isLevel2Active = 0;
    isLevel3Active = 0;

    prevButton = 0;
    theTracker = 0;

    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    REG_BG0CNT = BG_4BPP | BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    REG_BG1CNT = 0;

    buttons = BUTTONS;
    oldButtons = 0;

    setupSounds();
	setupInterrupts();


    goToStart();
}

// Sets up the start state
void goToStart() {
    
    REG_BG0VOFF = 0;
    isLevel2Active = 0;
    isLevel3Active = 0;
    REG_BG1CNT = 0;
    DMANow(3, shadowOAM, OAM, 512);

    DMANow(3, menuPal, PALETTE, menuPalLen/2);
    DMANow(3, menuTiles, &CHARBLOCK[0], menuTilesLen / 2);
    DMANow(3, menuMap, &SCREENBLOCK[28], menuMapLen / 2);

    stopSound();
    playSoundA(slowGhostSound_data, slowGhostSound_length, 1);


    state = START;

    seed = 0;

}

// Every frame of the start state
void start() {
    REG_BG1CNT = 0;
    seed++;
    isLevel2Active = 0;
    isLevel3Active = 0;
    pauseCounter = 1;
    hoff3 = 0;
    voff3 = 20;
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(seed);

        stopSound();
		playSoundA(levelSong_data, levelSong_length, 1);

        goToGame();
        initGame();
    } else if (BUTTON_PRESSED(BUTTON_A)) {
        goToInstructions();

    }
}

//Set up the instruction state
void goToInstructions() {
    REG_BG0VOFF = 0;
    REG_BG1CNT = 0;
    DMANow(3, shadowOAM, OAM, 512);

    DMANow(3, instructionsPal, PALETTE, instructionsPalLen / 2);
    DMANow(3, instructionsTiles, &CHARBLOCK[0], instructionsTilesLen / 2);
    DMANow(3, instructionsMap, &SCREENBLOCK[28], instructionsMapLen / 2);  

    state = INSTRUCTIONS;

}

//Runs during instruction state
void instructions() {
    REG_BG1CNT = 0;
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(seed);

	    playSoundA(levelSong_data, levelSong_length, 1);

        goToGame();
        initGame();
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

// Sets up the game state
void goToGame() {
    prevButton = 0;
    theTracker = 0;

    REG_DISPCTL = MODE0 | BG2_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
    DMANow(3, shadowOAM, OAM, 512);

    DMANow(3, layerOnePal, PALETTE, layerOnePalLen/2);
    REG_BG2CNT = BG_SIZE_WIDE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP;
    DMANow(3, layerOneTiles, &CHARBLOCK[0], layerOneTilesLen / 2);
    DMANow(3, layerOneMap, &SCREENBLOCK[28], layerOneMapLen / 2);
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(27) | BG_4BPP;
    DMANow(3, layerTwoTiles, &CHARBLOCK[1], layerTwoTilesLen/2);
    DMANow(3, layerTwoMap, &SCREENBLOCK[27], layerTwoMapLen/2);

    state = GAME;
}

// Runs every frame of the game state
void game() {
    REG_DISPCTL = MODE0 | BG2_ENABLE | BG1_ENABLE | SPRITE_ENABLE;

    updateGame();
    drawGame();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    if (BUTTON_PRESSED(BUTTON_START)) {
        pauseSound();
        goToPause();
    } 
    else if (playerLives == 0) {
        goToLose();
    } 
    else if (oziLives <= 0) {
        goToWin();
    }

}
// Set up the level 2 start state
void goToLevelTwoStart() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    isLevel2Active = 1;
    DMANow(3, shadowOAM, OAM, 512);
    DMANow(3, levelTwoStartScreenPal, PALETTE, levelTwoStartScreenPalLen / 2);
    DMANow(3, levelTwoStartScreenTiles, &CHARBLOCK[0], levelTwoStartScreenTilesLen / 2);
    DMANow(3, levelTwoStartScreenMap, &SCREENBLOCK[28], levelTwoStartScreenMapLen / 2);  

    stopSound();
    playSoundA(ghostSound_data, ghostSound_length, 1);

    state = LEVEL2START;
}

//Runs every frame of the Level two state state
void levelTwoStart() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    isLevel2Active = 1;
    seed++;
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(seed);

        stopSound();
	    playSoundA(levelSong_data, levelSong_length, 1);

        goToLevelTwoGame();
        initGame();
    }
}

//Set up level 2 game state
void goToLevelTwoGame() {
    REG_DISPCTL = MODE0 | BG2_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
    prevButton = 0;
    theTracker = 0;
    
    isLevel2Active = 1;
    isLevel3Active = 0;

    DMANow(3, shadowOAM, OAM, 512);

    DMANow(3, layerOnePal, PALETTE, layerOnePalLen/2);
    REG_BG2CNT = BG_SIZE_WIDE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP;
    DMANow(3, layerOneTiles, &CHARBLOCK[0], layerOneTilesLen / 2);
    DMANow(3, layerOneMap, &SCREENBLOCK[28], layerOneMapLen / 2);
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(27) | BG_4BPP;
    DMANow(3, layerTwoTiles, &CHARBLOCK[1], layerTwoTilesLen/2);
    DMANow(3, layerTwoMap, &SCREENBLOCK[27], layerTwoMapLen/2);

    state = LEVEL2GAME;
}

//Runs every frame of the Level 2 game state
void levelTwoGame() {
    REG_DISPCTL = MODE0 | BG2_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
    pauseCounter = 2;
    isLevel2Active = 1;
    isLevel3Active = 0;

    updateGame();
    drawGame();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    if (BUTTON_PRESSED(BUTTON_START)) {
        pauseSound();
        goToPause();
    } 
     if (playerLives == 0) {
        goToLose();
    } 
     if (oziLives <= 0 && secondOziLives <= 0) {  //oziLives == 0 && secondOziLives == 0 && playerLives > 0
        goToLevelTwoWin();
    }
}

//Set up Level 2 win state
void goToLevelTwoWin() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    hideSprites();
    waitForVBlank();
    
    DMANow(3, shadowOAM, OAM, 512);
    DMANow(3, levelTwoWinPal, PALETTE, levelTwoWinPalLen / 2);
    DMANow(3, levelTwoWinTiles, &CHARBLOCK[0], levelTwoWinTilesLen / 2);
    DMANow(3, levelTwoWinMap, &SCREENBLOCK[28], levelTwoWinMapLen / 2);

    stopSound();
	playSoundA(winSound_data, winSound_length, 0);

    state = LEVEL2WIN;

}

//Runs every frame of the Level 2 win state
void levelTwoWin() {

    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToLevelThreeStart();
    }

} 

//Set up Level 3 start state
void goToLevelThreeStart() {
    //isLevel2Active = 1;

    isLevel3Active = 1;

    DMANow(3, shadowOAM, OAM, (4*128)); //?
    DMANow(3, levelThreeStartScreenPal, PALETTE, levelThreeStartScreenPalLen / 2);
    DMANow(3, levelThreeStartScreenTiles, &CHARBLOCK[0], levelThreeStartScreenTilesLen / 2);
    DMANow(3, levelThreeStartScreenMap, &SCREENBLOCK[28], levelThreeStartScreenMapLen / 2); 

    stopSound();
    playSoundA(ghostSound_data, ghostSound_length, 1);

    state = LEVEL3START;
}

//Runs every frame of the Level 3 start state
void levelThreeStart() {
    //isLevel2Active = 1;
    isLevel3Active = 1;
    seed++;
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(seed);

        stopSound();
	    playSoundA(levelSong_data, levelSong_length, 1);

        goToLevelThreeGame();
        initGame();
    }
}

//Set up Level 3 game state
void goToLevelThreeGame() {
    REG_DISPCTL = MODE0 | BG2_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
    prevButton = 0;
    theTracker = 0;

    isLevel2Active = 1;
    isLevel3Active = 1;
    DMANow(3, shadowOAM, OAM, 512);

    DMANow(3, layerOnePal, PALETTE, layerOnePalLen/2);
    REG_BG2CNT = BG_SIZE_WIDE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_4BPP;
    DMANow(3, layerOneTiles, &CHARBLOCK[0], layerOneTilesLen / 2);
    DMANow(3, layerOneMap, &SCREENBLOCK[28], layerOneMapLen / 2);
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(27) | BG_4BPP;
    DMANow(3, layerTwoTiles, &CHARBLOCK[1], layerTwoTilesLen/2);
    DMANow(3, layerTwoMap, &SCREENBLOCK[27], layerTwoMapLen/2);

    state = LEVEL3GAME;
}

//Runs every frame of the Level 3 game state
void levelThreeGame() {
    REG_DISPCTL = MODE0 | BG2_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
    isLevel2Active = 1;
    pauseCounter = 3;
    isLevel3Active = 1;

    updateGame();
    drawGame();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);


    if (BUTTON_PRESSED(BUTTON_START)) {
        pauseSound();
        goToPause();
    } 

    if (oziLives <= 0 && secondOziLives <= 0) {  // oziLives == 0 && secondOziLives == 0 && playerLives > 0
        goToLevelThreeWin();
    } else if (playerLives == 0) {
        goToLose();
    }
}

//Set up Level 3 win state
void goToLevelThreeWin() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    hideSprites();
    waitForVBlank();
    

    DMANow(3, shadowOAM, OAM, 512);
    DMANow(3, levelThreeWinPal, PALETTE, winPalLen / 2);
    DMANow(3, levelThreeWinTiles, &CHARBLOCK[0], levelThreeWinTilesLen / 2);
    DMANow(3, levelThreeWinMap, &SCREENBLOCK[28], levelThreeWinMapLen / 2);

    stopSound();
    playSoundA(finalWinSound_data, finalWinSound_length, 1);

    state = LEVEL3WIN;

}

//Runs every frame of the Level 3 win state
void levelThreeWin() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }

} 

// Sets up the pause state
void goToPause() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    REG_BG0VOFF = 0;
    hideSprites();
    waitForVBlank();


    DMANow(3, shadowOAM, OAM, 512);
    DMANow(3, pausePal, PALETTE, pausePalLen / 2);
    DMANow(3, pauseTiles, &CHARBLOCK[0], pauseTilesLen / 2);
    DMANow(3, pauseMap, &SCREENBLOCK[28], pauseMapLen / 2); 

    state = PAUSE;
}

// Every frame of the pause state
void pause() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        if (pauseCounter == 1) {
            unpauseSound();
            goToGame();
        } else if (pauseCounter == 2) {
            unpauseSound();
            goToLevelTwoGame();
        } else if (pauseCounter == 3) {
            unpauseSound();
            goToLevelThreeGame();
        }
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }

}

// Sets up the Level 1 win state
void goToWin() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    REG_BG0VOFF = 0;
    hideSprites();
    waitForVBlank();

    //Draw the win background if we win!
    DMANow(3, shadowOAM, OAM, 512);
    DMANow(3, winPal, PALETTE, winPalLen / 2);
    DMANow(3, winTiles, &CHARBLOCK[0], winTilesLen / 2);
    DMANow(3, winMap, &SCREENBLOCK[28], winMapLen / 2);

    stopSound();
	playSoundA(winSound_data, winSound_length, 0);

    state = WIN;
}

// Every frame of the Level 1 win state
void win() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToLevelTwoStart();
    }

}

// Sets up the lose state (for any level)
void goToLose() {
    REG_BG0VOFF = 0;
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    hideSprites();
    waitForVBlank();
    
    //Draw the lose background if we lose
    DMANow(3, shadowOAM, OAM, 512);
    DMANow(3, losePal, PALETTE, losePalLen / 2);
    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen / 2);
    DMANow(3, loseMap, &SCREENBLOCK[28], loseMapLen / 2); 

    stopSound();
	playSoundA(loseSound_data, loseSound_length, 0);

    state = LOSE;
}

// Every frame of the lose state (for any level)
void lose() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}