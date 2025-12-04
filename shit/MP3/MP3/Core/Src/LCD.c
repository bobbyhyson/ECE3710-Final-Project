//////////////////////////////////////////////LCD.c//////////////////////////////////
#include "LCD.h"
#include "stm32l476xx.h"

#define LCD_Port GPIOB // GPIO Port B 
#define LCD_RS 0 // RS (Register Select): e = command, 1 = data 
#define LCD_EN 1 // Enable Pin 
#define LCD_D4 2 // GPIO pin for DB 4 
#define LCD_D5 3 // GPIO pin for DB 5 
#define LCD_D6 4 // GPIO pin for DB 6 
#define LCD_D7 5 // GPIO pin for DB 7 

#define R1 6
#define R2 7
#define R3 8
#define R4 9
#define C1 10
#define C2 11
#define C3 12
#define C4 13

/////////////////////////////////////	
void delay_ms(unsigned int ms);
/////////////////////////////////////
unsigned char key_map [4][4] = { 
	{'1', '2', '3', 'A'}, // 1st row 
	{'4', '5', '6', 'B'}, // 2nd row 
	{'7', '8', '9', 'C'}, // 3rd row 
	{'*', '0', '#', 'D'}, // 4th row 
}; 

void LCD_PutNibble(uint8_t c) { 
	if(c & 0x8) // Place 4th bit on pin DB 7 
		LCD_Port->ODR |= 1<<LCD_D7; 
	else 
		LCD_Port->ODR &= ~(1<<LCD_D7); 
	
	if(c & 0x4) // Place 3rd bit on pin D8 6 
		LCD_Port->ODR |= 1<<LCD_D6; 
	else 
		LCD_Port->ODR &= ~(1<<LCD_D6); 
	if(c & 0x2) // Place 2nd bit on pin D8 5 
		LCD_Port->ODR |= 1<<LCD_D5; 
	else 
		LCD_Port->ODR &= ~(1<<LCD_D5); 
	if( c & 0x1) // Place 1st bit on pin D8 4 
		LCD_Port->ODR |= 1<<LCD_D4; 
	else 
		LCD_Port->ODR &= ~(1<<LCD_D4); 
} 

void LCD_Pulse(void) { 
	LCD_Port->ODR |= 1<<LCD_EN; //set E high
	delay_ms(4);                // delay 4ms
	
	LCD_Port->ODR &= ~(1<<LCD_EN); //set E low
	delay_ms(4);                   // delay 4ms
}

void delay_ms(unsigned int ms) {
	unsigned int i,j;
	
	for (i = 0;i < ms; i++) {
		for (j = 0;j < 800; j++){}
	}
}

void LCD_WriteCom(unsigned char com) {
	unsigned char com1, com2;
	
	com1 = com & 0x0F;
	com2 = (com>>4) & 0x0F;
	
	GPIOB->ODR &= ~(1<<LCD_RS);
	
	LCD_PutNibble(com2);
	LCD_Pulse();
	
	LCD_PutNibble(com1);
	LCD_Pulse();
}

void LCD_WriteData(unsigned char dat) {
	unsigned char dat1, dat2;
	
	dat1 = dat & 0x0F;
	dat2 = (dat>>4) & 0x0F;
	
	GPIOB->ODR |= (1<<LCD_RS);
	
	LCD_PutNibble(dat2);
	LCD_Pulse();
	
	LCD_PutNibble(dat1);
	LCD_Pulse();
}

void LCD_Init(void){
	RCC->CR |= RCC_CR_HSION;
	while((RCC->CR & RCC_CR_HSIRDY) == 0);
	RCC->AHB2ENR |= RCC_AHB2ENR_GPIOBEN;
	
	// Set pins as outputs
	GPIOB->MODER &= 0xFFFFF000;
	GPIOB->MODER |= 0x00000555;
	
	delay_ms(30);
	LCD_WriteCom(0x03);
	
	LCD_WriteCom(0x03);
	delay_ms(5);
	
	LCD_WriteCom(0x03);
	delay_ms(1);
	
	LCD_WriteCom(0x02);
	delay_ms(1);
	
	LCD_WriteCom(0x28);
	LCD_WriteCom(0x0C);
	LCD_WriteCom(0x06);
	LCD_WriteCom(0x01);
	
	delay_ms(5);
}

void LCD_Clear(void){
  LCD_WriteCom(0x01);
	delay_ms(5);
}

void LCD_DisplayString(unsigned int line, unsigned char *ptr) {
	int i;
	
	if (line == 0) {
		LCD_WriteCom(0x80);
	
	}
	else {
		LCD_WriteCom(0xC0);
	}
	for( i =0; i < 16 && ptr[i] != '\0'; i++){
		LCD_WriteData(ptr[i]);
	}
}

