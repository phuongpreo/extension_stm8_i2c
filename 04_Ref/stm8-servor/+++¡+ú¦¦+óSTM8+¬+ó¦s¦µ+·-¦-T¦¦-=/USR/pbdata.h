/************************ �Զ��幫��ͷ�ļ� **************************************/

#ifndef _PBDATA_H//�궨�壬�����ļ�����
#define _PBDATA_H
#include "stm8s.h"//����STM8��ͷ�ļ�
#include <stdio.h>//��Ҫ�������ͷ�ļ�����ʵ��
#include "math.h"//��Ҫ�������ͷ�ļ�����ʵ��


#include "led.h"  //����LEDͷ�ļ�
#include "uart1.h"//����RS232ͷ�ļ�
#include "i2c.h"
#include "at24cxx.h"
#include "tm1650.h"
#include "tim1_pwm.h"

void delay_us(u16 nCount); //΢����ʱ����
void delay_ms(u16 nCount); //������ʱ����
u16 Get_decimal(double dt,u8 deci);   //�����ֵС������

#endif //�����ļ����ƽ���


/************************ ��̳��ַ www.zxkjmcu.com ******************************/