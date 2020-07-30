#include "pbdata.h"

__IO u16 djsd=1500;
__IO u8 printf_bz=0;


/*********************************************************************************
*   �� �� ��: Tim1_PWM_Init
*   ����˵��: ��ʼ���߼���ʱ��1
*   ��    �Σ���
*   �� �� ֵ: ��
*********************************************************************************/
void Tim1_PWM_Init(void)
{
    TIM1_TimeBaseInit(16,TIM1_COUNTERMODE_UP,20000,0);//��ʼ����ʱ��1  20.06ms
    TIM1_ARRPreloadConfig(ENABLE);//ʹ���Զ���װ
    
    TIM1_OC1Init(TIM1_OCMODE_PWM2,TIM1_OUTPUTSTATE_ENABLE,TIM1_OUTPUTNSTATE_ENABLE,djsd,TIM1_OCPOLARITY_LOW,TIM1_OCNPOLARITY_LOW,TIM1_OCIDLESTATE_SET,TIM1_OCNIDLESTATE_SET);
    TIM1_Cmd(ENABLE);//����ʱ��
    
    TIM1_CtrlPWMOutputs(ENABLE);//ʹ��PWM�����
}

void DJ_KZ_Key(void)
{
    u8 key=0;
    static u8 k=0;
    
    if(k<20)
    {
        k++;
        return;
    }
    
    k=0;    
    key=TM1650_Key();
    
    switch(key)
    {
          case 0x4C://ȷ��
          {
                djsd=1500;
                TIM1_SetCompare1(djsd);  //1.5ms 0 ��              
                while(TM1650_Key()==key);
                printf_bz=1;
          }
          break;
          case 0x54://��
          {
                djsd=500;
                TIM1_SetCompare1(djsd);  //0.5ms -90 ��              
                while(TM1650_Key()==key);
                printf_bz=1;
          }
          break;
          case 0x44://��
          {
                djsd=2500;
                TIM1_SetCompare1(djsd);  //2.5ms 90 ��              
                while(TM1650_Key()==key);
                printf_bz=1;
          }
          break;
          case 0x64://��
          {
                if(djsd>500) djsd=djsd-500;            
                TIM1_SetCompare1(djsd);  
                while(TM1650_Key()==key);
                printf_bz=1;
          }
          break;
          case 0x5C://�� ����
          {
                if(djsd<2500) djsd=djsd+500;            
                TIM1_SetCompare1(djsd);  
                while(TM1650_Key()==key);
                printf_bz=1;
          }
          break;
    }
}

void DJ_KZ_Uart(u8 dt)
{ 
    switch(dt)
    {
          case 0x05:
          {
                djsd=500;
                TIM1_SetCompare1(djsd);  //0.5ms -90 ��  
          }
          break;
          case 0x10:
          {
                djsd=1000;
                TIM1_SetCompare1(djsd);  //1ms -45 ��  
          }
          break;
          case 0x15:
          {
                djsd=1500;
                TIM1_SetCompare1(djsd);  //1.5ms 0 ��  
          }
          break;
          case 0x20:
          {
                djsd=2000;
                TIM1_SetCompare1(djsd);  //20ms 45 ��  
          }
          break;
          case 0x25:
          {
                djsd=2500;
                TIM1_SetCompare1(djsd);  //2.5ms 90 ��  
          }
          break;
    }
    
    printf_bz=1;
}

void DJ_CS_Printf(void)
{
    if(printf_bz==1)
    {
        printf_bz=0;
        switch(djsd)
        {
              case 500:
              {
                printf("���Ƕȡ�=-90 ��   �������ȡ�=0.5 ms\r\n");
              }
              break;
              case 1000:
              {
                printf("���Ƕȡ�=-45 ��   �������ȡ�=1 ms\r\n");
              }
              break;
              case 1500:
              {
                printf("���Ƕȡ�=0 ��   �������ȡ�=1.5 ms\r\n");
              }
              break;
              case 2000:
              {
                printf("���Ƕȡ�=45 ��   �������ȡ�=2 ms\r\n");
              }
              break;
              case 2500:
              {
                printf("���Ƕȡ�=90 ��   �������ȡ�=2.5 ms\r\n");
              }
              break;
        }
    }
}









/************************ ��̳��ַ www.zxkjmcu.com ******************************/