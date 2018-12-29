/* Interrupt Vector */

/*.word _*/

	.section .isr_vector

ISR_Vector:

	.word _estack
	.word _Sys_Reset
