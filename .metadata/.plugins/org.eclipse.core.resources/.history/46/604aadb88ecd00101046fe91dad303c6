#ifndef AUDIO_PLAYER_H
#define AUDIO_PLAYER_H

#include "stm32l4xx_hal.h"
#include "ff.h"

#define AUDIO_BUFFER_SIZE 4096  // bytes for DMA, multiple of MP3 frames

void audio_init(void);
void audio_start(FIL *mp3_file);
void audio_feed(void);  // call in DMA callbacks

extern SAI_HandleTypeDef hsai_BlockA1;

#endif
