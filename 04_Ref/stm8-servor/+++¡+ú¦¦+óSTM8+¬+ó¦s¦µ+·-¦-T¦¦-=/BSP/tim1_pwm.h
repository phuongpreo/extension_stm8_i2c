#ifndef _TIM1_PWM_H//宏定义，定义文件名称
#define _TIM1_PWM_H
#include "stm8s.h"

/*---------------------------宏定义声明--------------------------------------*/

extern __IO u16 djsd;


/*---------------------------函数声明--------------------------------------*/
void Tim1_PWM_Init(void);//初始化定时器1
void DJ_KZ_Key(void);
void DJ_KZ_Uart(u8 dt);
void DJ_CS_Printf(void);
#endif //定义文件名称结束

/************************ 论坛地址 www.zxkjmcu.com ******************************/
