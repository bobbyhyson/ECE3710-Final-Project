#include "wav.h"
#include "string.h"
#include "ff.h"

// helper to read little-endian integers from buffer
static uint32_t le32(const uint8_t *b) {
    return (uint32_t)b[0] | ((uint32_t)b[1]<<8) | ((uint32_t)b[2]<<16) | ((uint32_t)b[3]<<24);
}
static uint16_t le16(const uint8_t *b) {
    return (uint16_t)b[0] | ((uint16_t)b[1]<<8);
}

// Parse WAV header. Returns 0 on success, -1 on failure.
int wav_parse_header(FIL *f, WAV_Info *info) {
    FRESULT fr;
    UINT br;
    uint8_t buf[12];

    // read RIFF header (12 bytes)
    fr = f_lseek(f, 0);
    if (fr != FR_OK) return -1;
    fr = f_read(f, buf, 12, &br);
    if (fr != FR_OK || br != 12) return -1;

    if (memcmp(buf, "RIFF", 4) != 0 || memcmp(buf+8, "WAVE", 4) != 0) return -1;

    // read chunks until "fmt " and "data" are found
    uint8_t chunk_hdr[8];
    uint32_t fmt_found = 0, data_found = 0;
    uint32_t fmt_chunk_size = 0;
    uint16_t audio_format = 0;
    uint32_t data_chunk_pos = 0, data_chunk_size = 0;

    while (1) {
        fr = f_read(f, chunk_hdr, 8, &br);
        if (fr != FR_OK || br != 8) return -1;
        uint32_t chunk_id = le32(chunk_hdr);
        uint32_t chunk_size = le32(chunk_hdr+4);

        if (memcmp(chunk_hdr, "fmt ", 4) == 0) {
            // read fmt chunk
            fmt_chunk_size = chunk_size;
            uint8_t *fmt_buf = (uint8_t*)malloc(chunk_size);
            if (!fmt_buf) return -1;
            fr = f_read(f, fmt_buf, chunk_size, &br);
            if (fr != FR_OK || (uint32_t)br != chunk_size) { free(fmt_buf); return -1; }
            audio_format = le16(fmt_buf + 0);
            // channels, sample rate, bits per sample are in fmt
            uint16_t num_channels = le16(fmt_buf + 2);
            uint32_t sample_rate = le32(fmt_buf + 4);
            uint16_t bits_per_sample = le16(fmt_buf + 14);
            info->num_channels = num_channels;
            info->sample_rate = sample_rate;
            info->bits_per_sample = bits_per_sample;
            fmt_found = 1;
            free(fmt_buf);
        } else if (memcmp(chunk_hdr, "data", 4) == 0) {
            // data chunk start
            data_chunk_pos = f_tell(f);
            data_chunk_size = chunk_size;
            fr = f_lseek(f, f_tell(f) + chunk_size);
            if (fr != FR_OK) return -1;
            data_found = 1;
        } else {
            // skip unknown chunk
            // align to even boundary: chunk sizes are word aligned
            fr = f_lseek(f, f_tell(f) + chunk_size);
            if (fr != FR_OK) return -1;
        }

        if (fmt_found && data_found) break;

        // check EOF
        if (f_tell(f) >= f_size(f)) break;
    }

    // minimal checks
    if (!fmt_found || !data_found) return -1;
    if (audio_format != 1) return -1; // only PCM supported
    if (info->bits_per_sample != 16 && info->bits_per_sample != 24 && info->bits_per_sample != 32) return -1;

    info->data_start = data_chunk_pos;
    info->data_bytes = data_chunk_size;
    return 0;
}
