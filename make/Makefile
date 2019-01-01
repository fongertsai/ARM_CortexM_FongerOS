PROJECT = fongerOS

PWD ?= ${CURDIR}
EXECUTABLE = $(PROJECT).elf
BIN_IMAGE = $(PROJECT).bin


CROSS_COMPILE ?= arm-none-eabi-
CC = $(CROSS_COMPILE)gcc
AS = $(CROSS_COMPILE)as
LD = $(CROSS_COMPILE)ld
OBJCOPY = $(CROSS_COMPILE)objcopy
OBJDUMP = $(CROSS_COMPILE)objdump
SIZE = $(CROSS_COMPILE)size

CPU = cortex-m3
CFLAGS = -mcpu=$(CPU)
CFLAGS += -fno-common -O0 -g -mcpu=cortex-m3 -mthumb  -fno-stack-protector


LDFLAGS += -T../linker_script/linker.ld


CFLAGS += -I../platform/interface/inc

OBJS += ../platform/kernal/src/isr_vector.o
OBJS += ../platform/kernal/src/init.o


# DRIVER #
OBJS += ../platform/sys_drv/nvic/src/nvic.o
CFLAGS += -I../platform/sys_drv/nvic/inc



all: $(BIN_IMAGE)

$(BIN_IMAGE): $(EXECUTABLE)
	$(OBJCOPY) -O binary $^ $@
	$(OBJDUMP) -h -S -D $(EXECUTABLE) > $(PROJECT).lst

$(EXECUTABLE): $(OBJS)
	$(LD) -o $@ $(OBJS) \
		$(LDFLAGS)


%.o: %.s
	echo $@
	$(CC) $(CFLAGS) $(LDFLAGS) -c $< -o $@


clean:
	rm $(OBJS)
	rm -rf $(EXECUTABLE)
	rm $(BIN_IMAGE)

gdb:
	qemu-system-arm -M stm32-p103 -kernel $(BIN_IMAGE) -s -S
