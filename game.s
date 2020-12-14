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
	.file	"game.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet.part.0, %function
updateBullet.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #20]
	cmp	r3, #0
	bne	.L2
	ldr	r3, [r0]
	ldr	r2, [r0, #8]
	add	r2, r3, r2
	cmp	r2, #0
	ble	.L3
	ldr	r1, [r0, #4]
	cmp	r1, #239
	cmple	r3, #159
	movle	r3, #1
	movgt	r3, #0
	ldr	r2, [r0, #12]
	add	r2, r1, r2
	cmp	r2, #0
	movle	r3, #0
	andgt	r3, r3, #1
	cmp	r3, #0
	bne	.L20
.L3:
	mov	r3, #0
	str	r3, [r0, #16]
	bx	lr
.L2:
	cmp	r3, #1
	beq	.L21
	cmp	r3, #2
	beq	.L22
	cmp	r3, #3
	bxne	lr
	ldr	r2, [r0]
	ldr	r3, [r0, #8]
	add	r3, r2, r3
	cmp	r3, #0
	ble	.L3
	ldr	r3, [r0, #4]
	cmp	r2, #159
	cmple	r3, #239
	movle	r1, #1
	movgt	r1, #0
	ldr	ip, [r0, #12]
	add	r3, r3, ip
	cmp	r3, #0
	movle	r3, #0
	andgt	r3, r1, #1
	cmp	r3, #0
	beq	.L3
	add	r2, r2, #2
	str	r2, [r0]
	bx	lr
.L21:
	ldr	r3, [r0]
	ldr	r2, [r0, #8]
	add	r2, r3, r2
	cmp	r2, #0
	ble	.L3
	ldr	r1, [r0, #4]
	cmp	r1, #239
	cmple	r3, #159
	movle	r3, #1
	movgt	r3, #0
	ldr	r2, [r0, #12]
	add	r2, r1, r2
	cmp	r2, #0
	movle	r3, #0
	andgt	r3, r3, #1
	cmp	r3, #0
	beq	.L3
	add	r1, r1, #2
	str	r1, [r0, #4]
	bx	lr
.L22:
	ldr	r2, [r0]
	ldr	r3, [r0, #8]
	add	r3, r2, r3, lsl #1
	cmp	r3, #0
	ble	.L3
	ldr	r3, [r0, #4]
	cmp	r2, #159
	cmple	r3, #239
	movle	r1, #1
	movgt	r1, #0
	ldr	ip, [r0, #12]
	add	r3, r3, ip
	cmp	r3, #0
	movle	r3, #0
	andgt	r3, r1, #1
	cmp	r3, #0
	beq	.L3
	sub	r2, r2, #2
	str	r2, [r0]
	bx	lr
.L20:
	sub	r1, r1, #2
	str	r1, [r0, #4]
	bx	lr
	.size	updateBullet.part.0, .-updateBullet.part.0
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #16
	push	{r4, r5, r6, lr}
	ldr	r4, .L25
	ldr	r5, .L25+4
	str	r3, [r4, #12]
	str	r3, [r4, #8]
	mov	lr, pc
	bx	r5
	ldr	r2, .L25+8
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #6
	add	r3, r3, r3, lsl #1
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #1
	add	r0, r0, #50
	str	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	mov	lr, #2
	mov	r2, #0
	mov	ip, #3
	ldr	r3, .L25+12
	smull	r5, r1, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r1, asr #5
	add	r3, r3, r3, lsl lr
	sub	r0, r0, r3, lsl #4
	add	r0, r0, #20
	str	r0, [r4]
	str	lr, [r4, #28]
	str	ip, [r4, #40]
	str	r2, [r4, #36]
	str	r2, [r4, #44]
	str	r2, [r4, #48]
	str	r2, [r4, #52]
	pop	{r4, r5, r6, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	player
	.word	rand
	.word	-1240768329
	.word	1717986919
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r10, #1
	ldr	r2, .L42
	ldr	r8, [r2]
	ldr	r4, [r2, #8]
	ldr	r7, [r2, #4]
	ldr	r6, [r2, #12]
	add	fp, r4, r4, lsr #31
	ldr	r3, .L42+4
	sub	r5, r8, #2
	add	lr, r6, r6, lsr #31
	add	r5, r5, fp, asr r10
	sub	fp, r7, #2
	add	lr, fp, lr, asr r10
	mov	r0, #3
	mov	ip, #7
	mov	r9, #2
	mov	r1, #0
	ldr	r2, [r2, #28]
	add	r4, r4, r8
	add	r6, r6, r7
	add	fp, r3, #280
	b	.L34
.L41:
	cmp	r2, #1
	bne	.L38
	stm	r3, {r8, lr}
	str	ip, [r3, #8]
	str	r0, [r3, #12]
	str	r9, [r3, #20]
.L29:
	str	r1, [r3, #16]
	str	r1, [r3, #24]
	add	r3, r3, #28
	cmp	r3, fp
	beq	.L39
.L34:
	cmp	r2, #3
	beq	.L40
	cmp	r2, #2
	bne	.L41
	stm	r3, {r5, r6}
	str	r0, [r3, #8]
	str	ip, [r3, #12]
	str	r10, [r3, #20]
	b	.L29
.L38:
	cmp	r2, #0
	stmeq	r3, {r4, lr}
	streq	ip, [r3, #8]
	streq	r0, [r3, #12]
	streq	r0, [r3, #20]
	b	.L29
.L40:
	stm	r3, {r5, r7}
	str	r2, [r3, #8]
	str	ip, [r3, #12]
	str	r1, [r3, #20]
	b	.L29
.L39:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L43:
	.align	2
.L42:
	.word	player
	.word	bullets
	.size	initBullets, .-initBullets
	.align	2
	.global	fireBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L64
	mov	r3, #0
	mov	r2, r0
	b	.L53
.L45:
	add	r3, r3, #1
	cmp	r3, #10
	add	r2, r2, #28
	bxeq	lr
.L53:
	ldr	r1, [r2, #16]
	cmp	r1, #0
	bne	.L45
	ldr	r2, .L64+4
	ldr	ip, [r2, #28]
	cmp	ip, #3
	push	{r4, r5, r6, lr}
	beq	.L61
	cmp	ip, #2
	bne	.L62
	mov	lr, #1
	mov	r5, #3
	mov	r4, #7
	ldr	r1, [r2, #8]
	add	r1, r1, r1, lsr #31
	ldr	ip, [r2]
	asr	r1, r1, lr
	sub	r1, r1, #2
	add	r1, r1, ip
	rsb	ip, r3, r3, lsl r5
	str	r1, [r0, ip, lsl #2]
	ldr	r1, [r2, #4]
	ldr	r2, [r2, #12]
	add	r1, r1, r2
	sub	r1, r1, #4
	add	r2, r0, ip, lsl #2
	stmib	r2, {r1, r5}
	str	r4, [r2, #12]
	str	lr, [r2, #20]
	lsl	r2, r3, r5
.L47:
	mov	r1, #1
	sub	r3, r2, r3
	add	r0, r0, r3, lsl #2
	str	r1, [r0, #16]
	pop	{r4, r5, r6, lr}
	bx	lr
.L62:
	cmp	ip, #1
	bne	.L63
	mov	lr, #3
	mov	ip, #2
	mov	r4, #7
	ldr	r1, [r2, #12]
	add	r1, r1, r1, lsr #31
	ldr	r6, [r2, #4]
	asr	r1, r1, #1
	ldr	r5, [r2]
	sub	r1, r1, #2
	add	r2, r1, r6
	rsb	r1, r3, r3, lsl lr
	str	r5, [r0, r1, lsl #2]
	add	r1, r0, r1, lsl ip
	stmib	r1, {r2, r4, lr}
	str	ip, [r1, #20]
	lsl	r2, r3, lr
	b	.L47
.L63:
	cmp	ip, #0
	lslne	r2, r3, #3
	bne	.L47
	mov	lr, #3
	mov	r4, #7
	ldr	r1, [r2, #12]
	add	r1, r1, r1, lsr #31
	ldr	ip, [r2, #4]
	asr	r1, r1, #1
	sub	r1, r1, #2
	add	r1, r1, ip
	ldr	ip, [r2]
	ldr	r2, [r2, #8]
	rsb	r5, r3, r3, lsl lr
	add	r2, ip, r2
	sub	r2, r2, #2
	add	ip, r0, r5, lsl #2
	str	r2, [r0, r5, lsl #2]
	stmib	ip, {r1, r4}
	str	lr, [ip, #12]
	str	lr, [ip, #20]
	lsl	r2, r3, lr
	b	.L47
.L61:
	mov	r4, #7
	ldr	lr, [r2, #8]
	add	lr, lr, lr, lsr #31
	ldr	r6, [r2]
	asr	lr, lr, #1
	sub	lr, lr, #2
	ldr	r5, [r2, #4]
	add	r2, lr, r6
	rsb	lr, r3, r3, lsl #3
	str	r2, [r0, lr, lsl #2]
	add	r2, r0, lr, lsl #2
	stmib	r2, {r5, ip}
	str	r1, [r2, #20]
	str	r4, [r2, #12]
	lsl	r2, r3, #3
	b	.L47
.L65:
	.align	2
.L64:
	.word	bullets
	.word	player
	.size	fireBullet, .-fireBullet
	.align	2
	.global	updateBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bxeq	lr
	b	updateBullet.part.0
	.size	updateBullet, .-updateBullet
	.align	2
	.global	drawBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L83
	push	{r4, r5, r6, r7, lr}
	ldr	r2, .L83+4
	mov	r7, #288
	mov	r6, #256
	mov	r5, #224
	mov	r4, #192
	ldr	ip, .L83+8
	add	r0, r3, #280
	b	.L73
.L80:
	ldr	r1, [r3, #4]
	ldrb	lr, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	strh	r4, [r2, #12]	@ movhi
	strh	r1, [r2, #10]	@ movhi
	strh	lr, [r2, #8]	@ movhi
.L69:
	add	r3, r3, #28
	cmp	r3, r0
	add	r2, r2, #8
	beq	.L79
.L73:
	ldr	r1, [r3, #16]
	cmp	r1, #0
	beq	.L69
	ldr	r1, [r3, #20]
	cmp	r1, #0
	beq	.L80
	cmp	r1, #1
	beq	.L81
	cmp	r1, #2
	beq	.L82
	cmp	r1, #3
	bne	.L69
	ldr	r1, [r3, #4]
	ldrb	lr, [r3]	@ zero_extendqisi2
	add	r3, r3, #28
	and	r1, r1, ip
	cmp	r3, r0
	strh	r7, [r2, #12]	@ movhi
	strh	r1, [r2, #10]	@ movhi
	strh	lr, [r2, #8]	@ movhi
	add	r2, r2, #8
	bne	.L73
.L79:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L81:
	ldr	r1, [r3, #4]
	ldrb	lr, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	strh	r5, [r2, #12]	@ movhi
	strh	r1, [r2, #10]	@ movhi
	strh	lr, [r2, #8]	@ movhi
	b	.L69
.L82:
	ldr	r1, [r3, #4]
	ldrb	lr, [r3]	@ zero_extendqisi2
	and	r1, r1, ip
	strh	r6, [r2, #12]	@ movhi
	strh	r1, [r2, #10]	@ movhi
	strh	lr, [r2, #8]	@ movhi
	b	.L69
.L84:
	.align	2
.L83:
	.word	bullets
	.word	shadowOAM
	.word	511
	.size	drawBullet, .-drawBullet
	.align	2
	.global	initOzi
	.syntax unified
	.arm
	.fpu softvfp
	.type	initOzi, %function
initOzi:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #26
	ldr	r3, .L88
	ldr	ip, [r3]
	ldr	r3, .L88+4
	cmp	ip, #0
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	mov	r0, #100
	mov	r1, #210
	movne	r2, #3
	moveq	r2, #2
	stm	r3, {r0, r1}
	str	r2, [r3, #8]
	bx	lr
.L89:
	.align	2
.L88:
	.word	isLevel3Active
	.word	ozi
	.size	initOzi, .-initOzi
	.align	2
	.global	updateOzi
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateOzi, %function
updateOzi:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L92
	ldr	r3, [r2]
	sub	r1, r3, #2
	cmp	r1, #131
	ldr	r1, [r2, #8]
	rsbhi	r1, r1, #0
	add	r3, r3, r1
	strhi	r1, [r2, #8]
	str	r3, [r2]
	bx	lr
.L93:
	.align	2
.L92:
	.word	ozi
	.size	updateOzi, .-updateOzi
	.align	2
	.global	drawOzi
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawOzi, %function
drawOzi:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L104
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L95
	ldr	r1, .L104+4
	ldr	r3, [r1, #4]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r2, .L104+8
	ldr	r0, .L104+12
	ldr	r2, [r2]
	ldr	ip, .L104+16
	mla	r2, ip, r2, r0
	ldr	ip, .L104+20
	str	lr, [sp, #-4]!
	ldrb	lr, [r1]	@ zero_extendqisi2
	ldr	r1, .L104+24
	cmp	r0, r2, ror #1
	ldr	r2, [ip]
	strh	r3, [r1, #90]	@ movhi
	ldr	r3, .L104+28
	addcs	r2, r2, #1
	smull	r0, r3, r2, r3
	sub	r3, r3, r2, asr #31
	add	r3, r3, r3, lsl #1
	strh	lr, [r1, #88]	@ movhi
	strcs	r2, [ip]
	cmp	r2, r3
	moveq	r3, #384
	strheq	r3, [r1, #92]	@ movhi
	beq	.L94
	tst	r2, #1
	moveq	r3, #388
	movne	r3, #392
	strh	r3, [r1, #92]	@ movhi
.L94:
	ldr	lr, [sp], #4
	bx	lr
.L95:
	mov	r2, #512
	ldr	r3, .L104+24
	strh	r2, [r3, #88]	@ movhi
	bx	lr
.L105:
	.align	2
.L104:
	.word	oziLives
	.word	ozi
	.word	counter
	.word	85899344
	.word	-1030792151
	.word	ourVar
	.word	shadowOAM
	.word	1431655766
	.size	drawOzi, .-drawOzi
	.align	2
	.global	initSmallAliens
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSmallAliens, %function
initSmallAliens:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r1, #12
	mvn	r7, #1
	mov	ip, #0
	mov	r9, #2
	mov	r6, #16
	ldr	r4, .L114
	ldr	r2, .L114+4
	ldr	r10, .L114+8
	ldr	r0, [r4]
	ldr	lr, [r2]
	ldr	r3, .L114+12
	ldr	r8, [r2, #4]
	ldr	r2, .L114+16
	ldr	r5, [r4, #4]
	add	r0, r0, #8
	ldr	r4, [r10]
	add	lr, lr, #8
	add	r10, r3, #72
.L108:
	cmp	r4, #0
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	str	ip, [r3, #20]
	stm	r3, {r0, r5, r7}
	add	r3, r3, #24
	stmibne	r2, {r8, r9}
	strne	lr, [r2]
	strne	r6, [r2, #12]
	strne	r6, [r2, #16]
	strne	ip, [r2, #20]
	cmp	r3, r10
	add	r2, r2, #24
	bne	.L108
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L115:
	.align	2
.L114:
	.word	ozi
	.word	leftOzi
	.word	isLevel2Active
	.word	smallalien
	.word	secondHalf
	.size	initSmallAliens, .-initSmallAliens
	.align	2
	.global	updateSmallAliens
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSmallAliens, %function
updateSmallAliens:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, [r0, #4]
	add	r2, r1, #15
	cmp	r2, #254
	bhi	.L119
	ldr	r3, [r0, #20]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, [r0]
	ldr	ip, [r0, #12]
	add	r3, r3, ip
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	cmp	r2, #253
	movhi	r3, #0
	cmp	r3, #0
	bne	.L126
.L119:
	mov	r3, #0
	str	r3, [r0, #20]
	bx	lr
.L126:
	ldr	r3, [r0, #8]
	add	r1, r3, r1
	str	r1, [r0, #4]
	bx	lr
	.size	updateSmallAliens, .-updateSmallAliens
	.align	2
	.global	fireSmallAliens
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireSmallAliens, %function
fireSmallAliens:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L139
	ldr	r4, .L139+4
	mov	r1, r5
	mov	r0, r4
	mov	r2, #0
	ldr	ip, .L139+8
	ldr	r3, .L139+12
	ldr	ip, [ip]
	smull	r6, lr, r3, ip
	asr	r3, ip, #31
	rsb	r3, r3, lr, asr #4
	ldr	lr, .L139+16
	add	r3, r3, r3, lsl #2
	ldr	lr, [lr]
	sub	r3, ip, r3, lsl #3
.L131:
	ldr	ip, [r1, #20]
	orrs	ip, r3, ip
	beq	.L137
	cmp	lr, #0
	beq	.L130
	ldr	ip, [r0, #20]
	orrs	ip, r3, ip
	beq	.L138
.L130:
	add	r2, r2, #1
	cmp	r2, #3
	add	r1, r1, #24
	add	r0, r0, #24
	bne	.L131
.L127:
	pop	{r4, r5, r6, lr}
	bx	lr
.L137:
	mov	r0, #1
	ldr	r1, .L139+20
	ldr	r3, [r1]
	ldr	ip, [r1, #4]
	add	r2, r2, r2, lsl r0
	add	r1, r5, r2, lsl #3
	add	r3, r3, #8
	str	r3, [r5, r2, lsl #3]
	str	ip, [r1, #4]
	str	r0, [r1, #20]
	b	.L127
.L138:
	mov	r0, #1
	ldr	r1, .L139+24
	ldr	r3, [r1]
	ldr	ip, [r1, #4]
	add	r2, r2, r2, lsl r0
	add	r1, r4, r2, lsl #3
	add	r3, r3, #8
	str	r3, [r4, r2, lsl #3]
	str	ip, [r1, #4]
	str	r0, [r1, #20]
	b	.L127
.L140:
	.align	2
.L139:
	.word	smallalien
	.word	secondHalf
	.word	counter
	.word	1717986919
	.word	isLevel2Active
	.word	ozi
	.word	leftOzi
	.size	fireSmallAliens, .-fireSmallAliens
	.align	2
	.global	drawSmallAliens
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSmallAliens, %function
drawSmallAliens:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r5, #512
	mov	r8, #672
	ldr	r1, .L158
	ldr	r2, .L158+4
	ldr	r0, .L158+8
	ldr	r3, .L158+12
	ldr	lr, [r1]
	ldr	r6, [r2]
	ldr	r4, [r0]
	ldr	r1, .L158+16
	ldr	r2, .L158+20
	ldr	r7, .L158+24
	add	ip, r3, #24
.L146:
	cmp	r4, #0
	strhle	r5, [r3, #96]	@ movhi
	ble	.L143
	ldr	r0, [r2, #20]
	cmp	r0, #0
	beq	.L143
	ldr	r0, [r2, #4]
	ldrb	r9, [r2]	@ zero_extendqisi2
	and	r0, r0, r7
	orr	r0, r0, #16384
	strh	r8, [r3, #100]	@ movhi
	strh	r0, [r3, #98]	@ movhi
	strh	r9, [r3, #96]	@ movhi
.L143:
	cmp	lr, #0
	beq	.L144
	cmp	r6, #0
	strhle	r5, [r3, #128]	@ movhi
	ble	.L144
	ldr	r0, [r1, #20]
	cmp	r0, #0
	beq	.L144
	ldr	r0, [r1, #4]
	ldrb	r9, [r1]	@ zero_extendqisi2
	and	r0, r0, r7
	orr	r0, r0, #16384
	strh	r8, [r3, #132]	@ movhi
	strh	r0, [r3, #130]	@ movhi
	strh	r9, [r3, #128]	@ movhi
.L144:
	add	r3, r3, #8
	cmp	r3, ip
	add	r1, r1, #24
	add	r2, r2, #24
	bne	.L146
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L159:
	.align	2
.L158:
	.word	isLevel2Active
	.word	secondOziLives
	.word	oziLives
	.word	shadowOAM
	.word	secondHalf
	.word	smallalien
	.word	511
	.size	drawSmallAliens, .-drawSmallAliens
	.align	2
	.global	initPlayerLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayerLives, %function
initPlayerLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #16
	mov	r1, #1
	mov	lr, #2
	mov	ip, #22
	mov	r0, #42
	ldr	r3, .L162
	str	lr, [r3, #4]
	str	ip, [r3, #20]
	str	r0, [r3, #36]
	str	r1, [r3]
	str	r1, [r3, #16]
	str	r1, [r3, #32]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #40]
	str	r2, [r3, #44]
	ldr	lr, [sp], #4
	bx	lr
.L163:
	.align	2
.L162:
	.word	playerLife
	.size	initPlayerLives, .-initPlayerLives
	.align	2
	.global	drawPlayerLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayerLives, %function
drawPlayerLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #49152
	ldr	r3, .L171
	push	{r4, lr}
	ldr	lr, [r3]
	ldr	r0, .L171+4
	ldr	r2, .L171+8
	ldr	r3, .L171+12
	cmp	lr, #0
	strh	r1, [r0, #154]	@ movhi
	strh	r2, [r0, #152]	@ movhi
	strh	r3, [r0, #156]	@ movhi
	ble	.L165
	mov	r3, r0
	ldr	r2, .L171+16
	add	r4, r0, lr, lsl #3
.L166:
	ldr	r1, [r2, #4]
	ldr	ip, [r2]
	orr	r1, r1, #16384
	strh	r1, [r3, #162]	@ movhi
	strh	ip, [r3, #160]	@ movhi
	add	r3, r3, #8
	cmp	r3, r4
	add	r2, r2, #16
	bne	.L166
	cmp	lr, #3
	beq	.L170
.L165:
	mov	r3, #20
	cmp	lr, #1
	strh	r3, [r0, #180]	@ movhi
	strheq	r3, [r0, #172]	@ movhi
	pop	{r4, lr}
	bx	lr
.L170:
	mov	r3, #576
	pop	{r4, lr}
	strh	r3, [r0, #164]	@ movhi
	strh	r3, [r0, #172]	@ movhi
	strh	r3, [r0, #180]	@ movhi
	bx	lr
.L172:
	.align	2
.L171:
	.word	playerLives
	.word	shadowOAM
	.word	16385
	.word	715
	.word	playerLife
	.size	drawPlayerLives, .-drawPlayerLives
	.align	2
	.global	initOziLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	initOziLives, %function
initOziLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #16
	mov	r1, #143
	mov	lr, #145
	mov	ip, #165
	mov	r0, #185
	ldr	r3, .L175
	str	lr, [r3, #4]
	str	ip, [r3, #20]
	str	r0, [r3, #36]
	str	r1, [r3]
	str	r1, [r3, #16]
	str	r1, [r3, #32]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #40]
	str	r2, [r3, #44]
	ldr	lr, [sp], #4
	bx	lr
.L176:
	.align	2
.L175:
	.word	oziLife
	.size	initOziLives, .-initOziLives
	.align	2
	.global	drawOziLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawOziLives, %function
drawOziLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L189
	ldr	r2, [r3]
	ldr	ip, .L189+4
	ldr	r3, .L189+8
	ldr	r0, .L189+12
	ldr	r1, .L189+16
	cmp	r2, #3
	push	{r4, lr}
	strh	ip, [r3, #192]	@ movhi
	strh	r0, [r3, #194]	@ movhi
	strh	r1, [r3, #196]	@ movhi
	beq	.L186
	cmp	r2, #2
	beq	.L187
	cmp	r2, #1
	beq	.L188
	cmp	r2, #0
	movle	r2, #512
	pop	{r4, lr}
	strhle	r2, [r3, #200]	@ movhi
	strhle	r2, [r3, #208]	@ movhi
	strhle	r2, [r3, #216]	@ movhi
	bx	lr
.L187:
	mov	ip, #512
	ldr	r0, .L189+20
	ldr	lr, .L189+24
	ldr	r1, [r0, #4]
	ldr	r2, [r0, #20]
	and	r1, r1, lr
	and	r2, r2, lr
	ldrb	lr, [r0]	@ zero_extendqisi2
	ldrb	r0, [r0, #16]	@ zero_extendqisi2
	orr	r1, r1, #16384
	orr	r2, r2, #16384
	strh	lr, [r3, #200]	@ movhi
	strh	r1, [r3, #202]	@ movhi
	strh	r2, [r3, #210]	@ movhi
	strh	r0, [r3, #208]	@ movhi
	strh	ip, [r3, #204]	@ movhi
	strh	ip, [r3, #212]	@ movhi
	strh	ip, [r3, #216]	@ movhi
	pop	{r4, lr}
	bx	lr
.L186:
	mov	r4, #512
	ldr	r1, .L189+20
	ldr	lr, .L189+24
	add	ip, r3, #24
.L179:
	ldr	r2, [r1, #4]
	ldrb	r0, [r1]	@ zero_extendqisi2
	and	r2, r2, lr
	orr	r2, r2, #16384
	strh	r4, [r3, #204]	@ movhi
	strh	r2, [r3, #202]	@ movhi
	strh	r0, [r3, #200]	@ movhi
	add	r3, r3, #8
	cmp	ip, r3
	add	r1, r1, #16
	bne	.L179
	pop	{r4, lr}
	bx	lr
.L188:
	mov	r1, #512
	ldr	r0, .L189+20
	ldr	r2, [r0, #4]
	lsl	r2, r2, #23
	ldrb	r0, [r0]	@ zero_extendqisi2
	lsr	r2, r2, #23
	orr	r2, r2, #16384
	strh	r2, [r3, #202]	@ movhi
	strh	r0, [r3, #200]	@ movhi
	strh	r1, [r3, #204]	@ movhi
	strh	r1, [r3, #208]	@ movhi
	strh	r1, [r3, #216]	@ movhi
	pop	{r4, lr}
	bx	lr
.L190:
	.align	2
.L189:
	.word	oziLives
	.word	16527
	.word	shadowOAM
	.word	-16241
	.word	715
	.word	oziLife
	.word	511
	.size	drawOziLives, .-drawOziLives
	.align	2
	.global	initSecondOziLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSecondOziLives, %function
initSecondOziLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #16
	mov	r1, #143
	mov	lr, #50
	mov	ip, #70
	mov	r0, #90
	ldr	r3, .L193
	str	lr, [r3, #4]
	str	ip, [r3, #20]
	str	r0, [r3, #36]
	str	r1, [r3]
	str	r1, [r3, #16]
	str	r1, [r3, #32]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #40]
	str	r2, [r3, #44]
	ldr	lr, [sp], #4
	bx	lr
.L194:
	.align	2
.L193:
	.word	secondVersion
	.size	initSecondOziLives, .-initSecondOziLives
	.align	2
	.global	drawSecondOziLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSecondOziLives, %function
drawSecondOziLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L207
	ldr	r2, [r3]
	ldr	ip, .L207+4
	ldr	r3, .L207+8
	ldr	r0, .L207+12
	ldr	r1, .L207+16
	cmp	r2, #3
	push	{r4, lr}
	strh	ip, [r3, #224]	@ movhi
	strh	r0, [r3, #226]	@ movhi
	strh	r1, [r3, #228]	@ movhi
	beq	.L204
	cmp	r2, #2
	beq	.L205
	cmp	r2, #1
	beq	.L206
	cmp	r2, #0
	movle	r2, #512
	pop	{r4, lr}
	strhle	r2, [r3, #232]	@ movhi
	strhle	r2, [r3, #240]	@ movhi
	strhle	r2, [r3, #248]	@ movhi
	bx	lr
.L205:
	mov	ip, #512
	ldr	r0, .L207+20
	ldr	lr, .L207+24
	ldr	r1, [r0, #4]
	ldr	r2, [r0, #20]
	and	r1, r1, lr
	and	r2, r2, lr
	ldrb	lr, [r0]	@ zero_extendqisi2
	ldrb	r0, [r0, #16]	@ zero_extendqisi2
	orr	r1, r1, #16384
	orr	r2, r2, #16384
	strh	lr, [r3, #232]	@ movhi
	strh	r1, [r3, #234]	@ movhi
	strh	r2, [r3, #242]	@ movhi
	strh	r0, [r3, #240]	@ movhi
	strh	ip, [r3, #236]	@ movhi
	strh	ip, [r3, #244]	@ movhi
	strh	ip, [r3, #248]	@ movhi
	pop	{r4, lr}
	bx	lr
.L204:
	mov	r4, #512
	ldr	r1, .L207+20
	ldr	lr, .L207+24
	add	ip, r3, #24
.L197:
	ldr	r2, [r1, #4]
	ldrb	r0, [r1]	@ zero_extendqisi2
	and	r2, r2, lr
	orr	r2, r2, #16384
	strh	r4, [r3, #236]	@ movhi
	strh	r2, [r3, #234]	@ movhi
	strh	r0, [r3, #232]	@ movhi
	add	r3, r3, #8
	cmp	ip, r3
	add	r1, r1, #16
	bne	.L197
	pop	{r4, lr}
	bx	lr
.L206:
	mov	r1, #512
	ldr	r0, .L207+20
	ldr	r2, [r0, #4]
	lsl	r2, r2, #23
	ldrb	r0, [r0]	@ zero_extendqisi2
	lsr	r2, r2, #23
	orr	r2, r2, #16384
	strh	r2, [r3, #234]	@ movhi
	strh	r0, [r3, #232]	@ movhi
	strh	r1, [r3, #236]	@ movhi
	strh	r1, [r3, #240]	@ movhi
	strh	r1, [r3, #248]	@ movhi
	pop	{r4, lr}
	bx	lr
.L208:
	.align	2
.L207:
	.word	secondOziLives
	.word	16527
	.word	shadowOAM
	.word	-16336
	.word	715
	.word	secondVersion
	.word	511
	.size	drawSecondOziLives, .-drawSecondOziLives
	.align	2
	.global	playerCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	playerCollision, %function
playerCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L227
	ldr	r5, .L227+4
	ldr	r9, .L227+8
	ldr	r8, .L227+12
	ldr	r6, .L227+16
	ldr	r10, .L227+20
	ldr	fp, .L227+24
	sub	sp, sp, #20
	add	r7, r4, #72
.L216:
	ldr	r3, [r9]
	cmp	r3, #0
	bgt	.L225
.L211:
	ldr	r3, [r8]
	cmp	r3, #0
	ldr	r2, .L227+28
	add	r4, r4, #24
	beq	.L214
	ldr	r3, [r2]
	cmp	r3, #0
	bgt	.L226
.L214:
	cmp	r4, r7
	add	r5, r5, #24
	bne	.L216
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L225:
	add	r0, r4, #12
	ldm	r0, {r0, r1}
	ldm	r4, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r2, [r6, #12]
	ldr	r3, [r6, #8]
	ldr	r1, [r6]
	ldr	r0, [r6, #4]
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	beq	.L211
	ldr	r3, .L227+32
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L227+36
	ldr	r3, .L227+40
	mov	lr, pc
	bx	r3
	mvn	r2, #19
	ldr	r3, [fp]
	sub	r3, r3, #1
	str	r3, [fp]
	str	r2, [r4, #4]
	b	.L211
.L226:
	add	r0, r5, #12
	ldm	r0, {r0, r1}
	ldm	r5, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r2, [r6, #12]
	ldr	r3, [r6, #8]
	ldr	r1, [r6]
	ldr	r0, [r6, #4]
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	beq	.L214
	ldr	r3, .L227+32
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L227+36
	ldr	r3, .L227+40
	mov	lr, pc
	bx	r3
	mvn	r2, #19
	ldr	r3, [fp]
	sub	r3, r3, #1
	str	r3, [fp]
	str	r2, [r5, #4]
	b	.L214
.L228:
	.align	2
.L227:
	.word	smallalien
	.word	secondHalf
	.word	oziLives
	.word	isLevel2Active
	.word	player
	.word	collision
	.word	playerLives
	.word	secondOziLives
	.word	crashSound_length
	.word	crashSound_data
	.word	playSoundB
	.size	playerCollision, .-playerCollision
	.align	2
	.global	oziCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	oziCollision, %function
oziCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	ldm	r4, {r2, r3}
	ldr	r1, [r4, #12]
	ldr	ip, [r4, #8]
	sub	sp, sp, #16
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r0, .L248
	ldr	r5, .L248+4
	ldr	r3, [r0, #12]
	ldr	r2, [r0, #16]
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L245
	ldr	r3, .L248+8
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L246
.L229:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L245:
	ldr	r3, .L248+12
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L248+16
	ldr	r3, .L248+20
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L247
	cmp	r3, #1
	ldreq	r2, .L248+24
	ldreq	r3, [r2]
	subeq	r3, r3, #3
	streq	r3, [r2]
.L232:
	mvn	r3, #29
	str	r3, [r4, #4]
	ldr	r3, .L248+8
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L229
.L246:
	add	r6, r4, #8
	ldm	r6, {r6, ip}
	ldr	r0, .L248+28
	ldr	lr, [r4]
	ldr	r3, [r0, #12]
	ldr	r2, [r0, #16]
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	str	r6, [sp, #12]
	str	ip, [sp, #8]
	ldr	ip, [r4, #4]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L229
	ldr	r3, .L248+12
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L248+16
	ldr	r3, .L248+20
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bne	.L236
	ldr	r2, .L248+32
	ldr	r3, [r2]
	sub	r3, r3, #1
	str	r3, [r2]
.L237:
	mvn	r3, #29
	str	r3, [r4, #4]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L247:
	ldr	r2, .L248+24
	ldr	r3, [r2]
	sub	r3, r3, #1
	str	r3, [r2]
	b	.L232
.L236:
	cmp	r3, #1
	ldreq	r2, .L248+32
	ldreq	r3, [r2]
	subeq	r3, r3, #3
	streq	r3, [r2]
	b	.L237
.L249:
	.align	2
.L248:
	.word	ozi
	.word	collision
	.word	isLevel2Active
	.word	fireball_length
	.word	fireball_data
	.word	playSoundB
	.word	oziLives
	.word	leftOzi
	.word	secondOziLives
	.size	oziCollision, .-oziCollision
	.align	2
	.global	bulletAndSmallAlienCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	bulletAndSmallAlienCollision, %function
bulletAndSmallAlienCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mvn	fp, #59
	mov	r5, r0
	ldr	r4, .L266
	ldr	r6, .L266+4
	ldr	r8, .L266+8
	ldr	r10, .L266+12
	ldr	r9, .L266+16
	sub	sp, sp, #20
	add	r7, r4, #72
.L256:
	ldr	r3, [r5, #16]
	cmp	r3, #0
	beq	.L252
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bne	.L265
.L252:
	add	r4, r4, #24
	cmp	r4, r7
	add	r6, r6, #24
	bne	.L256
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L265:
	add	r0, r4, #12
	ldm	r0, {r0, r1}
	ldm	r4, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r3, [r5, #8]
	ldr	r2, [r5, #12]
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	bne	.L254
	ldr	r0, [r5, #4]
.L255:
	ldm	r6, {r2, r3}
	ldr	r1, [r6, #16]
	ldr	ip, [r6, #12]
	str	r1, [sp, #8]
	str	ip, [sp, #12]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r3, [r5, #8]
	ldr	r2, [r5, #12]
	ldr	r1, [r5]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L252
	ldr	r3, .L266+20
	mov	r2, #0
	mov	r0, r9
	ldr	r1, [r10]
	mov	lr, pc
	bx	r3
	mvn	r3, #39
	str	fp, [r5, #4]
	str	r3, [r6, #4]
	b	.L252
.L254:
	mov	r0, r9
	ldr	r3, .L266+20
	mov	r2, #0
	ldr	r1, [r10]
	mov	lr, pc
	bx	r3
	mvn	r3, #39
	str	fp, [r5, #4]
	mvn	r0, #59
	str	r3, [r4, #4]
	b	.L255
.L267:
	.align	2
.L266:
	.word	smallalien
	.word	secondHalf
	.word	collision
	.word	fireball_length
	.word	fireball_data
	.word	playSoundB
	.size	bulletAndSmallAlienCollision, .-bulletAndSmallAlienCollision
	.align	2
	.global	initSecondOzi
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSecondOzi, %function
initSecondOzi:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #26
	ldr	r3, .L271
	ldr	ip, [r3]
	ldr	r3, .L271+4
	cmp	ip, #0
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	mov	r0, #30
	mov	r1, #5
	movne	r2, #3
	moveq	r2, #2
	stm	r3, {r0, r1}
	str	r2, [r3, #8]
	bx	lr
.L272:
	.align	2
.L271:
	.word	isLevel3Active
	.word	leftOzi
	.size	initSecondOzi, .-initSecondOzi
	.align	2
	.global	updateSecondOzi
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSecondOzi, %function
updateSecondOzi:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L275
	ldr	r3, [r2]
	sub	r1, r3, #19
	cmp	r1, #114
	ldr	r1, [r2, #8]
	rsbhi	r1, r1, #0
	add	r3, r3, r1
	strhi	r1, [r2, #8]
	str	r3, [r2]
	bx	lr
.L276:
	.align	2
.L275:
	.word	leftOzi
	.size	updateSecondOzi, .-updateSecondOzi
	.align	2
	.global	drawSecondOzi
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSecondOzi, %function
drawSecondOzi:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L288
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L278
	ldr	r1, .L288+4
	ldr	r3, [r1, #4]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r2, .L288+8
	ldr	ip, .L288+12
	ldr	r2, [r2]
	ldr	r0, .L288+16
	mla	r2, ip, r2, r0
	ldr	ip, .L288+20
	str	lr, [sp, #-4]!
	ldrb	lr, [r1]	@ zero_extendqisi2
	ldr	r1, .L288+24
	cmp	r0, r2, ror #1
	ldr	r2, [ip]
	strh	r3, [r1, #2]	@ movhi
	ldr	r3, .L288+28
	addcs	r2, r2, #1
	strh	lr, [r1]	@ movhi
	smull	r1, r3, r2, r3
	sub	r3, r3, r2, asr #31
	add	r3, r3, r3, lsl #1
	strcs	r2, [ip]
	cmp	r2, r3
	beq	.L287
	tst	r2, #1
	moveq	r2, #392
	movne	r2, #384
	ldr	r3, .L288+32
	ldr	lr, [sp], #4
	strh	r2, [r3]	@ movhi
	bx	lr
.L287:
	mov	r2, #388
	ldr	r3, .L288+32
	ldr	lr, [sp], #4
	strh	r2, [r3]	@ movhi
	bx	lr
.L278:
	mov	r2, #512
	ldr	r3, .L288+24
	strh	r2, [r3]	@ movhi
	bx	lr
.L289:
	.align	2
.L288:
	.word	secondOziLives
	.word	leftOzi
	.word	counter
	.word	-1030792151
	.word	85899344
	.word	secondOurVar
	.word	shadowOAM+256
	.word	1431655766
	.word	shadowOAM+260
	.size	drawSecondOzi, .-drawSecondOzi
	.align	2
	.global	initStars
	.syntax unified
	.arm
	.fpu softvfp
	.type	initStars, %function
initStars:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r8, .L301
	ldr	r3, [r8]
	cmp	r3, #0
	ble	.L290
	mov	r6, #0
	ldr	r4, .L301+4
	ldr	r10, .L301+8
	ldr	r7, .L301+12
	ldr	r9, .L301+16
	ldr	fp, .L301+20
	b	.L296
.L300:
	mov	lr, pc
	bx	r7
	smull	r3, r1, r9, r0
	asr	r2, r0, #31
	rsb	r2, r2, r1, asr #4
	add	r2, r2, r2, lsl #2
	rsb	r2, r2, r2, lsl #4
	sub	r0, r0, r2, lsl #1
	sub	r5, r5, r0
	sub	r5, r5, #10
	str	r5, [r4, #4]
.L293:
	ldr	r5, [r10]
	ldr	r2, [r10, #8]
	cmp	r5, #80
	add	r5, r5, r2
	add	r5, r5, #2
	ble	.L294
	mov	lr, pc
	bx	r7
	ldr	r1, .L301+24
	smull	r3, r1, r0, r1
	asr	r2, r0, #31
	add	r1, r1, r0
	rsb	r2, r2, r1, asr #6
	add	r2, r2, r2, lsl #1
	rsb	r2, r2, r2, lsl #4
	sub	r2, r0, r2, lsl #1
	sub	r5, r5, r2
	str	r5, [r4]
.L295:
	mov	r1, #1
	mov	r2, #8
	ldr	r0, [r8]
	add	r6, r6, r1
	cmp	r0, r6
	str	r2, [r4, #8]
	str	r2, [r4, #12]
	str	r1, [r4, #16]
	add	r4, r4, #20
	ble	.L290
.L296:
	ldr	r5, [r10, #4]
	ldr	r2, [r10, #12]
	cmp	r5, #120
	add	r5, r5, r2
	add	r5, r5, #2
	bgt	.L300
	mov	lr, pc
	bx	r7
	smull	r3, r1, r9, r0
	asr	r2, r0, #31
	rsb	r2, r2, r1, asr #4
	add	r2, r2, r2, lsl #2
	rsb	r2, r2, r2, lsl #4
	sub	r2, r0, r2, lsl #1
	add	r5, r2, r5
	str	r5, [r4, #4]
	b	.L293
.L294:
	mov	lr, pc
	bx	r7
	smull	r3, r1, fp, r0
	asr	r2, r0, #31
	rsb	r2, r2, r1, asr #5
	add	r2, r2, r2, lsl #2
	sub	r0, r0, r2, lsl #4
	add	r5, r0, r5
	str	r5, [r4]
	b	.L295
.L290:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L302:
	.align	2
.L301:
	.word	numberOfStars
	.word	stars
	.word	player
	.word	rand
	.word	458129845
	.word	1717986919
	.word	-1240768329
	.size	initStars, .-initStars
	.align	2
	.global	drawStars
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawStars, %function
drawStars:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L311
	ldr	ip, [r3]
	cmp	ip, #0
	bxle	lr
	push	{r4, lr}
	mov	r4, #896
	ldr	r3, .L311+4
	ldr	r2, .L311+8
	ldr	lr, .L311+12
	add	ip, r3, ip, lsl #3
.L305:
	ldr	r1, [r2, #4]
	ldrb	r0, [r2]	@ zero_extendqisi2
	and	r1, r1, lr
	strh	r4, [r3, #4]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, ip
	add	r2, r2, #20
	bne	.L305
	pop	{r4, lr}
	bx	lr
.L312:
	.align	2
.L311:
	.word	numberOfStars
	.word	shadowOAM+272
	.word	stars
	.word	511
	.size	drawStars, .-drawStars
	.align	2
	.global	starAndPlayerCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	starAndPlayerCollision, %function
starAndPlayerCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r7, .L322
	ldr	r3, [r7]
	cmp	r3, #0
	sub	sp, sp, #20
	ble	.L313
	mov	r6, #0
	mvn	fp, #29
	ldr	r4, .L322+4
	ldr	r5, .L322+8
	ldr	r8, .L322+12
	ldr	r10, .L322+16
	ldr	r9, .L322+20
	b	.L316
.L315:
	ldr	r3, [r7]
	cmp	r3, r6
	add	r4, r4, #20
	ble	.L313
.L316:
	add	r0, r4, #8
	ldm	r0, {r0, r1}
	ldm	r4, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r2, [r5, #12]
	ldr	r3, [r5, #8]
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	add	r6, r6, #1
	beq	.L315
	ldr	r3, .L322+24
	mov	r2, #0
	ldr	r1, [r3]
	mov	r0, r10
	ldr	r3, .L322+28
	mov	lr, pc
	bx	r3
	ldr	r3, [r9]
	sub	r3, r3, #1
	str	r3, [r9]
	ldr	r3, [r7]
	cmp	r3, r6
	str	fp, [r4]
	add	r4, r4, #20
	bgt	.L316
.L313:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L323:
	.align	2
.L322:
	.word	numberOfStars
	.word	stars
	.word	player
	.word	collision
	.word	bump_data
	.word	playerLives
	.word	bump_length
	.word	playSoundB
	.size	starAndPlayerCollision, .-starAndPlayerCollision
	.align	2
	.global	starAndBulletCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	starAndBulletCollision, %function
starAndBulletCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r7, .L333
	ldr	r3, [r7]
	cmp	r3, #0
	sub	sp, sp, #20
	ble	.L324
	mov	r5, r0
	mov	r6, #0
	ldr	r4, .L333+4
	ldr	r8, .L333+8
	ldr	fp, .L333+12
	ldr	r10, .L333+16
	ldr	r9, .L333+20
	b	.L327
.L326:
	ldr	r3, [r7]
	cmp	r3, r6
	add	r4, r4, #20
	ble	.L324
.L327:
	add	r0, r4, #8
	ldm	r0, {r0, r1}
	ldm	r4, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r3, [r5, #8]
	ldr	r2, [r5, #12]
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	add	r6, r6, #1
	beq	.L326
	mov	r2, #0
	mov	r0, r10
	ldr	r1, [fp]
	mov	lr, pc
	bx	r9
	mvn	r3, #29
	str	r3, [r4]
	str	r3, [r5, #4]
	ldr	r3, [r7]
	cmp	r3, r6
	add	r4, r4, #20
	bgt	.L327
.L324:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L334:
	.align	2
.L333:
	.word	numberOfStars
	.word	stars
	.word	collision
	.word	fireball_length
	.word	fireball_data
	.word	playSoundB
	.size	starAndBulletCollision, .-starAndBulletCollision
	.align	2
	.global	initMegaBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initMegaBullets, %function
initMegaBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	lr, #1
	mov	r0, #6
	mov	r1, #14
	mov	ip, #0
	ldr	r2, .L348
	ldr	r9, [r2]
	ldr	r4, [r2, #8]
	ldr	r8, [r2, #4]
	ldr	r6, [r2, #12]
	ldr	r3, .L348+4
	add	fp, r4, r4, lsr #31
	sub	r10, r8, #4
	add	r5, r6, r6, lsr #31
	sub	r7, r9, #4
	ldr	r2, [r2, #28]
	add	r5, r10, r5, asr lr
	add	r7, r7, fp, asr lr
	add	r4, r4, r9
	add	r6, r6, r8
	add	r10, r3, #140
.L342:
	cmp	r2, #3
	beq	.L346
	cmp	r2, #2
	beq	.L338
	cmp	r2, #1
	bne	.L347
	mov	fp, #2
	str	r9, [r3]
	str	r5, [r3, #4]
	str	r1, [r3, #8]
	str	r0, [r3, #12]
	str	fp, [r3, #20]
.L337:
	str	ip, [r3, #16]
	str	lr, [r3, #24]
	add	r3, r3, #28
	cmp	r3, r10
	bne	.L342
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L347:
	cmp	r2, #0
	bne	.L337
	mov	fp, #3
	stm	r3, {r4, r5}
	str	r1, [r3, #8]
	str	r0, [r3, #12]
	str	fp, [r3, #20]
	b	.L337
.L338:
	str	r7, [r3]
	str	r6, [r3, #4]
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	str	lr, [r3, #20]
	b	.L337
.L346:
	stm	r3, {r7, r8}
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	str	ip, [r3, #20]
	b	.L337
.L349:
	.align	2
.L348:
	.word	player
	.word	megabullets
	.size	initMegaBullets, .-initMegaBullets
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mov	r2, #3
	push	{r4, r5, r6, r7, r8, lr}
	mov	lr, #30
	ldr	r6, .L363
	ldr	ip, [r6]
	ldr	r0, .L363+4
	cmp	ip, r3
	ldr	r1, .L363+8
	ldr	ip, .L363+12
	str	r3, [r0]
	str	r3, [r1]
	str	r3, [ip]
	ldr	r0, .L363+16
	ldrne	r3, .L363+20
	ldr	r1, .L363+24
	ldr	ip, .L363+28
	strne	r2, [r3]
	str	r2, [r0]
	str	r2, [r1]
	ldr	r4, .L363+32
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L363+36
	ldr	r1, .L363+40
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L363+44
	ldr	r2, .L363+48
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L363+52
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r2, #4352
	strh	r2, [r3]	@ movhi
	bl	initPlayer
	bl	initBullets
	bl	initOzi
	bl	initSmallAliens
	mov	r3, #1
	mov	r4, #16
	mov	r5, #143
	mov	lr, #42
	mov	ip, #145
	mov	r0, #165
	mov	r1, #185
	mov	r8, #2
	mov	r7, #22
	ldr	r2, .L363+56
	str	r3, [r2]
	str	r3, [r2, #16]
	str	r3, [r2, #32]
	ldr	r3, .L363+60
	str	r8, [r2, #4]
	str	r4, [r3, #8]
	str	r4, [r3, #12]
	str	r4, [r3, #24]
	str	r4, [r3, #28]
	str	r4, [r3, #40]
	str	r4, [r3, #44]
	str	ip, [r3, #4]
	str	r0, [r3, #20]
	str	r1, [r3, #36]
	str	r5, [r3]
	str	r5, [r3, #16]
	str	r5, [r3, #32]
	str	r7, [r2, #20]
	str	lr, [r2, #36]
	str	r4, [r2, #8]
	str	r4, [r2, #12]
	str	r4, [r2, #24]
	str	r4, [r2, #28]
	str	r4, [r2, #40]
	str	r4, [r2, #44]
	bl	initMegaBullets
	ldr	r3, [r6]
	cmp	r3, #0
	bne	.L361
	ldr	r3, .L363+64
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L362
.L350:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L361:
	bl	initSecondOzi
	mov	r0, #50
	mov	r1, #70
	mov	r2, #90
	ldr	r3, .L363+68
	str	r5, [r3]
	str	r0, [r3, #4]
	str	r4, [r3, #8]
	str	r4, [r3, #12]
	str	r5, [r3, #16]
	str	r4, [r3, #24]
	str	r4, [r3, #28]
	str	r5, [r3, #32]
	str	r4, [r3, #40]
	str	r4, [r3, #44]
	str	r1, [r3, #20]
	str	r2, [r3, #36]
	ldr	r3, .L363+64
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L350
.L362:
	pop	{r4, r5, r6, r7, r8, lr}
	b	initStars
.L364:
	.align	2
.L363:
	.word	isLevel2Active
	.word	ourVar
	.word	secondOurVar
	.word	counter
	.word	playerLives
	.word	secondOziLives
	.word	oziLives
	.word	numberOfStars
	.word	DMANow
	.word	83886592
	.word	spritesheetPal
	.word	spritesheetTiles
	.word	100728832
	.word	hideSprites
	.word	playerLife
	.word	oziLife
	.word	isLevel3Active
	.word	secondVersion
	.size	initGame, .-initGame
	.align	2
	.global	fireMegaBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireMegaBullet, %function
fireMegaBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L386
	mov	r2, r0
	ldr	r1, [r2, #16]
	cmp	r1, #0
	mov	r3, #0
	beq	.L383
.L366:
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #28
	bxeq	lr
	ldr	r1, [r2, #16]
	cmp	r1, #0
	bne	.L366
.L383:
	ldr	r2, .L386+4
	ldr	ip, [r2, #28]
	cmp	ip, #3
	push	{r4, r5, r6, lr}
	beq	.L384
	cmp	ip, #2
	beq	.L369
	cmp	ip, #1
	bne	.L385
	mov	ip, #2
	mov	r4, #14
	mov	lr, #6
	ldr	r1, [r2, #12]
	add	r1, r1, r1, lsr #31
	ldr	r6, [r2, #4]
	asr	r1, r1, #1
	ldr	r5, [r2]
	sub	r1, r1, #4
	add	r2, r1, r6
	rsb	r1, r3, r3, lsl #3
	str	r5, [r0, r1, lsl #2]
	add	r1, r0, r1, lsl ip
	stmib	r1, {r2, r4, lr}
	str	ip, [r1, #20]
.L382:
	lsl	r2, r3, #3
.L368:
	mov	r1, #1
	sub	r3, r2, r3
	add	r0, r0, r3, lsl #2
	str	r1, [r0, #16]
	pop	{r4, r5, r6, lr}
	bx	lr
.L384:
	mov	r4, #6
	mov	lr, #14
	ldr	ip, [r2, #8]
	add	ip, ip, ip, lsr #31
	ldr	r6, [r2]
	asr	ip, ip, #1
	sub	ip, ip, #4
	ldr	r5, [r2, #4]
	add	r2, ip, r6
	rsb	ip, r3, r3, lsl #3
	str	r2, [r0, ip, lsl #2]
	add	r2, r0, ip, lsl #2
	str	r5, [r2, #4]
	str	r1, [r2, #20]
	str	r4, [r2, #8]
	str	lr, [r2, #12]
	lsl	r2, r3, #3
	b	.L368
.L385:
	cmp	ip, #0
	bne	.L382
	mov	ip, #3
	mov	r4, #14
	mov	lr, #6
	ldr	r1, [r2, #12]
	add	r1, r1, r1, lsr #31
	ldr	r5, [r2, #4]
	asr	r1, r1, #1
	rsb	r6, r3, r3, lsl ip
	sub	r1, r1, #6
	add	r1, r1, r5
	add	r5, r0, r6, lsl #2
	str	r1, [r5, #4]
	ldr	r1, [r2]
	ldr	r2, [r2, #8]
	add	r2, r1, r2
	sub	r2, r2, #2
	str	r2, [r0, r6, lsl #2]
	str	r4, [r5, #8]
	str	lr, [r5, #12]
	str	ip, [r5, #20]
	lsl	r2, r3, ip
	b	.L368
.L369:
	mov	lr, #1
	mov	r5, #6
	mov	r4, #14
	ldr	r1, [r2, #8]
	add	r1, r1, r1, lsr #31
	ldr	ip, [r2]
	asr	r1, r1, lr
	sub	r1, r1, #4
	add	r1, r1, ip
	rsb	ip, r3, r3, lsl #3
	str	r1, [r0, ip, lsl #2]
	ldr	r1, [r2, #4]
	ldr	r2, [r2, #12]
	add	r1, r1, r2
	sub	r1, r1, #4
	add	r2, r0, ip, lsl #2
	stmib	r2, {r1, r5}
	str	r4, [r2, #12]
	str	lr, [r2, #20]
	lsl	r2, r3, #3
	b	.L368
.L387:
	.align	2
.L386:
	.word	megabullets
	.word	player
	.size	fireMegaBullet, .-fireMegaBullet
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	lr, .L454
	ldr	r3, [lr]
	cmp	r3, #0
	moveq	r3, #4
	ldr	r4, .L454+4
	ldr	ip, [r4]
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #52]
	ldr	r2, [r4, #48]
	ldr	r5, [r4, #28]
	add	r0, ip, r0
	add	r2, r1, r2
	stm	r4, {r0, r2}
	str	r5, [r4, #32]
	streq	r3, [r4, #28]
	beq	.L390
	ldr	ip, .L454+8
	ldr	r3, [ip]
	cmp	r3, #1
	beq	.L446
	cmp	r3, #2
	beq	.L447
	cmp	r3, #3
	beq	.L448
	cmp	r3, #4
	beq	.L449
.L390:
	ldr	r1, [r4, #24]
	ldr	r3, .L454+12
	smull	r6, ip, r3, r1
	asr	r3, r1, #31
	rsb	r3, r3, ip, asr #2
	add	r3, r3, r3, lsl #2
	subs	r3, r1, r3, lsl #1
	bne	.L394
	add	r6, r4, #36
	ldm	r6, {r6, ip}
	sub	ip, ip, #1
	cmp	r6, ip
	addlt	r6, r6, #1
	strlt	r6, [r4, #36]
	strge	r3, [r4, #36]
.L394:
	ldr	r3, .L454+16
	ldrh	r3, [r3, #48]
	ands	r3, r3, #64
	bne	.L396
	mov	r6, #1
	mvn	r7, #0
	ldr	ip, .L454+8
	str	r3, [r4, #48]
	str	r6, [r4, #28]
	str	r6, [lr]
	str	r6, [r4, #44]
	str	r6, [ip]
	str	r7, [r4, #52]
.L396:
	ldr	r3, .L454+16
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	bne	.L397
	mov	r7, #1
	mov	r6, #2
	ldr	ip, .L454+8
	str	r3, [r4, #28]
	str	r3, [r4, #48]
	str	r7, [lr]
	str	r7, [r4, #52]
	str	r6, [r4, #44]
	str	r6, [ip]
.L397:
	ldr	ip, .L454+16
	ldrh	r3, [ip, #48]
	ands	r3, r3, #32
	bne	.L398
	mov	r5, #3
	mov	r7, #1
	mvn	r6, #0
	ldrh	ip, [ip, #48]
	tst	ip, #16
	ldr	ip, .L454+8
	str	r7, [lr]
	str	r3, [r4, #52]
	str	r5, [r4, #28]
	str	r5, [r4, #44]
	str	r5, [ip]
	str	r6, [r4, #48]
	bne	.L400
.L401:
	mov	r5, #1
	mov	r3, #4
	mov	r7, #2
	mov	r6, #0
	str	r7, [r4, #28]
	str	r5, [lr]
	str	r5, [r4, #48]
	str	r3, [ip]
	str	r3, [r4, #44]
	str	r6, [r4, #52]
.L400:
	add	r1, r1, #1
	str	r1, [r4, #24]
.L402:
	ldr	r3, .L454+20
	ldr	r1, .L454+24
	cmp	r0, #15
	ldr	r3, [r3]
	ldr	r1, [r1]
	ble	.L450
	cmp	r3, #0
	bne	.L406
	cmp	r0, #128
	ble	.L408
	sub	ip, r2, #133
	cmp	ip, #69
	bls	.L451
.L409:
	cmp	r0, #144
	movgt	r0, #144
	strgt	r0, [r4]
.L408:
	cmp	r1, #0
	ble	.L417
.L410:
	cmp	r2, #194
	movgt	r2, #194
	strgt	r2, [r4, #4]
	ble	.L414
	cmp	r3, #0
	beq	.L422
.L453:
	ldr	r2, [r4, #4]
.L432:
	ldr	r3, .L454+28
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L421
	cmp	r2, #29
	movle	r3, #30
	strle	r3, [r4, #4]
.L422:
	ldr	r5, .L454+32
	ldrh	r2, [r5]
	tst	r2, #1
	ldr	r3, [r4, #16]
	beq	.L444
	ldr	r1, .L454+36
	ldrh	r1, [r1]
	tst	r1, #1
	beq	.L426
.L444:
	add	r3, r3, #1
.L425:
	tst	r2, #2
	str	r3, [r4, #16]
	ldr	r3, [r4, #20]
	beq	.L445
	ldr	r2, .L454+36
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L430
.L445:
	add	r1, r3, #1
.L429:
	ldr	r3, [r4, #4]
	ldr	r0, [r4, #36]
	ldr	r2, [r4, #28]
	lsl	r3, r3, #23
	ldrb	ip, [r4]	@ zero_extendqisi2
	add	r2, r2, r0, lsl #5
	lsr	r3, r3, #23
	ldr	r0, .L454+40
	orr	r3, r3, #16384
	lsl	r2, r2, #1
	str	r1, [r4, #20]
	strh	r3, [r0, #2]	@ movhi
	strh	ip, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L450:
	cmp	r2, #56
	movle	r0, #16
	strle	r0, [r4]
	ble	.L405
	cmp	r0, #0
	movlt	r0, #0
	strlt	r0, [r4]
.L405:
	cmp	r3, #0
	beq	.L408
	ldr	r0, [r4]
.L406:
	cmp	r0, #128
	ble	.L408
	sub	ip, r2, #136
	cmp	ip, #63
	bls	.L452
	sub	ip, r2, #41
	cmp	ip, #63
	movls	r1, #128
	strls	r1, [r4]
	bhi	.L409
.L414:
	cmp	r3, #0
	bne	.L432
.L421:
	cmp	r2, #0
	movlt	r3, #0
	strlt	r3, [r4, #4]
	b	.L422
.L398:
	ldrh	r3, [ip, #48]
	tst	r3, #16
	ldreq	ip, .L454+8
	beq	.L401
	ldr	r3, [r4, #28]
	cmp	r3, #4
	bne	.L400
	mov	r3, #0
	str	r5, [r4, #28]
	str	r3, [r4, #36]
	b	.L402
.L417:
	cmp	r2, #224
	ble	.L414
	mov	r2, #224
	cmp	r3, #0
	str	r2, [r4, #4]
	bne	.L453
	b	.L422
.L430:
	cmp	r3, #39
	ble	.L445
	bl	fireMegaBullet
	mov	r1, #1
	b	.L429
.L426:
	cmp	r3, #14
	ble	.L444
	bl	fireBullet
	mov	r3, #1
	ldrh	r2, [r5]
	b	.L425
.L446:
	ldr	ip, .L454+44
	ldr	r1, [ip]
	sub	r1, r1, #1
	str	r3, [r4, #28]
	str	r1, [ip]
	b	.L390
.L448:
	ldr	ip, .L454+48
	ldrh	r1, [ip]
	sub	r1, r1, #1
	str	r3, [r4, #28]
	strh	r1, [ip]	@ movhi
	b	.L390
.L452:
	mov	r0, #128
	cmp	r1, #0
	str	r0, [r4]
	ble	.L414
	b	.L410
.L451:
	mov	r0, #128
	cmp	r1, #0
	str	r0, [r4]
	bgt	.L410
	b	.L422
.L447:
	mov	ip, #0
	ldr	r1, .L454+44
	ldr	r3, [r1]
	add	r3, r3, #1
	str	r3, [r1]
	str	ip, [r4, #28]
	b	.L390
.L449:
	mov	ip, #2
	ldr	r1, .L454+48
	ldrh	r3, [r1]
	add	r3, r3, #1
	strh	r3, [r1]	@ movhi
	str	ip, [r4, #28]
	b	.L390
.L455:
	.align	2
.L454:
	.word	theTracker
	.word	player
	.word	prevButton
	.word	1717986919
	.word	67109120
	.word	isLevel2Active
	.word	oziLives
	.word	secondOziLives
	.word	oldButtons
	.word	buttons
	.word	shadowOAM
	.word	voff3
	.word	hoff3
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L487
	ldr	r3, [r2]
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r6, .L487+4
	add	r3, r3, #1
	str	r3, [r2]
	mov	r4, r6
	bl	updatePlayer
	add	r5, r6, #280
.L458:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	movne	r0, r4
	blne	updateBullet.part.0
.L457:
	add	r4, r4, #28
	cmp	r5, r4
	bne	.L458
	ldr	r0, .L487+8
	add	r4, r0, #140
.L460:
	ldr	r3, [r0, #16]
	cmp	r3, #0
	blne	updateBullet.part.0
.L459:
	add	r0, r0, #28
	cmp	r4, r0
	bne	.L460
	ldr	r2, .L487+12
	ldr	r3, [r2]
	sub	r1, r3, #2
	cmp	r1, #131
	ldr	r1, [r2, #8]
	rsbhi	r1, r1, #0
	add	r3, r3, r1
	strhi	r1, [r2, #8]
	str	r3, [r2]
	bl	fireSmallAliens
	ldr	r0, .L487+16
	bl	updateSmallAliens
	ldr	r7, .L487+20
	ldr	r0, .L487+24
	bl	updateSmallAliens
	ldr	r0, .L487+28
	bl	updateSmallAliens
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L462
	ldr	r0, .L487+32
	bl	updateSmallAliens
	ldr	r0, .L487+36
	bl	updateSmallAliens
	ldr	r0, .L487+40
	bl	updateSmallAliens
.L462:
	bl	playerCollision
	ldr	r4, .L487+4
.L463:
	mov	r0, r4
	add	r4, r4, #28
	bl	oziCollision
	cmp	r5, r4
	bne	.L463
	ldr	r0, .L487+8
	bl	oziCollision
	ldr	r0, .L487+44
	bl	oziCollision
	ldr	r0, .L487+48
	bl	oziCollision
	ldr	r0, .L487+52
	bl	oziCollision
	ldr	r0, .L487+56
	bl	oziCollision
	ldr	r4, .L487+4
.L464:
	mov	r0, r4
	add	r4, r4, #28
	bl	bulletAndSmallAlienCollision
	cmp	r5, r4
	bne	.L464
	ldr	r0, .L487+8
	bl	bulletAndSmallAlienCollision
	ldr	r0, .L487+44
	bl	bulletAndSmallAlienCollision
	ldr	r0, .L487+48
	bl	bulletAndSmallAlienCollision
	ldr	r0, .L487+52
	bl	bulletAndSmallAlienCollision
	ldr	r0, .L487+56
	bl	bulletAndSmallAlienCollision
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L465
	ldr	r2, .L487+60
	ldr	r3, [r2]
	sub	r1, r3, #19
	cmp	r1, #114
	ldr	r1, [r2, #8]
	rsbhi	r1, r1, #0
	add	r3, r3, r1
	strhi	r1, [r2, #8]
	str	r3, [r2]
.L465:
	ldr	r3, .L487+64
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L468
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L468:
	mov	r0, r6
	add	r6, r6, #28
	bl	starAndBulletCollision
	cmp	r5, r6
	bne	.L468
	ldr	r0, .L487+8
	bl	starAndBulletCollision
	ldr	r0, .L487+44
	bl	starAndBulletCollision
	ldr	r0, .L487+48
	bl	starAndBulletCollision
	ldr	r0, .L487+52
	bl	starAndBulletCollision
	ldr	r0, .L487+56
	bl	starAndBulletCollision
	pop	{r4, r5, r6, r7, r8, lr}
	b	starAndPlayerCollision
.L488:
	.align	2
.L487:
	.word	counter
	.word	bullets
	.word	megabullets
	.word	ozi
	.word	smallalien
	.word	isLevel2Active
	.word	smallalien+24
	.word	smallalien+48
	.word	secondHalf
	.word	secondHalf+24
	.word	secondHalf+48
	.word	megabullets+28
	.word	megabullets+56
	.word	megabullets+84
	.word	megabullets+112
	.word	leftOzi
	.word	isLevel3Active
	.size	updateGame, .-updateGame
	.align	2
	.global	drawMegaBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawMegaBullets, %function
drawMegaBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r8, #832
	mov	r7, #768
	mov	r6, #640
	mov	r4, #736
	ldr	r3, .L502
	ldr	r2, .L502+4
	ldr	r5, .L502+8
	ldr	lr, .L502+12
	add	r0, r3, #140
.L494:
	ldr	r1, [r3, #16]
	cmp	r1, #0
	beq	.L490
	ldr	r1, [r3, #20]
	cmp	r1, #0
	bne	.L491
	ldrb	ip, [r3]	@ zero_extendqisi2
	ldr	r1, [r3, #4]
	orr	ip, ip, #16384
	and	r1, r1, lr
	strh	r4, [r2, #4]	@ movhi
	strh	ip, [r2]	@ movhi
	strh	r1, [r2, #2]	@ movhi
.L490:
	add	r3, r3, #28
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L494
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L491:
	cmp	r1, #1
	beq	.L500
	cmp	r1, #2
	beq	.L501
	cmp	r1, #3
	bne	.L490
	ldrb	ip, [r3]	@ zero_extendqisi2
	ldr	r1, [r3, #4]
	orr	ip, ip, r5
	and	r1, r1, lr
	strh	r8, [r2, #4]	@ movhi
	strh	ip, [r2]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	b	.L490
.L500:
	ldrb	ip, [r3]	@ zero_extendqisi2
	ldr	r1, [r3, #4]
	orr	ip, ip, #16384
	and	r1, r1, lr
	strh	r6, [r2, #4]	@ movhi
	strh	ip, [r2]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	b	.L490
.L501:
	ldrb	ip, [r3]	@ zero_extendqisi2
	ldr	r1, [r3, #4]
	orr	ip, ip, r5
	and	r1, r1, lr
	strh	r7, [r2, #4]	@ movhi
	strh	ip, [r2]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	b	.L490
.L503:
	.align	2
.L502:
	.word	megabullets
	.word	shadowOAM+800
	.word	-32768
	.word	511
	.size	drawMegaBullets, .-drawMegaBullets
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	drawBullet
	bl	drawOzi
	bl	drawSmallAliens
	bl	drawPlayerLives
	bl	drawOziLives
	bl	drawMegaBullets
	ldr	r3, .L517
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L516
.L505:
	ldr	r3, .L517+4
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L506
	ldr	r3, .L517+8
	ldr	ip, [r3]
	cmp	ip, #0
	ble	.L506
	mov	r4, #896
	ldr	r3, .L517+12
	ldr	r2, .L517+16
	ldr	lr, .L517+20
	add	ip, r3, ip, lsl #3
.L507:
	ldr	r1, [r2, #4]
	ldrb	r0, [r2]	@ zero_extendqisi2
	and	r1, r1, lr
	strh	r4, [r3, #4]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, ip
	add	r2, r2, #20
	bne	.L507
.L506:
	mov	r1, #67108864
	ldr	r3, .L517+24
	ldrh	r2, [r3]
	strh	r2, [r1, #20]	@ movhi
	ldrh	r3, [r3]
	lsr	r3, r3, #2
	strh	r3, [r1, #24]	@ movhi
	ldr	r3, .L517+28
	ldr	r2, [r3]
	cmp	r2, #0
	add	r3, r2, #3
	movge	r3, r2
	asr	r3, r3, #2
	lsl	r2, r2, #16
	lsl	r3, r3, #16
	lsr	r2, r2, #16
	lsr	r3, r3, #16
	strh	r2, [r1, #22]	@ movhi
	pop	{r4, lr}
	strh	r3, [r1, #26]	@ movhi
	bx	lr
.L516:
	bl	drawSecondOzi
	bl	drawSecondOziLives
	b	.L505
.L518:
	.align	2
.L517:
	.word	isLevel2Active
	.word	isLevel3Active
	.word	numberOfStars
	.word	shadowOAM+272
	.word	stars
	.word	511
	.word	hoff3
	.word	voff3
	.size	drawGame, .-drawGame
	.comm	secondOurVar,4,4
	.comm	ourVar,4,4
	.comm	theTracker,4,4
	.comm	prevButton,4,4
	.comm	hoff,2,2
	.comm	isLevel3Active,4,4
	.comm	isLevel2Active,4,4
	.comm	secondOziLives,4,4
	.comm	oziLives,4,4
	.comm	playerLives,4,4
	.comm	numberOfStars,4,4
	.comm	counter,4,4
	.comm	leftOzi,20,4
	.comm	megabullets,140,4
	.comm	stars,600,4
	.comm	secondVersion,48,4
	.comm	secondHalf,72,4
	.comm	oziLife,48,4
	.comm	playerLife,48,4
	.comm	smallalien,72,4
	.comm	ozi,20,4
	.comm	bullets,280,4
	.comm	player,56,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
