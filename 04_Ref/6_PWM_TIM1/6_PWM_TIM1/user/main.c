/**
  ******************************************************************************
  * @file    Project/main.c 
  * @author  Minh Nguyen
  * @version V2.2.0
  * @date    22-March-2020
  * @brief   Main program body
   ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT 2014 STMicroelectronics</center></h2>
  *
  * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  * You may not use this file except in compliance with the License.
  * You may obtain a copy of the License at:
  *
  *        http://www.st.com/software_license_agreement_liberty_v2
  *
  * Unless required by applicable law or agreed to in writing, software 
  * distributed under the License is distributed on an "AS IS" BASIS, 
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  *
  ******************************************************************************
  */ 


/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"

/* Private defines -----------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
void CLK_Cofiguration(void);
void Timer1_PWM_Configuration(void);

/* Private functions ---------------------------------------------------------*/



void CLK_Cofiguration(void)
{
CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
}
void Delay_us(uint32_t time_delay)
{
while(time_delay--)
{
}
}

void Delay_ms(uint32_t time_delay)
{
while(time_delay--)
{
  Delay_us(200);
}
}
void Timer1_PWM_Configuration(void)
{
    TIM1_DeInit();								// reset all register timer1
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);	                // provide clock for timer1
    TIM1_TimeBaseInit(0,TIM1_COUNTERMODE_UP, 40000,0);			// config frequency interrupt PSC= 15999+1 =16000, ARR = 1000 -> F_interrupt = 16*10^6 / 16000/1000 = 1Hz = 1s
    TIM1_OC3Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_DISABLE,
    3000, TIM1_OCPOLARITY_HIGH, TIM1_OCNPOLARITY_HIGH, TIM1_OCIDLESTATE_SET,
    TIM1_OCNIDLESTATE_SET);							// config mode PWM1, enable TIM1_CH1 duty 20% , disable TIM1_CH1N 
    TIM1_ARRPreloadConfig(ENABLE);						// enable register auto reload active -  over timer -> reset counter
    TIM1_OC3PreloadConfig(ENABLE);						// enable reload mode output compare - TIM1_CMMR1
    TIM1_Cmd(ENABLE);								// active timer
    TIM1_CtrlPWMOutputs(ENABLE);						// active PWM output
}
void main(void)
{
 
  CLK_Cofiguration();
  Timer1_PWM_Configuration();
  enableInterrupts();
  while (1)
  {
    TIM1_SetCompare3(4000);
    Delay_ms(1000);
    TIM1_SetCompare3(10000);
    Delay_ms(1000);
//    TIM1_SetCompare3(1500);
//    Delay_ms(2000);
  }
  
}
#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval : None
  */
void assert_failed(u8* file, u32 line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {

  }
}
#endif


/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
