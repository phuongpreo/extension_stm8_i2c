#ifndef _TM1650_H  //�궨�壬�����ļ�����
#define _TM1650_H

/*---------------------------ͷ�ļ�����--------------------------------------*/
#include "stm8s.h"//����STM8ͷ�ļ�

void TM1650_Init(void);
void TM1650_Set(u8 addr,u8 dt);
u8 TM1650_Key(void);
void TM1650_Set_Demo1(void);
void TM1650_Key_Demo2(void);
#endif