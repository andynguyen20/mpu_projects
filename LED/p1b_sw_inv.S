.text
.global main

.equ LED_CTRL, 0x41210000
.equ SW_DATA, 0x41220000

main:
	ldr r1, =SW_DATA
	ldr r2, =LED_CTRL
loop:
	ldr r0, [r1]
	mvn r0, r0
	str r0, [r2]
	b loop
end:
