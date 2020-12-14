// Player Struct
typedef struct {
	int row;
	int col;
	int height;
	int width;
	int setNormalBullet;
	int setMegaBullet;

	int frameCounter;
	int currentAnimationState;
	int lastAnimationState;
	int currentFrame;
	int numberOfFrames;
	int direction;
	int specificColDel;
	int specificRowDel;
} PLAYER;

// Bullet Struct
typedef struct {
	int row;
	int col;
	int height;
	int width;
	int active;
	int direction;
	int definer;
} BULLET;

// Ozi Struct
typedef struct {
	int row;
	int col;
	int rdel;
	int height;
	int width;
} OZI;

// Small Alien Struct
typedef struct {
	int row;
	int col;
	int cdel;
	int height;
	int width;
	int active;
} SMALLALIEN;

typedef struct {
	int row;
	int col;
	int height;
	int width;
} LIVES;

typedef struct {
	int row;
	int col;
	int height;
	int width;
	int active;
} STAR;

// Constants
#define BULLETCOUNT 10 //3
#define SMALLALIENCOUNT 3 
#define PLAYERLIFECOUNT 3
#define OZILIFECOUNT 3
#define STARCOUNT 30 //10
#define MEGABULLETCOUNT 5

// Variables
extern PLAYER player;
extern BULLET bullets[BULLETCOUNT];
extern OZI ozi;
extern SMALLALIEN smallalien[SMALLALIENCOUNT];
extern LIVES playerLife[PLAYERLIFECOUNT];
extern LIVES oziLife[OZILIFECOUNT];

extern SMALLALIEN secondHalf[SMALLALIENCOUNT];
extern LIVES secondVersion[OZILIFECOUNT];

extern STAR stars[STARCOUNT];

extern int playerLives;
extern int oziLives;
extern int secondOziLives;


// Prototypes
void initGame();
void updateGame();
void drawGame();

void initPlayer();
void updatePlayer();

void initBullets();
void fireBullet();
void updateBullet(BULLET *);
void drawBullet();

void initOzi();
void updateOzi();
void drawOzi();

void initSmallAliens();
void updateSmallAliens(SMALLALIEN *);
void fireSmallAliens();
void drawSmallAliens();

void initPlayerLives();
void drawPlayerLives();

void initOziLives();
void drawOziLives();

void playerCollision();
void oziCollision(BULLET* b);
void bulletAndSmallAlienCollision(BULLET* b);

void initSecondOzi();
void updateSecondOzi();
void drawSecondOzi();

extern int isLevel2Active;

void initSecondOziLives();
void drawSecondOziLives();

void initStars();
void drawStars();

extern int isLevel3Active;

void starAndBulletCollision(BULLET* b);
void starAndPlayerCollision();

void updateOziLives();

extern unsigned short hoff;

extern unsigned short hoff3;

extern int voff3;

extern int prevButton;
extern int theTracker;

void initMegaBullets();
void fireMegaBullet();
void drawMegaBullets();