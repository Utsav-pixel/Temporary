#line 1 "F:/Electronics/Nysha/ELS/Keypad with PIC Microcontroller/Keypad with PIC Microcontroller/PIC Code/MyProject.c"
unsigned short kp, cnt, oldstate = 0,limit,limit1;
unsigned int pin, check;

char keypadPort at PORTD;

sbit LCD_RS at RB0_bit;
sbit LCD_EN at RB1_bit;
sbit LCD_D4 at RB2_bit;
sbit LCD_D5 at RB3_bit;
sbit LCD_D6 at RB4_bit;
sbit LCD_D7 at RB5_bit;

sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB4_bit;
sbit LCD_D7_Direction at TRISB5_bit;


void main() {
 TRISB.F6=1;
 UART1_Init(9600);
 Delay_ms(100);

 UART1_Write_Text("Start");
 UART1_Write(10);
 UART1_Write(13);

 limit = 0;
 cnt = 0;
 pin = 495051;
 check =0;
 Keypad_Init();
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1, 1, "Enter Pin:");

 do {
 kp = 0;
 do{
 kp = Keypad_Key_Click();
 if(PORTB.F6==1)
 { limit1=0;
 pin=0;
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1, 1, "Enter New Pin:");

 do {
 kp = 0;
 do
 kp = Keypad_Key_Click();
 while (!kp);

 switch (kp) {
 case 1: kp = 49; break;
 case 2: kp = 50; break;
 case 3: kp = 51; break;
 case 4: kp = 65; break;
 case 5: kp = 52; break;
 case 6: kp = 53; break;
 case 7: kp = 54; break;
 case 8: kp = 66; break;
 case 9: kp = 55; break;
 case 10: kp = 56; break;
 case 11: kp = 57; break;
 case 12: kp = 67; break;
 case 13: kp = 42; break;
 case 14: kp = 48; break;
 case 15: kp = 35; break;
 case 16: kp = 68; break;

 }





if(kp != 35 && limit<3)
 {
 pin = 100 * pin + kp;
 Lcd_Chr(2, 1 + limit1, kp);
 UART1_Write(check);
 limit1 = limit1 + 1;
 }
else if(kp==35)
{Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1, 1, "Your new Pin has set succesfully");
 Delay_ms(1000);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1, 1, "Enter Pin:");
 limit=0;
 kp=0;
 break;}

 } while (limit1<4);

 }}
 while (!kp);

 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1, 1, "Enter Pin:");
 switch (kp) {
 case 1: kp = 49; break;
 case 2: kp = 50; break;
 case 3: kp = 51; break;
 case 4: kp = 65; break;
 case 5: kp = 52; break;
 case 6: kp = 53; break;
 case 7: kp = 54; break;
 case 8: kp = 66; break;
 case 9: kp = 55; break;
 case 10: kp = 56; break;
 case 11: kp = 57; break;
 case 12: kp = 67; break;
 case 13: kp = 42; break;
 case 14: kp = 48; break;
 case 15: kp = 35; break;
 case 16: kp = 68; break;

 }






 if (kp == 35)
 {
 if (pin == check)
 {
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1, 3, "UNLOCKING");
 break;
 }
 else if(pin != check)
 {
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1, 3, "WrongPin");
 check=0;
 limit=0;
 }
 }
 else if(kp != 35 && limit<3)
 {
 check = 100 * check + kp;
 Lcd_Chr(2, 1 + limit, 42);
 UART1_Write(check);
 limit = limit + 1;
 }

 } while (limit<4);
}
