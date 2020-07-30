#include "pbdata.h"

void I2C_Configuration(void)
{
    GPIO_Init(I2C_PORT, I2C_SCL_PIN, GPIO_MODE_OUT_OD_HIZ_FAST);
    GPIO_Init(I2C_PORT, I2C_SDA_PIN, GPIO_MODE_OUT_OD_HIZ_FAST);
}

void I2C_Start(void)
{
    I2C_SDA_OUT;
    
    I2C_SDA_H;
    I2C_SCL_H;
    delay_us(5);
    I2C_SDA_L;
    delay_us(6);
    I2C_SCL_L;
}

void I2C_Stop(void)
{
    I2C_SDA_OUT;
    
    I2C_SCL_L;
    I2C_SDA_L;    
    I2C_SCL_H;
    delay_us(6);
    I2C_SDA_H;
    delay_us(6);
}

void I2C_Ack(void)
{    
    I2C_SDA_OUT;
    
    I2C_SCL_L;
    I2C_SDA_L;
    delay_us(2);
    I2C_SCL_H;
    delay_us(5);
    I2C_SCL_L;
}

void I2C_NAck(void)
{
    I2C_SDA_OUT;
    
    I2C_SCL_L;
    I2C_SDA_H;
    delay_us(2);
    I2C_SCL_H;
    delay_us(5);
    I2C_SCL_L;    
}
// ����1 ���� ��Ӧ���ź�
// ����0 ���� ��Ӧ���ź�
u8 I2C_Wait_Ack(void)
{
    u8 tempTime=0;
    
    I2C_SDA_IN;
    
    delay_us(5);
    I2C_SCL_H;
    delay_us(5);

    while(GPIO_ReadInputPin(I2C_PORT,I2C_SDA_PIN))
    {
        tempTime++;
        if(tempTime>250)
        {
            I2C_Stop();
            return 1;
        }
    }
    
    I2C_SCL_L;
    
    return 0;
}

void I2C_Send_Byte(u8 txd)
{
    u8 i=0;
      
    I2C_SDA_OUT;
    I2C_SCL_L;
    
    for(i=0;i<8;i++)
    {
        if((txd&0x80)>0)
        {
            I2C_SDA_H;
        }
        else
        {
            I2C_SDA_L;
        }
        
        txd<<=1;
        I2C_SCL_H;
        delay_us(5);
        I2C_SCL_L;
        delay_us(5);        
    }
}
//ack=0 ���ͷ�Ӧ���ź� ����������
//ack=1 ����Ӧ���ź� �������δ��� ��������
u8 I2C_Read_Byte(u8 ack)
{
    u8 i=0, receive=0;
    
    I2C_SDA_IN;
    
    for(i=0;i<8;i++)
    {
       I2C_SCL_L; 
       delay_us(2);
       I2C_SCL_H;
       delay_us(2);
       
       receive<<=1;
       
       if(GPIO_ReadInputPin(I2C_PORT,I2C_SDA_PIN))
         receive++;
       delay_us(1);
    }
    
    if(ack==0) 
    {
        I2C_NAck();
    }
    else
    {
        I2C_Ack();
    }
      
    return receive;
}











