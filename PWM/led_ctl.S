.text
.global main

.equ LED_CTL, 0x41210000

main:
	bl led0_on
	bl led0_off
	bl led0_toggle
	bl led0_toggle
	b main

led0_on:
	ldr r1, =LED_CTL
	ldr r0, [r1]	@get current value
	orr r0,r0,#1	@set the first bit (don't affect other bits)
	str r0, [r1]	@write back to LED_DATA
	bx lr		@return from subroutine

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
	mvn r3, r0 @invert all bits of switch
	and r3, r3, r2 @r3 has the value of inverted bit 0, upper bits are 0
	mvn r2, r2
	and r2, r0, r2 @all other switches unchanged, LSB 0
	add r2, r2, r3
	str r2, [r1]
	bx lr

end: