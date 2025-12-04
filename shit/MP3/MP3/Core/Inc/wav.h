#ifndef WAV_H
#define WAV_H

#include "ff.h"
#include <stdint.h>

typedef struct {
    uint32_t sample_rate;
    uint16_t bits_per_sample;
    uint16_t num_channels;
    uint32_t data_start;   // offset in file where PCM data begins
    uint32_t data_bytes;   // size of PCM data in bytes
} WAV_Info;

int wav_parse_header(FIL *f, WAV_Info *info);

#endif // WAV_H
