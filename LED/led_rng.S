.text
.global main

.equ SW_DATA, 0x41220000
.equ LED_CTRL, 0x41210000
.equ MASK_OUT, 0x0000000F

main:
	ldr r1,=SW_DATA
	ldr r2,=LED_CTRL
	ldr r3,=MASK_OUT
loop:
	ldr r0, [r1]
	AND r0, r0, r3
	cmp r0, #12
	BGE led_three
	cmp r0, #8
	BGE led_two
	cmp r0, #4
	BGE led_one
	cmp r0, #0
	BGE led_zero
	b loop
led_three:
	mov r4, #8
	str r4, [r2]
	b loop
led_two:
	mov r4, #4
	str r4, [r2]
	b loop
led_one:
	mov r4, #2
	str r4, [r2]
	b loop
led_zero:
	mov r4, #1
	str r4, [r2]
	b loop
end:
