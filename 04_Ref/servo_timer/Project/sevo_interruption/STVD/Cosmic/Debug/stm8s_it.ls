   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.31 - 09 Feb 2010
   3                     ; Generator V4.3.3 - 10 Feb 2010
  45                     ; 46 @far @interrupt void NonHandledInterrupt(void)
  45                     ; 47 {
  46                     	switch	.text
  47  0000               f_NonHandledInterrupt:
  51                     ; 51 	ppm ++;
  53  0000 be00          	ldw	x,_ppm
  54  0002 1c0001        	addw	x,#1
  55  0005 bf00          	ldw	_ppm,x
  56                     ; 52 }
  59  0007 80            	iret
  81                     ; 61 @far @interrupt void TRAP_IRQHandler(void)
  81                     ; 62 {
  82                     	switch	.text
  83  0008               f_TRAP_IRQHandler:
  87                     ; 66 }
  90  0008 80            	iret
 112                     ; 92 @far @interrupt void TLI_IRQHandler(void)
 112                     ; 93 #else /* _RAISONANCE_ */
 112                     ; 94 void TLI_IRQHandler(void) interrupt 0
 112                     ; 95 #endif /* _COSMIC_ */
 112                     ; 96 {
 113                     	switch	.text
 114  0009               f_TLI_IRQHandler:
 118                     ; 100 }
 121  0009 80            	iret
 143                     ; 110 @far @interrupt void AWU_IRQHandler(void)
 143                     ; 111 #else /* _RAISONANCE_ */
 143                     ; 112 void AWU_IRQHandler(void) interrupt 1
 143                     ; 113 #endif /* _COSMIC_ */
 143                     ; 114 {
 144                     	switch	.text
 145  000a               f_AWU_IRQHandler:
 149                     ; 118 }
 152  000a 80            	iret
 174                     ; 128 @far @interrupt void CLK_IRQHandler(void)
 174                     ; 129 #else /* _RAISONANCE_ */
 174                     ; 130 void CLK_IRQHandler(void) interrupt 2
 174                     ; 131 #endif /* _COSMIC_ */
 174                     ; 132 {
 175                     	switch	.text
 176  000b               f_CLK_IRQHandler:
 180                     ; 136 }
 183  000b 80            	iret
 206                     ; 146 @far @interrupt void EXTI_PORTA_IRQHandler(void)
 206                     ; 147 #else /* _RAISONANCE_ */
 206                     ; 148 void EXTI_PORTA_IRQHandler(void) interrupt 3
 206                     ; 149 #endif /* _COSMIC_ */
 206                     ; 150 {
 207                     	switch	.text
 208  000c               f_EXTI_PORTA_IRQHandler:
 212                     ; 154 }
 215  000c 80            	iret
 238                     ; 164 @far @interrupt void EXTI_PORTB_IRQHandler(void)
 238                     ; 165 #else /* _RAISONANCE_ */
 238                     ; 166 void EXTI_PORTB_IRQHandler(void) interrupt 4
 238                     ; 167 #endif /* _COSMIC_ */
 238                     ; 168 {
 239                     	switch	.text
 240  000d               f_EXTI_PORTB_IRQHandler:
 244                     ; 172 }
 247  000d 80            	iret
 270                     ; 182 @far @interrupt void EXTI_PORTC_IRQHandler(void)
 270                     ; 183 #else /* _RAISONANCE_ */
 270                     ; 184 void EXTI_PORTC_IRQHandler(void) interrupt 5
 270                     ; 185 #endif /* _COSMIC_ */
 270                     ; 186 {
 271                     	switch	.text
 272  000e               f_EXTI_PORTC_IRQHandler:
 276                     ; 190 }
 279  000e 80            	iret
 302                     ; 200 @far @interrupt void EXTI_PORTD_IRQHandler(void)
 302                     ; 201 #else /* _RAISONANCE_ */
 302                     ; 202 void EXTI_PORTD_IRQHandler(void) interrupt 6
 302                     ; 203 #endif /* _COSMIC_ */
 302                     ; 204 {
 303                     	switch	.text
 304  000f               f_EXTI_PORTD_IRQHandler:
 308                     ; 208 }
 311  000f 80            	iret
 334                     ; 218 @far @interrupt void EXTI_PORTE_IRQHandler(void)
 334                     ; 219 #else /* _RAISONANCE_ */
 334                     ; 220 void EXTI_PORTE_IRQHandler(void) interrupt 7
 334                     ; 221 #endif /* _COSMIC_ */
 334                     ; 222 {
 335                     	switch	.text
 336  0010               f_EXTI_PORTE_IRQHandler:
 340                     ; 226 }
 343  0010 80            	iret
 365                     ; 293 @far @interrupt void SPI_IRQHandler(void)
 365                     ; 294 #else /* _RAISONANCE_ */
 365                     ; 295 void SPI_IRQHandler(void) interrupt 10
 365                     ; 296 #endif /* _COSMIC_ */
 365                     ; 297 {
 366                     	switch	.text
 367  0011               f_SPI_IRQHandler:
 371                     ; 301 }
 374  0011 80            	iret
 397                     ; 311 @far @interrupt void TIM1_UPD_OVF_TRG_BRK_IRQHandler(void)
 397                     ; 312 #else /* _RAISONANCE_ */
 397                     ; 313 void TIM1_UPD_OVF_TRG_BRK_IRQHandler(void) interrupt 11
 397                     ; 314 #endif /* _COSMIC_ */
 397                     ; 315 {
 398                     	switch	.text
 399  0012               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 403                     ; 319 }
 406  0012 80            	iret
 429                     ; 329 @far @interrupt void TIM1_CAP_COM_IRQHandler(void)
 429                     ; 330 #else /* _RAISONANCE_ */
 429                     ; 331 void TIM1_CAP_COM_IRQHandler(void) interrupt 12
 429                     ; 332 #endif /* _COSMIC_ */
 429                     ; 333 {
 430                     	switch	.text
 431  0013               f_TIM1_CAP_COM_IRQHandler:
 435                     ; 337 }
 438  0013 80            	iret
 461                     ; 384 @far @interrupt void TIM2_UPD_OVF_BRK_IRQHandler(void)
 461                     ; 385 #else /* _RAISONANCE_ */
 461                     ; 386 void TIM2_UPD_OVF_BRK_IRQHandler(void) interrupt 13
 461                     ; 387 #endif /* _COSMIC_ */
 461                     ; 388 {
 462                     	switch	.text
 463  0014               f_TIM2_UPD_OVF_BRK_IRQHandler:
 467                     ; 392 }
 470  0014 80            	iret
 493                     ; 402 @far @interrupt void TIM2_CAP_COM_IRQHandler(void)
 493                     ; 403 #else /* _RAISONANCE_ */
 493                     ; 404 void TIM2_CAP_COM_IRQHandler(void) interrupt 14
 493                     ; 405 #endif /* _COSMIC_ */
 493                     ; 406 {
 494                     	switch	.text
 495  0015               f_TIM2_CAP_COM_IRQHandler:
 499                     ; 410 }
 502  0015 80            	iret
 528                     ; 422 @far @interrupt void TIM3_UPD_OVF_BRK_IRQHandler(void)
 528                     ; 423 #else /* _RAISONANCE_ */
 528                     ; 424 void TIM3_UPD_OVF_BRK_IRQHandler(void) interrupt 15
 528                     ; 425 #endif /* _COSMIC_ */
 528                     ; 426 {
 529                     	switch	.text
 530  0016               f_TIM3_UPD_OVF_BRK_IRQHandler:
 532  0016 3b0002        	push	c_x+2
 533  0019 be00          	ldw	x,c_x
 534  001b 89            	pushw	x
 535  001c 3b0002        	push	c_y+2
 536  001f be00          	ldw	x,c_y
 537  0021 89            	pushw	x
 540                     ; 431 	ppm += 10;	
 542  0022 be00          	ldw	x,_ppm
 543  0024 1c000a        	addw	x,#10
 544  0027 bf00          	ldw	_ppm,x
 545                     ; 433 	if(ppm < 2000)
 547  0029 be00          	ldw	x,_ppm
 548  002b a307d0        	cpw	x,#2000
 549  002e 2405          	jruge	L112
 550                     ; 435 		ppm = 2000;
 552  0030 ae07d0        	ldw	x,#2000
 553  0033 bf00          	ldw	_ppm,x
 554  0035               L112:
 555                     ; 437 	if(ppm > 4000)
 557  0035 be00          	ldw	x,_ppm
 558  0037 a30fa1        	cpw	x,#4001
 559  003a 2505          	jrult	L312
 560                     ; 439 		ppm = 2000;
 562  003c ae07d0        	ldw	x,#2000
 563  003f bf00          	ldw	_ppm,x
 564  0041               L312:
 565                     ; 442 	TIM2_SetCompare1(ppm);
 567  0041 be00          	ldw	x,_ppm
 568  0043 cd0000        	call	_TIM2_SetCompare1
 570                     ; 446 	TIM3_ClearITPendingBit(TIM3_IT_UPDATE);
 572  0046 a601          	ld	a,#1
 573  0048 cd0000        	call	_TIM3_ClearITPendingBit
 575                     ; 447 }
 578  004b 85            	popw	x
 579  004c bf00          	ldw	c_y,x
 580  004e 320002        	pop	c_y+2
 581  0051 85            	popw	x
 582  0052 bf00          	ldw	c_x,x
 583  0054 320002        	pop	c_x+2
 584  0057 80            	iret
 607                     ; 457 @far @interrupt void TIM3_CAP_COM_IRQHandler(void)
 607                     ; 458 #else /* _RAISONANCE_ */
 607                     ; 459 void TIM3_CAP_COM_IRQHandler(void) interrupt 16
 607                     ; 460 #endif /* _COSMIC_ */
 607                     ; 461 {
 608                     	switch	.text
 609  0058               f_TIM3_CAP_COM_IRQHandler:
 613                     ; 465 }
 616  0058 80            	iret
 638                     ; 514 @far @interrupt void I2C_IRQHandler(void)
 638                     ; 515 #else /* _RAISONANCE_ */
 638                     ; 516 void I2C_IRQHandler(void) interrupt 19
 638                     ; 517 #endif /* _COSMIC_ */
 638                     ; 518 {
 639                     	switch	.text
 640  0059               f_I2C_IRQHandler:
 644                     ; 522 }
 647  0059 80            	iret
 670                     ; 533 @far @interrupt void UART2_TX_IRQHandler(void)
 670                     ; 534 #else /* _RAISONANCE_ */
 670                     ; 535 void UART2_TX_IRQHandler(void) interrupt 20
 670                     ; 536 #endif /* _COSMIC_ */
 670                     ; 537 {
 671                     	switch	.text
 672  005a               f_UART2_TX_IRQHandler:
 676                     ; 541   }
 679  005a 80            	iret
 702                     ; 551 @far @interrupt void UART2_RX_IRQHandler(void)
 702                     ; 552 #else /* _RAISONANCE_ */
 702                     ; 553 void UART2_RX_IRQHandler(void) interrupt 21
 702                     ; 554 #endif /* _COSMIC_ */
 702                     ; 555 {
 703                     	switch	.text
 704  005b               f_UART2_RX_IRQHandler:
 708                     ; 559   }
 711  005b 80            	iret
 733                     ; 630 @far @interrupt void ADC1_IRQHandler(void)
 733                     ; 631 #else /* _RAISONANCE_ */
 733                     ; 632 void ADC1_IRQHandler(void) interrupt 22
 733                     ; 633 #endif /* _COSMIC_ */
 733                     ; 634 {
 734                     	switch	.text
 735  005c               f_ADC1_IRQHandler:
 739                     ; 639     return;
 742  005c 80            	iret
 765                     ; 671 @far @interrupt void TIM4_UPD_OVF_IRQHandler(void)
 765                     ; 672 #else /* _RAISONANCE_ */
 765                     ; 673 void TIM4_UPD_OVF_IRQHandler(void) interrupt 23
 765                     ; 674 #endif /* _COSMIC_ */
 765                     ; 675 {
 766                     	switch	.text
 767  005d               f_TIM4_UPD_OVF_IRQHandler:
 771                     ; 679 }
 774  005d 80            	iret
 797                     ; 690 @far @interrupt void EEPROM_EEC_IRQHandler(void)
 797                     ; 691 #else /* _RAISONANCE_ */
 797                     ; 692 void EEPROM_EEC_IRQHandler(void) interrupt 24
 797                     ; 693 #endif /* _COSMIC_ */
 797                     ; 694 {
 798                     	switch	.text
 799  005e               f_EEPROM_EEC_IRQHandler:
 803                     ; 698 }
 806  005e 80            	iret
 818                     	xref.b	_ppm
 819                     	xdef	f_EEPROM_EEC_IRQHandler
 820                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 821                     	xdef	f_ADC1_IRQHandler
 822                     	xdef	f_UART2_TX_IRQHandler
 823                     	xdef	f_UART2_RX_IRQHandler
 824                     	xdef	f_I2C_IRQHandler
 825                     	xdef	f_TIM3_CAP_COM_IRQHandler
 826                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
 827                     	xdef	f_TIM2_CAP_COM_IRQHandler
 828                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 829                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 830                     	xdef	f_TIM1_CAP_COM_IRQHandler
 831                     	xdef	f_SPI_IRQHandler
 832                     	xdef	f_EXTI_PORTE_IRQHandler
 833                     	xdef	f_EXTI_PORTD_IRQHandler
 834                     	xdef	f_EXTI_PORTC_IRQHandler
 835                     	xdef	f_EXTI_PORTB_IRQHandler
 836                     	xdef	f_EXTI_PORTA_IRQHandler
 837                     	xdef	f_CLK_IRQHandler
 838                     	xdef	f_AWU_IRQHandler
 839                     	xdef	f_TLI_IRQHandler
 840                     	xdef	f_TRAP_IRQHandler
 841                     	xdef	f_NonHandledInterrupt
 842                     	xref	_TIM3_ClearITPendingBit
 843                     	xref	_TIM2_SetCompare1
 844                     	xref.b	c_x
 845                     	xref.b	c_y
 864                     	end
