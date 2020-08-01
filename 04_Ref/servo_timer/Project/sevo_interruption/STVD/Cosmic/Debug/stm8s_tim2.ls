   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.31 - 09 Feb 2010
   3                     ; Generator V4.3.3 - 10 Feb 2010
  43                     ; 44 void TIM2_DeInit(void)
  43                     ; 45 {
  45                     	switch	.text
  46  0000               _TIM2_DeInit:
  50                     ; 47     TIM2->CR1 = (u8)TIM2_CR1_RESET_VALUE;
  52  0000 725f5300      	clr	21248
  53                     ; 48     TIM2->IER = (u8)TIM2_IER_RESET_VALUE;
  55  0004 725f5301      	clr	21249
  56                     ; 49     TIM2->SR2 = (u8)TIM2_SR2_RESET_VALUE;
  58  0008 725f5303      	clr	21251
  59                     ; 52     TIM2->CCER1 = (u8)TIM2_CCER1_RESET_VALUE;
  61  000c 725f5308      	clr	21256
  62                     ; 53     TIM2->CCER2 = (u8)TIM2_CCER2_RESET_VALUE;
  64  0010 725f5309      	clr	21257
  65                     ; 57     TIM2->CCER1 = (u8)TIM2_CCER1_RESET_VALUE;
  67  0014 725f5308      	clr	21256
  68                     ; 58     TIM2->CCER2 = (u8)TIM2_CCER2_RESET_VALUE;
  70  0018 725f5309      	clr	21257
  71                     ; 59     TIM2->CCMR1 = (u8)TIM2_CCMR1_RESET_VALUE;
  73  001c 725f5305      	clr	21253
  74                     ; 60     TIM2->CCMR2 = (u8)TIM2_CCMR2_RESET_VALUE;
  76  0020 725f5306      	clr	21254
  77                     ; 61     TIM2->CCMR3 = (u8)TIM2_CCMR3_RESET_VALUE;
  79  0024 725f5307      	clr	21255
  80                     ; 62     TIM2->CNTRH = (u8)TIM2_CNTRH_RESET_VALUE;
  82  0028 725f530a      	clr	21258
  83                     ; 63     TIM2->CNTRL = (u8)TIM2_CNTRL_RESET_VALUE;
  85  002c 725f530b      	clr	21259
  86                     ; 64     TIM2->PSCR = (u8)TIM2_PSCR_RESET_VALUE;
  88  0030 725f530c      	clr	21260
  89                     ; 65     TIM2->ARRH  = (u8)TIM2_ARRH_RESET_VALUE;
  91  0034 35ff530d      	mov	21261,#255
  92                     ; 66     TIM2->ARRL  = (u8)TIM2_ARRL_RESET_VALUE;
  94  0038 35ff530e      	mov	21262,#255
  95                     ; 67     TIM2->CCR1H = (u8)TIM2_CCR1H_RESET_VALUE;
  97  003c 725f530f      	clr	21263
  98                     ; 68     TIM2->CCR1L = (u8)TIM2_CCR1L_RESET_VALUE;
 100  0040 725f5310      	clr	21264
 101                     ; 69     TIM2->CCR2H = (u8)TIM2_CCR2H_RESET_VALUE;
 103  0044 725f5311      	clr	21265
 104                     ; 70     TIM2->CCR2L = (u8)TIM2_CCR2L_RESET_VALUE;
 106  0048 725f5312      	clr	21266
 107                     ; 71     TIM2->CCR3H = (u8)TIM2_CCR3H_RESET_VALUE;
 109  004c 725f5313      	clr	21267
 110                     ; 72     TIM2->CCR3L = (u8)TIM2_CCR3L_RESET_VALUE;
 112  0050 725f5314      	clr	21268
 113                     ; 73     TIM2->SR1 = (u8)TIM2_SR1_RESET_VALUE;
 115  0054 725f5302      	clr	21250
 116                     ; 74 }
 119  0058 81            	ret
 287                     ; 83 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 287                     ; 84                         u16 TIM2_Period)
 287                     ; 85 {
 288                     	switch	.text
 289  0059               _TIM2_TimeBaseInit:
 291  0059 88            	push	a
 292       00000000      OFST:	set	0
 295                     ; 87     TIM2->PSCR = (u8)(TIM2_Prescaler);
 297  005a c7530c        	ld	21260,a
 298                     ; 89     TIM2->ARRH = (u8)(TIM2_Period >> 8);
 300  005d 7b04          	ld	a,(OFST+4,sp)
 301  005f c7530d        	ld	21261,a
 302                     ; 90     TIM2->ARRL = (u8)(TIM2_Period);
 304  0062 7b05          	ld	a,(OFST+5,sp)
 305  0064 c7530e        	ld	21262,a
 306                     ; 91 }
 309  0067 84            	pop	a
 310  0068 81            	ret
 467                     ; 102 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 467                     ; 103                   TIM2_OutputState_TypeDef TIM2_OutputState,
 467                     ; 104                   u16 TIM2_Pulse,
 467                     ; 105                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 467                     ; 106 {
 468                     	switch	.text
 469  0069               _TIM2_OC1Init:
 471  0069 89            	pushw	x
 472  006a 88            	push	a
 473       00000001      OFST:	set	1
 476                     ; 108     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 478                     ; 109     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 480                     ; 110     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 482                     ; 113     TIM2->CCER1 &= (u8)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 484  006b c65308        	ld	a,21256
 485  006e a4fc          	and	a,#252
 486  0070 c75308        	ld	21256,a
 487                     ; 115     TIM2->CCER1 |= (u8)((TIM2_OutputState  & TIM2_CCER1_CC1E   ) | (TIM2_OCPolarity   & TIM2_CCER1_CC1P   ));
 489  0073 7b08          	ld	a,(OFST+7,sp)
 490  0075 a402          	and	a,#2
 491  0077 6b01          	ld	(OFST+0,sp),a
 492  0079 9f            	ld	a,xl
 493  007a a401          	and	a,#1
 494  007c 1a01          	or	a,(OFST+0,sp)
 495  007e ca5308        	or	a,21256
 496  0081 c75308        	ld	21256,a
 497                     ; 118     TIM2->CCMR1 = (u8)((TIM2->CCMR1 & (u8)(~TIM2_CCMR_OCM)) | (u8)TIM2_OCMode);
 499  0084 c65305        	ld	a,21253
 500  0087 a48f          	and	a,#143
 501  0089 1a02          	or	a,(OFST+1,sp)
 502  008b c75305        	ld	21253,a
 503                     ; 121     TIM2->CCR1H = (u8)(TIM2_Pulse >> 8);
 505  008e 7b06          	ld	a,(OFST+5,sp)
 506  0090 c7530f        	ld	21263,a
 507                     ; 122     TIM2->CCR1L = (u8)(TIM2_Pulse);
 509  0093 7b07          	ld	a,(OFST+6,sp)
 510  0095 c75310        	ld	21264,a
 511                     ; 123 }
 514  0098 5b03          	addw	sp,#3
 515  009a 81            	ret
 579                     ; 134 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 579                     ; 135                   TIM2_OutputState_TypeDef TIM2_OutputState,
 579                     ; 136                   u16 TIM2_Pulse,
 579                     ; 137                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 579                     ; 138 {
 580                     	switch	.text
 581  009b               _TIM2_OC2Init:
 583  009b 89            	pushw	x
 584  009c 88            	push	a
 585       00000001      OFST:	set	1
 588                     ; 140     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 590                     ; 141     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 592                     ; 142     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 594                     ; 146     TIM2->CCER1 &= (u8)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 596  009d c65308        	ld	a,21256
 597  00a0 a4cf          	and	a,#207
 598  00a2 c75308        	ld	21256,a
 599                     ; 148     TIM2->CCER1 |= (u8)((TIM2_OutputState  & TIM2_CCER1_CC2E   ) | \
 599                     ; 149                         (TIM2_OCPolarity   & TIM2_CCER1_CC2P   ));
 601  00a5 7b08          	ld	a,(OFST+7,sp)
 602  00a7 a420          	and	a,#32
 603  00a9 6b01          	ld	(OFST+0,sp),a
 604  00ab 9f            	ld	a,xl
 605  00ac a410          	and	a,#16
 606  00ae 1a01          	or	a,(OFST+0,sp)
 607  00b0 ca5308        	or	a,21256
 608  00b3 c75308        	ld	21256,a
 609                     ; 153     TIM2->CCMR2 = (u8)((TIM2->CCMR2 & (u8)(~TIM2_CCMR_OCM)) | (u8)TIM2_OCMode);
 611  00b6 c65306        	ld	a,21254
 612  00b9 a48f          	and	a,#143
 613  00bb 1a02          	or	a,(OFST+1,sp)
 614  00bd c75306        	ld	21254,a
 615                     ; 157     TIM2->CCR2H = (u8)(TIM2_Pulse >> 8);
 617  00c0 7b06          	ld	a,(OFST+5,sp)
 618  00c2 c75311        	ld	21265,a
 619                     ; 158     TIM2->CCR2L = (u8)(TIM2_Pulse);
 621  00c5 7b07          	ld	a,(OFST+6,sp)
 622  00c7 c75312        	ld	21266,a
 623                     ; 159 }
 626  00ca 5b03          	addw	sp,#3
 627  00cc 81            	ret
 691                     ; 170 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 691                     ; 171                   TIM2_OutputState_TypeDef TIM2_OutputState,
 691                     ; 172                   u16 TIM2_Pulse,
 691                     ; 173                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 691                     ; 174 {
 692                     	switch	.text
 693  00cd               _TIM2_OC3Init:
 695  00cd 89            	pushw	x
 696  00ce 88            	push	a
 697       00000001      OFST:	set	1
 700                     ; 176     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 702                     ; 177     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 704                     ; 178     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 706                     ; 180     TIM2->CCER2 &= (u8)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 708  00cf c65309        	ld	a,21257
 709  00d2 a4fc          	and	a,#252
 710  00d4 c75309        	ld	21257,a
 711                     ; 182     TIM2->CCER2 |= (u8)((TIM2_OutputState  & TIM2_CCER2_CC3E   ) |  (TIM2_OCPolarity   & TIM2_CCER2_CC3P   ));
 713  00d7 7b08          	ld	a,(OFST+7,sp)
 714  00d9 a402          	and	a,#2
 715  00db 6b01          	ld	(OFST+0,sp),a
 716  00dd 9f            	ld	a,xl
 717  00de a401          	and	a,#1
 718  00e0 1a01          	or	a,(OFST+0,sp)
 719  00e2 ca5309        	or	a,21257
 720  00e5 c75309        	ld	21257,a
 721                     ; 185     TIM2->CCMR3 = (u8)((TIM2->CCMR3 & (u8)(~TIM2_CCMR_OCM)) | (u8)TIM2_OCMode);
 723  00e8 c65307        	ld	a,21255
 724  00eb a48f          	and	a,#143
 725  00ed 1a02          	or	a,(OFST+1,sp)
 726  00ef c75307        	ld	21255,a
 727                     ; 188     TIM2->CCR3H = (u8)(TIM2_Pulse >> 8);
 729  00f2 7b06          	ld	a,(OFST+5,sp)
 730  00f4 c75313        	ld	21267,a
 731                     ; 189     TIM2->CCR3L = (u8)(TIM2_Pulse);
 733  00f7 7b07          	ld	a,(OFST+6,sp)
 734  00f9 c75314        	ld	21268,a
 735                     ; 191 }
 738  00fc 5b03          	addw	sp,#3
 739  00fe 81            	ret
 932                     ; 203 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
 932                     ; 204                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
 932                     ; 205                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
 932                     ; 206                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
 932                     ; 207                  u8 TIM2_ICFilter)
 932                     ; 208 {
 933                     	switch	.text
 934  00ff               _TIM2_ICInit:
 936  00ff 89            	pushw	x
 937       00000000      OFST:	set	0
 940                     ; 210     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
 942                     ; 211     assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
 944                     ; 212     assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
 946                     ; 213     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
 948                     ; 214     assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
 950                     ; 216     if (TIM2_Channel == TIM2_CHANNEL_1)
 952  0100 9e            	ld	a,xh
 953  0101 4d            	tnz	a
 954  0102 2614          	jrne	L104
 955                     ; 219         TI1_Config((u8)TIM2_ICPolarity,
 955                     ; 220                    (u8)TIM2_ICSelection,
 955                     ; 221                    (u8)TIM2_ICFilter);
 957  0104 7b07          	ld	a,(OFST+7,sp)
 958  0106 88            	push	a
 959  0107 7b06          	ld	a,(OFST+6,sp)
 960  0109 97            	ld	xl,a
 961  010a 7b03          	ld	a,(OFST+3,sp)
 962  010c 95            	ld	xh,a
 963  010d cd045a        	call	L3_TI1_Config
 965  0110 84            	pop	a
 966                     ; 224         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
 968  0111 7b06          	ld	a,(OFST+6,sp)
 969  0113 cd0340        	call	_TIM2_SetIC1Prescaler
 972  0116 202c          	jra	L304
 973  0118               L104:
 974                     ; 226     else if (TIM2_Channel == TIM2_CHANNEL_2)
 976  0118 7b01          	ld	a,(OFST+1,sp)
 977  011a a101          	cp	a,#1
 978  011c 2614          	jrne	L504
 979                     ; 229         TI2_Config((u8)TIM2_ICPolarity,
 979                     ; 230                    (u8)TIM2_ICSelection,
 979                     ; 231                    (u8)TIM2_ICFilter);
 981  011e 7b07          	ld	a,(OFST+7,sp)
 982  0120 88            	push	a
 983  0121 7b06          	ld	a,(OFST+6,sp)
 984  0123 97            	ld	xl,a
 985  0124 7b03          	ld	a,(OFST+3,sp)
 986  0126 95            	ld	xh,a
 987  0127 cd048a        	call	L5_TI2_Config
 989  012a 84            	pop	a
 990                     ; 234         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
 992  012b 7b06          	ld	a,(OFST+6,sp)
 993  012d cd034d        	call	_TIM2_SetIC2Prescaler
 996  0130 2012          	jra	L304
 997  0132               L504:
 998                     ; 239         TI3_Config((u8)TIM2_ICPolarity,
 998                     ; 240                    (u8)TIM2_ICSelection,
 998                     ; 241                    (u8)TIM2_ICFilter);
1000  0132 7b07          	ld	a,(OFST+7,sp)
1001  0134 88            	push	a
1002  0135 7b06          	ld	a,(OFST+6,sp)
1003  0137 97            	ld	xl,a
1004  0138 7b03          	ld	a,(OFST+3,sp)
1005  013a 95            	ld	xh,a
1006  013b cd04ba        	call	L7_TI3_Config
1008  013e 84            	pop	a
1009                     ; 244         TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1011  013f 7b06          	ld	a,(OFST+6,sp)
1012  0141 cd035a        	call	_TIM2_SetIC3Prescaler
1014  0144               L304:
1015                     ; 246 }
1018  0144 85            	popw	x
1019  0145 81            	ret
1115                     ; 258 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1115                     ; 259                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1115                     ; 260                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1115                     ; 261                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1115                     ; 262                      u8 TIM2_ICFilter)
1115                     ; 263 {
1116                     	switch	.text
1117  0146               _TIM2_PWMIConfig:
1119  0146 89            	pushw	x
1120  0147 89            	pushw	x
1121       00000002      OFST:	set	2
1124                     ; 264     u8 icpolarity = (u8)TIM2_ICPOLARITY_RISING;
1126                     ; 265     u8 icselection = (u8)TIM2_ICSELECTION_DIRECTTI;
1128                     ; 268     assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1130                     ; 269     assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1132                     ; 270     assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1134                     ; 271     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1136                     ; 274     if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1138  0148 9f            	ld	a,xl
1139  0149 a144          	cp	a,#68
1140  014b 2706          	jreq	L754
1141                     ; 276         icpolarity = (u8)TIM2_ICPOLARITY_FALLING;
1143  014d a644          	ld	a,#68
1144  014f 6b01          	ld	(OFST-1,sp),a
1146  0151 2002          	jra	L164
1147  0153               L754:
1148                     ; 280         icpolarity = (u8)TIM2_ICPOLARITY_RISING;
1150  0153 0f01          	clr	(OFST-1,sp)
1151  0155               L164:
1152                     ; 284     if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1154  0155 7b07          	ld	a,(OFST+5,sp)
1155  0157 a101          	cp	a,#1
1156  0159 2606          	jrne	L364
1157                     ; 286         icselection = (u8)TIM2_ICSELECTION_INDIRECTTI;
1159  015b a602          	ld	a,#2
1160  015d 6b02          	ld	(OFST+0,sp),a
1162  015f 2004          	jra	L564
1163  0161               L364:
1164                     ; 290         icselection = (u8)TIM2_ICSELECTION_DIRECTTI;
1166  0161 a601          	ld	a,#1
1167  0163 6b02          	ld	(OFST+0,sp),a
1168  0165               L564:
1169                     ; 293     if (TIM2_Channel == TIM2_CHANNEL_1)
1171  0165 0d03          	tnz	(OFST+1,sp)
1172  0167 2626          	jrne	L764
1173                     ; 296         TI1_Config((u8)TIM2_ICPolarity, (u8)TIM2_ICSelection,
1173                     ; 297                    (u8)TIM2_ICFilter);
1175  0169 7b09          	ld	a,(OFST+7,sp)
1176  016b 88            	push	a
1177  016c 7b08          	ld	a,(OFST+6,sp)
1178  016e 97            	ld	xl,a
1179  016f 7b05          	ld	a,(OFST+3,sp)
1180  0171 95            	ld	xh,a
1181  0172 cd045a        	call	L3_TI1_Config
1183  0175 84            	pop	a
1184                     ; 300         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1186  0176 7b08          	ld	a,(OFST+6,sp)
1187  0178 cd0340        	call	_TIM2_SetIC1Prescaler
1189                     ; 303         TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1191  017b 7b09          	ld	a,(OFST+7,sp)
1192  017d 88            	push	a
1193  017e 7b03          	ld	a,(OFST+1,sp)
1194  0180 97            	ld	xl,a
1195  0181 7b02          	ld	a,(OFST+0,sp)
1196  0183 95            	ld	xh,a
1197  0184 cd048a        	call	L5_TI2_Config
1199  0187 84            	pop	a
1200                     ; 306         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1202  0188 7b08          	ld	a,(OFST+6,sp)
1203  018a cd034d        	call	_TIM2_SetIC2Prescaler
1206  018d 2024          	jra	L174
1207  018f               L764:
1208                     ; 311         TI2_Config((u8)TIM2_ICPolarity, (u8)TIM2_ICSelection,
1208                     ; 312                    (u8)TIM2_ICFilter);
1210  018f 7b09          	ld	a,(OFST+7,sp)
1211  0191 88            	push	a
1212  0192 7b08          	ld	a,(OFST+6,sp)
1213  0194 97            	ld	xl,a
1214  0195 7b05          	ld	a,(OFST+3,sp)
1215  0197 95            	ld	xh,a
1216  0198 cd048a        	call	L5_TI2_Config
1218  019b 84            	pop	a
1219                     ; 315         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1221  019c 7b08          	ld	a,(OFST+6,sp)
1222  019e cd034d        	call	_TIM2_SetIC2Prescaler
1224                     ; 318         TI1_Config((u8)icpolarity, icselection, (u8)TIM2_ICFilter);
1226  01a1 7b09          	ld	a,(OFST+7,sp)
1227  01a3 88            	push	a
1228  01a4 7b03          	ld	a,(OFST+1,sp)
1229  01a6 97            	ld	xl,a
1230  01a7 7b02          	ld	a,(OFST+0,sp)
1231  01a9 95            	ld	xh,a
1232  01aa cd045a        	call	L3_TI1_Config
1234  01ad 84            	pop	a
1235                     ; 321         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1237  01ae 7b08          	ld	a,(OFST+6,sp)
1238  01b0 cd0340        	call	_TIM2_SetIC1Prescaler
1240  01b3               L174:
1241                     ; 323 }
1244  01b3 5b04          	addw	sp,#4
1245  01b5 81            	ret
1300                     ; 332 void TIM2_Cmd(FunctionalState NewState)
1300                     ; 333 {
1301                     	switch	.text
1302  01b6               _TIM2_Cmd:
1306                     ; 335     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1308                     ; 338     if (NewState != DISABLE)
1310  01b6 4d            	tnz	a
1311  01b7 2706          	jreq	L125
1312                     ; 340         TIM2->CR1 |= (u8)TIM2_CR1_CEN;
1314  01b9 72105300      	bset	21248,#0
1316  01bd 2004          	jra	L325
1317  01bf               L125:
1318                     ; 344         TIM2->CR1 &= (u8)(~TIM2_CR1_CEN);
1320  01bf 72115300      	bres	21248,#0
1321  01c3               L325:
1322                     ; 346 }
1325  01c3 81            	ret
1404                     ; 362 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1404                     ; 363 {
1405                     	switch	.text
1406  01c4               _TIM2_ITConfig:
1408  01c4 89            	pushw	x
1409       00000000      OFST:	set	0
1412                     ; 365     assert_param(IS_TIM2_IT_OK(TIM2_IT));
1414                     ; 366     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1416                     ; 368     if (NewState != DISABLE)
1418  01c5 9f            	ld	a,xl
1419  01c6 4d            	tnz	a
1420  01c7 2709          	jreq	L365
1421                     ; 371         TIM2->IER |= (u8)TIM2_IT;
1423  01c9 9e            	ld	a,xh
1424  01ca ca5301        	or	a,21249
1425  01cd c75301        	ld	21249,a
1427  01d0 2009          	jra	L565
1428  01d2               L365:
1429                     ; 376         TIM2->IER &= (u8)(~TIM2_IT);
1431  01d2 7b01          	ld	a,(OFST+1,sp)
1432  01d4 43            	cpl	a
1433  01d5 c45301        	and	a,21249
1434  01d8 c75301        	ld	21249,a
1435  01db               L565:
1436                     ; 378 }
1439  01db 85            	popw	x
1440  01dc 81            	ret
1476                     ; 387 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1476                     ; 388 {
1477                     	switch	.text
1478  01dd               _TIM2_UpdateDisableConfig:
1482                     ; 390     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1484                     ; 393     if (NewState != DISABLE)
1486  01dd 4d            	tnz	a
1487  01de 2706          	jreq	L506
1488                     ; 395         TIM2->CR1 |= (u8)TIM2_CR1_UDIS;
1490  01e0 72125300      	bset	21248,#1
1492  01e4 2004          	jra	L706
1493  01e6               L506:
1494                     ; 399         TIM2->CR1 &= (u8)(~TIM2_CR1_UDIS);
1496  01e6 72135300      	bres	21248,#1
1497  01ea               L706:
1498                     ; 401 }
1501  01ea 81            	ret
1559                     ; 411 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
1559                     ; 412 {
1560                     	switch	.text
1561  01eb               _TIM2_UpdateRequestConfig:
1565                     ; 414     assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
1567                     ; 417     if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
1569  01eb 4d            	tnz	a
1570  01ec 2706          	jreq	L736
1571                     ; 419         TIM2->CR1 |= (u8)TIM2_CR1_URS;
1573  01ee 72145300      	bset	21248,#2
1575  01f2 2004          	jra	L146
1576  01f4               L736:
1577                     ; 423         TIM2->CR1 &= (u8)(~TIM2_CR1_URS);
1579  01f4 72155300      	bres	21248,#2
1580  01f8               L146:
1581                     ; 425 }
1584  01f8 81            	ret
1641                     ; 436 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1641                     ; 437 {
1642                     	switch	.text
1643  01f9               _TIM2_SelectOnePulseMode:
1647                     ; 439     assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
1649                     ; 442     if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
1651  01f9 4d            	tnz	a
1652  01fa 2706          	jreq	L176
1653                     ; 444         TIM2->CR1 |= (u8)TIM2_CR1_OPM;
1655  01fc 72165300      	bset	21248,#3
1657  0200 2004          	jra	L376
1658  0202               L176:
1659                     ; 448         TIM2->CR1 &= (u8)(~TIM2_CR1_OPM);
1661  0202 72175300      	bres	21248,#3
1662  0206               L376:
1663                     ; 451 }
1666  0206 81            	ret
1734                     ; 482 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
1734                     ; 483                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
1734                     ; 484 {
1735                     	switch	.text
1736  0207               _TIM2_PrescalerConfig:
1740                     ; 486     assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
1742                     ; 487     assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
1744                     ; 490     TIM2->PSCR = (u8)Prescaler;
1746  0207 9e            	ld	a,xh
1747  0208 c7530c        	ld	21260,a
1748                     ; 493     TIM2->EGR = (u8)TIM2_PSCReloadMode;
1750  020b 9f            	ld	a,xl
1751  020c c75304        	ld	21252,a
1752                     ; 494 }
1755  020f 81            	ret
1813                     ; 505 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1813                     ; 506 {
1814                     	switch	.text
1815  0210               _TIM2_ForcedOC1Config:
1817  0210 88            	push	a
1818       00000000      OFST:	set	0
1821                     ; 508     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1823                     ; 511     TIM2->CCMR1  =  (u8)((TIM2->CCMR1 & (u8)(~TIM2_CCMR_OCM))  | (u8)TIM2_ForcedAction);
1825  0211 c65305        	ld	a,21253
1826  0214 a48f          	and	a,#143
1827  0216 1a01          	or	a,(OFST+1,sp)
1828  0218 c75305        	ld	21253,a
1829                     ; 512 }
1832  021b 84            	pop	a
1833  021c 81            	ret
1869                     ; 523 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1869                     ; 524 {
1870                     	switch	.text
1871  021d               _TIM2_ForcedOC2Config:
1873  021d 88            	push	a
1874       00000000      OFST:	set	0
1877                     ; 526     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1879                     ; 529     TIM2->CCMR2 = (u8)((TIM2->CCMR2 & (u8)(~TIM2_CCMR_OCM))  | (u8)TIM2_ForcedAction);
1881  021e c65306        	ld	a,21254
1882  0221 a48f          	and	a,#143
1883  0223 1a01          	or	a,(OFST+1,sp)
1884  0225 c75306        	ld	21254,a
1885                     ; 530 }
1888  0228 84            	pop	a
1889  0229 81            	ret
1925                     ; 541 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1925                     ; 542 {
1926                     	switch	.text
1927  022a               _TIM2_ForcedOC3Config:
1929  022a 88            	push	a
1930       00000000      OFST:	set	0
1933                     ; 544     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1935                     ; 547     TIM2->CCMR3  =  (u8)((TIM2->CCMR3 & (u8)(~TIM2_CCMR_OCM))  | (u8)TIM2_ForcedAction);
1937  022b c65307        	ld	a,21255
1938  022e a48f          	and	a,#143
1939  0230 1a01          	or	a,(OFST+1,sp)
1940  0232 c75307        	ld	21255,a
1941                     ; 548 }
1944  0235 84            	pop	a
1945  0236 81            	ret
1981                     ; 557 void TIM2_ARRPreloadConfig(FunctionalState NewState)
1981                     ; 558 {
1982                     	switch	.text
1983  0237               _TIM2_ARRPreloadConfig:
1987                     ; 560     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1989                     ; 563     if (NewState != DISABLE)
1991  0237 4d            	tnz	a
1992  0238 2706          	jreq	L7201
1993                     ; 565         TIM2->CR1 |= (u8)TIM2_CR1_ARPE;
1995  023a 721e5300      	bset	21248,#7
1997  023e 2004          	jra	L1301
1998  0240               L7201:
1999                     ; 569         TIM2->CR1 &= (u8)(~TIM2_CR1_ARPE);
2001  0240 721f5300      	bres	21248,#7
2002  0244               L1301:
2003                     ; 571 }
2006  0244 81            	ret
2042                     ; 580 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2042                     ; 581 {
2043                     	switch	.text
2044  0245               _TIM2_OC1PreloadConfig:
2048                     ; 583     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2050                     ; 586     if (NewState != DISABLE)
2052  0245 4d            	tnz	a
2053  0246 2706          	jreq	L1501
2054                     ; 588         TIM2->CCMR1 |= (u8)TIM2_CCMR_OCxPE;
2056  0248 72165305      	bset	21253,#3
2058  024c 2004          	jra	L3501
2059  024e               L1501:
2060                     ; 592         TIM2->CCMR1 &= (u8)(~TIM2_CCMR_OCxPE);
2062  024e 72175305      	bres	21253,#3
2063  0252               L3501:
2064                     ; 594 }
2067  0252 81            	ret
2103                     ; 603 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2103                     ; 604 {
2104                     	switch	.text
2105  0253               _TIM2_OC2PreloadConfig:
2109                     ; 606     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2111                     ; 609     if (NewState != DISABLE)
2113  0253 4d            	tnz	a
2114  0254 2706          	jreq	L3701
2115                     ; 611         TIM2->CCMR2 |= (u8)TIM2_CCMR_OCxPE;
2117  0256 72165306      	bset	21254,#3
2119  025a 2004          	jra	L5701
2120  025c               L3701:
2121                     ; 615         TIM2->CCMR2 &= (u8)(~TIM2_CCMR_OCxPE);
2123  025c 72175306      	bres	21254,#3
2124  0260               L5701:
2125                     ; 617 }
2128  0260 81            	ret
2164                     ; 626 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2164                     ; 627 {
2165                     	switch	.text
2166  0261               _TIM2_OC3PreloadConfig:
2170                     ; 629     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2172                     ; 632     if (NewState != DISABLE)
2174  0261 4d            	tnz	a
2175  0262 2706          	jreq	L5111
2176                     ; 634         TIM2->CCMR3 |= (u8)TIM2_CCMR_OCxPE;
2178  0264 72165307      	bset	21255,#3
2180  0268 2004          	jra	L7111
2181  026a               L5111:
2182                     ; 638         TIM2->CCMR3 &= (u8)(~TIM2_CCMR_OCxPE);
2184  026a 72175307      	bres	21255,#3
2185  026e               L7111:
2186                     ; 640 }
2189  026e 81            	ret
2262                     ; 653 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2262                     ; 654 {
2263                     	switch	.text
2264  026f               _TIM2_GenerateEvent:
2268                     ; 656     assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2270                     ; 659     TIM2->EGR = (u8)TIM2_EventSource;
2272  026f c75304        	ld	21252,a
2273                     ; 660 }
2276  0272 81            	ret
2312                     ; 671 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2312                     ; 672 {
2313                     	switch	.text
2314  0273               _TIM2_OC1PolarityConfig:
2318                     ; 674     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2320                     ; 677     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2322  0273 4d            	tnz	a
2323  0274 2706          	jreq	L1711
2324                     ; 679         TIM2->CCER1 |= (u8)TIM2_CCER1_CC1P;
2326  0276 72125308      	bset	21256,#1
2328  027a 2004          	jra	L3711
2329  027c               L1711:
2330                     ; 683         TIM2->CCER1 &= (u8)(~TIM2_CCER1_CC1P);
2332  027c 72135308      	bres	21256,#1
2333  0280               L3711:
2334                     ; 685 }
2337  0280 81            	ret
2373                     ; 696 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2373                     ; 697 {
2374                     	switch	.text
2375  0281               _TIM2_OC2PolarityConfig:
2379                     ; 699     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2381                     ; 702     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2383  0281 4d            	tnz	a
2384  0282 2706          	jreq	L3121
2385                     ; 704         TIM2->CCER1 |= TIM2_CCER1_CC2P;
2387  0284 721a5308      	bset	21256,#5
2389  0288 2004          	jra	L5121
2390  028a               L3121:
2391                     ; 708         TIM2->CCER1 &= (u8)(~TIM2_CCER1_CC2P);
2393  028a 721b5308      	bres	21256,#5
2394  028e               L5121:
2395                     ; 710 }
2398  028e 81            	ret
2434                     ; 721 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2434                     ; 722 {
2435                     	switch	.text
2436  028f               _TIM2_OC3PolarityConfig:
2440                     ; 724     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2442                     ; 727     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2444  028f 4d            	tnz	a
2445  0290 2706          	jreq	L5321
2446                     ; 729         TIM2->CCER2 |= (u8)TIM2_CCER2_CC3P;
2448  0292 72125309      	bset	21257,#1
2450  0296 2004          	jra	L7321
2451  0298               L5321:
2452                     ; 733         TIM2->CCER2 &= (u8)(~TIM2_CCER2_CC3P);
2454  0298 72135309      	bres	21257,#1
2455  029c               L7321:
2456                     ; 735 }
2459  029c 81            	ret
2504                     ; 749 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
2504                     ; 750 {
2505                     	switch	.text
2506  029d               _TIM2_CCxCmd:
2508  029d 89            	pushw	x
2509       00000000      OFST:	set	0
2512                     ; 752     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2514                     ; 753     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2516                     ; 755     if (TIM2_Channel == TIM2_CHANNEL_1)
2518  029e 9e            	ld	a,xh
2519  029f 4d            	tnz	a
2520  02a0 2610          	jrne	L3621
2521                     ; 758         if (NewState != DISABLE)
2523  02a2 9f            	ld	a,xl
2524  02a3 4d            	tnz	a
2525  02a4 2706          	jreq	L5621
2526                     ; 760             TIM2->CCER1 |= (u8)TIM2_CCER1_CC1E;
2528  02a6 72105308      	bset	21256,#0
2530  02aa 202a          	jra	L1721
2531  02ac               L5621:
2532                     ; 764             TIM2->CCER1 &= (u8)(~TIM2_CCER1_CC1E);
2534  02ac 72115308      	bres	21256,#0
2535  02b0 2024          	jra	L1721
2536  02b2               L3621:
2537                     ; 768     else if (TIM2_Channel == TIM2_CHANNEL_2)
2539  02b2 7b01          	ld	a,(OFST+1,sp)
2540  02b4 a101          	cp	a,#1
2541  02b6 2610          	jrne	L3721
2542                     ; 771         if (NewState != DISABLE)
2544  02b8 0d02          	tnz	(OFST+2,sp)
2545  02ba 2706          	jreq	L5721
2546                     ; 773             TIM2->CCER1 |= (u8)TIM2_CCER1_CC2E;
2548  02bc 72185308      	bset	21256,#4
2550  02c0 2014          	jra	L1721
2551  02c2               L5721:
2552                     ; 777             TIM2->CCER1 &= (u8)(~TIM2_CCER1_CC2E);
2554  02c2 72195308      	bres	21256,#4
2555  02c6 200e          	jra	L1721
2556  02c8               L3721:
2557                     ; 783         if (NewState != DISABLE)
2559  02c8 0d02          	tnz	(OFST+2,sp)
2560  02ca 2706          	jreq	L3031
2561                     ; 785             TIM2->CCER2 |= (u8)TIM2_CCER2_CC3E;
2563  02cc 72105309      	bset	21257,#0
2565  02d0 2004          	jra	L1721
2566  02d2               L3031:
2567                     ; 789             TIM2->CCER2 &= (u8)(~TIM2_CCER2_CC3E);
2569  02d2 72115309      	bres	21257,#0
2570  02d6               L1721:
2571                     ; 792 }
2574  02d6 85            	popw	x
2575  02d7 81            	ret
2620                     ; 814 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
2620                     ; 815 {
2621                     	switch	.text
2622  02d8               _TIM2_SelectOCxM:
2624  02d8 89            	pushw	x
2625       00000000      OFST:	set	0
2628                     ; 817     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2630                     ; 818     assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
2632                     ; 820     if (TIM2_Channel == TIM2_CHANNEL_1)
2634  02d9 9e            	ld	a,xh
2635  02da 4d            	tnz	a
2636  02db 2610          	jrne	L1331
2637                     ; 823         TIM2->CCER1 &= (u8)(~TIM2_CCER1_CC1E);
2639  02dd 72115308      	bres	21256,#0
2640                     ; 826         TIM2->CCMR1 = (u8)((TIM2->CCMR1 & (u8)(~TIM2_CCMR_OCM)) | (u8)TIM2_OCMode);
2642  02e1 c65305        	ld	a,21253
2643  02e4 a48f          	and	a,#143
2644  02e6 1a02          	or	a,(OFST+2,sp)
2645  02e8 c75305        	ld	21253,a
2647  02eb 2024          	jra	L3331
2648  02ed               L1331:
2649                     ; 828     else if (TIM2_Channel == TIM2_CHANNEL_2)
2651  02ed 7b01          	ld	a,(OFST+1,sp)
2652  02ef a101          	cp	a,#1
2653  02f1 2610          	jrne	L5331
2654                     ; 831         TIM2->CCER1 &= (u8)(~TIM2_CCER1_CC2E);
2656  02f3 72195308      	bres	21256,#4
2657                     ; 834         TIM2->CCMR2 = (u8)((TIM2->CCMR2 & (u8)(~TIM2_CCMR_OCM)) | (u8)TIM2_OCMode);
2659  02f7 c65306        	ld	a,21254
2660  02fa a48f          	and	a,#143
2661  02fc 1a02          	or	a,(OFST+2,sp)
2662  02fe c75306        	ld	21254,a
2664  0301 200e          	jra	L3331
2665  0303               L5331:
2666                     ; 839         TIM2->CCER2 &= (u8)(~TIM2_CCER2_CC3E);
2668  0303 72115309      	bres	21257,#0
2669                     ; 842         TIM2->CCMR3 = (u8)((TIM2->CCMR3 & (u8)(~TIM2_CCMR_OCM)) | (u8)TIM2_OCMode);
2671  0307 c65307        	ld	a,21255
2672  030a a48f          	and	a,#143
2673  030c 1a02          	or	a,(OFST+2,sp)
2674  030e c75307        	ld	21255,a
2675  0311               L3331:
2676                     ; 844 }
2679  0311 85            	popw	x
2680  0312 81            	ret
2714                     ; 853 void TIM2_SetCounter(u16 Counter)
2714                     ; 854 {
2715                     	switch	.text
2716  0313               _TIM2_SetCounter:
2720                     ; 856     TIM2->CNTRH = (u8)(Counter >> 8);
2722  0313 9e            	ld	a,xh
2723  0314 c7530a        	ld	21258,a
2724                     ; 857     TIM2->CNTRL = (u8)(Counter);
2726  0317 9f            	ld	a,xl
2727  0318 c7530b        	ld	21259,a
2728                     ; 859 }
2731  031b 81            	ret
2765                     ; 868 void TIM2_SetAutoreload(u16 Autoreload)
2765                     ; 869 {
2766                     	switch	.text
2767  031c               _TIM2_SetAutoreload:
2771                     ; 872     TIM2->ARRH = (u8)(Autoreload >> 8);
2773  031c 9e            	ld	a,xh
2774  031d c7530d        	ld	21261,a
2775                     ; 873     TIM2->ARRL = (u8)(Autoreload);
2777  0320 9f            	ld	a,xl
2778  0321 c7530e        	ld	21262,a
2779                     ; 875 }
2782  0324 81            	ret
2816                     ; 884 void TIM2_SetCompare1(u16 Compare1)
2816                     ; 885 {
2817                     	switch	.text
2818  0325               _TIM2_SetCompare1:
2822                     ; 887     TIM2->CCR1H = (u8)(Compare1 >> 8);
2824  0325 9e            	ld	a,xh
2825  0326 c7530f        	ld	21263,a
2826                     ; 888     TIM2->CCR1L = (u8)(Compare1);
2828  0329 9f            	ld	a,xl
2829  032a c75310        	ld	21264,a
2830                     ; 890 }
2833  032d 81            	ret
2867                     ; 899 void TIM2_SetCompare2(u16 Compare2)
2867                     ; 900 {
2868                     	switch	.text
2869  032e               _TIM2_SetCompare2:
2873                     ; 902     TIM2->CCR2H = (u8)(Compare2 >> 8);
2875  032e 9e            	ld	a,xh
2876  032f c75311        	ld	21265,a
2877                     ; 903     TIM2->CCR2L = (u8)(Compare2);
2879  0332 9f            	ld	a,xl
2880  0333 c75312        	ld	21266,a
2881                     ; 905 }
2884  0336 81            	ret
2918                     ; 914 void TIM2_SetCompare3(u16 Compare3)
2918                     ; 915 {
2919                     	switch	.text
2920  0337               _TIM2_SetCompare3:
2924                     ; 917     TIM2->CCR3H = (u8)(Compare3 >> 8);
2926  0337 9e            	ld	a,xh
2927  0338 c75313        	ld	21267,a
2928                     ; 918     TIM2->CCR3L = (u8)(Compare3);
2930  033b 9f            	ld	a,xl
2931  033c c75314        	ld	21268,a
2932                     ; 920 }
2935  033f 81            	ret
2971                     ; 933 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
2971                     ; 934 {
2972                     	switch	.text
2973  0340               _TIM2_SetIC1Prescaler:
2975  0340 88            	push	a
2976       00000000      OFST:	set	0
2979                     ; 936     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
2981                     ; 939     TIM2->CCMR1 = (u8)((TIM2->CCMR1 & (u8)(~TIM2_CCMR_ICxPSC)) | (u8)TIM2_IC1Prescaler);
2983  0341 c65305        	ld	a,21253
2984  0344 a4f3          	and	a,#243
2985  0346 1a01          	or	a,(OFST+1,sp)
2986  0348 c75305        	ld	21253,a
2987                     ; 940 }
2990  034b 84            	pop	a
2991  034c 81            	ret
3027                     ; 952 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3027                     ; 953 {
3028                     	switch	.text
3029  034d               _TIM2_SetIC2Prescaler:
3031  034d 88            	push	a
3032       00000000      OFST:	set	0
3035                     ; 955     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3037                     ; 958     TIM2->CCMR2 = (u8)((TIM2->CCMR2 & (u8)(~TIM2_CCMR_ICxPSC)) | (u8)TIM2_IC2Prescaler);
3039  034e c65306        	ld	a,21254
3040  0351 a4f3          	and	a,#243
3041  0353 1a01          	or	a,(OFST+1,sp)
3042  0355 c75306        	ld	21254,a
3043                     ; 959 }
3046  0358 84            	pop	a
3047  0359 81            	ret
3083                     ; 971 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
3083                     ; 972 {
3084                     	switch	.text
3085  035a               _TIM2_SetIC3Prescaler:
3087  035a 88            	push	a
3088       00000000      OFST:	set	0
3091                     ; 975     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
3093                     ; 977     TIM2->CCMR3 = (u8)((TIM2->CCMR3 & (u8)(~TIM2_CCMR_ICxPSC)) | (u8)TIM2_IC3Prescaler);
3095  035b c65307        	ld	a,21255
3096  035e a4f3          	and	a,#243
3097  0360 1a01          	or	a,(OFST+1,sp)
3098  0362 c75307        	ld	21255,a
3099                     ; 978 }
3102  0365 84            	pop	a
3103  0366 81            	ret
3155                     ; 986 u16 TIM2_GetCapture1(void)
3155                     ; 987 {
3156                     	switch	.text
3157  0367               _TIM2_GetCapture1:
3159  0367 5204          	subw	sp,#4
3160       00000004      OFST:	set	4
3163                     ; 989     u16 tmpccr1 = 0;
3165                     ; 990     u8 tmpccr1l=0, tmpccr1h=0;
3169                     ; 992     tmpccr1h = TIM2->CCR1H;
3171  0369 c6530f        	ld	a,21263
3172  036c 6b02          	ld	(OFST-2,sp),a
3173                     ; 993     tmpccr1l = TIM2->CCR1L;
3175  036e c65310        	ld	a,21264
3176  0371 6b01          	ld	(OFST-3,sp),a
3177                     ; 995     tmpccr1 = (u16)(tmpccr1l);
3179  0373 7b01          	ld	a,(OFST-3,sp)
3180  0375 5f            	clrw	x
3181  0376 97            	ld	xl,a
3182  0377 1f03          	ldw	(OFST-1,sp),x
3183                     ; 996     tmpccr1 |= (u16)((u16)tmpccr1h << 8);
3185  0379 7b02          	ld	a,(OFST-2,sp)
3186  037b 5f            	clrw	x
3187  037c 97            	ld	xl,a
3188  037d 4f            	clr	a
3189  037e 02            	rlwa	x,a
3190  037f 01            	rrwa	x,a
3191  0380 1a04          	or	a,(OFST+0,sp)
3192  0382 01            	rrwa	x,a
3193  0383 1a03          	or	a,(OFST-1,sp)
3194  0385 01            	rrwa	x,a
3195  0386 1f03          	ldw	(OFST-1,sp),x
3196                     ; 998     return (u16)tmpccr1;
3198  0388 1e03          	ldw	x,(OFST-1,sp)
3201  038a 5b04          	addw	sp,#4
3202  038c 81            	ret
3254                     ; 1007 u16 TIM2_GetCapture2(void)
3254                     ; 1008 {
3255                     	switch	.text
3256  038d               _TIM2_GetCapture2:
3258  038d 5204          	subw	sp,#4
3259       00000004      OFST:	set	4
3262                     ; 1010     u16 tmpccr2 = 0;
3264                     ; 1011     u8 tmpccr2l=0, tmpccr2h=0;
3268                     ; 1013     tmpccr2h = TIM2->CCR2H;
3270  038f c65311        	ld	a,21265
3271  0392 6b02          	ld	(OFST-2,sp),a
3272                     ; 1014     tmpccr2l = TIM2->CCR2L;
3274  0394 c65312        	ld	a,21266
3275  0397 6b01          	ld	(OFST-3,sp),a
3276                     ; 1016     tmpccr2 = (u16)(tmpccr2l);
3278  0399 7b01          	ld	a,(OFST-3,sp)
3279  039b 5f            	clrw	x
3280  039c 97            	ld	xl,a
3281  039d 1f03          	ldw	(OFST-1,sp),x
3282                     ; 1017     tmpccr2 |= (u16)((u16)tmpccr2h << 8);
3284  039f 7b02          	ld	a,(OFST-2,sp)
3285  03a1 5f            	clrw	x
3286  03a2 97            	ld	xl,a
3287  03a3 4f            	clr	a
3288  03a4 02            	rlwa	x,a
3289  03a5 01            	rrwa	x,a
3290  03a6 1a04          	or	a,(OFST+0,sp)
3291  03a8 01            	rrwa	x,a
3292  03a9 1a03          	or	a,(OFST-1,sp)
3293  03ab 01            	rrwa	x,a
3294  03ac 1f03          	ldw	(OFST-1,sp),x
3295                     ; 1019     return (u16)tmpccr2;
3297  03ae 1e03          	ldw	x,(OFST-1,sp)
3300  03b0 5b04          	addw	sp,#4
3301  03b2 81            	ret
3353                     ; 1028 u16 TIM2_GetCapture3(void)
3353                     ; 1029 {
3354                     	switch	.text
3355  03b3               _TIM2_GetCapture3:
3357  03b3 5204          	subw	sp,#4
3358       00000004      OFST:	set	4
3361                     ; 1031     u16 tmpccr3 = 0;
3363                     ; 1032     u8 tmpccr3l=0, tmpccr3h=0;
3367                     ; 1034     tmpccr3h = TIM2->CCR3H;
3369  03b5 c65313        	ld	a,21267
3370  03b8 6b02          	ld	(OFST-2,sp),a
3371                     ; 1035     tmpccr3l = TIM2->CCR3L;
3373  03ba c65314        	ld	a,21268
3374  03bd 6b01          	ld	(OFST-3,sp),a
3375                     ; 1037     tmpccr3 = (u16)(tmpccr3l);
3377  03bf 7b01          	ld	a,(OFST-3,sp)
3378  03c1 5f            	clrw	x
3379  03c2 97            	ld	xl,a
3380  03c3 1f03          	ldw	(OFST-1,sp),x
3381                     ; 1038     tmpccr3 |= (u16)((u16)tmpccr3h << 8);
3383  03c5 7b02          	ld	a,(OFST-2,sp)
3384  03c7 5f            	clrw	x
3385  03c8 97            	ld	xl,a
3386  03c9 4f            	clr	a
3387  03ca 02            	rlwa	x,a
3388  03cb 01            	rrwa	x,a
3389  03cc 1a04          	or	a,(OFST+0,sp)
3390  03ce 01            	rrwa	x,a
3391  03cf 1a03          	or	a,(OFST-1,sp)
3392  03d1 01            	rrwa	x,a
3393  03d2 1f03          	ldw	(OFST-1,sp),x
3394                     ; 1040     return (u16)tmpccr3;
3396  03d4 1e03          	ldw	x,(OFST-1,sp)
3399  03d6 5b04          	addw	sp,#4
3400  03d8 81            	ret
3423                     ; 1049 u16 TIM2_GetCounter(void)
3423                     ; 1050 {
3424                     	switch	.text
3425  03d9               _TIM2_GetCounter:
3427  03d9 89            	pushw	x
3428       00000002      OFST:	set	2
3431                     ; 1052     return (u16)(((u16)TIM2->CNTRH << 8) | (u16)(TIM2->CNTRL));
3433  03da c6530b        	ld	a,21259
3434  03dd 5f            	clrw	x
3435  03de 97            	ld	xl,a
3436  03df 1f01          	ldw	(OFST-1,sp),x
3437  03e1 c6530a        	ld	a,21258
3438  03e4 5f            	clrw	x
3439  03e5 97            	ld	xl,a
3440  03e6 4f            	clr	a
3441  03e7 02            	rlwa	x,a
3442  03e8 01            	rrwa	x,a
3443  03e9 1a02          	or	a,(OFST+0,sp)
3444  03eb 01            	rrwa	x,a
3445  03ec 1a01          	or	a,(OFST-1,sp)
3446  03ee 01            	rrwa	x,a
3449  03ef 5b02          	addw	sp,#2
3450  03f1 81            	ret
3474                     ; 1062 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
3474                     ; 1063 {
3475                     	switch	.text
3476  03f2               _TIM2_GetPrescaler:
3480                     ; 1065     return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
3482  03f2 c6530c        	ld	a,21260
3485  03f5 81            	ret
3624                     ; 1082 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
3624                     ; 1083 {
3625                     	switch	.text
3626  03f6               _TIM2_GetFlagStatus:
3628  03f6 5204          	subw	sp,#4
3629       00000004      OFST:	set	4
3632                     ; 1084     volatile FlagStatus bitstatus = RESET;
3634  03f8 0f04          	clr	(OFST+0,sp)
3635                     ; 1088     assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
3637                     ; 1090     tim2_flag_l = (u8)(TIM2_FLAG);
3639  03fa 9f            	ld	a,xl
3640  03fb 6b02          	ld	(OFST-2,sp),a
3641                     ; 1091     tim2_flag_h = (u8)(TIM2_FLAG >> 8);
3643  03fd 9e            	ld	a,xh
3644  03fe 6b03          	ld	(OFST-1,sp),a
3645                     ; 1093     if (((TIM2->SR1 & tim2_flag_l) | (TIM2->SR2 & tim2_flag_h)) != (u8)RESET )
3647  0400 c65303        	ld	a,21251
3648  0403 1403          	and	a,(OFST-1,sp)
3649  0405 6b01          	ld	(OFST-3,sp),a
3650  0407 c65302        	ld	a,21250
3651  040a 1402          	and	a,(OFST-2,sp)
3652  040c 1a01          	or	a,(OFST-3,sp)
3653  040e 2706          	jreq	L7271
3654                     ; 1095         bitstatus = SET;
3656  0410 a601          	ld	a,#1
3657  0412 6b04          	ld	(OFST+0,sp),a
3659  0414 2002          	jra	L1371
3660  0416               L7271:
3661                     ; 1099         bitstatus = RESET;
3663  0416 0f04          	clr	(OFST+0,sp)
3664  0418               L1371:
3665                     ; 1101     return (FlagStatus)bitstatus;
3667  0418 7b04          	ld	a,(OFST+0,sp)
3670  041a 5b04          	addw	sp,#4
3671  041c 81            	ret
3706                     ; 1118 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
3706                     ; 1119 {
3707                     	switch	.text
3708  041d               _TIM2_ClearFlag:
3710  041d 89            	pushw	x
3711       00000000      OFST:	set	0
3714                     ; 1121     assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
3716                     ; 1124     TIM2->SR1 = (u8)(~((u8)(TIM2_FLAG)));
3718  041e 9f            	ld	a,xl
3719  041f 43            	cpl	a
3720  0420 c75302        	ld	21250,a
3721                     ; 1125     TIM2->SR2 = (u8)(~((u8)(TIM2_FLAG >> 8)));
3723  0423 7b01          	ld	a,(OFST+1,sp)
3724  0425 43            	cpl	a
3725  0426 c75303        	ld	21251,a
3726                     ; 1126 }
3729  0429 85            	popw	x
3730  042a 81            	ret
3794                     ; 1140 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
3794                     ; 1141 {
3795                     	switch	.text
3796  042b               _TIM2_GetITStatus:
3798  042b 88            	push	a
3799  042c 5203          	subw	sp,#3
3800       00000003      OFST:	set	3
3803                     ; 1142     volatile ITStatus bitstatus = RESET;
3805  042e 0f03          	clr	(OFST+0,sp)
3806                     ; 1143     vu8 TIM2_itStatus = 0, TIM2_itEnable = 0;
3808  0430 0f01          	clr	(OFST-2,sp)
3811  0432 0f02          	clr	(OFST-1,sp)
3812                     ; 1146     assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
3814                     ; 1148     TIM2_itStatus = (u8)(TIM2->SR1 & TIM2_IT);
3816  0434 c45302        	and	a,21250
3817  0437 6b01          	ld	(OFST-2,sp),a
3818                     ; 1150     TIM2_itEnable = (u8)(TIM2->IER & TIM2_IT);
3820  0439 c65301        	ld	a,21249
3821  043c 1404          	and	a,(OFST+1,sp)
3822  043e 6b02          	ld	(OFST-1,sp),a
3823                     ; 1152     if ((TIM2_itStatus != (u8)RESET ) && (TIM2_itEnable != (u8)RESET ))
3825  0440 0d01          	tnz	(OFST-2,sp)
3826  0442 270a          	jreq	L3002
3828  0444 0d02          	tnz	(OFST-1,sp)
3829  0446 2706          	jreq	L3002
3830                     ; 1154         bitstatus = SET;
3832  0448 a601          	ld	a,#1
3833  044a 6b03          	ld	(OFST+0,sp),a
3835  044c 2002          	jra	L5002
3836  044e               L3002:
3837                     ; 1158         bitstatus = RESET;
3839  044e 0f03          	clr	(OFST+0,sp)
3840  0450               L5002:
3841                     ; 1160     return (ITStatus)(bitstatus);
3843  0450 7b03          	ld	a,(OFST+0,sp)
3846  0452 5b04          	addw	sp,#4
3847  0454 81            	ret
3883                     ; 1174 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
3883                     ; 1175 {
3884                     	switch	.text
3885  0455               _TIM2_ClearITPendingBit:
3889                     ; 1177     assert_param(IS_TIM2_IT_OK(TIM2_IT));
3891                     ; 1180     TIM2->SR1 = (u8)(~TIM2_IT);
3893  0455 43            	cpl	a
3894  0456 c75302        	ld	21250,a
3895                     ; 1181 }
3898  0459 81            	ret
3950                     ; 1200 static void TI1_Config(u8 TIM2_ICPolarity,
3950                     ; 1201                        u8 TIM2_ICSelection,
3950                     ; 1202                        u8 TIM2_ICFilter)
3950                     ; 1203 {
3951                     	switch	.text
3952  045a               L3_TI1_Config:
3954  045a 89            	pushw	x
3955  045b 88            	push	a
3956       00000001      OFST:	set	1
3959                     ; 1205     TIM2->CCER1 &= (u8)(~TIM2_CCER1_CC1E);
3961  045c 72115308      	bres	21256,#0
3962                     ; 1208     TIM2->CCMR1  = (u8)((TIM2->CCMR1 & (u8)(~( TIM2_CCMR_CCxS     |        TIM2_CCMR_ICxF    ))) | (u8)(( (TIM2_ICSelection)) | ((u8)( TIM2_ICFilter << 4))));
3964  0460 7b06          	ld	a,(OFST+5,sp)
3965  0462 97            	ld	xl,a
3966  0463 a610          	ld	a,#16
3967  0465 42            	mul	x,a
3968  0466 9f            	ld	a,xl
3969  0467 1a03          	or	a,(OFST+2,sp)
3970  0469 6b01          	ld	(OFST+0,sp),a
3971  046b c65305        	ld	a,21253
3972  046e a40c          	and	a,#12
3973  0470 1a01          	or	a,(OFST+0,sp)
3974  0472 c75305        	ld	21253,a
3975                     ; 1211     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
3977  0475 0d02          	tnz	(OFST+1,sp)
3978  0477 2706          	jreq	L3502
3979                     ; 1213         TIM2->CCER1 |= TIM2_CCER1_CC1P;
3981  0479 72125308      	bset	21256,#1
3983  047d 2004          	jra	L5502
3984  047f               L3502:
3985                     ; 1217         TIM2->CCER1 &= (u8)(~TIM2_CCER1_CC1P);
3987  047f 72135308      	bres	21256,#1
3988  0483               L5502:
3989                     ; 1220     TIM2->CCER1 |= TIM2_CCER1_CC1E;
3991  0483 72105308      	bset	21256,#0
3992                     ; 1221 }
3995  0487 5b03          	addw	sp,#3
3996  0489 81            	ret
4048                     ; 1240 static void TI2_Config(u8 TIM2_ICPolarity,
4048                     ; 1241                        u8 TIM2_ICSelection,
4048                     ; 1242                        u8 TIM2_ICFilter)
4048                     ; 1243 {
4049                     	switch	.text
4050  048a               L5_TI2_Config:
4052  048a 89            	pushw	x
4053  048b 88            	push	a
4054       00000001      OFST:	set	1
4057                     ; 1245     TIM2->CCER1 &= (u8)(~TIM2_CCER1_CC2E);
4059  048c 72195308      	bres	21256,#4
4060                     ; 1248     TIM2->CCMR2 = (u8)((TIM2->CCMR2 & (u8)(~( TIM2_CCMR_CCxS     |        TIM2_CCMR_ICxF    ))) | (u8)(( (TIM2_ICSelection)) | ((u8)( TIM2_ICFilter << 4))));
4062  0490 7b06          	ld	a,(OFST+5,sp)
4063  0492 97            	ld	xl,a
4064  0493 a610          	ld	a,#16
4065  0495 42            	mul	x,a
4066  0496 9f            	ld	a,xl
4067  0497 1a03          	or	a,(OFST+2,sp)
4068  0499 6b01          	ld	(OFST+0,sp),a
4069  049b c65306        	ld	a,21254
4070  049e a40c          	and	a,#12
4071  04a0 1a01          	or	a,(OFST+0,sp)
4072  04a2 c75306        	ld	21254,a
4073                     ; 1252     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4075  04a5 0d02          	tnz	(OFST+1,sp)
4076  04a7 2706          	jreq	L5012
4077                     ; 1254         TIM2->CCER1 |= TIM2_CCER1_CC2P;
4079  04a9 721a5308      	bset	21256,#5
4081  04ad 2004          	jra	L7012
4082  04af               L5012:
4083                     ; 1258         TIM2->CCER1 &= (u8)(~TIM2_CCER1_CC2P);
4085  04af 721b5308      	bres	21256,#5
4086  04b3               L7012:
4087                     ; 1262     TIM2->CCER1 |= TIM2_CCER1_CC2E;
4089  04b3 72185308      	bset	21256,#4
4090                     ; 1264 }
4093  04b7 5b03          	addw	sp,#3
4094  04b9 81            	ret
4146                     ; 1280 static void TI3_Config(u8 TIM2_ICPolarity, u8 TIM2_ICSelection,
4146                     ; 1281                        u8 TIM2_ICFilter)
4146                     ; 1282 {
4147                     	switch	.text
4148  04ba               L7_TI3_Config:
4150  04ba 89            	pushw	x
4151  04bb 88            	push	a
4152       00000001      OFST:	set	1
4155                     ; 1284     TIM2->CCER2 &=  (u8)(~TIM2_CCER2_CC3E);
4157  04bc 72115309      	bres	21257,#0
4158                     ; 1287     TIM2->CCMR3 = (u8)((TIM2->CCMR3 & (u8)(~( TIM2_CCMR_CCxS     |        TIM2_CCMR_ICxF    ))) | (u8)(( (TIM2_ICSelection)) | ((u8)( TIM2_ICFilter << 4))));
4160  04c0 7b06          	ld	a,(OFST+5,sp)
4161  04c2 97            	ld	xl,a
4162  04c3 a610          	ld	a,#16
4163  04c5 42            	mul	x,a
4164  04c6 9f            	ld	a,xl
4165  04c7 1a03          	or	a,(OFST+2,sp)
4166  04c9 6b01          	ld	(OFST+0,sp),a
4167  04cb c65307        	ld	a,21255
4168  04ce a40c          	and	a,#12
4169  04d0 1a01          	or	a,(OFST+0,sp)
4170  04d2 c75307        	ld	21255,a
4171                     ; 1291     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4173  04d5 0d02          	tnz	(OFST+1,sp)
4174  04d7 2706          	jreq	L7312
4175                     ; 1293         TIM2->CCER2 |= TIM2_CCER2_CC3P;
4177  04d9 72125309      	bset	21257,#1
4179  04dd 2004          	jra	L1412
4180  04df               L7312:
4181                     ; 1297         TIM2->CCER2 &= (u8)(~TIM2_CCER2_CC3P);
4183  04df 72135309      	bres	21257,#1
4184  04e3               L1412:
4185                     ; 1300     TIM2->CCER2 |= TIM2_CCER2_CC3E;
4187  04e3 72105309      	bset	21257,#0
4188                     ; 1301 }
4191  04e7 5b03          	addw	sp,#3
4192  04e9 81            	ret
4205                     	xdef	_TIM2_ClearITPendingBit
4206                     	xdef	_TIM2_GetITStatus
4207                     	xdef	_TIM2_ClearFlag
4208                     	xdef	_TIM2_GetFlagStatus
4209                     	xdef	_TIM2_GetPrescaler
4210                     	xdef	_TIM2_GetCounter
4211                     	xdef	_TIM2_GetCapture3
4212                     	xdef	_TIM2_GetCapture2
4213                     	xdef	_TIM2_GetCapture1
4214                     	xdef	_TIM2_SetIC3Prescaler
4215                     	xdef	_TIM2_SetIC2Prescaler
4216                     	xdef	_TIM2_SetIC1Prescaler
4217                     	xdef	_TIM2_SetCompare3
4218                     	xdef	_TIM2_SetCompare2
4219                     	xdef	_TIM2_SetCompare1
4220                     	xdef	_TIM2_SetAutoreload
4221                     	xdef	_TIM2_SetCounter
4222                     	xdef	_TIM2_SelectOCxM
4223                     	xdef	_TIM2_CCxCmd
4224                     	xdef	_TIM2_OC3PolarityConfig
4225                     	xdef	_TIM2_OC2PolarityConfig
4226                     	xdef	_TIM2_OC1PolarityConfig
4227                     	xdef	_TIM2_GenerateEvent
4228                     	xdef	_TIM2_OC3PreloadConfig
4229                     	xdef	_TIM2_OC2PreloadConfig
4230                     	xdef	_TIM2_OC1PreloadConfig
4231                     	xdef	_TIM2_ARRPreloadConfig
4232                     	xdef	_TIM2_ForcedOC3Config
4233                     	xdef	_TIM2_ForcedOC2Config
4234                     	xdef	_TIM2_ForcedOC1Config
4235                     	xdef	_TIM2_PrescalerConfig
4236                     	xdef	_TIM2_SelectOnePulseMode
4237                     	xdef	_TIM2_UpdateRequestConfig
4238                     	xdef	_TIM2_UpdateDisableConfig
4239                     	xdef	_TIM2_ITConfig
4240                     	xdef	_TIM2_Cmd
4241                     	xdef	_TIM2_PWMIConfig
4242                     	xdef	_TIM2_ICInit
4243                     	xdef	_TIM2_OC3Init
4244                     	xdef	_TIM2_OC2Init
4245                     	xdef	_TIM2_OC1Init
4246                     	xdef	_TIM2_TimeBaseInit
4247                     	xdef	_TIM2_DeInit
4266                     	end
