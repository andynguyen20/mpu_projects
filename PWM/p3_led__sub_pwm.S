.text
.global main

.equ LED_CTL, 0x41210000
.equ SW_DATA, 0x41220000

main:
	blinky_loop:
		bl led0_on
		mov r0, #100       @adjust for brightness ratio
		bl delay
		bl led0_off
		mov r0, #10000       @adjust for brightness ratio (last ratio 1:100 to test dimming)
		bl delay
		b blinky_loop

delay:
	subs r0,r0,#1
	bpl delay
	bx lr

led0_on:
	ldr r1, =LED_CTL
	ldr r0, [r1]
	orr r0,r0,#1
	str r0, [r1]
	bx lr

led0_off:
	ldr r1, =LED_CTL
	ldr r0, [r1]
	mov r2, #1
	mvn r2, r2
	and r0, r0, r2
	str r0, [r1]
	bx lr

led0_toggle:
	ldr r1, =LED_CTL
	ldr r0, [r1]
	mov r2, #1
	mvn r3, r0
	and r3, r3, r2
	mvn r2, r2
	and r2, r0, r2
	add r2, r2, r3
	str r2, [r1]
	bx lr

end: