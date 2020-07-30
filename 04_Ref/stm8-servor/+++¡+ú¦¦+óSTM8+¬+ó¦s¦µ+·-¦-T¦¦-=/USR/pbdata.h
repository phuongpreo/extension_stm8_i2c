/************************ 自定义公共头文件 **************************************/

#ifndef _PBDATA_H//宏定义，定义文件名称
#define _PBDATA_H
#include "stm8s.h"//引入STM8的头文件
#include <stdio.h>//需要引用这个头文件才能实现
#include "math.h"//需要引用这个头文件才能实现


#include "led.h"  //引用LED头文件
#include "uart1.h"//引用RS232头文件
#include "i2c.h"
#include "at24cxx.h"
#include "tm1650.h"
#include "tim1_pwm.h"

void delay_us(u16 nCount); //微秒延时程序
void delay_ms(u16 nCount); //毫秒延时程序
u16 Get_decimal(double dt,u8 deci);   //获得数值小数部分

#endif //定义文件名称结束


/************************ 论坛地址 www.zxkjmcu.com ******************************/