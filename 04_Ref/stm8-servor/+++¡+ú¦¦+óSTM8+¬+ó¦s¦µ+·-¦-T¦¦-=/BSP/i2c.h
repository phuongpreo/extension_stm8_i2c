#ifndef _I2C_H  //�궨�壬�����ļ�����
#define _I2C_H

/*---------------------------ͷ�ļ�����--------------------------------------*/
#include "stm8s.h"//����STM8ͷ�ļ�

#define I2C_SCL_PIN GPIO_PIN_1 
#define I2C_SDA_PIN GPIO_PIN_2  

#define I2C_PORT GPIOE  

#define I2C_SCL_L GPIO_WriteLow(I2C_PORT,I2C_SCL_PIN); 
#define I2C_SCL_H GPIO_WriteHigh(I2C_PORT,I2C_SCL_PIN); 

#define I2C_SDA_L GPIO_WriteLow(I2C_PORT,I2C_SDA_PIN); 
#define I2C_SDA_H GPIO_WriteHigh(I2C_PORT,I2C_SDA_PIN); 

#define I2C_SDA_OUT GPIO_Init(I2C_PORT, I2C_SDA_PIN, GPIO_MODE_OUT_OD_HIZ_FAST);
#define I2C_SDA_IN GPIO_Init(I2C_PORT, I2C_SDA_PIN, GPIO_MODE_IN_FL_NO_IT);

void I2C_Configuration(void);
void I2C_Start(void);
void I2C_Stop(void);
void I2C_Ack(void);
void I2C_NAck(void);
u8 I2C_Wait_Ack(void);
void I2C_Send_Byte(u8 txd);
u8 I2C_Read_Byte(u8 ack);

#endif
