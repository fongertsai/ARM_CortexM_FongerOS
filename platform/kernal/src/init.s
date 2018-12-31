

	.section .text
	.type	Sys_Reset, %function
	.global	Sys_Reset
	.global default_entry

Sys_Reset:
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	mov	r1,	#10
	mov	r2,	#2
	mov	r3,	#3
	mov	r4,	#4

default_entry:
	bl default_entry
