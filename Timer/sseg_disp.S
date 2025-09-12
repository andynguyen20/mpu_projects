.text
.global main

.equ BTN_DATA, 0x41200000
.equ SW_DATA, 0x41220000
.equ SVN_SEG_CNTL, 0x43C10000
.equ SVN_SEG_DATA, 0x43C10004

main:
	ldr r1, =BTN_DATA
	ldr r2, =SW_DATA
	ldr r3, =SVN_SEG_CNTL
	ldr r4, =SVN_SEG_DATA

	mov r5, #1
	str r5, [r3]

loop:
	ldr r4, =SVN_SEG_DATA
	bl read_sw
	bl read_btn

	mov r8, r0
	bl write_sseg

	add r4, r4, #0x1
	mov r0, #0xF0
	and r0, r0, r8
	lsr r0, r0, #4
	bl write_sseg

	add r4, r4, #0x1
	mov r0, #0xF00
	and r0, r0, r8
	lsr r0, r0, #8
	bl write_sseg

	add r4, r4, #0x1
	mov r0, #0xF000
	and r0, r0, r8
	lsr r0, r0, #12
	bl write_sseg

	b loop

write_sseg:
	mov r5, #0xF
	and r0, r0, r5
	strb r0, [r4]
	bx lr

read_sw:
	ldr r0, [r2]
	mov r5, #0xFFF
	and r0, r0, r5
	bx lr

read_btn:
	ldr r6, [r1]
	mov r7, #0xF
	and r6, r6, r7
	lsl r6, r6, #12
	orr r0, r0, r6
	bx lr
