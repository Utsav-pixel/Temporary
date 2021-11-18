
_main:

;MyProject.c,21 :: 		void main() {
;MyProject.c,22 :: 		TRISB.F6=1;
	BSF         TRISB+0, 6 
;MyProject.c,23 :: 		UART1_Init(9600);               // Initialize UART module at 9600 bps
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;MyProject.c,24 :: 		Delay_ms(100);                  // Wait for UART module to stabilize
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
;MyProject.c,26 :: 		UART1_Write_Text("Start");
	MOVLW       ?lstr1_MyProject+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr1_MyProject+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;MyProject.c,27 :: 		UART1_Write(10);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;MyProject.c,28 :: 		UART1_Write(13);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;MyProject.c,30 :: 		limit = 0;
	CLRF        _limit+0 
;MyProject.c,31 :: 		cnt = 0;
	CLRF        _cnt+0 
;MyProject.c,32 :: 		pin = 495051;
	MOVLW       203
	MOVWF       _pin+0 
	MOVLW       141
	MOVWF       _pin+1 
;MyProject.c,33 :: 		check =0;
	CLRF        _check+0 
	CLRF        _check+1 
;MyProject.c,34 :: 		Keypad_Init();
	CALL        _Keypad_Init+0, 0
;MyProject.c,35 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;MyProject.c,36 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,37 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,38 :: 		Lcd_Out(1, 1, "Enter Pin:");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,40 :: 		do {
L_main1:
;MyProject.c,41 :: 		kp = 0;
	CLRF        _kp+0 
;MyProject.c,42 :: 		do{
L_main4:
;MyProject.c,43 :: 		kp = Keypad_Key_Click();
	CALL        _Keypad_Key_Click+0, 0
	MOVF        R0, 0 
	MOVWF       _kp+0 
;MyProject.c,44 :: 		if(PORTB.F6==1)
	BTFSS       PORTB+0, 6 
	GOTO        L_main7
;MyProject.c,45 :: 		{    limit1=0;
	CLRF        _limit1+0 
;MyProject.c,46 :: 		pin=0;
	CLRF        _pin+0 
	CLRF        _pin+1 
;MyProject.c,47 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,48 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,49 :: 		Lcd_Out(1, 1, "Enter New Pin:");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,51 :: 		do {
L_main8:
;MyProject.c,52 :: 		kp = 0;
	CLRF        _kp+0 
;MyProject.c,53 :: 		do
L_main11:
;MyProject.c,54 :: 		kp = Keypad_Key_Click();
	CALL        _Keypad_Key_Click+0, 0
	MOVF        R0, 0 
	MOVWF       _kp+0 
;MyProject.c,55 :: 		while (!kp);
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main11
;MyProject.c,57 :: 		switch (kp) {
	GOTO        L_main14
;MyProject.c,58 :: 		case  1: kp = 49; break; // 1
L_main16:
	MOVLW       49
	MOVWF       _kp+0 
	GOTO        L_main15
;MyProject.c,59 :: 		case  2: kp = 50; break; // 2
L_main17:
	MOVLW       50
	MOVWF       _kp+0 
	GOTO        L_main15
;MyProject.c,60 :: 		case  3: kp = 51; break; // 3
L_main18:
	MOVLW       51
	MOVWF       _kp+0 
	GOTO        L_main15
;MyProject.c,61 :: 		case  4: kp = 65; break; // A
L_main19:
	MOVLW       65
	MOVWF       _kp+0 
	GOTO        L_main15
;MyProject.c,62 :: 		case  5: kp = 52; break; // 4
L_main20:
	MOVLW       52
	MOVWF       _kp+0 
	GOTO        L_main15
;MyProject.c,63 :: 		case  6: kp = 53; break; // 5
L_main21:
	MOVLW       53
	MOVWF       _kp+0 
	GOTO        L_main15
;MyProject.c,64 :: 		case  7: kp = 54; break; // 6
L_main22:
	MOVLW       54
	MOVWF       _kp+0 
	GOTO        L_main15
;MyProject.c,65 :: 		case  8: kp = 66; break; // B
L_main23:
	MOVLW       66
	MOVWF       _kp+0 
	GOTO        L_main15
;MyProject.c,66 :: 		case  9: kp = 55; break; // 7
L_main24:
	MOVLW       55
	MOVWF       _kp+0 
	GOTO        L_main15
;MyProject.c,67 :: 		case 10: kp = 56; break; // 8
L_main25:
	MOVLW       56
	MOVWF       _kp+0 
	GOTO        L_main15
;MyProject.c,68 :: 		case 11: kp = 57; break; // 9
L_main26:
	MOVLW       57
	MOVWF       _kp+0 
	GOTO        L_main15
;MyProject.c,69 :: 		case 12: kp = 67; break; // C
L_main27:
	MOVLW       67
	MOVWF       _kp+0 
	GOTO        L_main15
;MyProject.c,70 :: 		case 13: kp = 42; break; // *
L_main28:
	MOVLW       42
	MOVWF       _kp+0 
	GOTO        L_main15
;MyProject.c,71 :: 		case 14: kp = 48; break; // 0
L_main29:
	MOVLW       48
	MOVWF       _kp+0 
	GOTO        L_main15
;MyProject.c,72 :: 		case 15: kp = 35; break; // #
L_main30:
	MOVLW       35
	MOVWF       _kp+0 
	GOTO        L_main15
;MyProject.c,73 :: 		case 16: kp = 68; break; // D
L_main31:
	MOVLW       68
	MOVWF       _kp+0 
	GOTO        L_main15
;MyProject.c,75 :: 		}
L_main14:
	MOVF        _kp+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_main16
	MOVF        _kp+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_main17
	MOVF        _kp+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_main18
	MOVF        _kp+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_main19
	MOVF        _kp+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_main20
	MOVF        _kp+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_main21
	MOVF        _kp+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_main22
	MOVF        _kp+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_main23
	MOVF        _kp+0, 0 
	XORLW       9
	BTFSC       STATUS+0, 2 
	GOTO        L_main24
	MOVF        _kp+0, 0 
	XORLW       10
	BTFSC       STATUS+0, 2 
	GOTO        L_main25
	MOVF        _kp+0, 0 
	XORLW       11
	BTFSC       STATUS+0, 2 
	GOTO        L_main26
	MOVF        _kp+0, 0 
	XORLW       12
	BTFSC       STATUS+0, 2 
	GOTO        L_main27
	MOVF        _kp+0, 0 
	XORLW       13
	BTFSC       STATUS+0, 2 
	GOTO        L_main28
	MOVF        _kp+0, 0 
	XORLW       14
	BTFSC       STATUS+0, 2 
	GOTO        L_main29
	MOVF        _kp+0, 0 
	XORLW       15
	BTFSC       STATUS+0, 2 
	GOTO        L_main30
	MOVF        _kp+0, 0 
	XORLW       16
	BTFSC       STATUS+0, 2 
	GOTO        L_main31
L_main15:
;MyProject.c,81 :: 		if(kp != 35 && limit<3)
	MOVF        _kp+0, 0 
	XORLW       35
	BTFSC       STATUS+0, 2 
	GOTO        L_main34
	MOVLW       3
	SUBWF       _limit+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main34
L__main65:
;MyProject.c,83 :: 		pin = 100 * pin + kp;
	MOVLW       100
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _pin+0, 0 
	MOVWF       R4 
	MOVF        _pin+1, 0 
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        _kp+0, 0 
	ADDWF       R0, 0 
	MOVWF       _pin+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       _pin+1 
;MyProject.c,84 :: 		Lcd_Chr(2, 1 + limit1, kp);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        _limit1+0, 0 
	ADDLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        _kp+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;MyProject.c,85 :: 		UART1_Write(check);
	MOVF        _check+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;MyProject.c,86 :: 		limit1 = limit1 + 1;
	INCF        _limit1+0, 1 
;MyProject.c,87 :: 		}
	GOTO        L_main35
L_main34:
;MyProject.c,88 :: 		else if(kp==35)
	MOVF        _kp+0, 0 
	XORLW       35
	BTFSS       STATUS+0, 2 
	GOTO        L_main36
;MyProject.c,89 :: 		{Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,90 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,91 :: 		Lcd_Out(1, 1, "Your new Pin has set succesfully");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,92 :: 		Delay_ms(1000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_main37:
	DECFSZ      R13, 1, 1
	BRA         L_main37
	DECFSZ      R12, 1, 1
	BRA         L_main37
	DECFSZ      R11, 1, 1
	BRA         L_main37
	NOP
;MyProject.c,93 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,94 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,95 :: 		Lcd_Out(1, 1, "Enter Pin:");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,96 :: 		limit=0;
	CLRF        _limit+0 
;MyProject.c,97 :: 		kp=0;
	CLRF        _kp+0 
;MyProject.c,98 :: 		break;}
	GOTO        L_main9
L_main36:
L_main35:
;MyProject.c,100 :: 		} while (limit1<4);
	MOVLW       4
	SUBWF       _limit1+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_main8
L_main9:
;MyProject.c,102 :: 		}}
L_main7:
;MyProject.c,103 :: 		while (!kp);
	MOVF        _kp+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main4
;MyProject.c,105 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,106 :: 		Lcd_Out(1, 1, "Enter Pin:");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,107 :: 		switch (kp) {
	GOTO        L_main38
;MyProject.c,108 :: 		case  1: kp = 49; break; // 1
L_main40:
	MOVLW       49
	MOVWF       _kp+0 
	GOTO        L_main39
;MyProject.c,109 :: 		case  2: kp = 50; break; // 2
L_main41:
	MOVLW       50
	MOVWF       _kp+0 
	GOTO        L_main39
;MyProject.c,110 :: 		case  3: kp = 51; break; // 3
L_main42:
	MOVLW       51
	MOVWF       _kp+0 
	GOTO        L_main39
;MyProject.c,111 :: 		case  4: kp = 65; break; // A
L_main43:
	MOVLW       65
	MOVWF       _kp+0 
	GOTO        L_main39
;MyProject.c,112 :: 		case  5: kp = 52; break; // 4
L_main44:
	MOVLW       52
	MOVWF       _kp+0 
	GOTO        L_main39
;MyProject.c,113 :: 		case  6: kp = 53; break; // 5
L_main45:
	MOVLW       53
	MOVWF       _kp+0 
	GOTO        L_main39
;MyProject.c,114 :: 		case  7: kp = 54; break; // 6
L_main46:
	MOVLW       54
	MOVWF       _kp+0 
	GOTO        L_main39
;MyProject.c,115 :: 		case  8: kp = 66; break; // B
L_main47:
	MOVLW       66
	MOVWF       _kp+0 
	GOTO        L_main39
;MyProject.c,116 :: 		case  9: kp = 55; break; // 7
L_main48:
	MOVLW       55
	MOVWF       _kp+0 
	GOTO        L_main39
;MyProject.c,117 :: 		case 10: kp = 56; break; // 8
L_main49:
	MOVLW       56
	MOVWF       _kp+0 
	GOTO        L_main39
;MyProject.c,118 :: 		case 11: kp = 57; break; // 9
L_main50:
	MOVLW       57
	MOVWF       _kp+0 
	GOTO        L_main39
;MyProject.c,119 :: 		case 12: kp = 67; break; // C
L_main51:
	MOVLW       67
	MOVWF       _kp+0 
	GOTO        L_main39
;MyProject.c,120 :: 		case 13: kp = 42; break; // *
L_main52:
	MOVLW       42
	MOVWF       _kp+0 
	GOTO        L_main39
;MyProject.c,121 :: 		case 14: kp = 48; break; // 0
L_main53:
	MOVLW       48
	MOVWF       _kp+0 
	GOTO        L_main39
;MyProject.c,122 :: 		case 15: kp = 35; break; // #
L_main54:
	MOVLW       35
	MOVWF       _kp+0 
	GOTO        L_main39
;MyProject.c,123 :: 		case 16: kp = 68; break; // D
L_main55:
	MOVLW       68
	MOVWF       _kp+0 
	GOTO        L_main39
;MyProject.c,125 :: 		}
L_main38:
	MOVF        _kp+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_main40
	MOVF        _kp+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_main41
	MOVF        _kp+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_main42
	MOVF        _kp+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_main43
	MOVF        _kp+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_main44
	MOVF        _kp+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_main45
	MOVF        _kp+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_main46
	MOVF        _kp+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_main47
	MOVF        _kp+0, 0 
	XORLW       9
	BTFSC       STATUS+0, 2 
	GOTO        L_main48
	MOVF        _kp+0, 0 
	XORLW       10
	BTFSC       STATUS+0, 2 
	GOTO        L_main49
	MOVF        _kp+0, 0 
	XORLW       11
	BTFSC       STATUS+0, 2 
	GOTO        L_main50
	MOVF        _kp+0, 0 
	XORLW       12
	BTFSC       STATUS+0, 2 
	GOTO        L_main51
	MOVF        _kp+0, 0 
	XORLW       13
	BTFSC       STATUS+0, 2 
	GOTO        L_main52
	MOVF        _kp+0, 0 
	XORLW       14
	BTFSC       STATUS+0, 2 
	GOTO        L_main53
	MOVF        _kp+0, 0 
	XORLW       15
	BTFSC       STATUS+0, 2 
	GOTO        L_main54
	MOVF        _kp+0, 0 
	XORLW       16
	BTFSC       STATUS+0, 2 
	GOTO        L_main55
L_main39:
;MyProject.c,132 :: 		if (kp == 35)
	MOVF        _kp+0, 0 
	XORLW       35
	BTFSS       STATUS+0, 2 
	GOTO        L_main56
;MyProject.c,134 :: 		if (pin == check)
	MOVF        _pin+1, 0 
	XORWF       _check+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main67
	MOVF        _check+0, 0 
	XORWF       _pin+0, 0 
L__main67:
	BTFSS       STATUS+0, 2 
	GOTO        L_main57
;MyProject.c,136 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,137 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,138 :: 		Lcd_Out(1, 3, "UNLOCKING");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr7_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr7_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,139 :: 		break;
	GOTO        L_main2
;MyProject.c,140 :: 		}
L_main57:
;MyProject.c,141 :: 		else if(pin != check)
	MOVF        _pin+1, 0 
	XORWF       _check+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main68
	MOVF        _check+0, 0 
	XORWF       _pin+0, 0 
L__main68:
	BTFSC       STATUS+0, 2 
	GOTO        L_main59
;MyProject.c,143 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,144 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,145 :: 		Lcd_Out(1, 3, "WrongPin");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr8_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr8_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,146 :: 		check=0;
	CLRF        _check+0 
	CLRF        _check+1 
;MyProject.c,147 :: 		limit=0;
	CLRF        _limit+0 
;MyProject.c,148 :: 		}
L_main59:
;MyProject.c,149 :: 		}
	GOTO        L_main60
L_main56:
;MyProject.c,150 :: 		else if(kp != 35 && limit<3)
	MOVF        _kp+0, 0 
	XORLW       35
	BTFSC       STATUS+0, 2 
	GOTO        L_main63
	MOVLW       3
	SUBWF       _limit+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main63
L__main64:
;MyProject.c,152 :: 		check = 100 * check + kp;
	MOVLW       100
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _check+0, 0 
	MOVWF       R4 
	MOVF        _check+1, 0 
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVF        _kp+0, 0 
	ADDWF       R0, 0 
	MOVWF       _check+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       _check+1 
;MyProject.c,153 :: 		Lcd_Chr(2, 1 + limit, 42);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        _limit+0, 0 
	ADDLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       42
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;MyProject.c,154 :: 		UART1_Write(check);
	MOVF        _check+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;MyProject.c,155 :: 		limit = limit + 1;
	INCF        _limit+0, 1 
;MyProject.c,156 :: 		}
L_main63:
L_main60:
;MyProject.c,158 :: 		} while (limit<4);
	MOVLW       4
	SUBWF       _limit+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_main1
L_main2:
;MyProject.c,159 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
