/**
 * Copyright (c) 2016 - 2019, Nordic Semiconductor ASA
 *
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice, this
 *    list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form, except as embedded into a Nordic
 *    Semiconductor ASA integrated circuit in a product or a software update for
 *    such product, must reproduce the above copyright notice, this list of
 *    conditions and the following disclaimer in the documentation and/or other
 *    materials provided with the distribution.
 *
 * 3. Neither the name of Nordic Semiconductor ASA nor the names of its
 *    contributors may be used to endorse or promote products derived from this
 *    software without specific prior written permission.
 *
 * 4. This software, with or without modification, must only be used with a
 *    Nordic Semiconductor ASA integrated circuit.
 *
 * 5. Any software provided in binary form under this license must not be reverse
 *    engineered, decompiled, modified and/or disassembled.
 *
 * THIS SOFTWARE IS PROVIDED BY NORDIC SEMICONDUCTOR ASA "AS IS" AND ANY EXPRESS
 * OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY, NONINFRINGEMENT, AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL NORDIC SEMICONDUCTOR ASA OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 * GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
 * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */
/** @file
 * @defgroup tw_scanner main.c
 * @{
 * @ingroup nrf_twi_example
 * @brief TWI Sensor Example main file.
 *
 * This file contains the source code for a sample application using TWI.
 *
 */

#include <stdio.h>
#include "boards.h"
#include "app_util_platform.h"
#include "app_error.h"
#include "nrf_drv_twi.h"


#include "nrf_drv_gpiote.h"

#include "nrf_log.h"
#include "nrf_log_ctrl.h"
#include "nrf_log_default_backends.h"
#include "nrf_ws2812.h"
///* TWI instance ID. */
//#if TWI0_ENABLED
//#define TWI_INSTANCE_ID     0
//#elif TWI1_ENABLED
//#define TWI_INSTANCE_ID     1
//#endif

 /* Number of possible TWI addresses. */
//#define TWI_ADDRESSES      127
//#define MPU_TWI_BUFFER_SIZE     	14 // 14 byte buffers will suffice to read acceleromter, gyroscope and temperature data in one transmission.

///* TWI instance. */
//static const nrf_drv_twi_t m_twi = NRF_DRV_TWI_INSTANCE(TWI_INSTANCE_ID);
//
//volatile static bool twi_tx_done = false;
//volatile static bool twi_rx_done = false;
//
//uint8_t twi_tx_buffer[MPU_TWI_BUFFER_SIZE];
//
//static void nrf_drv_mpu_twi_event_handler(nrf_drv_twi_evt_t const * p_event, void * p_context)
//{
//    switch(p_event->type)
//    {
//        case NRF_DRV_TWI_EVT_DONE:
//            switch(p_event->xfer_desc.type)
//            {
//                case NRF_DRV_TWI_XFER_TX:
//                    twi_tx_done = true;
//                    break;
//                case NRF_DRV_TWI_XFER_TXTX:
//                    twi_tx_done = true;
//                    break;
//                case NRF_DRV_TWI_XFER_RX:
//                    twi_rx_done = true;
//                    break;
//                case NRF_DRV_TWI_XFER_TXRX:
//                    twi_rx_done = true;
//                    break;
//                default:
//                    break;
//            }
//            break;
//        case NRF_DRV_TWI_EVT_ADDRESS_NACK:
//            break;
//        case NRF_DRV_TWI_EVT_DATA_NACK:
//            break;
//        default:
//            break;
//    }
//}
//
///**
// * @brief TWI initialization.
// */
//void twi_init (void)
//{
//    ret_code_t err_code;
//
//    const nrf_drv_twi_config_t twi_config = {
//       .scl                = ARDUINO_SCL_PIN,
//       .sda                = ARDUINO_SDA_PIN,
//       .frequency          = NRF_DRV_TWI_FREQ_100K,
//       .interrupt_priority = APP_IRQ_PRIORITY_HIGH,
//       .clear_bus_init     = false
//    };
//
//    err_code = nrf_drv_twi_init(&m_twi, &twi_config, nrf_drv_mpu_twi_event_handler, NULL);
//    APP_ERROR_CHECK(err_code);
//
//    nrf_drv_twi_enable(&m_twi);
//}

#define PIN_IN BSP_BUTTON_0
#define PIN_OUT BSP_LED_0
volatile bool is_irq_extension =false;
void in_pin_handler(nrf_drv_gpiote_pin_t pin, nrf_gpiote_polarity_t action)
{
    nrf_drv_gpiote_out_toggle(PIN_OUT);
    is_irq_extension = true;
}


/**
 * @brief Function for main application entry.
 */
int main(void)
{
    ret_code_t err_code;


    APP_ERROR_CHECK(NRF_LOG_INIT(NULL));
    NRF_LOG_DEFAULT_BACKENDS_INIT();

    NRF_LOG_INFO("TWI scanner started.");
    NRF_LOG_FLUSH();

    err_code = nrf_drv_gpiote_init();
    APP_ERROR_CHECK(err_code);


    nrf_drv_gpiote_out_config_t out_config = GPIOTE_CONFIG_OUT_SIMPLE(false);

    err_code = nrf_drv_gpiote_out_init(PIN_OUT, &out_config);
    APP_ERROR_CHECK(err_code);



    nrf_drv_gpiote_in_config_t in_config = GPIOTE_CONFIG_IN_SENSE_LOTOHI(false);
    in_config.pull = NRF_GPIO_PIN_PULLUP;

    err_code = nrf_drv_gpiote_in_init(PIN_IN, &in_config, in_pin_handler);
    APP_ERROR_CHECK(err_code);

    nrf_drv_gpiote_in_event_enable(PIN_IN, true);


    nrf_drv_mpu_init();
    NRF_LOG_INFO("111");
    NRF_LOG_FLUSH();
    //Set Commands
#define EXTENSION_SET_REG 0x01
//GET commands
#define EXTENSION_GET_EVT_REG 0x02
#define EXTENSION_ROTATE_LED_REG 0x10
#define EXTENSION_ROTATE_LED2_REG 0x11
    uint8_t p[1] = {0x00};
    while (true)
    {
//      scan_address();
      if(is_irq_extension){
        nrf_drv_mpu_read_registers(EXTENSION_GET_EVT_REG,p,1);
        NRF_LOG_INFO("p0=%x",p[0]);
//         NRF_LOG_INFO("p1=%x",p[1]); 
        is_irq_extension=false;
      }
//      nrf_drv_mpu_write_registers(0x01,p,1);
//      nrf_drv_mpu_write_single_register(0x01,0x03);
//      NRF_LOG_INFO("p=%x",p[1]); 
      NRF_LOG_FLUSH();
    };


//    ws2812_init();
//    while (true)
//    {
//    ws_set_show_32(0x00cc7a);
//    nrf_delay_ms(200);
//    ws_set_show_32(0xffcc7a);
//    nrf_delay_ms(200);
//        /* Empty loop. */
//    }
}

/** @} */
