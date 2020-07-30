#include "pbdata.h"

u8 CODE[10] = {0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f}; //0~9显示代码

void TM1650_Init(void)
{
    TM1650_Set(0x48,0x11);
    TM1650_Set(0x68,CODE[0]);
    TM1650_Set(0x6A,CODE[1]);
    TM1650_Set(0x6C,CODE[2]);
    TM1650_Set(0x6E,CODE[3]);
}

void TM1650_Set(u8 addr,u8 dt)
{
    I2C_Start();
   
    I2C_Send_Byte(addr);
    I2C_Wait_Ack();
    
    I2C_Send_Byte(dt);
    I2C_Wait_Ack();
    
    I2C_Stop(); 
}

u8 TM1650_Key(void)
{
   u8 key=0;
  
    I2C_Start();
    I2C_Send_Byte(0x49);
    I2C_Wait_Ack();
    
    key=I2C_Read_Byte(0);
    I2C_Stop();
    
    return key;
}

void TM1650_Set_Demo1(void)
{
     static u8 i=0;
     
     TM1650_Set(0x68,CODE[i]);
     TM1650_Set(0x6A,CODE[i]);
     TM1650_Set(0x6C,CODE[i]);
     TM1650_Set(0x6E,CODE[i]|0x80);
     
     i++;
     if(i>9) i=0;
     delay_ms(500);
}

void TM1650_Key_Demo2(void)
{
    u8 key=0;
    
    key=TM1650_Key();
    
    switch(key)
    {
          case 0x4C://确认
          {
            printf("键值：%0.2X--确认\r\n",key);
            while(TM1650_Key()==key);
          }
          break;
          case 0x54://左
          {
            printf("键值：%0.2X--左\r\n",key);
            while(TM1650_Key()==key);
          }
          break;
          case 0x44://右
          {
            printf("键值：%0.2X--右\r\n",key);
            while(TM1650_Key()==key);
          }
          break;
          case 0x64://上
          {
            printf("键值：%0.2X--上\r\n",key);
            while(TM1650_Key()==key);
          }
          break;
          case 0x5C://下
          {
            printf("键值：%0.2X--下\r\n",key);
            while(TM1650_Key()==key);
          }
          break;
    }
    
    delay_ms(20);
}



