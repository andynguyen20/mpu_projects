.text
.global main

.equ BTN_DATA, 0x41200000
.equ SW_DATA, 0x41220000
.equ LED_CTRL, 0x41210000
.equ MASK_OUT, 0x000000FF

main:
	ldr r1,=BTN_DATA
	ldr r2,=SW_DATA
	ldr r3,=LED_CTRL
	ldr r4,=MASK_OUT
loop:
	ldr r5, [r2]
	ldr r6, [r1]
	AND r5, r5, r4
	cmp r6, #1
	BEQ latch
	cmp r6, #2
	BEQ zero
	b loop
latch:
	str r5, [r3]
	b loop
zero:
	mov r5, #0
	str r5, [r3]
	b loop
end:
