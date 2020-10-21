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
#define GET_CONFIG_REG 0x1E
#define GET_TYPE_DEVICE_REG 0x1F
#define GET_EVT_REG 0x20
#define GET_SR04_DIS_DATA_REG 0x21
#define GET_SERVO_ANGLE_REG 0x23

#define SET_CONFIG_REG 0x9E
#define SET_SR04_CONFIG_REG 0xA1
#define SET_SERVO_ANGLE_REG 0xA3
#define SET_SR04_IRQ_DIST_REG 0xA2
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
  /* Private variables ---------------------------------------------------------*/
__IO uint8_t Slave_Buffer_Rx[6];//255
__IO uint8_t Tx_Idx = 0, Rx_Idx = 0;
//__IO uint16_t Event = 0x00;
volatile bool is_new_servo_angle = FALSE;
volatile bool is_done_mean_dis = TRUE;
volatile bool is_stop =FALSE;
volatile bool Rx_Add_MATCHED =FALSE;
volatile bool Tx_Add_MATCHED =FALSE;

volatile uint8_t *read_p;
volatile uint8_t *write_p;
volatile uint8_t writing;
volatile uint8_t reading;


volatile uint8_t buf[3];
volatile uint8_t val;
/*register*/
#define KODIMO 0x40
#define LED_SERVO_EXTENSION 0x01
volatile uint8_t _evt_reg = 0x00;
volatile uint8_t _sr04_dis_reg=0x00;
volatile uint8_t _config = 0x00;
volatile uint8_t _servo_angle = 0x00;
volatile uint8_t _sr04_config_reg = 0x00;
const uint8_t _type_device_reg = KODIMO|LED_SERVO_EXTENSION; 

bool irq_sr04_on =FALSE;

/*variable*/
volatile bool en_irq_distance = FALSE; /*bien lay ra tu thanh ghi config SR04, kt co enable ngat khong*/
volatile int  g_evt = 0;
volatile char g_buf = 0;
uint8_t distance_detected = 10 ; /*khoang cach detect ultrasonic unit: cm*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
/* Public functions ----------------------------------------------------------*/

/**
  * @brief  Main program.
  * @param  None
  * @retval None
  */
void Delay (uint16_t nCount);
void Delay_us(uint32_t time_delay);
void Delay_ms(uint32_t time_delay);
uint8_t get_cout_content(__IO uint8_t *buff);
void Timer1_PWM_Configuration(void);
void SetupSerialPort();
void Printf(char *message);
void ServoSetAngle(uint8_t angle);
void init_tim2();
/*
Tao xung ngan tren Pin C5  detect LOW->HIGH
*/
static inline void genIRQ(){
  
  GPIO_WriteHigh(GPIOC,GPIO_PIN_5);
  Delay(0x000F); 
  GPIO_WriteLow(GPIOC,GPIO_PIN_5);
}
void print_value(uint8_t value){
    Printf("value=");
    if(!value) Printf("NULL");
    else if(value<10) Printf("10");
    else if(value<20) Printf("20");
    else if(value<30) Printf("30");
    else if(value<40) Printf("40");
    else if(value<50) Printf("50");
    else if(value<60) Printf("60");
    else if(value<70) Printf("70");
    else Printf("100");
    Printf("\n");
}
void main(void)
{

  /* system_clock / 1 */
  CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
  
  /* Initialize LEDs mounted on STM8/128-EVAL board */

	
  SetupSerialPort();
  Printf("Hello\n");
  I2C_DeInit();

   // UART1_Init((uint32_t)115200, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO,
   // UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
  /* Initialize I2C peripheral */

#ifdef I2C_slave_7Bits_Address
  I2C_Init(100000, SLAVE_ADDRESS, I2C_DUTYCYCLE_2, I2C_ACK_CURR, I2C_ADDMODE_7BIT, 16);
  Printf("7bit\n");
#else
  I2C_Init(100000, SLAVE_ADDRESS, I2C_DUTYCYCLE_2, I2C_ACK_CURR,I2C_ADDMODE_10BIT, 16);
#endif

  /* Enable Error Interrupt*/
  I2C_ITConfig((I2C_IT_TypeDef)(I2C_IT_ERR | I2C_IT_EVT | I2C_IT_BUF), ENABLE);
  
  //GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST);
  GPIO_Init(GPIOC, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST);
  
  
    /* TRIG */
  #define TRIG_PORT   GPIOD
  #define TRIG_PIN    GPIO_PIN_2
  TRIG_PORT->ODR &= (uint8_t)(~TRIG_PIN); // default low
  TRIG_PORT->CR1 |= (uint8_t)TRIG_PIN;    // push-pull
  TRIG_PORT->CR2 &= (uint8_t)(~TRIG_PIN); // slow
  TRIG_PORT->DDR |= (uint8_t)TRIG_PIN;    // output
    
    
  I2C_Cmd(ENABLE);
  init_tim2();
  Timer1_PWM_Configuration();
  /* Enable general interrupts */
  enableInterrupts();

  ServoSetAngle(0);
  /*Main Loop */
  int16_t c =0;
  
  while (1)
  {
    /* infinite loop */
//    if(is_stop) {
//      Printf("rec\n");
//      is_stop=FALSE;
//    }
    /*
    if(c==1000)    {
      ServoSetAngle(_servo_angle);
    }
    if(c==1999)    {
      ServoSetAngle(_servo_angle);
    }
    */


    //evt_reg++;Printf("Send:");
/*
    GPIO_WriteHigh(GPIOC,GPIO_PIN_5);
    Delay(0x00FF); 
    GPIO_WriteLow(GPIOC,GPIO_PIN_5);
    Delay_ms(100);
    if(is_stop){
      char reg = reading+0x30;
      Printf("len:");Printf(&reg);
      Printf("\n");
      is_stop=FALSE;
    }
    Delay_ms(1000);
*/

    //Delay_ms(1);
    c++;
    if(is_new_servo_angle){
      ServoSetAngle(_servo_angle);
      is_new_servo_angle=FALSE;
    }
    if(irq_sr04_on) {
      irq_sr04_on=FALSE;
      genIRQ();
    }
    switch(g_evt){
    case 0:
      break;
    case 0xfe:
      Printf("e\n");
      break;
    case 0xff:
      Printf("f\n");
      break;
    case GET_CONFIG_REG:
      Printf("GET_CONFIG_REG\n");
      break;
    case GET_TYPE_DEVICE_REG:
      Printf("GET_TYPE_DEVICE_REG\n");
      break;
    case GET_EVT_REG:
      Printf("GET_EVT_REG");
      break;
    case GET_SR04_DIS_DATA_REG:
      Printf("GET_SR04_DIS_DATA_REG\n");
      break;
    case GET_SERVO_ANGLE_REG:
      Printf("GET_SERVO_ANGLE_REG\n");
      break;
    case SET_CONFIG_REG:
      Printf("SET_CONFIG_REG\n");
      break;
    case SET_SERVO_ANGLE_REG:
      Printf("SET_SERVO_ANGLE_REG\n");
      break;
    case SET_SR04_CONFIG_REG:
      Printf("SET_SR04_CONFIG_REG\n");
      break;
    case SET_SR04_IRQ_DIST_REG:
      Printf("SET_SR04_IRQ_DIST_REG\n");
      break;
    default:
      Printf("x\n");
      break;
    }
    g_evt=0;
    if(c%200==0){
        //Printf(".");
        //print_value(_sr04_dis_reg);
        //Printf(_sr04_dis_reg);
        if(_sr04_config_reg==0){//kiem tra enable sr04
          
          TIM2->CR1 &= ~TIM2_CR1_CEN; // stop timer 2
          _sr04_dis_reg=0x00;
          is_done_mean_dis  =FALSE;
        }else if(_sr04_config_reg==1){//neu enable roi thi bat timer 2
          TRIG_PORT->ODR |= TRIG_PIN; // TRIG high
          for(volatile int8_t i = 0; i < 5; i++);
          TRIG_PORT->ODR &= ~(TRIG_PIN); // TRIG low
          TIM2->CR1 |= TIM2_CR1_CEN; // start timer 2
        }
    }
    if(c==2000) {
      
      c=0;
      //Printf("\n");
      //Printf("en=");
      //print_value(en_irq_distance);
      //Printf("dis=");
      //print_value(distance_detected);
    }
    /*
    if(is_done_mean_dis){
        TRIG_PORT->ODR |= TRIG_PIN; // TRIG high
        for(volatile int8_t i = 0; i < 5; i++);
        TRIG_PORT->ODR &= ~(TRIG_PIN); // TRIG low
        TIM2->CR1 |= TIM2_CR1_CEN; // start timer 2
        is_done_mean_dis=FALSE;
    }
    */
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
//    char *ch = message;
//    while (*ch)
//    {
//        UART1->DR = (u8) (*ch);
//        while ((UART1->SR & (u8) UART1_FLAG_TXE) == RESET);
//        ch++;
//    }
}
//Setup PWM Servo
void ServoSetAngle(uint8_t angle){
  TIM1_SetCompare3(angle*40+360);//1000-10000 : 0-100
}
void Timer1_PWM_Configuration(void)
{
    TIM1_DeInit();								// reset all register timer1
    CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);	                // provide clock for timer1
    TIM1_TimeBaseInit(4,TIM1_COUNTERMODE_UP, 39999,0);			// config frequency interrupt PSC= 15999+1 =16000, ARR = 1000 -> F_interrupt = 16*10^6 / 1/40000 = 1Hz = 1s
    TIM1_OC3Init(TIM1_OCMODE_PWM1, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_DISABLE,
    3000, TIM1_OCPOLARITY_HIGH, TIM1_OCNPOLARITY_HIGH, TIM1_OCIDLESTATE_SET,
    TIM1_OCNIDLESTATE_SET);							// config mode PWM1, enable TIM1_CH1 duty 20% , disable TIM1_CH1N 
    TIM1_ARRPreloadConfig(ENABLE);						// enable register auto reload active -  over timer -> reset counter
    TIM1_OC3PreloadConfig(ENABLE);						// enable reload mode output compare - TIM1_CMMR1
    TIM1_Cmd(ENABLE);								// active timer
    TIM1_CtrlPWMOutputs(ENABLE);						// active PWM output
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

//
//INTERRUPT_HANDLER(I2C_IRQHandler, 19)
//{
//  /* Read SR2 register to get I2C error:rst22 */
//  if ((I2C->SR2) != 0)
//  {
//    /* Clears SR2 register */
//    I2C->SR2 = 0;
//
//    /* Set LED2 */
//
//  }
//  switch (I2C_GetLastEvent())
//  {
//      /******* Slave transmitter ******/ //tuong duong voi i2c master read data
//      /* check on EV1 */
//    case I2C_EVENT_SLAVE_TRANSMITTER_ADDRESS_MATCHED:
//      Tx_Add_MATCHED=TRUE;
//      reading = 0;
//      read_p = buf;
//      write_p = ((volatile uint8_t *)(&val) + 0);//((volatile uint8_t *)(&val) + 1); Dung cho val =16 byte
//      writing = 1;
//      //Tx_Idx = 0;
//      //g_evt = 0xfe;
//      Printf("t");
//      break;
//
//      /* check on EV3 */
//    case I2C_EVENT_SLAVE_BYTE_TRANSMITTING:
//      Printf("2");
//      /* Transmit data */
//      //I2C_SendData(Slave_Buffer_Rx[Tx_Idx++]);
//      if(writing==0) {
//        I2C_SendData(0x00) ;
//      }else 
//      {
//        I2C_SendData(*write_p--);
//      }
//      while (!I2C_CheckEvent(I2C_EVENT_SLAVE_BYTE_TRANSMITTED));
//      writing--;
//      break;
//      /******* Slave receiver **********///master write data
//      /* check on EV1*/
//    case I2C_EVENT_SLAVE_RECEIVER_ADDRESS_MATCHED:
//            Rx_Add_MATCHED = TRUE;
//            reading = 0;
//            read_p = buf;
//            //g_evt = 0xff;
//            Printf("r");
//      break;
//
//      /* Check on EV2*/
//    case I2C_EVENT_SLAVE_BYTE_RECEIVED:
//      
////Slave_Buffer_Rx[Rx_Idx++] = I2C_ReceiveData();
////ignore more than 3 bytes reading
////      if (reading > 3){
////        reading=0;
////       read_p=buf;
////        return;
////      }
////read bytes from slave
//        *read_p++ = I2C_ReceiveData();
//        reading++;
//        
//      break;
//
//      /* Check on EV4 */
//  case I2C_EVENT_SLAVE_STOP_DETECTED:{
//    Printf("d");
//            /* write to CR2 to clear STOPF flag */
//    g_buf=buf[0];
//    //g_evt = buf[0];
//    switch(buf[0]){
//    case GET_CONFIG_REG:
//      val = _config;
//      break;
//    case GET_TYPE_DEVICE_REG:
//      val = _type_device_reg;
//      break;
//    case GET_EVT_REG:
//      val = _evt_reg;_evt_reg=0x00;
//      break;
//    case GET_SR04_DIS_DATA_REG:
//      val = _sr04_dis_reg;
//      break;
//    case GET_SERVO_ANGLE_REG:
//      val = _servo_angle;
//      break;
//    case SET_CONFIG_REG:
//      _config = buf[1];
//      break;
//    case SET_SERVO_ANGLE_REG:
//      //g_evt=SET_SERVO_ANGLE_REG;
//      _servo_angle = buf[1];
//      ServoSetAngle(_servo_angle);
//      break;
//    case SET_SR04_CONFIG_REG:
//      _sr04_config_reg=buf[1];
//      break;
//    case SET_SR04_IRQ_DIST_REG:
//      en_irq_distance = buf[1]&0x01; //lay bit cuoi
//      distance_detected = (buf[1]>>2)&0x3F; //lay khoang cach but [7:3]
//      break;
//    default:
//      break;
//    }
///*
//    if (buf[0] == EXTENSION_GET_EVT_REG){ //INT 
//               val = evt_reg;//buf[1] + buf[2];
//    } else if (buf[0] == EXTENSION_ROTATE_LED_REG){
//              //val =0x1234; //0x12 0x34
//              evt_reg = buf[1];
//    }
//    else if (buf[0] == SR04_DIS_DATA_REG){
//              val = sr04_dis_reg;
//    } else if (buf[0] >= 0x80) { //con lai la set value
//      is_stop=TRUE;
//    }
//*/
//            I2C->CR2 |= I2C_CR2_ACK;
//    //char* a;*a= 0x30+g_buf;
//    Printf("s");
//  }
//      break;
//    default:
//      break;
//  }
//
//}

INTERRUPT_HANDLER(I2C_IRQHandler, 19)
{
    static u8 sr1;                  
    static u8 sr2;
    static u8 sr3;
 
    // save the I2C registers configuration
    sr1 = I2C->SR1;
    sr2 = I2C->SR2;
    sr3 = I2C->SR3;
 
    /* Communication error? */
  if (sr2 & (I2C_SR2_WUFH | I2C_SR2_OVR |I2C_SR2_ARLO |I2C_SR2_BERR))
  {     
    I2C->CR2|= I2C_CR2_STOP;  // stop communication - release the lines
    I2C->SR2= 0;                        // clear all error flags
   Printf("b");
    }
 
    /* More bytes received ? */
  if ((sr1 & (I2C_SR1_RXNE | I2C_SR1_BTF)) == (I2C_SR1_RXNE | I2C_SR1_BTF))
  {
    //I2C_byte_received(I2C->DR);
    Printf("1");
        Slave_Buffer_Rx[Rx_Idx++] = I2C->DR;
        
  }
 
    /* Byte received ? */
  if (sr1 & I2C_SR1_RXNE)
  {
    //I2C_byte_received(I2C->DR);
        Slave_Buffer_Rx[Rx_Idx++] = I2C->DR;
         Printf("r");
         switch(Slave_Buffer_Rx[0]){
          case SET_CONFIG_REG:
            _config = Slave_Buffer_Rx[1];
            break;
          case SET_SERVO_ANGLE_REG:
            //g_evt=SET_SERVO_ANGLE_REG;
            _servo_angle = Slave_Buffer_Rx[1];
            is_new_servo_angle = TRUE;
            //ServoSetAngle(_servo_angle);
            break;
          case SET_SR04_CONFIG_REG:
            _sr04_config_reg=Slave_Buffer_Rx[1];
            break;
          case SET_SR04_IRQ_DIST_REG:
            en_irq_distance = Slave_Buffer_Rx[1]&0x01; //lay bit cuoi
            distance_detected = (Slave_Buffer_Rx[1]>>2)&0x3F; //lay khoang cach but [7:3]
            break;
          default:
            break;
          }
  }
 
    /* NAK? (=end of slave transmit comm) */
  if (sr2 & I2C_SR2_AF)
  { 
    I2C->SR2 &= ~I2C_SR2_AF;      // clear AF
            Printf("o");
    }
 
    /* Stop bit from Master  (= end of slave receive comm) */
  if (sr1 & I2C_SR1_STOPF) 
  {
    I2C->CR2 |= I2C_CR2_ACK;      // CR2 write to clear STOPF
            Printf("i");
    }
 
    /* Slave address matched (= Start Comm) */
  if (sr1 & I2C_SR1_ADDR)
  {
        Rx_Idx = 0;
        Printf("2");
    }
 
    /* More bytes to transmit ? */
  if ((sr1 & (I2C_SR1_TXE | I2C_SR1_BTF)) == (I2C_SR1_TXE | I2C_SR1_BTF))
  {
        I2C_SendData(0x00);
        Printf("3");
  }
 
    /* Byte to transmit ? */
  if (sr1 & I2C_SR1_TXE)
  {
 
        if (Rx_Idx == 0)
        {
          uint8_t val=0xff;
          switch(Slave_Buffer_Rx[0]){
            case GET_CONFIG_REG:
              val = _config;
              break;
            case GET_TYPE_DEVICE_REG:
              val = _type_device_reg;
              break;
            case GET_EVT_REG:
              val = _evt_reg;_evt_reg=0x00;
              break;
            case GET_SR04_DIS_DATA_REG:
              val = _sr04_dis_reg;
              break;
            case GET_SERVO_ANGLE_REG:
              val = _servo_angle;
              break;
            default:
              break;
          }
            I2C->DR = val;//(0x41 >> 8);
        }
        else if (Rx_Idx ==1)
        {           
            I2C->DR = 0xfe;
        }
        else
        {
            I2C->DR = 0xff;
        }
        Rx_Idx++;    
        Printf("5");
  } 
 
    return; 
}




volatile uint16_t start = 0;
volatile uint16_t stop = 0;
void init_tim2()
{
    // Timer 2

    // Prescaler = 2^1 = 2, clk = 1 MHz
    TIM2->PSCR = 4;
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
        TIM2->CR1 &= ~TIM2_CR1_CEN; // stop timer 2
   //     LED_PORT->ODR &= ~LED_PIN; // LED on
        uint8_t cm [2];// =0;// (stop-start)/58;
        cm[1]=0x00;cm[0]=0x00;
        
        int16_t cmm = (stop-start);//58
        cmm=cmm/58;
        if(cmm<0 || cmm > 150) cmm = 150;
        cm[0]=(uint8_t)cmm;
        // printf("%uus %ucm\r\n", (stop-start),(stop-start)/58);
        
        if(en_irq_distance==1 && (cm[0]<=distance_detected))//kiem tra co enable ngat khong co thì sinh ngat
        {
          if(_sr04_dis_reg!=cm[0]){
          _sr04_dis_reg = cm[0];
          _evt_reg = 0x01;
          irq_sr04_on=TRUE;
          }
        } else {
          _sr04_dis_reg = cm[0];
        }

        is_done_mean_dis  =TRUE; //khong dung cai nay vi no delay 1ms trong main loop
    }
    // clear all flags
    TIM2->SR1 = 0;
}

/**
  * @}
  */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
