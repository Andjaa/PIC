/*PIC mikrokontroler 16F877 povezati sa 4x4 matricnim displejomLCD
displejom
preko 8 linije jednog porta. Na drugi port PIC mikrokontrolera povezati
LCD displej
i to sa 4 linije za podatke D0-D3 i tri linije za tri dodatne linije E,
R/W i RS za
kontrolu komunikacije. Pritisnuti taster na tastaturi prvo detekotvati
pomocu
Keypad_Key_Click() funkcije, a zatim ga ispisati na tastaturi, kao i broj
puta koliko
je pritisnut (otpušten).*/

unsigned short i, kp, cnt, oldstate = 0;
char txt[6];

// Keypad module connections
char  keypadPort at PORTB;
// End Keypad module connections
const unsigned char cifre []={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};
// LCD module connections
sbit LCD_RS at RD4_bit;
sbit LCD_EN at RD5_bit;
sbit LCD_D4 at RD0_bit;
sbit LCD_D5 at RD1_bit;
sbit LCD_D6 at RD2_bit;
sbit LCD_D7 at RD3_bit;

sbit LCD_RS_Direction at TRISD4_bit;
sbit LCD_EN_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD0_bit;
sbit LCD_D5_Direction at TRISD1_bit;
sbit LCD_D6_Direction at TRISD2_bit;
sbit LCD_D7_Direction at TRISD3_bit;
// End LCD module connections

void Brojac(int br)
{
  int jed=br%10;
  int des=(br/10)%10;
  int sto=br/100;


  PORTE.B0=1;PORTE.B1=0;PORTE.B2=0;
  PORTC=cifre[sto];
  Delay_ms(50);



  PORTE.B0=0;PORTE.B1=1;PORTE.B2=0;
  PORTC=cifre[des];
  Delay_ms(50);


  PORTE.B0=0;PORTE.B1=0;PORTE.B2=1;
  PORTC=cifre[jed];
  Delay_ms(50);


}

void main() {

  cnt = 0;
  Keypad_Init();
  TRISC=0;
  PORTC=0;
  TRISE=0;
  PORTE=0;
  ANSEL  = 0;
  ANSELH = 0;
  Lcd_Init();
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Cmd(_LCD_CURSOR_OFF);
  Lcd_Out(1, 1, "1");
  Lcd_Out(1, 1, "Key :");

  Lcd_Out(2, 1, "Times :");




  do {
    kp = 0;
    
    do{
      Brojac(cnt);
      kp = Keypad_Key_Click();
      }
    while (!kp);

    switch (kp) {

      case  1: kp = 49; break; // 1 A
      case  2: kp = 50; break; // 2
      case  3: kp = 51; break; // 3

      case  5: kp = 52; break; // 4
      case  6: kp = 53; break; // 5
      case  7: kp = 54; break; // 6

      case  9: kp = 55; break; // 7
      case 10: kp = 56; break; // 8
      case 11: kp = 57; break; // 9

      case 13: kp = 42; break; // *
      case 14: kp = 48; break; // 0
      case 15: kp = 35; break; // #


    }

    if (kp != oldstate) {
      cnt = 1;
      oldstate = kp;
      }
    else {
      cnt++;
      }

    Lcd_Chr(1, 10, kp);

    if (cnt == 255) {
      cnt = 0;
      Lcd_Out(2, 10, "   ");
      }

    WordToStr(cnt, txt);
    Lcd_Out(2, 10, txt);

  } while (1);
}