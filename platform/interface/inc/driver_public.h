#ifndef __DRIVER_PUBLIC_H__
#define __DRIVER_PUBLIC_H__

#define REG_READ(addr, val)\
	while(0){\
		val = ((volatile *)(addr));\
	}



#define REG_WRITE(addr, val)\
	while(0){\
		(*((volatile int*)(addr))) = (int)val;\
	}





#endif /*__DRIVER_PUBLIC_H__*/
