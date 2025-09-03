.text
.global main

.equ SVN_SEG_DATA1, 0x43C10004
.equ SVN_SEG_CNTL, 0x43C10000
.equ SW_DATA, 0x41220000
.equ BTN_DATA, 0x41200000

main:
	ldr r9, =SVN_SEG_CNTL
	mov r8, #1
	str r8, [r9]
	mov r1, #0
	mov r8, #0
	mov r9, #0

loop:
	ldr r6, =BTN_DATA
	ldr r7, [r6]
	cmp r7, r8
	beq no_toggle

	bic r7, r7, r8
	cmp r7, #1
	beq toggle
	b no_toggle

toggle:
	eor r9, r9, #1
	cmp r9, #1
	beq digit_ones
	cmp r9, #0
	beq stop

no_toggle:
	cmp r9, #1
	beq digit_ones
	cmp r9, #0
	beq stop

stop:
	ldr r5, =SVN_SEG_DATA1
	strb r1, [r5]
	mov r8, r7
	b loop

digit_ones:
	mov r8, r7
	ldr r5, =SVN_SEG_DATA1
	strb r1, [r5]
	cmp r1, #10
	beq zero
	add r1, r1, #1
	movw r0,#0
	movt r0,#0x0300
	bl delay
	mov r8, r7
	b loop

zero:
	mov r1, #0
	b loop

delay:
	subs r0,r0,#1
	bne delay
	bx lr