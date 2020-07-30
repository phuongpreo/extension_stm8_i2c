#include "pbdata.h"

__IO u16 djsd=1500;
__IO u8 printf_bz=0;


/*********************************************************************************
*   函 数 名: Tim1_PWM_Init
*   功能说明: 初始化高级定时器1
*   形    参：无
*   返 回 值: 无
*********************************************************************************/
void Tim1_PWM_Init(void)
{
    TIM1_TimeBaseInit(16,TIM1_COUNTERMODE_UP,20000,0);//初始化定时器1  20.06ms
    TIM1_ARRPreloadConfig(ENABLE);//使能自动重装
    
    TIM1_OC1Init(TIM1_OCMODE_PWM2,TIM1_OUTPUTSTATE_ENABLE,TIM1_OUTPUTNSTATE_ENABLE,djsd,TIM1_OCPOLARITY_LOW,TIM1_OCNPOLARITY_LOW,TIM1_OCIDLESTATE_SET,TIM1_OCNIDLESTATE_SET);
    TIM1_Cmd(ENABLE);//开定时器
    
    TIM1_CtrlPWMOutputs(ENABLE);//使能PWM主输出
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
          case 0x4C://确认
          {
                djsd=1500;
                TIM1_SetCompare1(djsd);  //1.5ms 0 度              
                while(TM1650_Key()==key);
                printf_bz=1;
          }
          break;
          case 0x54://左
          {
                djsd=500;
                TIM1_SetCompare1(djsd);  //0.5ms -90 度              
                while(TM1650_Key()==key);
                printf_bz=1;
          }
          break;
          case 0x44://右
          {
                djsd=2500;
                TIM1_SetCompare1(djsd);  //2.5ms 90 度              
                while(TM1650_Key()==key);
                printf_bz=1;
          }
          break;
          case 0x64://上
          {
                if(djsd>500) djsd=djsd-500;            
                TIM1_SetCompare1(djsd);  
                while(TM1650_Key()==key);
                printf_bz=1;
          }
          break;
          case 0x5C://下 减速
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
                TIM1_SetCompare1(djsd);  //0.5ms -90 度  
          }
          break;
          case 0x10:
          {
                djsd=1000;
                TIM1_SetCompare1(djsd);  //1ms -45 度  
          }
          break;
          case 0x15:
          {
                djsd=1500;
                TIM1_SetCompare1(djsd);  //1.5ms 0 度  
          }
          break;
          case 0x20:
          {
                djsd=2000;
                TIM1_SetCompare1(djsd);  //20ms 45 度  
          }
          break;
          case 0x25:
          {
                djsd=2500;
                TIM1_SetCompare1(djsd);  //2.5ms 90 度  
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
                printf("【角度】=-90 度   【脉冲宽度】=0.5 ms\r\n");
              }
              break;
              case 1000:
              {
                printf("【角度】=-45 度   【脉冲宽度】=1 ms\r\n");
              }
              break;
              case 1500:
              {
                printf("【角度】=0 度   【脉冲宽度】=1.5 ms\r\n");
              }
              break;
              case 2000:
              {
                printf("【角度】=45 度   【脉冲宽度】=2 ms\r\n");
              }
              break;
              case 2500:
              {
                printf("【角度】=90 度   【脉冲宽度】=2.5 ms\r\n");
              }
              break;
        }
    }
}









/************************ 论坛地址 www.zxkjmcu.com ******************************/