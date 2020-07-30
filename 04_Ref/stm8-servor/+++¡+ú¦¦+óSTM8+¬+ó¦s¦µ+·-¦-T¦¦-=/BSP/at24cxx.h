#ifndef _AT24CXX_H  //�궨�壬�����ļ�����
#define _AT24CXX_H

/*---------------------------ͷ�ļ�����--------------------------------------*/
#include "stm8s.h"//����STM8ͷ�ļ�


#define AT24C01  127
#define AT24C02  255
#define AT24C04  511
#define AT24C08  1023
#define AT24C16  2047
#define AT24C32  4095
#define AT24C64  8191
#define AT24C128 16383
#define AT24C256 32767

#define EE_TYPE  AT24C02
#define EEPROM_ADDRESS 0xA0

u8 AT24Cxx_ReadOneByte(u16 addr);
void AT24Cxx_WriteOneByte(u16 addr,u8 dt);
void AT24Cxx_Demo2(void);
#endif