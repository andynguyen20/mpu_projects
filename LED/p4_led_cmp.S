.text
.global main

.equ LED_CTRL, 0x41210000
.equ SW_DATA, 0x41220000

main:
	ldr r1,=SW_DATA
	ldr r2,=LED_CTRL
loop:
	mov r0, #0
	add r0, #20
	ldr r4, [r1]
	cmp r0, r4
	beq led_age
	mov r0, #4095
	cmp r4, r0
	beq led_all
led_off:
	mov r5, #0
	str r5, [r2]
	b loop
led_age:
	mov r5, #1
	str r5, [r2]
	b loop
led_all:
	mov r5, #2
	str r5, [r2]
	b loop
end:
