   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.31 - 09 Feb 2010
   3                     ; Generator V4.3.3 - 10 Feb 2010
  43                     ; 43 void TIM3_DeInit(void)
  43                     ; 44 {
  45                     	switch	.text
  46  0000               _TIM3_DeInit:
  50                     ; 46     TIM3->CR1 = (u8)TIM3_CR1_RESET_VALUE;
  52  0000 725f5320      	clr	21280
  53                     ; 47     TIM3->IER = (u8)TIM3_IER_RESET_VALUE;
  55  0004 725f5321      	clr	21281
  56                     ; 48     TIM3->SR2 = (u8)TIM3_SR2_RESET_VALUE;
  58  0008 725f5323      	clr	21283
  59                     ; 51     TIM3->CCER1 = (u8)TIM3_CCER1_RESET_VALUE;
  61  000c 725f5327      	clr	21287
  62                     ; 54     TIM3->CCER1 = (u8)TIM3_CCER1_RESET_VALUE;
  64  0010 725f5327      	clr	21287
  65                     ; 55     TIM3->CCMR1 = (u8)TIM3_CCMR1_RESET_VALUE;
  67  0014 725f5325      	clr	21285
  68                     ; 56     TIM3->CCMR2 = (u8)TIM3_CCMR2_RESET_VALUE;
  70  0018 725f5326      	clr	21286
  71                     ; 57     TIM3->CNTRH = (u8)TIM3_CNTRH_RESET_VALUE;
  73  001c 725f5328      	clr	21288
  74                     ; 58     TIM3->CNTRL = (u8)TIM3_CNTRL_RESET_VALUE;
  76  0020 725f5329      	clr	21289
  77                     ; 59     TIM3->PSCR = (u8)TIM3_PSCR_RESET_VALUE;
  79  0024 725f532a      	clr	21290
  80                     ; 60     TIM3->ARRH  = (u8)TIM3_ARRH_RESET_VALUE;
  82  0028 35ff532b      	mov	21291,#255
  83                     ; 61     TIM3->ARRL  = (u8)TIM3_ARRL_RESET_VALUE;
  85  002c 35ff532c      	mov	21292,#255
  86                     ; 62     TIM3->CCR1H = (u8)TIM3_CCR1H_RESET_VALUE;
  88  0030 725f532d      	clr	21293
  89                     ; 63     TIM3->CCR1L = (u8)TIM3_CCR1L_RESET_VALUE;
  91  0034 725f532e      	clr	21294
  92                     ; 64     TIM3->CCR2H = (u8)TIM3_CCR2H_RESET_VALUE;
  94  0038 725f532f      	clr	21295
  95                     ; 65     TIM3->CCR2L = (u8)TIM3_CCR2L_RESET_VALUE;
  97  003c 725f5330      	clr	21296
  98                     ; 66     TIM3->SR1 = (u8)TIM3_SR1_RESET_VALUE;
 100  0040 725f5322      	clr	21282
 101                     ; 67 }
 104  0044 81            	ret
 272                     ; 76 void TIM3_TimeBaseInit( TIM3_Prescaler_TypeDef TIM3_Prescaler,
 272                     ; 77                         u16 TIM3_Period)
 272                     ; 78 {
 273                     	switch	.text
 274  0045               _TIM3_TimeBaseInit:
 276  0045 88            	push	a
 277       00000000      OFST:	set	0
 280                     ; 80     TIM3->PSCR = (u8)(TIM3_Prescaler);
 282  0046 c7532a        	ld	21290,a
 283                     ; 82     TIM3->ARRH = (u8)(TIM3_Period >> 8);
 285  0049 7b04          	ld	a,(OFST+4,sp)
 286  004b c7532b        	ld	21291,a
 287                     ; 83     TIM3->ARRL = (u8)(TIM3_Period);
 289  004e 7b05          	ld	a,(OFST+5,sp)
 290  0050 c7532c        	ld	21292,a
 291                     ; 84 }
 294  0053 84            	pop	a
 295  0054 81            	ret
 452                     ; 94 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 452                     ; 95                   TIM3_OutputState_TypeDef TIM3_OutputState,
 452                     ; 96                   u16 TIM3_Pulse,
 452                     ; 97                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 452                     ; 98 {
 453                     	switch	.text
 454  0055               _TIM3_OC1Init:
 456  0055 89            	pushw	x
 457  0056 88            	push	a
 458       00000001      OFST:	set	1
 461                     ; 100     assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 463                     ; 101     assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 465                     ; 102     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 467                     ; 105     TIM3->CCER1 &= (u8)(~( TIM3_CCER1_CC1E | TIM3_CCER1_CC1P));
 469  0057 c65327        	ld	a,21287
 470  005a a4fc          	and	a,#252
 471  005c c75327        	ld	21287,a
 472                     ; 107     TIM3->CCER1 |= (u8)((TIM3_OutputState  & TIM3_CCER1_CC1E   ) | (TIM3_OCPolarity   & TIM3_CCER1_CC1P   ));
 474  005f 7b08          	ld	a,(OFST+7,sp)
 475  0061 a402          	and	a,#2
 476  0063 6b01          	ld	(OFST+0,sp),a
 477  0065 9f            	ld	a,xl
 478  0066 a401          	and	a,#1
 479  0068 1a01          	or	a,(OFST+0,sp)
 480  006a ca5327        	or	a,21287
 481  006d c75327        	ld	21287,a
 482                     ; 110     TIM3->CCMR1 = (u8)((TIM3->CCMR1 & (u8)(~TIM3_CCMR_OCM)) | (u8)TIM3_OCMode);
 484  0070 c65325        	ld	a,21285
 485  0073 a48f          	and	a,#143
 486  0075 1a02          	or	a,(OFST+1,sp)
 487  0077 c75325        	ld	21285,a
 488                     ; 113     TIM3->CCR1H = (u8)(TIM3_Pulse >> 8);
 490  007a 7b06          	ld	a,(OFST+5,sp)
 491  007c c7532d        	ld	21293,a
 492                     ; 114     TIM3->CCR1L = (u8)(TIM3_Pulse);
 494  007f 7b07          	ld	a,(OFST+6,sp)
 495  0081 c7532e        	ld	21294,a
 496                     ; 115 }
 499  0084 5b03          	addw	sp,#3
 500  0086 81            	ret
 564                     ; 126 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 564                     ; 127                   TIM3_OutputState_TypeDef TIM3_OutputState,
 564                     ; 128                   u16 TIM3_Pulse,
 564                     ; 129                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 564                     ; 130 {
 565                     	switch	.text
 566  0087               _TIM3_OC2Init:
 568  0087 89            	pushw	x
 569  0088 88            	push	a
 570       00000001      OFST:	set	1
 573                     ; 132     assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 575                     ; 133     assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 577                     ; 134     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 579                     ; 138     TIM3->CCER1 &= (u8)(~( TIM3_CCER1_CC2E |  TIM3_CCER1_CC2P ));
 581  0089 c65327        	ld	a,21287
 582  008c a4cf          	and	a,#207
 583  008e c75327        	ld	21287,a
 584                     ; 140     TIM3->CCER1 |= (u8)((TIM3_OutputState  & TIM3_CCER1_CC2E   ) | (TIM3_OCPolarity   & TIM3_CCER1_CC2P ));
 586  0091 7b08          	ld	a,(OFST+7,sp)
 587  0093 a420          	and	a,#32
 588  0095 6b01          	ld	(OFST+0,sp),a
 589  0097 9f            	ld	a,xl
 590  0098 a410          	and	a,#16
 591  009a 1a01          	or	a,(OFST+0,sp)
 592  009c ca5327        	or	a,21287
 593  009f c75327        	ld	21287,a
 594                     ; 144     TIM3->CCMR2 = (u8)((TIM3->CCMR2 & (u8)(~TIM3_CCMR_OCM)) | (u8)TIM3_OCMode);
 596  00a2 c65326        	ld	a,21286
 597  00a5 a48f          	and	a,#143
 598  00a7 1a02          	or	a,(OFST+1,sp)
 599  00a9 c75326        	ld	21286,a
 600                     ; 148     TIM3->CCR2H = (u8)(TIM3_Pulse >> 8);
 602  00ac 7b06          	ld	a,(OFST+5,sp)
 603  00ae c7532f        	ld	21295,a
 604                     ; 149     TIM3->CCR2L = (u8)(TIM3_Pulse);
 606  00b1 7b07          	ld	a,(OFST+6,sp)
 607  00b3 c75330        	ld	21296,a
 608                     ; 150 }
 611  00b6 5b03          	addw	sp,#3
 612  00b8 81            	ret
 796                     ; 161 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
 796                     ; 162                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 796                     ; 163                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
 796                     ; 164                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 796                     ; 165                  u8 TIM3_ICFilter)
 796                     ; 166 {
 797                     	switch	.text
 798  00b9               _TIM3_ICInit:
 800  00b9 89            	pushw	x
 801       00000000      OFST:	set	0
 804                     ; 168     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
 806                     ; 169     assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 808                     ; 170     assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 810                     ; 171     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 812                     ; 172     assert_param(IS_TIM3_IC_FILTER_OK(TIM3_ICFilter));
 814                     ; 174     if (TIM3_Channel != TIM3_CHANNEL_2)
 816  00ba 9e            	ld	a,xh
 817  00bb a101          	cp	a,#1
 818  00bd 2714          	jreq	L343
 819                     ; 177         TI1_Config((u8)TIM3_ICPolarity,
 819                     ; 178                    (u8)TIM3_ICSelection,
 819                     ; 179                    (u8)TIM3_ICFilter);
 821  00bf 7b07          	ld	a,(OFST+7,sp)
 822  00c1 88            	push	a
 823  00c2 7b06          	ld	a,(OFST+6,sp)
 824  00c4 97            	ld	xl,a
 825  00c5 7b03          	ld	a,(OFST+3,sp)
 826  00c7 95            	ld	xh,a
 827  00c8 cd036c        	call	L3_TI1_Config
 829  00cb 84            	pop	a
 830                     ; 182         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
 832  00cc 7b06          	ld	a,(OFST+6,sp)
 833  00ce cd0285        	call	_TIM3_SetIC1Prescaler
 836  00d1 2012          	jra	L543
 837  00d3               L343:
 838                     ; 187         TI2_Config((u8)TIM3_ICPolarity,
 838                     ; 188                    (u8)TIM3_ICSelection,
 838                     ; 189                    (u8)TIM3_ICFilter);
 840  00d3 7b07          	ld	a,(OFST+7,sp)
 841  00d5 88            	push	a
 842  00d6 7b06          	ld	a,(OFST+6,sp)
 843  00d8 97            	ld	xl,a
 844  00d9 7b03          	ld	a,(OFST+3,sp)
 845  00db 95            	ld	xh,a
 846  00dc cd039c        	call	L5_TI2_Config
 848  00df 84            	pop	a
 849                     ; 192         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
 851  00e0 7b06          	ld	a,(OFST+6,sp)
 852  00e2 cd0292        	call	_TIM3_SetIC2Prescaler
 854  00e5               L543:
 855                     ; 194 }
 858  00e5 85            	popw	x
 859  00e6 81            	ret
 955                     ; 204 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
 955                     ; 205                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 955                     ; 206                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
 955                     ; 207                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 955                     ; 208                      u8 TIM3_ICFilter)
 955                     ; 209 {
 956                     	switch	.text
 957  00e7               _TIM3_PWMIConfig:
 959  00e7 89            	pushw	x
 960  00e8 89            	pushw	x
 961       00000002      OFST:	set	2
 964                     ; 210     u8 icpolarity = (u8)TIM3_ICPOLARITY_RISING;
 966                     ; 211     u8 icselection = (u8)TIM3_ICSELECTION_DIRECTTI;
 968                     ; 214     assert_param(IS_TIM3_PWMI_CHANNEL_OK(TIM3_Channel));
 970                     ; 215     assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 972                     ; 216     assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 974                     ; 217     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 976                     ; 220     if (TIM3_ICPolarity != TIM3_ICPOLARITY_FALLING)
 978  00e9 9f            	ld	a,xl
 979  00ea a144          	cp	a,#68
 980  00ec 2706          	jreq	L514
 981                     ; 222         icpolarity = (u8)TIM3_ICPOLARITY_FALLING;
 983  00ee a644          	ld	a,#68
 984  00f0 6b01          	ld	(OFST-1,sp),a
 986  00f2 2002          	jra	L714
 987  00f4               L514:
 988                     ; 226         icpolarity = (u8)TIM3_ICPOLARITY_RISING;
 990  00f4 0f01          	clr	(OFST-1,sp)
 991  00f6               L714:
 992                     ; 230     if (TIM3_ICSelection == TIM3_ICSELECTION_DIRECTTI)
 994  00f6 7b07          	ld	a,(OFST+5,sp)
 995  00f8 a101          	cp	a,#1
 996  00fa 2606          	jrne	L124
 997                     ; 232         icselection = (u8)TIM3_ICSELECTION_INDIRECTTI;
 999  00fc a602          	ld	a,#2
1000  00fe 6b02          	ld	(OFST+0,sp),a
1002  0100 2004          	jra	L324
1003  0102               L124:
1004                     ; 236         icselection = (u8)TIM3_ICSELECTION_DIRECTTI;
1006  0102 a601          	ld	a,#1
1007  0104 6b02          	ld	(OFST+0,sp),a
1008  0106               L324:
1009                     ; 239     if (TIM3_Channel != TIM3_CHANNEL_2)
1011  0106 7b03          	ld	a,(OFST+1,sp)
1012  0108 a101          	cp	a,#1
1013  010a 2726          	jreq	L524
1014                     ; 242         TI1_Config((u8)TIM3_ICPolarity, (u8)TIM3_ICSelection,
1014                     ; 243                    (u8)TIM3_ICFilter);
1016  010c 7b09          	ld	a,(OFST+7,sp)
1017  010e 88            	push	a
1018  010f 7b08          	ld	a,(OFST+6,sp)
1019  0111 97            	ld	xl,a
1020  0112 7b05          	ld	a,(OFST+3,sp)
1021  0114 95            	ld	xh,a
1022  0115 cd036c        	call	L3_TI1_Config
1024  0118 84            	pop	a
1025                     ; 246         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1027  0119 7b08          	ld	a,(OFST+6,sp)
1028  011b cd0285        	call	_TIM3_SetIC1Prescaler
1030                     ; 249         TI2_Config(icpolarity, icselection, TIM3_ICFilter);
1032  011e 7b09          	ld	a,(OFST+7,sp)
1033  0120 88            	push	a
1034  0121 7b03          	ld	a,(OFST+1,sp)
1035  0123 97            	ld	xl,a
1036  0124 7b02          	ld	a,(OFST+0,sp)
1037  0126 95            	ld	xh,a
1038  0127 cd039c        	call	L5_TI2_Config
1040  012a 84            	pop	a
1041                     ; 252         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1043  012b 7b08          	ld	a,(OFST+6,sp)
1044  012d cd0292        	call	_TIM3_SetIC2Prescaler
1047  0130 2024          	jra	L724
1048  0132               L524:
1049                     ; 257         TI2_Config((u8)TIM3_ICPolarity, (u8)TIM3_ICSelection,
1049                     ; 258                    (u8)TIM3_ICFilter);
1051  0132 7b09          	ld	a,(OFST+7,sp)
1052  0134 88            	push	a
1053  0135 7b08          	ld	a,(OFST+6,sp)
1054  0137 97            	ld	xl,a
1055  0138 7b05          	ld	a,(OFST+3,sp)
1056  013a 95            	ld	xh,a
1057  013b cd039c        	call	L5_TI2_Config
1059  013e 84            	pop	a
1060                     ; 261         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1062  013f 7b08          	ld	a,(OFST+6,sp)
1063  0141 cd0292        	call	_TIM3_SetIC2Prescaler
1065                     ; 264         TI1_Config(icpolarity, icselection, TIM3_ICFilter);
1067  0144 7b09          	ld	a,(OFST+7,sp)
1068  0146 88            	push	a
1069  0147 7b03          	ld	a,(OFST+1,sp)
1070  0149 97            	ld	xl,a
1071  014a 7b02          	ld	a,(OFST+0,sp)
1072  014c 95            	ld	xh,a
1073  014d cd036c        	call	L3_TI1_Config
1075  0150 84            	pop	a
1076                     ; 267         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1078  0151 7b08          	ld	a,(OFST+6,sp)
1079  0153 cd0285        	call	_TIM3_SetIC1Prescaler
1081  0156               L724:
1082                     ; 269 }
1085  0156 5b04          	addw	sp,#4
1086  0158 81            	ret
1141                     ; 278 void TIM3_Cmd(FunctionalState NewState)
1141                     ; 279 {
1142                     	switch	.text
1143  0159               _TIM3_Cmd:
1147                     ; 281     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1149                     ; 284     if (NewState != DISABLE)
1151  0159 4d            	tnz	a
1152  015a 2706          	jreq	L754
1153                     ; 286         TIM3->CR1 |= (u8)TIM3_CR1_CEN;
1155  015c 72105320      	bset	21280,#0
1157  0160 2004          	jra	L164
1158  0162               L754:
1159                     ; 290         TIM3->CR1 &= (u8)(~TIM3_CR1_CEN);
1161  0162 72115320      	bres	21280,#0
1162  0166               L164:
1163                     ; 292 }
1166  0166 81            	ret
1238                     ; 307 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
1238                     ; 308 {
1239                     	switch	.text
1240  0167               _TIM3_ITConfig:
1242  0167 89            	pushw	x
1243       00000000      OFST:	set	0
1246                     ; 310     assert_param(IS_TIM3_IT_OK(TIM3_IT));
1248                     ; 311     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1250                     ; 313     if (NewState != DISABLE)
1252  0168 9f            	ld	a,xl
1253  0169 4d            	tnz	a
1254  016a 2709          	jreq	L715
1255                     ; 316         TIM3->IER |= (u8)TIM3_IT;
1257  016c 9e            	ld	a,xh
1258  016d ca5321        	or	a,21281
1259  0170 c75321        	ld	21281,a
1261  0173 2009          	jra	L125
1262  0175               L715:
1263                     ; 321         TIM3->IER &= (u8)(~TIM3_IT);
1265  0175 7b01          	ld	a,(OFST+1,sp)
1266  0177 43            	cpl	a
1267  0178 c45321        	and	a,21281
1268  017b c75321        	ld	21281,a
1269  017e               L125:
1270                     ; 323 }
1273  017e 85            	popw	x
1274  017f 81            	ret
1310                     ; 332 void TIM3_UpdateDisableConfig(FunctionalState NewState)
1310                     ; 333 {
1311                     	switch	.text
1312  0180               _TIM3_UpdateDisableConfig:
1316                     ; 335     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1318                     ; 338     if (NewState != DISABLE)
1320  0180 4d            	tnz	a
1321  0181 2706          	jreq	L145
1322                     ; 340         TIM3->CR1 |= TIM3_CR1_UDIS;
1324  0183 72125320      	bset	21280,#1
1326  0187 2004          	jra	L345
1327  0189               L145:
1328                     ; 344         TIM3->CR1 &= (u8)(~TIM3_CR1_UDIS);
1330  0189 72135320      	bres	21280,#1
1331  018d               L345:
1332                     ; 346 }
1335  018d 81            	ret
1393                     ; 356 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
1393                     ; 357 {
1394                     	switch	.text
1395  018e               _TIM3_UpdateRequestConfig:
1399                     ; 359     assert_param(IS_TIM3_UPDATE_SOURCE_OK(TIM3_UpdateSource));
1401                     ; 362     if (TIM3_UpdateSource != TIM3_UPDATESOURCE_GLOBAL)
1403  018e 4d            	tnz	a
1404  018f 2706          	jreq	L375
1405                     ; 364         TIM3->CR1 |= TIM3_CR1_URS;
1407  0191 72145320      	bset	21280,#2
1409  0195 2004          	jra	L575
1410  0197               L375:
1411                     ; 368         TIM3->CR1 &= (u8)(~TIM3_CR1_URS);
1413  0197 72155320      	bres	21280,#2
1414  019b               L575:
1415                     ; 370 }
1418  019b 81            	ret
1475                     ; 381 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
1475                     ; 382 {
1476                     	switch	.text
1477  019c               _TIM3_SelectOnePulseMode:
1481                     ; 384     assert_param(IS_TIM3_OPM_MODE_OK(TIM3_OPMode));
1483                     ; 387     if (TIM3_OPMode != TIM3_OPMODE_REPETITIVE)
1485  019c 4d            	tnz	a
1486  019d 2706          	jreq	L526
1487                     ; 389         TIM3->CR1 |= TIM3_CR1_OPM;
1489  019f 72165320      	bset	21280,#3
1491  01a3 2004          	jra	L726
1492  01a5               L526:
1493                     ; 393         TIM3->CR1 &= (u8)(~TIM3_CR1_OPM);
1495  01a5 72175320      	bres	21280,#3
1496  01a9               L726:
1497                     ; 396 }
1500  01a9 81            	ret
1568                     ; 427 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
1568                     ; 428                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
1568                     ; 429 {
1569                     	switch	.text
1570  01aa               _TIM3_PrescalerConfig:
1574                     ; 431     assert_param(IS_TIM3_PRESCALER_RELOAD_OK(TIM3_PSCReloadMode));
1576                     ; 432     assert_param(IS_TIM3_PRESCALER_OK(Prescaler));
1578                     ; 435     TIM3->PSCR = (u8)Prescaler;
1580  01aa 9e            	ld	a,xh
1581  01ab c7532a        	ld	21290,a
1582                     ; 438     TIM3->EGR = (u8)TIM3_PSCReloadMode;
1584  01ae 9f            	ld	a,xl
1585  01af c75324        	ld	21284,a
1586                     ; 439 }
1589  01b2 81            	ret
1647                     ; 450 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
1647                     ; 451 {
1648                     	switch	.text
1649  01b3               _TIM3_ForcedOC1Config:
1651  01b3 88            	push	a
1652       00000000      OFST:	set	0
1655                     ; 453     assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
1657                     ; 456     TIM3->CCMR1 =  (u8)((TIM3->CCMR1 & (u8)(~TIM3_CCMR_OCM))  | (u8)TIM3_ForcedAction);
1659  01b4 c65325        	ld	a,21285
1660  01b7 a48f          	and	a,#143
1661  01b9 1a01          	or	a,(OFST+1,sp)
1662  01bb c75325        	ld	21285,a
1663                     ; 457 }
1666  01be 84            	pop	a
1667  01bf 81            	ret
1703                     ; 468 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
1703                     ; 469 {
1704                     	switch	.text
1705  01c0               _TIM3_ForcedOC2Config:
1707  01c0 88            	push	a
1708       00000000      OFST:	set	0
1711                     ; 471     assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
1713                     ; 474     TIM3->CCMR2 =  (u8)((TIM3->CCMR2 & (u8)(~TIM3_CCMR_OCM)) | (u8)TIM3_ForcedAction);
1715  01c1 c65326        	ld	a,21286
1716  01c4 a48f          	and	a,#143
1717  01c6 1a01          	or	a,(OFST+1,sp)
1718  01c8 c75326        	ld	21286,a
1719                     ; 475 }
1722  01cb 84            	pop	a
1723  01cc 81            	ret
1759                     ; 484 void TIM3_ARRPreloadConfig(FunctionalState NewState)
1759                     ; 485 {
1760                     	switch	.text
1761  01cd               _TIM3_ARRPreloadConfig:
1765                     ; 487     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1767                     ; 490     if (NewState != DISABLE)
1769  01cd 4d            	tnz	a
1770  01ce 2706          	jreq	L547
1771                     ; 492         TIM3->CR1 |= TIM3_CR1_ARPE;
1773  01d0 721e5320      	bset	21280,#7
1775  01d4 2004          	jra	L747
1776  01d6               L547:
1777                     ; 496         TIM3->CR1 &= (u8)(~TIM3_CR1_ARPE);
1779  01d6 721f5320      	bres	21280,#7
1780  01da               L747:
1781                     ; 498 }
1784  01da 81            	ret
1820                     ; 507 void TIM3_OC1PreloadConfig(FunctionalState NewState)
1820                     ; 508 {
1821                     	switch	.text
1822  01db               _TIM3_OC1PreloadConfig:
1826                     ; 510     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1828                     ; 513     if (NewState != DISABLE)
1830  01db 4d            	tnz	a
1831  01dc 2706          	jreq	L767
1832                     ; 515         TIM3->CCMR1 |= TIM3_CCMR_OCxPE;
1834  01de 72165325      	bset	21285,#3
1836  01e2 2004          	jra	L177
1837  01e4               L767:
1838                     ; 519         TIM3->CCMR1 &= (u8)(~TIM3_CCMR_OCxPE);
1840  01e4 72175325      	bres	21285,#3
1841  01e8               L177:
1842                     ; 521 }
1845  01e8 81            	ret
1881                     ; 530 void TIM3_OC2PreloadConfig(FunctionalState NewState)
1881                     ; 531 {
1882                     	switch	.text
1883  01e9               _TIM3_OC2PreloadConfig:
1887                     ; 533     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1889                     ; 536     if (NewState != DISABLE)
1891  01e9 4d            	tnz	a
1892  01ea 2706          	jreq	L1101
1893                     ; 538         TIM3->CCMR2 |= TIM3_CCMR_OCxPE;
1895  01ec 72165326      	bset	21286,#3
1897  01f0 2004          	jra	L3101
1898  01f2               L1101:
1899                     ; 542         TIM3->CCMR2 &= (u8)(~TIM3_CCMR_OCxPE);
1901  01f2 72175326      	bres	21286,#3
1902  01f6               L3101:
1903                     ; 544 }
1906  01f6 81            	ret
1971                     ; 555 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
1971                     ; 556 {
1972                     	switch	.text
1973  01f7               _TIM3_GenerateEvent:
1977                     ; 558     assert_param(IS_TIM3_EVENT_SOURCE_OK(TIM3_EventSource));
1979                     ; 561     TIM3->EGR = (u8)TIM3_EventSource;
1981  01f7 c75324        	ld	21284,a
1982                     ; 562 }
1985  01fa 81            	ret
2021                     ; 573 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2021                     ; 574 {
2022                     	switch	.text
2023  01fb               _TIM3_OC1PolarityConfig:
2027                     ; 576     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2029                     ; 579     if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2031  01fb 4d            	tnz	a
2032  01fc 2706          	jreq	L3601
2033                     ; 581         TIM3->CCER1 |= TIM3_CCER1_CC1P;
2035  01fe 72125327      	bset	21287,#1
2037  0202 2004          	jra	L5601
2038  0204               L3601:
2039                     ; 585         TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC1P);
2041  0204 72135327      	bres	21287,#1
2042  0208               L5601:
2043                     ; 587 }
2046  0208 81            	ret
2082                     ; 598 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2082                     ; 599 {
2083                     	switch	.text
2084  0209               _TIM3_OC2PolarityConfig:
2088                     ; 601     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2090                     ; 604     if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2092  0209 4d            	tnz	a
2093  020a 2706          	jreq	L5011
2094                     ; 606         TIM3->CCER1 |= TIM3_CCER1_CC2P;
2096  020c 721a5327      	bset	21287,#5
2098  0210 2004          	jra	L7011
2099  0212               L5011:
2100                     ; 610         TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC2P);
2102  0212 721b5327      	bres	21287,#5
2103  0216               L7011:
2104                     ; 612 }
2107  0216 81            	ret
2152                     ; 625 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel, FunctionalState NewState)
2152                     ; 626 {
2153                     	switch	.text
2154  0217               _TIM3_CCxCmd:
2156  0217 89            	pushw	x
2157       00000000      OFST:	set	0
2160                     ; 628     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2162                     ; 629     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2164                     ; 631     if (TIM3_Channel == TIM3_CHANNEL_1)
2166  0218 9e            	ld	a,xh
2167  0219 4d            	tnz	a
2168  021a 2610          	jrne	L3311
2169                     ; 634         if (NewState != DISABLE)
2171  021c 9f            	ld	a,xl
2172  021d 4d            	tnz	a
2173  021e 2706          	jreq	L5311
2174                     ; 636             TIM3->CCER1 |= TIM3_CCER1_CC1E;
2176  0220 72105327      	bset	21287,#0
2178  0224 2014          	jra	L1411
2179  0226               L5311:
2180                     ; 640             TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC1E);
2182  0226 72115327      	bres	21287,#0
2183  022a 200e          	jra	L1411
2184  022c               L3311:
2185                     ; 647         if (NewState != DISABLE)
2187  022c 0d02          	tnz	(OFST+2,sp)
2188  022e 2706          	jreq	L3411
2189                     ; 649             TIM3->CCER1 |= TIM3_CCER1_CC2E;
2191  0230 72185327      	bset	21287,#4
2193  0234 2004          	jra	L1411
2194  0236               L3411:
2195                     ; 653             TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC2E);
2197  0236 72195327      	bres	21287,#4
2198  023a               L1411:
2199                     ; 657 }
2202  023a 85            	popw	x
2203  023b 81            	ret
2248                     ; 678 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel, TIM3_OCMode_TypeDef TIM3_OCMode)
2248                     ; 679 {
2249                     	switch	.text
2250  023c               _TIM3_SelectOCxM:
2252  023c 89            	pushw	x
2253       00000000      OFST:	set	0
2256                     ; 681     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2258                     ; 682     assert_param(IS_TIM3_OCM_OK(TIM3_OCMode));
2260                     ; 684     if (TIM3_Channel == TIM3_CHANNEL_1)
2262  023d 9e            	ld	a,xh
2263  023e 4d            	tnz	a
2264  023f 2610          	jrne	L1711
2265                     ; 687         TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC1E);
2267  0241 72115327      	bres	21287,#0
2268                     ; 690         TIM3->CCMR1 = (u8)((TIM3->CCMR1 & (u8)(~TIM3_CCMR_OCM)) | (u8)TIM3_OCMode);
2270  0245 c65325        	ld	a,21285
2271  0248 a48f          	and	a,#143
2272  024a 1a02          	or	a,(OFST+2,sp)
2273  024c c75325        	ld	21285,a
2275  024f 200e          	jra	L3711
2276  0251               L1711:
2277                     ; 695         TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC2E);
2279  0251 72195327      	bres	21287,#4
2280                     ; 698         TIM3->CCMR2 = (u8)((TIM3->CCMR2 & (u8)(~TIM3_CCMR_OCM)) | (u8)TIM3_OCMode);
2282  0255 c65326        	ld	a,21286
2283  0258 a48f          	and	a,#143
2284  025a 1a02          	or	a,(OFST+2,sp)
2285  025c c75326        	ld	21286,a
2286  025f               L3711:
2287                     ; 700 }
2290  025f 85            	popw	x
2291  0260 81            	ret
2325                     ; 709 void TIM3_SetCounter(u16 Counter)
2325                     ; 710 {
2326                     	switch	.text
2327  0261               _TIM3_SetCounter:
2331                     ; 712     TIM3->CNTRH = (u8)(Counter >> 8);
2333  0261 9e            	ld	a,xh
2334  0262 c75328        	ld	21288,a
2335                     ; 713     TIM3->CNTRL = (u8)(Counter);
2337  0265 9f            	ld	a,xl
2338  0266 c75329        	ld	21289,a
2339                     ; 715 }
2342  0269 81            	ret
2376                     ; 724 void TIM3_SetAutoreload(u16 Autoreload)
2376                     ; 725 {
2377                     	switch	.text
2378  026a               _TIM3_SetAutoreload:
2382                     ; 727     TIM3->ARRH = (u8)(Autoreload >> 8);
2384  026a 9e            	ld	a,xh
2385  026b c7532b        	ld	21291,a
2386                     ; 728     TIM3->ARRL = (u8)(Autoreload);
2388  026e 9f            	ld	a,xl
2389  026f c7532c        	ld	21292,a
2390                     ; 729 }
2393  0272 81            	ret
2427                     ; 738 void TIM3_SetCompare1(u16 Compare1)
2427                     ; 739 {
2428                     	switch	.text
2429  0273               _TIM3_SetCompare1:
2433                     ; 741     TIM3->CCR1H = (u8)(Compare1 >> 8);
2435  0273 9e            	ld	a,xh
2436  0274 c7532d        	ld	21293,a
2437                     ; 742     TIM3->CCR1L = (u8)(Compare1);
2439  0277 9f            	ld	a,xl
2440  0278 c7532e        	ld	21294,a
2441                     ; 743 }
2444  027b 81            	ret
2478                     ; 752 void TIM3_SetCompare2(u16 Compare2)
2478                     ; 753 {
2479                     	switch	.text
2480  027c               _TIM3_SetCompare2:
2484                     ; 755     TIM3->CCR2H = (u8)(Compare2 >> 8);
2486  027c 9e            	ld	a,xh
2487  027d c7532f        	ld	21295,a
2488                     ; 756     TIM3->CCR2L = (u8)(Compare2);
2490  0280 9f            	ld	a,xl
2491  0281 c75330        	ld	21296,a
2492                     ; 757 }
2495  0284 81            	ret
2531                     ; 770 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
2531                     ; 771 {
2532                     	switch	.text
2533  0285               _TIM3_SetIC1Prescaler:
2535  0285 88            	push	a
2536       00000000      OFST:	set	0
2539                     ; 773     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC1Prescaler));
2541                     ; 776     TIM3->CCMR1 = (u8)((TIM3->CCMR1 & (u8)(~TIM3_CCMR_ICxPSC)) | (u8)TIM3_IC1Prescaler);
2543  0286 c65325        	ld	a,21285
2544  0289 a4f3          	and	a,#243
2545  028b 1a01          	or	a,(OFST+1,sp)
2546  028d c75325        	ld	21285,a
2547                     ; 777 }
2550  0290 84            	pop	a
2551  0291 81            	ret
2587                     ; 789 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
2587                     ; 790 {
2588                     	switch	.text
2589  0292               _TIM3_SetIC2Prescaler:
2591  0292 88            	push	a
2592       00000000      OFST:	set	0
2595                     ; 792     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC2Prescaler));
2597                     ; 795     TIM3->CCMR2 = (u8)((TIM3->CCMR2 & (u8)(~TIM3_CCMR_ICxPSC)) | (u8)TIM3_IC2Prescaler);
2599  0293 c65326        	ld	a,21286
2600  0296 a4f3          	and	a,#243
2601  0298 1a01          	or	a,(OFST+1,sp)
2602  029a c75326        	ld	21286,a
2603                     ; 796 }
2606  029d 84            	pop	a
2607  029e 81            	ret
2659                     ; 803 u16 TIM3_GetCapture1(void)
2659                     ; 804 {
2660                     	switch	.text
2661  029f               _TIM3_GetCapture1:
2663  029f 5204          	subw	sp,#4
2664       00000004      OFST:	set	4
2667                     ; 806     u16 tmpccr1 = 0;
2669                     ; 807     u8 tmpccr1l=0, tmpccr1h=0;
2673                     ; 809     tmpccr1h = TIM3->CCR1H;
2675  02a1 c6532d        	ld	a,21293
2676  02a4 6b02          	ld	(OFST-2,sp),a
2677                     ; 810     tmpccr1l = TIM3->CCR1L;
2679  02a6 c6532e        	ld	a,21294
2680  02a9 6b01          	ld	(OFST-3,sp),a
2681                     ; 812     tmpccr1 = (u16)(tmpccr1l);
2683  02ab 7b01          	ld	a,(OFST-3,sp)
2684  02ad 5f            	clrw	x
2685  02ae 97            	ld	xl,a
2686  02af 1f03          	ldw	(OFST-1,sp),x
2687                     ; 813     tmpccr1 |= (u16)((u16)tmpccr1h << 8);
2689  02b1 7b02          	ld	a,(OFST-2,sp)
2690  02b3 5f            	clrw	x
2691  02b4 97            	ld	xl,a
2692  02b5 4f            	clr	a
2693  02b6 02            	rlwa	x,a
2694  02b7 01            	rrwa	x,a
2695  02b8 1a04          	or	a,(OFST+0,sp)
2696  02ba 01            	rrwa	x,a
2697  02bb 1a03          	or	a,(OFST-1,sp)
2698  02bd 01            	rrwa	x,a
2699  02be 1f03          	ldw	(OFST-1,sp),x
2700                     ; 815     return (u16)tmpccr1;
2702  02c0 1e03          	ldw	x,(OFST-1,sp)
2705  02c2 5b04          	addw	sp,#4
2706  02c4 81            	ret
2758                     ; 824 u16 TIM3_GetCapture2(void)
2758                     ; 825 {
2759                     	switch	.text
2760  02c5               _TIM3_GetCapture2:
2762  02c5 5204          	subw	sp,#4
2763       00000004      OFST:	set	4
2766                     ; 827     u16 tmpccr2 = 0;
2768                     ; 828     u8 tmpccr2l=0, tmpccr2h=0;
2772                     ; 830     tmpccr2h = TIM3->CCR2H;
2774  02c7 c6532f        	ld	a,21295
2775  02ca 6b02          	ld	(OFST-2,sp),a
2776                     ; 831     tmpccr2l = TIM3->CCR2L;
2778  02cc c65330        	ld	a,21296
2779  02cf 6b01          	ld	(OFST-3,sp),a
2780                     ; 833     tmpccr2 = (u16)(tmpccr2l);
2782  02d1 7b01          	ld	a,(OFST-3,sp)
2783  02d3 5f            	clrw	x
2784  02d4 97            	ld	xl,a
2785  02d5 1f03          	ldw	(OFST-1,sp),x
2786                     ; 834     tmpccr2 |= (u16)((u16)tmpccr2h << 8);
2788  02d7 7b02          	ld	a,(OFST-2,sp)
2789  02d9 5f            	clrw	x
2790  02da 97            	ld	xl,a
2791  02db 4f            	clr	a
2792  02dc 02            	rlwa	x,a
2793  02dd 01            	rrwa	x,a
2794  02de 1a04          	or	a,(OFST+0,sp)
2795  02e0 01            	rrwa	x,a
2796  02e1 1a03          	or	a,(OFST-1,sp)
2797  02e3 01            	rrwa	x,a
2798  02e4 1f03          	ldw	(OFST-1,sp),x
2799                     ; 836     return (u16)tmpccr2;
2801  02e6 1e03          	ldw	x,(OFST-1,sp)
2804  02e8 5b04          	addw	sp,#4
2805  02ea 81            	ret
2828                     ; 845 u16 TIM3_GetCounter(void)
2828                     ; 846 {
2829                     	switch	.text
2830  02eb               _TIM3_GetCounter:
2832  02eb 89            	pushw	x
2833       00000002      OFST:	set	2
2836                     ; 848     return (u16)(((u16)TIM3->CNTRH << 8) | (u16)(TIM3->CNTRL));
2838  02ec c65329        	ld	a,21289
2839  02ef 5f            	clrw	x
2840  02f0 97            	ld	xl,a
2841  02f1 1f01          	ldw	(OFST-1,sp),x
2842  02f3 c65328        	ld	a,21288
2843  02f6 5f            	clrw	x
2844  02f7 97            	ld	xl,a
2845  02f8 4f            	clr	a
2846  02f9 02            	rlwa	x,a
2847  02fa 01            	rrwa	x,a
2848  02fb 1a02          	or	a,(OFST+0,sp)
2849  02fd 01            	rrwa	x,a
2850  02fe 1a01          	or	a,(OFST-1,sp)
2851  0300 01            	rrwa	x,a
2854  0301 5b02          	addw	sp,#2
2855  0303 81            	ret
2879                     ; 858 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
2879                     ; 859 {
2880                     	switch	.text
2881  0304               _TIM3_GetPrescaler:
2885                     ; 861     return (TIM3_Prescaler_TypeDef)(TIM3->PSCR);
2887  0304 c6532a        	ld	a,21290
2890  0307 81            	ret
3015                     ; 876 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
3015                     ; 877 {
3016                     	switch	.text
3017  0308               _TIM3_GetFlagStatus:
3019  0308 5204          	subw	sp,#4
3020       00000004      OFST:	set	4
3023                     ; 878     volatile FlagStatus bitstatus = RESET;
3025  030a 0f04          	clr	(OFST+0,sp)
3026                     ; 882     assert_param(IS_TIM3_GET_FLAG_OK(TIM3_FLAG));
3028                     ; 884     tim3_flag_l = (u8)(TIM3_FLAG);
3030  030c 9f            	ld	a,xl
3031  030d 6b02          	ld	(OFST-2,sp),a
3032                     ; 885     tim3_flag_h = (u8)(TIM3_FLAG >> 8);
3034  030f 9e            	ld	a,xh
3035  0310 6b03          	ld	(OFST-1,sp),a
3036                     ; 887     if (((TIM3->SR1 & tim3_flag_l) | (TIM3->SR2 & tim3_flag_h)) != (u8)RESET )
3038  0312 c65323        	ld	a,21283
3039  0315 1403          	and	a,(OFST-1,sp)
3040  0317 6b01          	ld	(OFST-3,sp),a
3041  0319 c65322        	ld	a,21282
3042  031c 1402          	and	a,(OFST-2,sp)
3043  031e 1a01          	or	a,(OFST-3,sp)
3044  0320 2706          	jreq	L5741
3045                     ; 889         bitstatus = SET;
3047  0322 a601          	ld	a,#1
3048  0324 6b04          	ld	(OFST+0,sp),a
3050  0326 2002          	jra	L7741
3051  0328               L5741:
3052                     ; 893         bitstatus = RESET;
3054  0328 0f04          	clr	(OFST+0,sp)
3055  032a               L7741:
3056                     ; 895     return (FlagStatus)bitstatus;
3058  032a 7b04          	ld	a,(OFST+0,sp)
3061  032c 5b04          	addw	sp,#4
3062  032e 81            	ret
3097                     ; 910 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
3097                     ; 911 {
3098                     	switch	.text
3099  032f               _TIM3_ClearFlag:
3101  032f 89            	pushw	x
3102       00000000      OFST:	set	0
3105                     ; 913     assert_param(IS_TIM3_CLEAR_FLAG_OK(TIM3_FLAG));
3107                     ; 916     TIM3->SR1 = (u8)(~((u8)(TIM3_FLAG)));
3109  0330 9f            	ld	a,xl
3110  0331 43            	cpl	a
3111  0332 c75322        	ld	21282,a
3112                     ; 917     TIM3->SR2 = (u8)(~((u8)(TIM3_FLAG >> 8)));
3114  0335 7b01          	ld	a,(OFST+1,sp)
3115  0337 43            	cpl	a
3116  0338 c75323        	ld	21283,a
3117                     ; 918 }
3120  033b 85            	popw	x
3121  033c 81            	ret
3185                     ; 931 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
3185                     ; 932 {
3186                     	switch	.text
3187  033d               _TIM3_GetITStatus:
3189  033d 88            	push	a
3190  033e 5203          	subw	sp,#3
3191       00000003      OFST:	set	3
3194                     ; 933     volatile ITStatus bitstatus = RESET;
3196  0340 0f03          	clr	(OFST+0,sp)
3197                     ; 934     vu8 TIM3_itStatus = 0, TIM3_itEnable = 0;
3199  0342 0f01          	clr	(OFST-2,sp)
3202  0344 0f02          	clr	(OFST-1,sp)
3203                     ; 937     assert_param(IS_TIM3_GET_IT_OK(TIM3_IT));
3205                     ; 939     TIM3_itStatus = (u8)(TIM3->SR1 & TIM3_IT);
3207  0346 c45322        	and	a,21282
3208  0349 6b01          	ld	(OFST-2,sp),a
3209                     ; 941     TIM3_itEnable = (u8)(TIM3->IER & TIM3_IT);
3211  034b c65321        	ld	a,21281
3212  034e 1404          	and	a,(OFST+1,sp)
3213  0350 6b02          	ld	(OFST-1,sp),a
3214                     ; 943     if ((TIM3_itStatus != (u8)RESET ) && (TIM3_itEnable != (u8)RESET ))
3216  0352 0d01          	tnz	(OFST-2,sp)
3217  0354 270a          	jreq	L1551
3219  0356 0d02          	tnz	(OFST-1,sp)
3220  0358 2706          	jreq	L1551
3221                     ; 945         bitstatus = SET;
3223  035a a601          	ld	a,#1
3224  035c 6b03          	ld	(OFST+0,sp),a
3226  035e 2002          	jra	L3551
3227  0360               L1551:
3228                     ; 949         bitstatus = RESET;
3230  0360 0f03          	clr	(OFST+0,sp)
3231  0362               L3551:
3232                     ; 951     return (ITStatus)(bitstatus);
3234  0362 7b03          	ld	a,(OFST+0,sp)
3237  0364 5b04          	addw	sp,#4
3238  0366 81            	ret
3274                     ; 964 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
3274                     ; 965 {
3275                     	switch	.text
3276  0367               _TIM3_ClearITPendingBit:
3280                     ; 967     assert_param(IS_TIM3_IT_OK(TIM3_IT));
3282                     ; 970     TIM3->SR1 = (u8)(~TIM3_IT);
3284  0367 43            	cpl	a
3285  0368 c75322        	ld	21282,a
3286                     ; 971 }
3289  036b 81            	ret
3341                     ; 990 static void TI1_Config(u8 TIM3_ICPolarity,
3341                     ; 991                        u8 TIM3_ICSelection,
3341                     ; 992                        u8 TIM3_ICFilter)
3341                     ; 993 {
3342                     	switch	.text
3343  036c               L3_TI1_Config:
3345  036c 89            	pushw	x
3346  036d 88            	push	a
3347       00000001      OFST:	set	1
3350                     ; 995     TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC1E);
3352  036e 72115327      	bres	21287,#0
3353                     ; 998     TIM3->CCMR1 = (u8)((TIM3->CCMR1 & (u8)(~( TIM3_CCMR_CCxS     |        TIM3_CCMR_ICxF    ))) | (u8)(( (TIM3_ICSelection)) | ((u8)( TIM3_ICFilter << 4))));
3355  0372 7b06          	ld	a,(OFST+5,sp)
3356  0374 97            	ld	xl,a
3357  0375 a610          	ld	a,#16
3358  0377 42            	mul	x,a
3359  0378 9f            	ld	a,xl
3360  0379 1a03          	or	a,(OFST+2,sp)
3361  037b 6b01          	ld	(OFST+0,sp),a
3362  037d c65325        	ld	a,21285
3363  0380 a40c          	and	a,#12
3364  0382 1a01          	or	a,(OFST+0,sp)
3365  0384 c75325        	ld	21285,a
3366                     ; 1001     if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
3368  0387 0d02          	tnz	(OFST+1,sp)
3369  0389 2706          	jreq	L1261
3370                     ; 1003         TIM3->CCER1 |= TIM3_CCER1_CC1P;
3372  038b 72125327      	bset	21287,#1
3374  038f 2004          	jra	L3261
3375  0391               L1261:
3376                     ; 1007         TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC1P);
3378  0391 72135327      	bres	21287,#1
3379  0395               L3261:
3380                     ; 1010     TIM3->CCER1 |= TIM3_CCER1_CC1E;
3382  0395 72105327      	bset	21287,#0
3383                     ; 1011 }
3386  0399 5b03          	addw	sp,#3
3387  039b 81            	ret
3439                     ; 1030 static void TI2_Config(u8 TIM3_ICPolarity,
3439                     ; 1031                        u8 TIM3_ICSelection,
3439                     ; 1032                        u8 TIM3_ICFilter)
3439                     ; 1033 {
3440                     	switch	.text
3441  039c               L5_TI2_Config:
3443  039c 89            	pushw	x
3444  039d 88            	push	a
3445       00000001      OFST:	set	1
3448                     ; 1035     TIM3->CCER1 &=  (u8)(~TIM3_CCER1_CC2E);
3450  039e 72195327      	bres	21287,#4
3451                     ; 1038     TIM3->CCMR2 = (u8)((TIM3->CCMR2 & (u8)(~( TIM3_CCMR_CCxS     |        TIM3_CCMR_ICxF    ))) | (u8)(( (TIM3_ICSelection)) | ((u8)( TIM3_ICFilter << 4))));
3453  03a2 7b06          	ld	a,(OFST+5,sp)
3454  03a4 97            	ld	xl,a
3455  03a5 a610          	ld	a,#16
3456  03a7 42            	mul	x,a
3457  03a8 9f            	ld	a,xl
3458  03a9 1a03          	or	a,(OFST+2,sp)
3459  03ab 6b01          	ld	(OFST+0,sp),a
3460  03ad c65326        	ld	a,21286
3461  03b0 a40c          	and	a,#12
3462  03b2 1a01          	or	a,(OFST+0,sp)
3463  03b4 c75326        	ld	21286,a
3464                     ; 1042     if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
3466  03b7 0d02          	tnz	(OFST+1,sp)
3467  03b9 2706          	jreq	L3561
3468                     ; 1044         TIM3->CCER1 |= TIM3_CCER1_CC2P;
3470  03bb 721a5327      	bset	21287,#5
3472  03bf 2004          	jra	L5561
3473  03c1               L3561:
3474                     ; 1048         TIM3->CCER1 &= (u8)(~TIM3_CCER1_CC2P);
3476  03c1 721b5327      	bres	21287,#5
3477  03c5               L5561:
3478                     ; 1052     TIM3->CCER1 |= TIM3_CCER1_CC2E;
3480  03c5 72185327      	bset	21287,#4
3481                     ; 1054 }
3484  03c9 5b03          	addw	sp,#3
3485  03cb 81            	ret
3498                     	xdef	_TIM3_ClearITPendingBit
3499                     	xdef	_TIM3_GetITStatus
3500                     	xdef	_TIM3_ClearFlag
3501                     	xdef	_TIM3_GetFlagStatus
3502                     	xdef	_TIM3_GetPrescaler
3503                     	xdef	_TIM3_GetCounter
3504                     	xdef	_TIM3_GetCapture2
3505                     	xdef	_TIM3_GetCapture1
3506                     	xdef	_TIM3_SetIC2Prescaler
3507                     	xdef	_TIM3_SetIC1Prescaler
3508                     	xdef	_TIM3_SetCompare2
3509                     	xdef	_TIM3_SetCompare1
3510                     	xdef	_TIM3_SetAutoreload
3511                     	xdef	_TIM3_SetCounter
3512                     	xdef	_TIM3_SelectOCxM
3513                     	xdef	_TIM3_CCxCmd
3514                     	xdef	_TIM3_OC2PolarityConfig
3515                     	xdef	_TIM3_OC1PolarityConfig
3516                     	xdef	_TIM3_GenerateEvent
3517                     	xdef	_TIM3_OC2PreloadConfig
3518                     	xdef	_TIM3_OC1PreloadConfig
3519                     	xdef	_TIM3_ARRPreloadConfig
3520                     	xdef	_TIM3_ForcedOC2Config
3521                     	xdef	_TIM3_ForcedOC1Config
3522                     	xdef	_TIM3_PrescalerConfig
3523                     	xdef	_TIM3_SelectOnePulseMode
3524                     	xdef	_TIM3_UpdateRequestConfig
3525                     	xdef	_TIM3_UpdateDisableConfig
3526                     	xdef	_TIM3_ITConfig
3527                     	xdef	_TIM3_Cmd
3528                     	xdef	_TIM3_PWMIConfig
3529                     	xdef	_TIM3_ICInit
3530                     	xdef	_TIM3_OC2Init
3531                     	xdef	_TIM3_OC1Init
3532                     	xdef	_TIM3_TimeBaseInit
3533                     	xdef	_TIM3_DeInit
3552                     	end
