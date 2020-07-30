/***********************************************************************
*    ���ݻ�STM8������Ӳ������
*    LED1-PE0          
*    LED2-PA3          
*    LED3-PA6          
************************************************************************/

#ifndef _LED_H  //�궨�壬�����ļ�����
#define _LED_H

/*---------------------------ͷ�ļ�����--------------------------------------*/
#include "stm8s.h"//����STM8ͷ�ļ�

/*---------------------------�궨������--------------------------------------*/
#define LED1_PIN GPIO_PIN_0  //����GPIO_PIN_0����ΪLED1_PIN���൱������������
#define LED2_PIN GPIO_PIN_3  //����GPIO_PIN_3����ΪLED2_PIN���൱������������
#define LED3_PIN GPIO_PIN_6  //����GPIO_PIN_6����ΪLED3_PIN���൱������������

#define LED1_PORT GPIOE  //����GPIOE�˿�ΪLED1_PORT���൱������������
#define LED2_PORT GPIOA  //����GPIOA�˿�ΪLED2_PORT���൱������������
#define LED3_PORT GPIOA  //����GPIOA�˿�ΪLED3_PORT���൱������������

//������������ܽſ���LED,��ôֻ����������Ӧ�Ķ˿������ű�ż���

#define LED1_L GPIO_WriteLow(LED1_PORT,LED1_PIN);       //����LED1_L,����LED1_L���PE0��������͵�ƽ
#define LED1_H GPIO_WriteHigh(LED1_PORT,LED1_PIN);      //����LED1_H,����LED1_H���PE0��������͸�ƽ
#define LED1_R GPIO_WriteReverse(LED1_PORT,LED1_PIN);   //����LED1_R,����LED1_R���PE0���������ƽ״̬ȡ��

#define LED2_L GPIO_WriteLow(LED2_PORT,LED2_PIN);       //����LED2_L,����LED2_L���PA3��������͵�ƽ
#define LED2_H GPIO_WriteHigh(LED2_PORT,LED2_PIN);      //����LED2_H,����LED2_H���PA3��������͸�ƽ
#define LED2_R GPIO_WriteReverse(LED2_PORT,LED2_PIN);   //����LED2_R,����LED2_R���PA3���������ƽ״̬ȡ��

#define LED3_L GPIO_WriteLow(LED3_PORT,LED3_PIN);       //����LED3_L,����LED2_L���PA6��������͵�ƽ
#define LED3_H GPIO_WriteHigh(LED3_PORT,LED3_PIN);      //����LED3_H,����LED2_H���PA6��������͸�ƽ
#define LED3_R GPIO_WriteReverse(LED3_PORT,LED3_PIN);   //����LED3_R,����LED2_R���PA6���������ƽ״̬ȡ��

/*---------------------------��������--------------------------------------*/
void LED_Init(void);  //LED��ʼ������
void LED_Demo1(void); //��˸����1�����ʱ��Ϊ1��
void LED_Demo2(void); //��˸����2�����ʱ��Ϊ1��

#endif //�����ļ����ƽ���


/************************ ��̳��ַ www.zxkjmcu.com ******************************/