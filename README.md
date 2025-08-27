This repository contains the microprocessor projects using the single-core ARM Cortex-A9 processor, where I learn to use Vitis, write ARM assembly programs, use the ARM interrupt system, and write C code to access on-chip peripherals. 

## File Formatting
Just Assembly programs because Vitis .gitignore is nasty. 

## Part 1
* [**Project 1a**](https://github.com/andynguyen20/mpu_projects/blob/main/LED/p1_sw_led.S)
  * Navigating Vitis, studying the ARM processor architecture and ARM Assembly, and then mapping switches to leds
* [**Project 1b**](https://github.com/andynguyen20/mpu_projects/blob/main/LED/p2_sw_inv.S)
  *  Negate the led signals from the switches
* [**Project 1c**](https://github.com/andynguyen20/mpu_projects/blob/main/LED/p3_btn_led.S)
  * Connecting to pushbuttons to turn on leds
* [**Project 1d**](https://github.com/andynguyen20/mpu_projects/blob/main/LED/p4_led_cmp.S)
  *  Illuminate first LED when the value of the switches is equal to my age(20), and the second LED if all switches are ‘1’.
* [**Project 1e**](https://github.com/andynguyen20/mpu_projects/blob/main/LED/p5_led_rng.S)
  *  Illuminate leds in correspondence to range of switches treated as binary values. (0-3) -> led0 | (4-7) -> led1 | (8-11) -> led2 | (12-15) -> led3 
* [**Project 1f**](https://github.com/andynguyen20/mpu_projects/blob/main/LED/p6_sw_btn_led.S)
  *  Use both switches and pushbuttons to turn on leds
* [**Project 1g**](https://github.com/andynguyen20/mpu_projects/blob/main/LED/p7_btn_latch.S)
  *  Treat the first 8 switches as binary values and use a a pushbutton as an enable to latch values onto led

  ## Part 2
* [**Project 2a**]
