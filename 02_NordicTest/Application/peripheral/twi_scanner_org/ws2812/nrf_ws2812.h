#ifndef MT_NRF_WS2812_H
#define MT_NRF_WS2812_H 

#include <stdio.h>
#include "nrf_drv_i2s.h"
#include "nrf_delay.h"
#include "app_error.h"
#include "nrf_log.h"

#define NLEDS 1
#define RESET_BITS 0
#define NRF_WS2812_PIN 17


#define I2S_BUFFER_SIZE (3*NLEDS + RESET_BITS)

void ws2812_init();
uint32_t caclChannelValue(uint8_t level);
void ws_set(uint8_t red,uint8_t green,uint8_t blue);
void ws_show();
void ws_off();
void ws_set_show(uint8_t red,uint8_t green,uint8_t blue);
void ws_set_show_32(uint32_t color);
void ws_set_device_color(uint32_t color); //device color
uint32_t ws_set_ColorHSV(uint16_t hue, uint8_t sat, uint8_t val);
#endif