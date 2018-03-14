
_Brojac:

	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_Brojac_br+0, 0
	MOVWF      R0+0
	MOVF       FARG_Brojac_br+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      Brojac_jed_L0+0
	MOVF       R0+1, 0
	MOVWF      Brojac_jed_L0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_Brojac_br+0, 0
	MOVWF      R0+0
	MOVF       FARG_Brojac_br+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      Brojac_des_L0+0
	MOVF       R0+1, 0
	MOVWF      Brojac_des_L0+1
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_Brojac_br+0, 0
	MOVWF      R0+0
	MOVF       FARG_Brojac_br+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	BSF        PORTE+0, 0
	BCF        PORTE+0, 1
	BCF        PORTE+0, 2
	MOVLW      _cifre+0
	ADDWF      R0+0, 1
	MOVLW      hi_addr(_cifre+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTC+0
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_Brojac0:
	DECFSZ     R13+0, 1
	GOTO       L_Brojac0
	DECFSZ     R12+0, 1
	GOTO       L_Brojac0
	NOP
	NOP
	BCF        PORTE+0, 0
	BSF        PORTE+0, 1
	BCF        PORTE+0, 2
	MOVF       Brojac_des_L0+0, 0
	ADDLW      _cifre+0
	MOVWF      R0+0
	MOVLW      hi_addr(_cifre+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      Brojac_des_L0+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTC+0
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_Brojac1:
	DECFSZ     R13+0, 1
	GOTO       L_Brojac1
	DECFSZ     R12+0, 1
	GOTO       L_Brojac1
	NOP
	NOP
	BCF        PORTE+0, 0
	BCF        PORTE+0, 1
	BSF        PORTE+0, 2
	MOVF       Brojac_jed_L0+0, 0
	ADDLW      _cifre+0
	MOVWF      R0+0
	MOVLW      hi_addr(_cifre+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      Brojac_jed_L0+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTC+0
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_Brojac2:
	DECFSZ     R13+0, 1
	GOTO       L_Brojac2
	DECFSZ     R12+0, 1
	GOTO       L_Brojac2
	NOP
	NOP
L_end_Brojac:
	RETURN
; end of _Brojac

_main:

	CLRF       _cnt+0
	CALL       _Keypad_Init+0
	CLRF       TRISC+0
	CLRF       PORTC+0
	CLRF       TRISE+0
	CLRF       PORTE+0
	CLRF       ANSEL+0
	CLRF       ANSELH+0
	CALL       _Lcd_Init+0
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L_main3:
	CLRF       _kp+0
L_main6:
	MOVF       _cnt+0, 0
	MOVWF      FARG_Brojac_br+0
	CLRF       FARG_Brojac_br+1
	CALL       _Brojac+0
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main6
	GOTO       L_main9
L_main11:
	MOVLW      49
	MOVWF      _kp+0
	GOTO       L_main10
L_main12:
	MOVLW      50
	MOVWF      _kp+0
	GOTO       L_main10
L_main13:
	MOVLW      51
	MOVWF      _kp+0
	GOTO       L_main10
L_main14:
	MOVLW      52
	MOVWF      _kp+0
	GOTO       L_main10
L_main15:
	MOVLW      53
	MOVWF      _kp+0
	GOTO       L_main10
L_main16:
	MOVLW      54
	MOVWF      _kp+0
	GOTO       L_main10
L_main17:
	MOVLW      55
	MOVWF      _kp+0
	GOTO       L_main10
L_main18:
	MOVLW      56
	MOVWF      _kp+0
	GOTO       L_main10
L_main19:
	MOVLW      57
	MOVWF      _kp+0
	GOTO       L_main10
L_main20:
	MOVLW      42
	MOVWF      _kp+0
	GOTO       L_main10
L_main21:
	MOVLW      48
	MOVWF      _kp+0
	GOTO       L_main10
L_main22:
	MOVLW      35
	MOVWF      _kp+0
	GOTO       L_main10
L_main9:
	MOVF       _kp+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main11
	MOVF       _kp+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main12
	MOVF       _kp+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main13
	MOVF       _kp+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_main14
	MOVF       _kp+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_main15
	MOVF       _kp+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_main16
	MOVF       _kp+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_main17
	MOVF       _kp+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_main18
	MOVF       _kp+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_main19
	MOVF       _kp+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_main20
	MOVF       _kp+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_main21
	MOVF       _kp+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_main22
L_main10:
	MOVF       _kp+0, 0
	XORWF      _oldstate+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main23
	MOVLW      1
	MOVWF      _cnt+0
	MOVF       _kp+0, 0
	MOVWF      _oldstate+0
	GOTO       L_main24
L_main23:
	INCF       _cnt+0, 1
L_main24:
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _kp+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVF       _cnt+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_main25
	CLRF       _cnt+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_MyProject+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L_main25:
	MOVF       _cnt+0, 0
	MOVWF      FARG_WordToStr_input+0
	CLRF       FARG_WordToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_main3
L_end_main:
	GOTO       $+0
; end of _main
