.text
.global main

.equ PWM_EN, 0x43C00000
.equ PWM_PERIOD, 0x43C00004
.equ PWM_WIDTH, 0x43C00008
.equ SW_DATA, 0x41220000

main:
	ldr r1, =PWM_EN
	ldr r2, =PWM_PERIOD
	ldr r3, =PWM_WIDTH
	ldr r4, =SW_DATA

	mov r5, #1000
	str r5, [r2]
	add r2, r2, #0x10
	str r5, [r2]
	add r2, r2, #0x10
	str r5, [r2]

loop:
	bl pwm_duty_value
	bl sw_read
loop_2:
	b loop

sw_read:
	ldr r1, =PWM_EN
	ldr r5, [r4]
	mov r6, #3584
	and r5, r5, r6
	asr r5, r5, #9
	cmp r5, #1
	beq pwm_en
	add r1, #0x10
	cmp r5, #2
	beq pwm_en
	add r1, #0x10
	cmp r5, #4
	beq pwm_en
	b pwm_disable

pwm_disable:
	ldr r1, =PWM_EN
	mov r8, #0
	str r8, [r1]
	add r1, #0x10
	str r8, [r1]
	add r1, #0x10
	str r8, [r1]
	b loop_2

pwm_en:
	mov r7, #1
	str r7, [r1]
	b loop_2


pwm_duty_value:
	ldr r3, =PWM_WIDTH
	ldr r5, [r4]
	mov r6, #255
	and r5, r5, r6
	mov r7, #1000
	mul r5, r5, r7
	lsr r5, r5, #8
	str r5, [r3]
	add r3, #0x10
	str r5, [r3]
	add r3, #0x10
	str r5, [r3]
	bx lr

end: