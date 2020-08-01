# Choose either STM8103 for stm8s103p3 or STM8105 for stm8s105k4 below:
SDCC = sdcc -mstm8 -I../libs -L../libs -DSTM8103
NAME = test_pwm
OBJS = lib_pwm.rel lib_eeprom.rel

all: $(NAME).ihx

.SUFFIXES : .rel .c .ihx


$(NAME).ihx: $(NAME).c $(OBJS)
	$(SDCC) $(NAME).c  $(LIBS) $(OBJS)

.c.rel :
	$(SDCC) -c $<
clean:
	- rm -f *.adb *.asm *.cdb *.ihx *.lk *.lst *.map *.rel *.rst *.sym

