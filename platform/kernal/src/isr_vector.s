/* Interrupt Vector */

/*.word _*/

	.section .isr_vector

ISR_Vector:

	/*.word _estack */
	.word Sys_Reset
	.word Sys_Reset
	.word default_entry

