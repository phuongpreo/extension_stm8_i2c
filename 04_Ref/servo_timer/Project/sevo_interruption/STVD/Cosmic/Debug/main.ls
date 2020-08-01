   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.31 - 09 Feb 2010
   3                     ; Generator V4.3.3 - 10 Feb 2010
  15                     	bsct
  16  0000               _ppm:
  17  0000 0bb8          	dc.w	3000
  59                     ; 43 void main(void)
  59                     ; 44 {
  61                     	switch	.text
  62  0000               _main:
  66                     ; 49   TIM2_DeInit();
  68  0000 cd0000        	call	_TIM2_DeInit
  70                     ; 52   TIM2_TimeBaseInit(TIM2_PRESCALER_1, 40000);
  72  0003 ae9c40        	ldw	x,#40000
  73  0006 89            	pushw	x
  74  0007 4f            	clr	a
  75  0008 cd0000        	call	_TIM2_TimeBaseInit
  77  000b 85            	popw	x
  78                     ; 56   TIM2_OC1Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE,ppm, TIM2_OCPOLARITY_HIGH ); 
  80  000c 4b00          	push	#0
  81  000e be00          	ldw	x,_ppm
  82  0010 89            	pushw	x
  83  0011 ae0011        	ldw	x,#17
  84  0014 a660          	ld	a,#96
  85  0016 95            	ld	xh,a
  86  0017 cd0000        	call	_TIM2_OC1Init
  88  001a 5b03          	addw	sp,#3
  89                     ; 57   TIM2_OC1PreloadConfig(ENABLE);
  91  001c a601          	ld	a,#1
  92  001e cd0000        	call	_TIM2_OC1PreloadConfig
  94                     ; 60 	TIM2_ARRPreloadConfig(ENABLE);
  96  0021 a601          	ld	a,#1
  97  0023 cd0000        	call	_TIM2_ARRPreloadConfig
  99                     ; 63   TIM2_Cmd(ENABLE);
 101  0026 a601          	ld	a,#1
 102  0028 cd0000        	call	_TIM2_Cmd
 104                     ; 66   TIM3_DeInit();
 106  002b cd0000        	call	_TIM3_DeInit
 108                     ; 69   TIM3_TimeBaseInit(TIM3_PRESCALER_1, 40000); //update every 20ms the duty cycle
 110  002e ae9c40        	ldw	x,#40000
 111  0031 89            	pushw	x
 112  0032 4f            	clr	a
 113  0033 cd0000        	call	_TIM3_TimeBaseInit
 115  0036 85            	popw	x
 116                     ; 72 	TIM3_ITConfig(TIM3_IT_UPDATE ,ENABLE);
 118  0037 ae0001        	ldw	x,#1
 119  003a a601          	ld	a,#1
 120  003c 95            	ld	xh,a
 121  003d cd0000        	call	_TIM3_ITConfig
 123                     ; 75 	TIM3_ARRPreloadConfig(ENABLE);
 125  0040 a601          	ld	a,#1
 126  0042 cd0000        	call	_TIM3_ARRPreloadConfig
 128                     ; 78   TIM3_Cmd(ENABLE);
 130  0045 a601          	ld	a,#1
 131  0047 cd0000        	call	_TIM3_Cmd
 133                     ; 80 	enableInterrupts();
 136  004a 9a            rim
 138  004b               L12:
 140  004b 20fe          	jra	L12
 164                     	xdef	_main
 165                     	xdef	_ppm
 166                     	xref	_TIM3_ARRPreloadConfig
 167                     	xref	_TIM3_ITConfig
 168                     	xref	_TIM3_Cmd
 169                     	xref	_TIM3_TimeBaseInit
 170                     	xref	_TIM3_DeInit
 171                     	xref	_TIM2_OC1PreloadConfig
 172                     	xref	_TIM2_ARRPreloadConfig
 173                     	xref	_TIM2_Cmd
 174                     	xref	_TIM2_OC1Init
 175                     	xref	_TIM2_TimeBaseInit
 176                     	xref	_TIM2_DeInit
 195                     	end
