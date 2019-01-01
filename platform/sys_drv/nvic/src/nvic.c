/*
An Implementation of NVIC controller
*/

#include "driver_public.h"
#include "nvic.h"


void Register_ISR(int irq_num, void *func)
{
	int offset = (irq_num * ISR_SIZE);
	REG_WRITE(ISR_VECTOR_BASE + offset, func);
}
