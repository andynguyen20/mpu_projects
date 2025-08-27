.text
.global main

.equ BTN_DATA, 0x41200000
.equ LED_CTRL, 0x41210000

main:
	ldr r1,=BTN_DATA
	ldr r2,=LED_CTRL
loop:
	ldr r0, [r1]
	str r0, [r2]
	b loop
end: