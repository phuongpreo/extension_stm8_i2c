#ifndef _TIM1_PWM_H//�궨�壬�����ļ�����
#define _TIM1_PWM_H
#include "stm8s.h"

/*---------------------------�궨������--------------------------------------*/

extern __IO u16 djsd;


/*---------------------------��������--------------------------------------*/
void Tim1_PWM_Init(void);//��ʼ����ʱ��1
void DJ_KZ_Key(void);
void DJ_KZ_Uart(u8 dt);
void DJ_CS_Printf(void);
#endif //�����ļ����ƽ���

/************************ ��̳��ַ www.zxkjmcu.com ******************************/
