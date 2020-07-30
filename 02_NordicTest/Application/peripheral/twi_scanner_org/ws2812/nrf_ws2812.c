#include "nrf_ws2812.h"
#define RED_COLOR_INDEX (0x00U)
#define GREEN_COLOR_INDEX (0x01U)
#define BLUE_COLOR_INDEX (0x02U)
#define YELLOW_COLOR_INDEX (0x03U)
#define VIOLET_COLOR_INDEX (0x04U)

static const uint32_t colour_hue[5] = {
 	0xFF0000,//Red	#FF0000	(255,0,0)
 	0x00FF00,//green	#00FF00	(0,255,0)
 	0x0000FF,//Blue	#0000FF	(0,0,255)
 	0xFFFF00,//Yellow	#FFFF00	(255,255,0)
 	0xFF00FF,//Magenta / Fuchsia	#FF00FF
};

static uint32_t mm_buffer_tx[I2S_BUFFER_SIZE];
uint32_t ws_set_faded_32(uint32_t color, uint8_t sat, uint8_t val);
#ifdef LOW_BATTERY
static uint8_t const m_brightness = 100;
#else
static uint8_t const m_brightness = 200;
#endif
static void data_handler(nrf_drv_i2s_buffers_t const * p_released,
                         uint32_t                      status)
{
    // 'nrf_drv_i2s_next_buffers_set' is called directly from the handler
    // each time next buffers are requested, so data corruption is not
    // expected.
    ASSERT(p_released);

    // When the handler is called after the transfer has been stopped
    // (no next buffers are needed, only the used buffers are to be
    // released), there is nothing to do.
    if (!(status & NRFX_I2S_STATUS_NEXT_BUFFERS_NEEDED))
    {
        return;
    }

    // First call of this handler occurs right after the transfer is started.
    // No data has been transferred yet at this point, so there is nothing to
    // check. Only the buffers for the next part of the transfer should be
    // provided.
    if (!p_released->p_rx_buffer)
    {
//        nrf_drv_i2s_buffers_t const next_buffers = {
//            .p_rx_buffer = m_buffer_rx[1],
//            .p_tx_buffer = m_buffer_tx[1],
//        };
//        APP_ERROR_CHECK(nrf_drv_i2s_next_buffers_set(&next_buffers));
//
//        mp_block_to_fill = m_buffer_tx[1];
//done_transferred = true;
//NRF_LOG_INFO("p_tx_buffer ");
    }
    else
    {
//    NRF_LOG_INFO("p_rx_buffer ");
//        mp_block_to_check = p_released->p_rx_buffer;
//        // The driver has just finished accessing the buffers pointed by
//        // 'p_released'. They can be used for the next part of the transfer
//        // that will be scheduled now.
//        APP_ERROR_CHECK(nrf_drv_i2s_next_buffers_set(p_released));
//
//        // The pointer needs to be typecasted here, so that it is possible to
//        // modify the content it is pointing to (it is marked in the structure
//        // as pointing to constant data because the driver is not supposed to
//        // modify the provided data).
//        mp_block_to_fill = (uint32_t *)p_released->p_tx_buffer;
    }
}
static bool ble_device_connected = false;
static uint8_t hsv_index = 0 ;
static bool select_color =true;
static volatile uint32_t m_color= colour_hue[0];
static uint8_t m_color_arlam_index = 0;

static uint8_t c[3];
static uint8_t WheelPos=0;
static uint8_t * Wheel(uint8_t j) {
  if(j < 85) {
   c[0]=j * 3;
   c[1]=255 - j * 3;
   c[2]=0;
  } else if(j < 170) {
   j -= 85;
   c[0]=255 - j * 3;
   c[1]=0;
   c[2]=j * 3;
  } else {
   j -= 170;
   c[0]=0;
   c[1]=j * 3;
   c[2]=255 - j * 3;
  }
}

void ws2812_init(){

    nrf_drv_i2s_config_t config = NRF_DRV_I2S_DEFAULT_CONFIG;
    //    config.sck_pin      = NRF_DRV_I2S_PIN_NOT_USED;
    //    config.lrck_pin   = NRF_DRV_I2S_PIN_NOT_USED;
    config.sdin_pin  = NRF_DRV_I2S_PIN_NOT_USED;
    config.mck_pin = NRF_DRV_I2S_PIN_NOT_USED;
    config.sdout_pin = NRF_WS2812_PIN;
    config.mck_setup = NRF_I2S_MCK_32MDIV10;
    config.ratio     = NRF_I2S_RATIO_32X;
    config.channels  = NRF_I2S_CHANNELS_STEREO;
    uint32_t err_code = nrf_drv_i2s_init(&config, data_handler);


    uint32_t color;



}
//chi set 3 byte cuoi
void ws_set_device_color(uint32_t color){
    uint8_t index= (color>>24)&0xFF; //check index firt byte user has set color
    if(index) {
      m_color = colour_hue[index-1];
    } else {
      m_color = color&0x00FFFFFF;
    }
}

uint32_t caclChannelValue(uint8_t level)
{
    uint32_t val = 0;

    // 0 
    if(level == 0) {
        val = 0x88888888;
    }
    // 255
    else if (level == 255) {
        val = 0xeeeeeeee;
    }
    else {
        // apply 4-bit 0xe HIGH pattern wherever level bits are 1.
        val = 0x88888888;
        for (uint8_t i = 0; i < 8; i++) {
            if((1 << i) & level) {
                uint32_t mask = ~(0x0f << 4*i);
                uint32_t patt = (0x0e << 4*i);
                val = (val & mask) | patt;
            }
        }

        // swap 16 bits
        val = (val >> 16) | (val << 16);
    }

    return val;
}

void ws_show(){
        // start I2S

        nrf_drv_i2s_buffers_t const initial_buffers = {
          .p_tx_buffer = mm_buffer_tx,
          .p_rx_buffer = NULL,
        };
         uint32_t err_code = nrf_drv_i2s_start(&initial_buffers, I2S_BUFFER_SIZE, 0);
         APP_ERROR_CHECK(err_code);
         nrf_delay_us(100);
         nrf_drv_i2s_stop();
}
void ws_set(uint8_t red,uint8_t green,uint8_t blue){
        int i = NLEDS-1;
        red= red*m_brightness/255;
        green= green*m_brightness/255;
        blue= blue*m_brightness/255;
        mm_buffer_tx[i]   =   caclChannelValue(green);
        mm_buffer_tx[i+1] =   caclChannelValue(red);
        mm_buffer_tx[i+2] =   caclChannelValue(blue);
}

//BGR
uint32_t colour_32[4] = {
		0x00cc7a,
		0xfff100,
//		0x20062f,
		0xff00df,
		0x00ff4a
		 };
static uint16_t cmd_show_count = 0;

void ws_set_show(uint8_t red,uint8_t green,uint8_t blue){
      ws_set(red,green,blue);
      ws_show();
}
//input 0xRGB
void ws_set_show_32(uint32_t color){
      uint8_t b = color & 0xff;
      uint8_t g = ((color) >> 8)& 0xff;
      uint8_t r =  (color  >> 16)& 0xff;
      ws_set(r,g,b);
      ws_show();
}
void ws_off(){
      ws_set(0,0,0);
      ws_show();
}
void ws_off_shutdown(){
      nrf_delay_ms(200);
      ws_set_show(0,0,0);
}
//input oxRGB , val:0->255
uint32_t ws_set_faded_32(uint32_t color, uint8_t sat, uint8_t val){
      uint8_t b = color & 0xff;
      uint8_t g = ((color) >> 8)& 0xff;
      uint8_t r =  (color  >> 16)& 0xff;
      r= r*val/255;
      g= g*val/255;
      b= b*val/255;

//  NRF_LOG_INFO("r g b:%d  %d  %d",r,g,b);
  ws_set_show(r,g,b); 
  return 0;
}
/*!
  @brief   Convert hue, saturation and value into a packed 32-bit RGB color
           that can be passed to setPixelColor() or other RGB-compatible
           functions.
  @param   hue  An unsigned 16-bit value, 0 to 65535, representing one full
                loop of the color wheel, which allows 16-bit hues to "roll
                over" while still doing the expected thing (and allowing
                more precision than the wheel() function that was common to
                prior NeoPixel examples).
  @param   sat  Saturation, 8-bit value, 0 (min or pure grayscale) to 255
                (max or pure hue). Default of 255 if unspecified.
  @param   val  Value (brightness), 8-bit value, 0 (min / black / off) to
                255 (max or full brightness). Default of 255 if unspecified.
  @return  Packed 32-bit RGB with the most significant byte set to 0 -- the
           white element of WRGB pixels is NOT utilized. Result is linearly
           but not perceptually correct, so you may want to pass the result
           through the gamma32() function (or your own gamma-correction
           operation) else colors may appear washed out. This is not done
           automatically by this function because coders may desire a more
           refined gamma-correction function than the simplified
           one-size-fits-all operation of gamma32(). Diffusing the LEDs also
           really seems to help when using low-saturation colors.
*/
uint32_t ws_set_ColorHSV(uint16_t hue, uint8_t sat, uint8_t val) {

  uint8_t r, g, b;

  // Remap 0-65535 to 0-1529. Pure red is CENTERED on the 64K rollover;
  // 0 is not the start of pure red, but the midpoint...a few values above
  // zero and a few below 65536 all yield pure red (similarly, 32768 is the
  // midpoint, not start, of pure cyan). The 8-bit RGB hexcone (256 values
  // each for red, green, blue) really only allows for 1530 distinct hues
  // (not 1536, more on that below), but the full unsigned 16-bit type was
  // chosen for hue so that one's code can easily handle a contiguous color
  // wheel by allowing hue to roll over in either direction.
//NRF_LOG_INFO("hue:%d",hue);
  hue = (hue * 1530L + 32768) / 65536;
//  NRF_LOG_INFO("hue:%d",hue);
  // Because red is centered on the rollover point (the +32768 above,
  // essentially a fixed-point +0.5), the above actually yields 0 to 1530,
  // where 0 and 1530 would yield the same thing. Rather than apply a
  // costly modulo operator, 1530 is handled as a special case below.

  // So you'd think that the color "hexcone" (the thing that ramps from
  // pure red, to pure yellow, to pure green and so forth back to red,
  // yielding six slices), and with each color component having 256
  // possible values (0-255), might have 1536 possible items (6*256),
  // but in reality there's 1530. This is because the last element in
  // each 256-element slice is equal to the first element of the next
  // slice, and keeping those in there this would create small
  // discontinuities in the color wheel. So the last element of each
  // slice is dropped...we regard only elements 0-254, with item 255
  // being picked up as element 0 of the next slice. Like this:
  // Red to not-quite-pure-yellow is:        255,   0, 0 to 255, 254,   0
  // Pure yellow to not-quite-pure-green is: 255, 255, 0 to   1, 255,   0
  // Pure green to not-quite-pure-cyan is:     0, 255, 0 to   0, 255, 254
  // and so forth. Hence, 1530 distinct hues (0 to 1529), and hence why
  // the constants below are not the multiples of 256 you might expect.

  // Convert hue to R,G,B (nested ifs faster than divide+mod+switch):
  if(hue < 510) {         // Red to Green-1
    b = 0;
    if(hue < 250) {       //   Red to Yellow-1
      r = 250;
      g = hue;            //     g = 0 to 254
    } else {              //   Yellow to Green-1
      r = 510 - hue;      //     r = 255 to 1
      g = 250;
    }
  } else if(hue < 1020) { // Green to Blue-1
    r = 0;
    if(hue <  760) {      //   Green to Cyan-1
      g = 250;
      b = hue - 510;      //     b = 0 to 254
    } else {              //   Cyan to Blue-1
      g = 1020 - hue;     //     g = 255 to 1
      b = 250;
    }
  } else if(hue < 1530) { // Blue to Red-1
    g = 0;
    if(hue < 1270) {      //   Blue to Magenta-1
      r = hue - 1020;     //     r = 0 to 254
      b = 250;
    } else {              //   Magenta to Red-1
      r = 250;
      b = 1530 - hue;     //     b = 255 to 1
    }
  } else {                // Last 0.5 Red (quicker than % operator)
    r = 250;
    g = b = 0;
  }


  // Apply saturation and value to R,G,B, pack into 32-bit result:

  r= r*val/255;
  g= g*val/255;
  b= b*val/255;

//  NRF_LOG_INFO("r g b:%d  %d  %d",r,g,b);
  ws_set_show(r,g,b); return 0;
//  uint32_t v1 =   1 + val; // 1 to 256; allows >>8 instead of /255
//  uint16_t s1 =   1 + sat; // 1 to 256; same reason
//  uint8_t  s2 = 255 - sat; // 255 to 0

//  uint32_t xxx = (((((rr >> 8) + s2) * v1) & 0xff00) << 8) |
//          ((((gg >> 8) + s2) * v1) & 0xff00)       |
//         ( (((bb >> 8) + s2) * v1)           >> 8);
//         ws_set_show_32(xxx);return 0;

}