.text
.global main

.equ SVN_SEG_DATA1, 0x43C10004
.equ SVN_SEG_DATA2, 0x43C10005
.equ SVN_SEG_DATA3, 0x43C10006
.equ SVN_SEG_DATA4, 0x43C10007
.equ SVN_SEG_CNTL, 0x43C10000

main:
	ldr r9, =SVN_SEG_CNTL
	mov r8, #1
	str r8, [r9]
	mov r1, #0
	mov r2, #0
	mov r3, #0
	mov r4, #0

digit_ones:
	cmp r1, #9
	beq digit_tens
	add r1, r1, #1
	ldr r5, =SVN_SEG_DATA1
	strb r1, [r5]
	movw r0,#0
	movt r0,#0x0100
	bl delay
	b digit_ones

digit_tens:
	ldr r5, =SVN_SEG_DATA1
	mov r1, #0
	strb r1, [r5]
	cmp r2, #9
	beq digit_hundreds
	add r2, r2, #1
	ldr r5, =SVN_SEG_DATA2
	strb r2, [r5]
	movw r0,#0
	movt r0,#0x0100
	bl delay
	b digit_ones

digit_hundreds:
	ldr r5, =SVN_SEG_DATA2
	mov r2, #0
	strb r2, [r5]
	cmp r3, #9
	beq digit_thousands
	add r3, r3, #1
	ldr r5, =SVN_SEG_DATA3
	strb r3, [r5]
	movw r0,#0
	movt r0,#0x0100
	bl delay
	b digit_ones

digit_thousands:
	ldr r5, =SVN_SEG_DATA3
	mov r3, #0
	strb r3, [r5]
	cmp r4, #9
	beq zero
	add r4, r4, #1
	ldr r5, =SVN_SEG_DATA4
	strb r4, [r5]
	movw r0,#0
	movt r0,#0x0100
	bl delay
	b digit_ones

zero:
	ldr r5, =SVN_SEG_DATA4
	mov r4, #0
	strb r4, [r5]
	b digit_ones

delay:
	subs r0,r0,#1
	bne delay
	bx lr
