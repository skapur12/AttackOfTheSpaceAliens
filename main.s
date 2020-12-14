	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r1, #67108864
	mov	r4, #0
	ldr	r0, .L4
	ldr	r2, .L4+4
	strh	r4, [r1, #18]	@ movhi
	ldr	r5, .L4+8
	str	r4, [r0]
	str	r4, [r2]
	mov	r3, #512
	strh	r4, [r1, #10]	@ movhi
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r5
	mov	r3, #7040
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r2, .L4+24
	ldr	r1, .L4+28
	mov	r3, #1024
	mov	lr, pc
	bx	r5
	ldr	r3, .L4+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+36
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L4+40
	ldr	r3, .L4+44
	mov	lr, pc
	bx	r3
	ldr	r2, .L4+48
	ldr	r3, .L4+52
	str	r4, [r2]
	str	r4, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	isLevel2Active
	.word	isLevel3Active
	.word	DMANow
	.word	shadowOAM
	.word	menuPal
	.word	menuTiles
	.word	100720640
	.word	menuMap
	.word	stopSound
	.word	slowGhostSound_length
	.word	slowGhostSound_data
	.word	playSoundA
	.word	state
	.word	seed
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mov	r2, #67108864
	mov	ip, #4352
	mov	r0, #56320
	push	{r4, lr}
	ldr	r1, .L8
	ldr	lr, .L8+4
	str	r3, [r1]
	str	r3, [lr]
	ldr	r1, .L8+8
	ldr	lr, .L8+12
	str	r3, [r1]
	str	r3, [lr]
	ldr	r1, .L8+16
	strh	ip, [r2]	@ movhi
	strh	r0, [r2, #8]	@ movhi
	strh	r3, [r2, #10]	@ movhi
	ldr	ip, .L8+20
	ldrh	r0, [r1, #48]
	ldr	r1, .L8+24
	ldr	r2, .L8+28
	strh	r3, [ip]	@ movhi
	strh	r0, [r1]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r3, .L8+32
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	isLevel3Active
	.word	isLevel2Active
	.word	theTracker
	.word	prevButton
	.word	67109120
	.word	oldButtons
	.word	buttons
	.word	setupSounds
	.word	setupInterrupts
	.size	initialize, .-initialize
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #67108864
	mov	r0, #0
	push	{r4, lr}
	mov	r3, #512
	ldr	r4, .L12
	strh	r0, [r1, #18]	@ movhi
	mov	r2, #117440512
	strh	r0, [r1, #10]	@ movhi
	mov	r0, #3
	ldr	r1, .L12+4
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L12+8
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L12+12
	ldr	r1, .L12+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L12+20
	mov	r0, #3
	ldr	r1, .L12+24
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L12+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	shadowOAM
	.word	instructionsPal
	.word	6624
	.word	instructionsTiles
	.word	100720640
	.word	instructionsMap
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #0
	mov	r5, #67108864
	mov	r2, #5632
	ldr	r0, .L16
	ldr	r1, .L16+4
	ldr	r4, .L16+8
	str	r3, [r0]
	str	r3, [r1]
	mov	r0, #3
	strh	r2, [r5]	@ movhi
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L16+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L16+16
	mov	lr, pc
	bx	r4
	mov	r2, #23552
	mov	r0, #3
	strh	r2, [r5, #12]	@ movhi
	ldr	r3, .L16+20
	mov	r2, #100663296
	ldr	r1, .L16+24
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L16+28
	ldr	r1, .L16+32
	mov	lr, pc
	bx	r4
	ldr	r2, .L16+36
	mov	r3, #3472
	strh	r2, [r5, #10]	@ movhi
	mov	r0, #3
	ldr	r2, .L16+40
	ldr	r1, .L16+44
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L16+48
	mov	r0, #3
	ldr	r1, .L16+52
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L16+56
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L17:
	.align	2
.L16:
	.word	prevButton
	.word	theTracker
	.word	DMANow
	.word	shadowOAM
	.word	layerOnePal
	.word	5088
	.word	layerOneTiles
	.word	100720640
	.word	layerOneMap
	.word	6916
	.word	100679680
	.word	layerTwoTiles
	.word	100718592
	.word	layerTwoMap
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mov	r2, #67108864
	push	{r4, r5, r6, lr}
	mov	r5, #1
	mov	r0, #20
	ldr	r4, .L30
	strh	r3, [r2, #10]	@ movhi
	ldr	r2, .L30+4
	ldr	r1, [r4]
	str	r3, [r2]
	ldr	r2, .L30+8
	ldr	ip, .L30+12
	add	r1, r1, r5
	strh	r3, [r2]	@ movhi
	str	r1, [r4]
	ldr	r2, .L30+16
	ldr	r1, .L30+20
	str	r3, [ip]
	ldr	r3, .L30+24
	str	r5, [r1]
	str	r0, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L19
	ldr	r2, .L30+32
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L28
.L19:
	tst	r3, #1
	beq	.L18
	ldr	r3, .L30+32
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L29
.L18:
	pop	{r4, r5, r6, lr}
	bx	lr
.L28:
	ldr	r0, [r4]
	ldr	r3, .L30+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+44
	mov	r2, r5
	ldr	r1, [r3]
	ldr	r0, .L30+48
	ldr	r3, .L30+52
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L30+56
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L29:
	pop	{r4, r5, r6, lr}
	b	goToInstructions
.L31:
	.align	2
.L30:
	.word	seed
	.word	isLevel2Active
	.word	hoff3
	.word	isLevel3Active
	.word	voff3
	.word	.LANCHOR0
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	stopSound
	.word	levelSong_length
	.word	levelSong_data
	.word	playSoundA
	.word	initGame
	.size	start, .-start
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #0
	push	{r4, lr}
	ldr	r3, .L44
	strh	r1, [r2, #10]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L44+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L33
	ldr	r2, .L44+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L42
.L33:
	tst	r3, #4
	beq	.L32
	ldr	r3, .L44+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L43
.L32:
	pop	{r4, lr}
	bx	lr
.L42:
	ldr	r2, .L44+12
	ldr	r3, .L44+16
	ldr	r0, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L44+20
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L44+24
	ldr	r3, .L44+28
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L44+32
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L43:
	pop	{r4, lr}
	b	goToStart
.L45:
	.align	2
.L44:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	seed
	.word	srand
	.word	levelSong_length
	.word	levelSong_data
	.word	playSoundA
	.word	initGame
	.size	instructions, .-instructions
	.align	2
	.global	goToLevelTwoStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLevelTwoStart, %function
goToLevelTwoStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #4352
	push	{r4, r5, r6, lr}
	mov	r5, #1
	ldr	ip, .L48
	ldr	r4, .L48+4
	strh	r2, [r3]	@ movhi
	mov	r0, #3
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L48+8
	str	r5, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L48+12
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L48+16
	ldr	r1, .L48+20
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L48+24
	ldr	r1, .L48+28
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L48+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L48+36
	mov	r2, r5
	ldr	r1, [r3]
	ldr	r0, .L48+40
	ldr	r3, .L48+44
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L48+48
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L49:
	.align	2
.L48:
	.word	isLevel2Active
	.word	DMANow
	.word	shadowOAM
	.word	levelTwoStartScreenPal
	.word	4368
	.word	levelTwoStartScreenTiles
	.word	100720640
	.word	levelTwoStartScreenMap
	.word	stopSound
	.word	ghostSound_length
	.word	ghostSound_data
	.word	playSoundA
	.word	state
	.size	goToLevelTwoStart, .-goToLevelTwoStart
	.align	2
	.global	goToLevelTwoGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLevelTwoGame, %function
goToLevelTwoGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	ip, #5632
	mov	r5, #67108864
	mov	r1, #0
	mov	lr, #1
	ldr	r3, .L52
	ldr	r2, .L52+4
	ldr	r0, .L52+8
	strh	ip, [r5]	@ movhi
	ldr	ip, .L52+12
	ldr	r4, .L52+16
	str	r1, [r3]
	str	r1, [r2]
	str	r1, [r0]
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L52+20
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L52+24
	mov	lr, pc
	bx	r4
	mov	r2, #23552
	mov	r0, #3
	strh	r2, [r5, #12]	@ movhi
	ldr	r3, .L52+28
	mov	r2, #100663296
	ldr	r1, .L52+32
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L52+36
	ldr	r1, .L52+40
	mov	lr, pc
	bx	r4
	ldr	r2, .L52+44
	mov	r3, #3472
	strh	r2, [r5, #10]	@ movhi
	mov	r0, #3
	ldr	r2, .L52+48
	ldr	r1, .L52+52
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L52+56
	mov	r0, #3
	ldr	r1, .L52+60
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L52+64
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L53:
	.align	2
.L52:
	.word	prevButton
	.word	theTracker
	.word	isLevel3Active
	.word	isLevel2Active
	.word	DMANow
	.word	shadowOAM
	.word	layerOnePal
	.word	5088
	.word	layerOneTiles
	.word	100720640
	.word	layerOneMap
	.word	6916
	.word	100679680
	.word	layerTwoTiles
	.word	100718592
	.word	layerTwoMap
	.word	state
	.size	goToLevelTwoGame, .-goToLevelTwoGame
	.align	2
	.global	levelTwoStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	levelTwoStart, %function
levelTwoStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #4352
	push	{r4, r5, r6, lr}
	mov	r5, #1
	ldr	r4, .L61
	strh	r2, [r3]	@ movhi
	ldr	r3, [r4]
	ldr	r1, .L61+4
	add	r3, r3, r5
	ldr	r2, .L61+8
	str	r3, [r4]
	str	r5, [r1]
	mov	lr, pc
	bx	r2
	ldr	r3, .L61+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L54
	ldr	r3, .L61+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L60
.L54:
	pop	{r4, r5, r6, lr}
	bx	lr
.L60:
	ldr	r0, [r4]
	ldr	r3, .L61+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L61+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L61+28
	mov	r2, r5
	ldr	r1, [r3]
	ldr	r0, .L61+32
	ldr	r3, .L61+36
	mov	lr, pc
	bx	r3
	bl	goToLevelTwoGame
	ldr	r3, .L61+40
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L62:
	.align	2
.L61:
	.word	seed
	.word	isLevel2Active
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	stopSound
	.word	levelSong_length
	.word	levelSong_data
	.word	playSoundA
	.word	initGame
	.size	levelTwoStart, .-levelTwoStart
	.align	2
	.global	goToLevelTwoWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLevelTwoWin, %function
goToLevelTwoWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #4352
	push	{r4, lr}
	ldr	r3, .L65
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L65+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L65+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L65+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L65+16
	mov	lr, pc
	bx	r4
	mov	r3, #4992
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L65+20
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L65+24
	ldr	r1, .L65+28
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L65+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L65+36
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L65+40
	ldr	r3, .L65+44
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L65+48
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L66:
	.align	2
.L65:
	.word	hideSprites
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	levelTwoWinPal
	.word	levelTwoWinTiles
	.word	100720640
	.word	levelTwoWinMap
	.word	stopSound
	.word	winSound_length
	.word	winSound_data
	.word	playSoundA
	.word	state
	.size	goToLevelTwoWin, .-goToLevelTwoWin
	.align	2
	.global	goToLevelThreeStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLevelThreeStart, %function
goToLevelThreeStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, #1
	ldr	ip, .L69
	ldr	r4, .L69+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L69+8
	str	r5, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L69+12
	mov	lr, pc
	bx	r4
	mov	r3, #3664
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L69+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L69+20
	ldr	r1, .L69+24
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L69+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+32
	mov	r2, r5
	ldr	r1, [r3]
	ldr	r0, .L69+36
	ldr	r3, .L69+40
	mov	lr, pc
	bx	r3
	mov	r2, #6
	ldr	r3, .L69+44
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L70:
	.align	2
.L69:
	.word	isLevel3Active
	.word	DMANow
	.word	shadowOAM
	.word	levelThreeStartScreenPal
	.word	levelThreeStartScreenTiles
	.word	100720640
	.word	levelThreeStartScreenMap
	.word	stopSound
	.word	ghostSound_length
	.word	ghostSound_data
	.word	playSoundA
	.word	state
	.size	goToLevelThreeStart, .-goToLevelThreeStart
	.align	2
	.global	levelTwoWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	levelTwoWin, %function
levelTwoWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L78
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L78+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L71
	ldr	r3, .L78+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L77
.L71:
	pop	{r4, lr}
	bx	lr
.L77:
	pop	{r4, lr}
	b	goToLevelThreeStart
.L79:
	.align	2
.L78:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	levelTwoWin, .-levelTwoWin
	.align	2
	.global	goToLevelThreeGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLevelThreeGame, %function
goToLevelThreeGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, #67108864
	mov	lr, #5632
	mov	ip, #1
	mov	r2, #0
	ldr	r3, .L82
	ldr	r1, .L82+4
	ldr	r0, .L82+8
	strh	lr, [r5]	@ movhi
	ldr	lr, .L82+12
	str	ip, [r0]
	ldr	r4, .L82+16
	str	r2, [r3]
	str	r2, [r1]
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L82+20
	str	ip, [lr]
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L82+24
	mov	lr, pc
	bx	r4
	mov	r2, #23552
	mov	r0, #3
	strh	r2, [r5, #12]	@ movhi
	ldr	r3, .L82+28
	mov	r2, #100663296
	ldr	r1, .L82+32
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L82+36
	ldr	r1, .L82+40
	mov	lr, pc
	bx	r4
	ldr	r2, .L82+44
	mov	r3, #3472
	strh	r2, [r5, #10]	@ movhi
	mov	r0, #3
	ldr	r2, .L82+48
	ldr	r1, .L82+52
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L82+56
	mov	r0, #3
	ldr	r1, .L82+60
	mov	lr, pc
	bx	r4
	mov	r2, #7
	ldr	r3, .L82+64
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L83:
	.align	2
.L82:
	.word	prevButton
	.word	theTracker
	.word	isLevel2Active
	.word	isLevel3Active
	.word	DMANow
	.word	shadowOAM
	.word	layerOnePal
	.word	5088
	.word	layerOneTiles
	.word	100720640
	.word	layerOneMap
	.word	6916
	.word	100679680
	.word	layerTwoTiles
	.word	100718592
	.word	layerTwoMap
	.word	state
	.size	goToLevelThreeGame, .-goToLevelThreeGame
	.align	2
	.global	levelThreeStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	levelThreeStart, %function
levelThreeStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, #1
	ldr	r4, .L91
	ldr	r3, [r4]
	ldr	r1, .L91+4
	add	r3, r3, r5
	ldr	r2, .L91+8
	str	r3, [r4]
	str	r5, [r1]
	mov	lr, pc
	bx	r2
	ldr	r3, .L91+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L84
	ldr	r3, .L91+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L90
.L84:
	pop	{r4, r5, r6, lr}
	bx	lr
.L90:
	ldr	r0, [r4]
	ldr	r3, .L91+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L91+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L91+28
	mov	r2, r5
	ldr	r1, [r3]
	ldr	r0, .L91+32
	ldr	r3, .L91+36
	mov	lr, pc
	bx	r3
	bl	goToLevelThreeGame
	ldr	r3, .L91+40
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L92:
	.align	2
.L91:
	.word	seed
	.word	isLevel3Active
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	stopSound
	.word	levelSong_length
	.word	levelSong_data
	.word	playSoundA
	.word	initGame
	.size	levelThreeStart, .-levelThreeStart
	.align	2
	.global	goToLevelThreeWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLevelThreeWin, %function
goToLevelThreeWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #4352
	push	{r4, lr}
	ldr	r3, .L95
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L95+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L95+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L95+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L95+16
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L95+20
	ldr	r1, .L95+24
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L95+28
	ldr	r1, .L95+32
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L95+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L95+40
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L95+44
	ldr	r3, .L95+48
	mov	lr, pc
	bx	r3
	mov	r2, #8
	ldr	r3, .L95+52
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L96:
	.align	2
.L95:
	.word	hideSprites
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	levelThreeWinPal
	.word	4464
	.word	levelThreeWinTiles
	.word	100720640
	.word	levelThreeWinMap
	.word	stopSound
	.word	finalWinSound_length
	.word	finalWinSound_data
	.word	playSoundA
	.word	state
	.size	goToLevelThreeWin, .-goToLevelThreeWin
	.align	2
	.global	levelThreeWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	levelThreeWin, %function
levelThreeWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L104
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L104+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L97
	ldr	r3, .L104+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L103
.L97:
	pop	{r4, lr}
	bx	lr
.L103:
	pop	{r4, lr}
	b	goToStart
.L105:
	.align	2
.L104:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	levelThreeWin, .-levelThreeWin
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #0
	mov	r2, #4352
	push	{r4, lr}
	strh	r2, [r3]	@ movhi
	strh	r1, [r3, #18]	@ movhi
	ldr	r2, .L108
	mov	lr, pc
	bx	r2
	ldr	r3, .L108+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L108+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L108+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L108+16
	mov	lr, pc
	bx	r4
	mov	r3, #3344
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L108+20
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L108+24
	mov	r0, #3
	ldr	r1, .L108+28
	mov	lr, pc
	bx	r4
	mov	r2, #9
	ldr	r3, .L108+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L109:
	.align	2
.L108:
	.word	hideSprites
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	pausePal
	.word	pauseTiles
	.word	100720640
	.word	pauseMap
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #4352
	push	{r4, lr}
	ldr	r3, .L125
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L125+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L111
	ldr	r2, .L125+8
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L111
	ldr	r3, .L125+12
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L122
	cmp	r3, #2
	beq	.L123
	cmp	r3, #3
	beq	.L124
.L110:
	pop	{r4, lr}
	bx	lr
.L111:
	tst	r3, #4
	beq	.L110
	ldr	r3, .L125+8
	ldrh	r3, [r3]
	tst	r3, #4
	bne	.L110
	pop	{r4, lr}
	b	goToStart
.L122:
	ldr	r3, .L125+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L124:
	ldr	r3, .L125+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToLevelThreeGame
.L123:
	ldr	r3, .L125+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToLevelTwoGame
.L126:
	.align	2
.L125:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	.LANCHOR0
	.word	unpauseSound
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #67108864
	mov	r5, #0
	mov	r2, #4352
	strh	r2, [r3]	@ movhi
	ldr	r2, .L129
	strh	r5, [r3, #18]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r3, .L129+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L129+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L129+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L129+16
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L129+20
	ldr	r1, .L129+24
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L129+28
	ldr	r1, .L129+32
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L129+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L129+40
	mov	r2, r5
	ldr	r1, [r3]
	ldr	r0, .L129+44
	ldr	r3, .L129+48
	mov	lr, pc
	bx	r3
	mov	r2, #10
	ldr	r3, .L129+52
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L130:
	.align	2
.L129:
	.word	hideSprites
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	winPal
	.word	4464
	.word	winTiles
	.word	100720640
	.word	winMap
	.word	stopSound
	.word	winSound_length
	.word	winSound_data
	.word	playSoundA
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #4352
	push	{r4, lr}
	ldr	r3, .L138
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L138+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L131
	ldr	r3, .L138+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L137
.L131:
	pop	{r4, lr}
	bx	lr
.L137:
	pop	{r4, lr}
	b	goToLevelTwoStart
.L139:
	.align	2
.L138:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #67108864
	mov	r1, #4352
	mov	r5, #0
	ldr	r2, .L142
	strh	r5, [r3, #18]	@ movhi
	strh	r1, [r3]	@ movhi
	mov	lr, pc
	bx	r2
	ldr	r3, .L142+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L142+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L142+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L142+16
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L142+20
	ldr	r1, .L142+24
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L142+28
	ldr	r1, .L142+32
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L142+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L142+40
	mov	r2, r5
	ldr	r1, [r3]
	ldr	r0, .L142+44
	ldr	r3, .L142+48
	mov	lr, pc
	bx	r3
	mov	r2, #11
	ldr	r3, .L142+52
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L143:
	.align	2
.L142:
	.word	hideSprites
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	losePal
	.word	4336
	.word	loseTiles
	.word	100720640
	.word	loseMap
	.word	stopSound
	.word	loseSound_length
	.word	loseSound_data
	.word	playSoundA
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #5632
	push	{r4, lr}
	ldr	r3, .L155
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L155+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L155+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L155+12
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L155+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L155+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L145
	ldr	r3, .L155+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L152
.L145:
	ldr	r3, .L155+28
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L153
	ldr	r3, .L155+32
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L154
	pop	{r4, lr}
	bx	lr
.L153:
	pop	{r4, lr}
	b	goToLose
.L152:
	ldr	r3, .L155+36
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToPause
.L154:
	pop	{r4, lr}
	b	goToWin
.L156:
	.align	2
.L155:
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.word	playerLives
	.word	oziLives
	.word	pauseSound
	.size	game, .-game
	.align	2
	.global	levelTwoGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	levelTwoGame, %function
levelTwoGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r0, #5632
	push	{r4, lr}
	mov	lr, #2
	mov	ip, #1
	mov	r1, #0
	ldr	r3, .L168
	strh	r0, [r2]	@ movhi
	ldr	r0, .L168+4
	ldr	r2, .L168+8
	str	lr, [r3]
	ldr	r3, .L168+12
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L168+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L168+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L168+24
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L168+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L168+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L158
	ldr	r3, .L168+36
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L165
.L158:
	ldr	r3, .L168+40
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L166
.L159:
	ldr	r3, .L168+44
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L167
.L157:
	pop	{r4, lr}
	bx	lr
.L167:
	ldr	r3, .L168+48
	ldr	r3, [r3]
	cmp	r3, #0
	bgt	.L157
	pop	{r4, lr}
	b	goToLevelTwoWin
.L166:
	bl	goToLose
	b	.L159
.L165:
	ldr	r3, .L168+52
	mov	lr, pc
	bx	r3
	bl	goToPause
	b	.L158
.L169:
	.align	2
.L168:
	.word	.LANCHOR0
	.word	isLevel2Active
	.word	isLevel3Active
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.word	playerLives
	.word	oziLives
	.word	secondOziLives
	.word	pauseSound
	.size	levelTwoGame, .-levelTwoGame
	.align	2
	.global	levelThreeGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	levelThreeGame, %function
levelThreeGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #5632
	push	{r4, lr}
	mov	r3, #1
	mov	r4, #3
	strh	r1, [r2]	@ movhi
	ldr	ip, .L181
	ldr	r0, .L181+4
	ldr	r1, .L181+8
	ldr	r2, .L181+12
	str	r3, [ip]
	str	r3, [r0]
	str	r4, [r1]
	mov	lr, pc
	bx	r2
	ldr	r3, .L181+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L181+20
	mov	lr, pc
	bx	r3
	mov	r0, r4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L181+24
	ldr	r4, .L181+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L181+32
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L171
	ldr	r3, .L181+36
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L178
.L171:
	ldr	r3, .L181+40
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L179
.L172:
	ldr	r3, .L181+44
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L180
	pop	{r4, lr}
	bx	lr
.L179:
	ldr	r3, .L181+48
	ldr	r3, [r3]
	cmp	r3, #0
	bgt	.L172
	pop	{r4, lr}
	b	goToLevelThreeWin
.L180:
	pop	{r4, lr}
	b	goToLose
.L178:
	ldr	r3, .L181+52
	mov	lr, pc
	bx	r3
	bl	goToPause
	b	.L171
.L182:
	.align	2
.L181:
	.word	isLevel2Active
	.word	isLevel3Active
	.word	.LANCHOR0
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	shadowOAM
	.word	DMANow
	.word	oldButtons
	.word	buttons
	.word	oziLives
	.word	playerLives
	.word	secondOziLives
	.word	pauseSound
	.size	levelThreeGame, .-levelThreeGame
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #4352
	push	{r4, lr}
	ldr	r3, .L190
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L190+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L183
	ldr	r3, .L190+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L189
.L183:
	pop	{r4, lr}
	bx	lr
.L189:
	pop	{r4, lr}
	b	goToStart
.L191:
	.align	2
.L190:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L211
	mov	lr, pc
	bx	r3
	ldr	r6, .L211+4
	ldr	r7, .L211+8
	ldr	r5, .L211+12
	ldr	fp, .L211+16
	ldr	r10, .L211+20
	ldr	r9, .L211+24
	ldr	r8, .L211+28
	ldr	r4, .L211+32
.L193:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L194:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #11
	ldrls	pc, [pc, r2, asl #2]
	b	.L194
.L196:
	.word	.L207
	.word	.L206
	.word	.L205
	.word	.L204
	.word	.L203
	.word	.L202
	.word	.L201
	.word	.L200
	.word	.L199
	.word	.L198
	.word	.L197
	.word	.L195
.L195:
	ldr	r3, .L211+36
	mov	lr, pc
	bx	r3
	b	.L193
.L197:
	ldr	r3, .L211+40
	mov	lr, pc
	bx	r3
	b	.L193
.L198:
	ldr	r3, .L211+44
	mov	lr, pc
	bx	r3
	b	.L193
.L199:
	ldr	r3, .L211+48
	mov	lr, pc
	bx	r3
	b	.L193
.L200:
	ldr	r3, .L211+52
	mov	lr, pc
	bx	r3
	b	.L193
.L201:
	ldr	r3, .L211+56
	mov	lr, pc
	bx	r3
	b	.L193
.L202:
	ldr	r3, .L211+60
	mov	lr, pc
	bx	r3
	b	.L193
.L203:
	ldr	r3, .L211+64
	mov	lr, pc
	bx	r3
	b	.L193
.L204:
	mov	lr, pc
	bx	r8
	b	.L193
.L205:
	mov	lr, pc
	bx	r9
	b	.L193
.L206:
	mov	lr, pc
	bx	r10
	b	.L193
.L207:
	mov	lr, pc
	bx	fp
	b	.L193
.L212:
	.align	2
.L211:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	instructions
	.word	game
	.word	levelTwoStart
	.word	67109120
	.word	lose
	.word	win
	.word	pause
	.word	levelThreeWin
	.word	levelThreeGame
	.word	levelThreeStart
	.word	levelTwoWin
	.word	levelTwoGame
	.size	main, .-main
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	seed,4,4
	.comm	state,4,4
	.global	pauseCounter
	.comm	voff3,4,4
	.comm	hoff3,2,2
	.comm	soundB,32,4
	.comm	soundA,32,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	pauseCounter, %object
	.size	pauseCounter, 4
pauseCounter:
	.word	1
	.ident	"GCC: (devkitARM release 53) 9.1.0"
