/**
  ******************************************************************************
  * @file    I2C/I2C_TwoBoards/I2C_DataExchange/Slave/main.c
  * @author  MCD Application Team
  * @version V2.0.4
  * @date    26-April-2018
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
#include "main.h"
#include "stm8s_uart1.h"

#include <stdio.h> 
//#include <string.h> 

/** @addtogroup I2C_TwoBoards
  * @{
  */

/** @addtogroup I2C_DataExchange
  * @{
  */

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
#define EXTENSION_GET_EVT_REG 0x02
#define EXTENSION_ROTATE_LED_REG 0x10
#define EXTENSION_ROTATE_LED2_REG 0x11
#define SR04_DIS_DATA_REG 0x12
#define TRIG_PORT   GPIOD
#define TRIG_PIN    GPIO_PIN_2
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
  /* Private variables ---------------------------------------------------------*/
//__IO uint8_t Slave_Buffer_Rx[6];//255
__IO uint8_t Tx_Idx = 0, Rx_Idx = 0;
__IO uint16_t Event = 0x00;

volatile uint8_t *read_p;
volatile uint8_t *write_p;
volatile uint8_t writing;
volatile uint8_t reading;


volatile uint8_t buf[3];
volatile uint16_t val;
volatile uint8_t evt_reg = 0x64;

volatile uint8_t sr04_dis_reg=0x00;

u16 ppm = 5000;

/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
/* Public functions ----------------------------------------------------------*/

/**
  * @brief  Main program.
  * @param  None
  * @retval None
  */
void Delay (uint16_t nCount);
uint8_t get_cout_content(__IO uint8_t *buff);
void SetupSerialPort();
void Printf(char *message);
void init_tim2();
void main(void)
{

  /* system_clock / 1 */
  CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
  
  /* Initialize LEDs mounted on STM8/128-EVAL board */


  SetupSerialPort();
  Printf("Hello\n");
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
  GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST);
  /* Enable general interrupts */
  enableInterrupts();


  /*Main Loop */
  while (1)
  {
    /* infinite loop */
   
 
    evt_reg++;Printf("Send:");char reg = evt_reg;Printf(&reg);Printf("\n");
    GPIO_WriteHigh(GPIOC,GPIO_PIN_5);
    Delay(0x00FF); 
    GPIO_WriteLow(GPIOC,GPIO_PIN_5);

/*
    TRIG_PORT->ODR |= TRIG_PIN; // TRIG high
    for(volatile int8_t i = 0; i < 5; i++);
    TRIG_PORT->ODR &= ~(TRIG_PIN); // TRIG low
    TIM2->CR1 |= TIM2_CR1_CEN; // start timer 2
*/
    for(int i = 0; i < 100; i++)Delay(0xFFFF); 
  }
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {}
}
#endif
void Delay(uint16_t nCount)
{
  /* Decrement nCount value */
  while (nCount != 0)
  {
    nCount--;
  }
}
/**
  * @}
  */
uint8_t get_cout_content(__IO uint8_t *buff){
    uint8_t c= 0;
    for(uint8_t i = 0;i<6;i++){
        if(buff[i]==0x00) break;
        c++;
    }
    return c;
}
//
//  Setup the UART to run at 115200 baud, no parity, one stop bit, 8 data bits.
//
//  Important: This relies upon the system clock being set to run at 16 MHz.
//
//
//  Send a message to the debug port (UART1).
//
void Printf(char *message)
{
    char *ch = message;
    while (*ch)
    {
        UART1->DR = (u8) (*ch);
        while ((UART1->SR & (u8) UART1_FLAG_TXE) == RESET);
        ch++;
    }
}
void SetupSerialPort()
{
    //
    //  Clear the Idle Line Detected bit in the status register by a read
    //  to the UART1_SR register followed by a Read to the UART1_DR register.
    //
    (void) UART1->SR;
    (void) UART1->DR;

    UART1->CR2 = UART1_CR2_RESET_VALUE;
    UART1->CR4 = UART1_CR4_RESET_VALUE;
    UART1->CR5 = UART1_CR5_RESET_VALUE;
    UART1->GTR = UART1_GTR_RESET_VALUE;
    UART1->PSCR = UART1_PSCR_RESET_VALUE;
    //
    //  Setup the port.
    //
    UART1->CR1 = (u8) UART1_WORDLENGTH_8D | (u8) UART1_PARITY_NO;   // Word length = 8, no parity.
    UART1->CR3 = (u8) UART1_STOPBITS_1;                             // 1 stop bit.

    UART1->BRR1 &= (uint8_t) (~UART1_BRR1_DIVM);
    UART1->BRR2 &= (uint8_t) (~UART1_BRR2_DIVM);
    UART1->BRR2 &= (uint8_t) (~UART1_BRR2_DIVF);
    //
    //  Set the clock prescaler for 11520 baud.  This assumes a 16 MHz clock speed.
    //
    UART1->BRR2 = 0x0b;
    UART1->BRR1 = 0x08;
    //
    //  Disable the Transmitter and Receiver before seting the LBCL, CPOL and CPHA bits
    //
    UART1->CR2 &= (u8) ~(UART1_CR2_TEN | UART1_CR2_REN);
    //
    //  Clear the Clock Polarity, lock Phase, Last Bit Clock pulse
    //
    UART1->CR3 &= (u8)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL);
    //
    //  Set the Clock Polarity, lock Phase, Last Bit Clock pulse
    //
    UART1->CR3 |= (u8)((u8) UART1_SYNCMODE_CLOCK_ENABLE &
                       (u8) (UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL));
    //
    //  Set the Tx and Rx state
    //
    UART1->CR2 |= (u8) ((u8) UART1_CR2_TEN | (u8) UART1_CR2_REN);
    UART1->CR3 &= (u8) (~UART1_CR3_CKEN);
}

/**
  * @brief  I2C Interrupt routine
  * @param None
  * @retval
  * None
  */
INTERRUPT_HANDLER(I2C_IRQHandler, 19)
{
  /* Read SR2 register to get I2C error */
  if ((I2C->SR2) != 0)
  {
    /* Clears SR2 register */
    I2C->SR2 = 0;

    /* Set LED2 */

  }
  Event = I2C_GetLastEvent();
  switch (Event)
  {
      /******* Slave transmitter ******/
      /* check on EV1 */
    case I2C_EVENT_SLAVE_TRANSMITTER_ADDRESS_MATCHED:
      reading = 0;
      read_p = buf;
      write_p = ((volatile uint8_t *)(&val) + 1);
      writing = 2;
      //Tx_Idx = 0;
      break;

      /* check on EV3 */
    case I2C_EVENT_SLAVE_BYTE_TRANSMITTING:
      /* Transmit data */
      //I2C_SendData(Slave_Buffer_Rx[Tx_Idx++]);
      I2C_SendData(*write_p--);
      writing--;
      break;
      /******* Slave receiver **********/
      /* check on EV1*/
    case I2C_EVENT_SLAVE_RECEIVER_ADDRESS_MATCHED:
        //Rx_Add_MATCHED=TRUE;
      break;

      /* Check on EV2*/
    case I2C_EVENT_SLAVE_BYTE_RECEIVED:
      //Slave_Buffer_Rx[Rx_Idx++] = I2C_ReceiveData();
       //ignore more than 3 bytes reading
        if (reading > 3)
          return;
        //read bytes from slave
        *read_p++ = I2C_ReceiveData();
        reading++;
      break;

      /* Check on EV4 */
  case I2C_EVENT_SLAVE_STOP_DETECTED:{
            /* write to CR2 to clear STOPF flag */
    if (buf[0] == EXTENSION_GET_EVT_REG){ //INT 
               val = 0x5678;//buf[1] + buf[2]+5;
               //writing = 1;
    } else if (buf[0] == EXTENSION_ROTATE_LED_REG)
              val =0x1234; //0x12 0x34
            else if (buf[0] == SR04_DIS_DATA_REG)
              val = sr04_dis_reg;
            
            I2C->CR2 |= I2C_CR2_ACK;
  }
      break;

    default:
      break;
  }

}
volatile uint16_t start = 0;
volatile uint16_t stop = 0;
void init_tim2()
{
    // Timer 2

    // Prescaler = 2^1 = 2, clk = 1 MHz
    TIM2->PSCR = 1;
    TIM2->EGR |= TIM2_EGR_UG;

    //only reset counter on UE
    TIM2->CR1 |= TIM2_CR1_UDIS;

    // connect input 2 to channel 1, TI2FP1
    TIM2->CCMR1 |= (TIM2_CCMR_CCxS & 2);
    // connect input 2 to channel 2, TI2FP2
    TIM2->CCMR2 |= (TIM2_CCMR_CCxS & 1);

    // Program filter
    // none by default
    // TIM2->CCMR2 bits IC2F

    // Select edge
    // ch 1 rising by default
    TIM2->CCER1 &= ~TIM2_CCER1_CC1P;
    // ch 2 falling
    TIM2->CCER1 |= TIM2_CCER1_CC2P;

    // Program prescaler
    // none by default
    // TIM2->CCMR2 bits IC2PSC

    // Enable capture
    TIM2->CCER1 |= TIM2_CCER1_CC1E;
    TIM2->CCER1 |= TIM2_CCER1_CC2E;

    // Enable CC2 interrupt
    TIM2->IER |= TIM2_IER_CC1IE;
    TIM2->IER |= TIM2_IER_CC2IE;
}
 INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
{
    // get value on rising edge
    if(TIM2->SR1 & TIM2_SR1_CC1IF)
    {
        start = (TIM2->CCR1H) * 256;
        start += TIM2->CCR1L;
 //       LED_PORT->ODR |= LED_PIN; // LED off
        //TIM2->EGR |= TIM2_EGR_UG; // reset counter
    }

    // read counter on falling edge
    if(TIM2->SR1 & TIM2_SR1_CC2IF)
    {
        stop = (TIM2->CCR2H) * 256;
        stop += TIM2->CCR2L;
   //     LED_PORT->ODR &= ~LED_PIN; // LED on
        uint8_t cm [2];// =0;// (stop-start)/58;
        cm[1]=0x00;cm[0]=0x00;
        cm[0] = (stop-start)/58;
        sr04_dis_reg = cm[0];
        GPIO_WriteHigh(GPIOC,GPIO_PIN_5);
        Delay(0x000F); 
        GPIO_WriteLow(GPIOC,GPIO_PIN_5);
        //Printf(&cm[0]);//Printf("\n");
       // printf("%uus %ucm\r\n", (stop-start), (stop-start)/58);
        //LED_PORT->ODR |= LED_PIN; // LED off
        TIM2->CR1 &= ~TIM2_CR1_CEN; // stop timer 2
    }

    // clear all flags
    TIM2->SR1 = 0;
}
/**
  * @}
  */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
