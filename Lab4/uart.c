#include "stm32l476xx.h"
#include "uart.h"

void usart_init(USART_TypeDef * USARTx){
//disable usart
USARTx->CR1 &= ~USART_CR1_UE;

//set ata length to 8 bits
USARTx->CR1 &= ~USART_CR1_M;

//select 1 stop bit
USARTx->CR2 &= ~(USART_CR2_STOP);

//set parity control as no parity
USARTx->CR1 &= ~USART_CR1_PCE;

//oversampliing by 16
USARTx->CR1 |= ~USART_CR1_OVER8;

//set baud rate to 9600
USARTx->BRR = 0X208D;

//Enable transmission and reception
USARTx->CR1 |= (USART_CR1_TE | USART_CR1_RE);

//Enable Usart
USARTx->CR1 |= USART_CR1_UE;

//verify usart is ready for transmission TEAK
while ((USARTx->ISR & USART_ISR_TEACK) == 0);

//REAK
while ((USARTx->ISR & USART_ISR_REACK) == 0);


}


