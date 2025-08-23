.text
.global main

.equ SW_DATA, 0x41220000
.equ BTN_DATA, 0x41200000
.equ LED_CTRL, 0x41210000
.equ MASK_OUT, 0x0000000F

main:
	ldr r1,=SW_DATA
	ldr r2,=BTN_DATA
	ldr r3,=LED_CTRL
	ldr r4,=MASK_OUT
loop:
	ldr r5, [r1]
	ldr r6, [r2]
	AND  r5, r5, r4
	AND r6, r6, r4
	EOR r5, r5, r6
	str r5, [r3]
	b loop
end:
