/**
  ******************************************************************************
  * @file PWM\Sources\main.c
  * @brief This file contains the main function for TIM2 PWM Output example.
  * @author STMicroelectronics - MCD Application Team
  * @version V1.1.1
  * @date 06/05/2009
  ******************************************************************************
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  * <h2><center>&copy; COPYRIGHT 2009 STMicroelectronics</center></h2>
  * @image html logo.bmp
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"


/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/ 
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
/* Public functions ----------------------------------------------------------*/
u16 ppm = 3000;
/**
  * @brief Example firmware main entry point.
  * @par Parameters:
  * None
  * @retval 
  * None
  */
void main(void)
{
		
	//clock at 2MHz

  /* TIM2 Peripheral Configuration */ 
  TIM2_DeInit();

  /* Set TIM2 Frequency to 2Mhz */ 
  TIM2_TimeBaseInit(TIM2_PRESCALER_1, 40000);

  
	/* Channel 1 PWM configuration */ 
  TIM2_OC1Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,ppm, TIM2_OCPOLARITY_HIGH ); 
  TIM2_OC1PreloadConfig(ENABLE);
  
	/* Enables TIM2 peripheral Preload register on ARR */
	TIM2_ARRPreloadConfig(ENABLE);
	
  /* Enable TIM2 */
  TIM2_Cmd(ENABLE);

 /* TIM3 Peripheral Configuration */ 
  TIM3_DeInit();

  /* Set TIM3 Frequency to 2Mhz */ 
  TIM3_TimeBaseInit(TIM3_PRESCALER_1, 40000); //update every 20ms the duty cycle

						
	TIM3_ITConfig(TIM3_IT_UPDATE ,ENABLE);

	/* Enables TIM3 peripheral Preload register on ARR */
	TIM3_ARRPreloadConfig(ENABLE);
	
  /* Enable TIM3 */
  TIM3_Cmd(ENABLE);
	
	enableInterrupts();
  
  while (1)
	{

	}
}

#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  * where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval 
  * None
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

/**
  * @}
  */

/******************* (C) COPYRIGHT 2009 STMicroelectronics *****END OF FILE****/
