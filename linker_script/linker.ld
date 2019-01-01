ENTRY(Sys_Reset)

MEMORY
{
  FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 128K
  RAM (rwx) : ORIGIN = 0x20000000, LENGTH = 20K

}

SECTIONS
{
	.ISR_VECTOR :
	{
		KEEP(*(.isr_vector*))
		/* Reserve 0x150 for ISR vector */
		. = 0x150;
	} >FLASH

	.text :
	{
 		*(.text*)
		*(.rodata)
		_sidata = .;
	} >FLASH

	/* Initialized data will initially be loaded in FLASH at the end of the .text section. */
    .data : AT (_sidata) 
    {
		_sdata = .;
		*(.data)		/* Initialized data */
		_edata = .;
	} >RAM

	.bss : {
		_sbss = .;
		*(.bss)         /* Zero-filled run time allocate data memory */
		_ebss = .;
	} >RAM
    
    _estack = ORIGIN(RAM) + LENGTH(RAM);
/*
	/DISCARD/ :
	{
		*(.debug*)
	}
*/
 }  
