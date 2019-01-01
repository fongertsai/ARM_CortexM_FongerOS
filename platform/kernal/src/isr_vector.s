/* Interrupt Vector */

/*
#############################################################
ISR Vector range: 0x0 ~ 0x14C
And use linker script to insure that no variable will corrupt
Set the necessary two due to system reset.
##############################################################
*/

	.section .isr_vector

ISR_Vector:
	.word _estack
	.word Sys_Reset

