#include "pbdata.h"

u8 AT24Cxx_ReadOneByte(u16 addr)
{
    u8 temp=0;
  
    I2C_Start();
    
    if(EE_TYPE>AT24C16)
    {
        I2C_Send_Byte(EEPROM_ADDRESS);
        I2C_Wait_Ack();
        
        I2C_Send_Byte((u8)(addr>>8));
        I2C_Wait_Ack();
    }
    else
    {   //1010 000 0
        I2C_Send_Byte(EEPROM_ADDRESS+((addr/256)<<1));
        I2C_Wait_Ack();
    }
    
    I2C_Send_Byte((u8)(addr));
    I2C_Wait_Ack();
    
    I2C_Start();    
    
    I2C_Send_Byte(EEPROM_ADDRESS+1);
    I2C_Wait_Ack();
    
    temp=I2C_Read_Byte(0);
    
    I2C_Stop();
    
    return temp;
}

void AT24Cxx_WriteOneByte(u16 addr,u8 dt)
{
     I2C_Start();
    
    if(EE_TYPE>AT24C16)
    {
        I2C_Send_Byte(EEPROM_ADDRESS);
        I2C_Wait_Ack();
        
        I2C_Send_Byte((u8)(addr>>8));
        I2C_Wait_Ack();
    }
    else
    {   //1010 000 0
        I2C_Send_Byte(EEPROM_ADDRESS+((addr/256)<<1));
        I2C_Wait_Ack();
    }
    
    I2C_Send_Byte((u8)(addr));
    I2C_Wait_Ack();
    
    I2C_Send_Byte(dt);
    I2C_Wait_Ack();
    
    I2C_Stop();    
}

void AT24Cxx_Demo2(void)
{
    u8 dt=0;
    
    AT24Cxx_WriteOneByte(0x10,0x12);    
    delay_ms(20);    
    dt=AT24Cxx_ReadOneByte(0x10);    
    printf("%0.2X\r\n",dt);  
}

