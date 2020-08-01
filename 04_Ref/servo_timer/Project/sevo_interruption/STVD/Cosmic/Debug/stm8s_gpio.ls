   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.31 - 09 Feb 2010
   3                     ; Generator V4.3.3 - 10 Feb 2010
 109                     ; 45 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 109                     ; 46 {
 111                     	switch	.text
 112  0000               _GPIO_DeInit:
 116                     ; 47     GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 118  0000 7f            	clr	(x)
 119                     ; 48     GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 121  0001 6f02          	clr	(2,x)
 122                     ; 49     GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 124  0003 6f03          	clr	(3,x)
 125                     ; 50     GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 127  0005 6f04          	clr	(4,x)
 128                     ; 51 }
 131  0007 81            	ret
 371                     ; 62 void GPIO_Init(GPIO_TypeDef* GPIOx,
 371                     ; 63                GPIO_Pin_TypeDef GPIO_Pin,
 371                     ; 64                GPIO_Mode_TypeDef GPIO_Mode)
 371                     ; 65 {
 372                     	switch	.text
 373  0008               _GPIO_Init:
 375  0008 89            	pushw	x
 376       00000000      OFST:	set	0
 379                     ; 70     assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 381                     ; 71     assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 383                     ; 77     if ((((u8)(GPIO_Mode)) & (u8)0x80) != (u8)0x00) /* Output mode */
 385  0009 7b06          	ld	a,(OFST+6,sp)
 386  000b a580          	bcp	a,#128
 387  000d 271d          	jreq	L771
 388                     ; 79         if ((((u8)(GPIO_Mode)) & (u8)0x10) != (u8)0x00) /* High level */
 390  000f 7b06          	ld	a,(OFST+6,sp)
 391  0011 a510          	bcp	a,#16
 392  0013 2706          	jreq	L102
 393                     ; 81             GPIOx->ODR |= (u8)GPIO_Pin;
 395  0015 f6            	ld	a,(x)
 396  0016 1a05          	or	a,(OFST+5,sp)
 397  0018 f7            	ld	(x),a
 399  0019 2007          	jra	L302
 400  001b               L102:
 401                     ; 84             GPIOx->ODR &= (u8)(~(GPIO_Pin));
 403  001b 1e01          	ldw	x,(OFST+1,sp)
 404  001d 7b05          	ld	a,(OFST+5,sp)
 405  001f 43            	cpl	a
 406  0020 f4            	and	a,(x)
 407  0021 f7            	ld	(x),a
 408  0022               L302:
 409                     ; 87         GPIOx->DDR |= (u8)GPIO_Pin;
 411  0022 1e01          	ldw	x,(OFST+1,sp)
 412  0024 e602          	ld	a,(2,x)
 413  0026 1a05          	or	a,(OFST+5,sp)
 414  0028 e702          	ld	(2,x),a
 416  002a 2009          	jra	L502
 417  002c               L771:
 418                     ; 91         GPIOx->DDR &= (u8)(~(GPIO_Pin));
 420  002c 1e01          	ldw	x,(OFST+1,sp)
 421  002e 7b05          	ld	a,(OFST+5,sp)
 422  0030 43            	cpl	a
 423  0031 e402          	and	a,(2,x)
 424  0033 e702          	ld	(2,x),a
 425  0035               L502:
 426                     ; 98     if ((((u8)(GPIO_Mode)) & (u8)0x40) != (u8)0x00) /* Pull-Up or Push-Pull */
 428  0035 7b06          	ld	a,(OFST+6,sp)
 429  0037 a540          	bcp	a,#64
 430  0039 270a          	jreq	L702
 431                     ; 100         GPIOx->CR1 |= (u8)GPIO_Pin;
 433  003b 1e01          	ldw	x,(OFST+1,sp)
 434  003d e603          	ld	a,(3,x)
 435  003f 1a05          	or	a,(OFST+5,sp)
 436  0041 e703          	ld	(3,x),a
 438  0043 2009          	jra	L112
 439  0045               L702:
 440                     ; 103         GPIOx->CR1 &= (u8)(~(GPIO_Pin));
 442  0045 1e01          	ldw	x,(OFST+1,sp)
 443  0047 7b05          	ld	a,(OFST+5,sp)
 444  0049 43            	cpl	a
 445  004a e403          	and	a,(3,x)
 446  004c e703          	ld	(3,x),a
 447  004e               L112:
 448                     ; 110     if ((((u8)(GPIO_Mode)) & (u8)0x20) != (u8)0x00) /* Interrupt or Slow slope */
 450  004e 7b06          	ld	a,(OFST+6,sp)
 451  0050 a520          	bcp	a,#32
 452  0052 270a          	jreq	L312
 453                     ; 112         GPIOx->CR2 |= (u8)GPIO_Pin;
 455  0054 1e01          	ldw	x,(OFST+1,sp)
 456  0056 e604          	ld	a,(4,x)
 457  0058 1a05          	or	a,(OFST+5,sp)
 458  005a e704          	ld	(4,x),a
 460  005c 2009          	jra	L512
 461  005e               L312:
 462                     ; 115         GPIOx->CR2 &= (u8)(~(GPIO_Pin));
 464  005e 1e01          	ldw	x,(OFST+1,sp)
 465  0060 7b05          	ld	a,(OFST+5,sp)
 466  0062 43            	cpl	a
 467  0063 e404          	and	a,(4,x)
 468  0065 e704          	ld	(4,x),a
 469  0067               L512:
 470                     ; 118 }
 473  0067 85            	popw	x
 474  0068 81            	ret
 520                     ; 129 void GPIO_Write(GPIO_TypeDef* GPIOx, u8 PortVal)
 520                     ; 130 {
 521                     	switch	.text
 522  0069               _GPIO_Write:
 524  0069 89            	pushw	x
 525       00000000      OFST:	set	0
 528                     ; 131     GPIOx->ODR = PortVal;
 530  006a 7b05          	ld	a,(OFST+5,sp)
 531  006c 1e01          	ldw	x,(OFST+1,sp)
 532  006e f7            	ld	(x),a
 533                     ; 132 }
 536  006f 85            	popw	x
 537  0070 81            	ret
 584                     ; 143 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 584                     ; 144 {
 585                     	switch	.text
 586  0071               _GPIO_WriteHigh:
 588  0071 89            	pushw	x
 589       00000000      OFST:	set	0
 592                     ; 145     GPIOx->ODR |= (u8)PortPins;
 594  0072 f6            	ld	a,(x)
 595  0073 1a05          	or	a,(OFST+5,sp)
 596  0075 f7            	ld	(x),a
 597                     ; 146 }
 600  0076 85            	popw	x
 601  0077 81            	ret
 648                     ; 157 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 648                     ; 158 {
 649                     	switch	.text
 650  0078               _GPIO_WriteLow:
 652  0078 89            	pushw	x
 653       00000000      OFST:	set	0
 656                     ; 159     GPIOx->ODR &= (u8)(~PortPins);
 658  0079 7b05          	ld	a,(OFST+5,sp)
 659  007b 43            	cpl	a
 660  007c f4            	and	a,(x)
 661  007d f7            	ld	(x),a
 662                     ; 160 }
 665  007e 85            	popw	x
 666  007f 81            	ret
 713                     ; 171 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 713                     ; 172 {
 714                     	switch	.text
 715  0080               _GPIO_WriteReverse:
 717  0080 89            	pushw	x
 718       00000000      OFST:	set	0
 721                     ; 173     GPIOx->ODR ^= (u8)PortPins;
 723  0081 f6            	ld	a,(x)
 724  0082 1805          	xor	a,	(OFST+5,sp)
 725  0084 f7            	ld	(x),a
 726                     ; 174 }
 729  0085 85            	popw	x
 730  0086 81            	ret
 768                     ; 183 u8 GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 768                     ; 184 {
 769                     	switch	.text
 770  0087               _GPIO_ReadOutputData:
 774                     ; 185     return ((u8)GPIOx->ODR);
 776  0087 f6            	ld	a,(x)
 779  0088 81            	ret
 816                     ; 195 u8 GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 816                     ; 196 {
 817                     	switch	.text
 818  0089               _GPIO_ReadInputData:
 822                     ; 197     return ((u8)GPIOx->IDR);
 824  0089 e601          	ld	a,(1,x)
 827  008b 81            	ret
 895                     ; 210 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 895                     ; 211 {
 896                     	switch	.text
 897  008c               _GPIO_ReadInputPin:
 899  008c 89            	pushw	x
 900       00000000      OFST:	set	0
 903                     ; 212     return ((BitStatus)(GPIOx->IDR & (vu8)GPIO_Pin));
 905  008d e601          	ld	a,(1,x)
 906  008f 1405          	and	a,(OFST+5,sp)
 909  0091 85            	popw	x
 910  0092 81            	ret
 988                     ; 223 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
 988                     ; 224 {
 989                     	switch	.text
 990  0093               _GPIO_ExternalPullUpConfig:
 992  0093 89            	pushw	x
 993       00000000      OFST:	set	0
 996                     ; 226     assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 998                     ; 227     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1000                     ; 229     if (NewState != DISABLE) /* External Pull-Up Set*/
1002  0094 0d06          	tnz	(OFST+6,sp)
1003  0096 2708          	jreq	L374
1004                     ; 231         GPIOx->CR1 |= (u8)GPIO_Pin;
1006  0098 e603          	ld	a,(3,x)
1007  009a 1a05          	or	a,(OFST+5,sp)
1008  009c e703          	ld	(3,x),a
1010  009e 2009          	jra	L574
1011  00a0               L374:
1012                     ; 234         GPIOx->CR1 &= (u8)(~(GPIO_Pin));
1014  00a0 1e01          	ldw	x,(OFST+1,sp)
1015  00a2 7b05          	ld	a,(OFST+5,sp)
1016  00a4 43            	cpl	a
1017  00a5 e403          	and	a,(3,x)
1018  00a7 e703          	ld	(3,x),a
1019  00a9               L574:
1020                     ; 236 }
1023  00a9 85            	popw	x
1024  00aa 81            	ret
1037                     	xdef	_GPIO_ExternalPullUpConfig
1038                     	xdef	_GPIO_ReadInputPin
1039                     	xdef	_GPIO_ReadOutputData
1040                     	xdef	_GPIO_ReadInputData
1041                     	xdef	_GPIO_WriteReverse
1042                     	xdef	_GPIO_WriteLow
1043                     	xdef	_GPIO_WriteHigh
1044                     	xdef	_GPIO_Write
1045                     	xdef	_GPIO_Init
1046                     	xdef	_GPIO_DeInit
1065                     	end
