#ifndef _TM1650_H  //宏定义，定义文件名称
#define _TM1650_H

/*---------------------------头文件引用--------------------------------------*/
#include "stm8s.h"//引用STM8头文件

void TM1650_Init(void);
void TM1650_Set(u8 addr,u8 dt);
u8 TM1650_Key(void);
void TM1650_Set_Demo1(void);
void TM1650_Key_Demo2(void);
#endif