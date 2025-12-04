################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Src/audio_player.c \
../Src/bitstream.c \
../Src/dct32.c \
../Src/dequant.c \
../Src/diskio.c \
../Src/fatfs.c \
../Src/ff.c \
../Src/ff_gen_drv.c \
../Src/helix_mp3.c \
../Src/huffman.c \
../Src/hufftabs.c \
../Src/imdct.c \
../Src/main.c \
../Src/mp3dec.c \
../Src/syscall.c \
../Src/syscalls.c \
../Src/sysmem.c \
../Src/system_stm32l4xx.c \
../Src/trigtabs.c \
../Src/user_diskio.c 

OBJS += \
./Src/audio_player.o \
./Src/bitstream.o \
./Src/dct32.o \
./Src/dequant.o \
./Src/diskio.o \
./Src/fatfs.o \
./Src/ff.o \
./Src/ff_gen_drv.o \
./Src/helix_mp3.o \
./Src/huffman.o \
./Src/hufftabs.o \
./Src/imdct.o \
./Src/main.o \
./Src/mp3dec.o \
./Src/syscall.o \
./Src/syscalls.o \
./Src/sysmem.o \
./Src/system_stm32l4xx.o \
./Src/trigtabs.o \
./Src/user_diskio.o 

C_DEPS += \
./Src/audio_player.d \
./Src/bitstream.d \
./Src/dct32.d \
./Src/dequant.d \
./Src/diskio.d \
./Src/fatfs.d \
./Src/ff.d \
./Src/ff_gen_drv.d \
./Src/helix_mp3.d \
./Src/huffman.d \
./Src/hufftabs.d \
./Src/imdct.d \
./Src/main.d \
./Src/mp3dec.d \
./Src/syscall.d \
./Src/syscalls.d \
./Src/sysmem.d \
./Src/system_stm32l4xx.d \
./Src/trigtabs.d \
./Src/user_diskio.d 


# Each subdirectory must supply rules for building sources it contributes
Src/%.o Src/%.su Src/%.cyclo: ../Src/%.c Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32L4 -DSTM32 -DSTM32L476RGTx -c -I../Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Src

clean-Src:
	-$(RM) ./Src/audio_player.cyclo ./Src/audio_player.d ./Src/audio_player.o ./Src/audio_player.su ./Src/bitstream.cyclo ./Src/bitstream.d ./Src/bitstream.o ./Src/bitstream.su ./Src/dct32.cyclo ./Src/dct32.d ./Src/dct32.o ./Src/dct32.su ./Src/dequant.cyclo ./Src/dequant.d ./Src/dequant.o ./Src/dequant.su ./Src/diskio.cyclo ./Src/diskio.d ./Src/diskio.o ./Src/diskio.su ./Src/fatfs.cyclo ./Src/fatfs.d ./Src/fatfs.o ./Src/fatfs.su ./Src/ff.cyclo ./Src/ff.d ./Src/ff.o ./Src/ff.su ./Src/ff_gen_drv.cyclo ./Src/ff_gen_drv.d ./Src/ff_gen_drv.o ./Src/ff_gen_drv.su ./Src/helix_mp3.cyclo ./Src/helix_mp3.d ./Src/helix_mp3.o ./Src/helix_mp3.su ./Src/huffman.cyclo ./Src/huffman.d ./Src/huffman.o ./Src/huffman.su ./Src/hufftabs.cyclo ./Src/hufftabs.d ./Src/hufftabs.o ./Src/hufftabs.su ./Src/imdct.cyclo ./Src/imdct.d ./Src/imdct.o ./Src/imdct.su ./Src/main.cyclo ./Src/main.d ./Src/main.o ./Src/main.su ./Src/mp3dec.cyclo ./Src/mp3dec.d ./Src/mp3dec.o ./Src/mp3dec.su ./Src/syscall.cyclo ./Src/syscall.d ./Src/syscall.o ./Src/syscall.su ./Src/syscalls.cyclo ./Src/syscalls.d ./Src/syscalls.o ./Src/syscalls.su ./Src/sysmem.cyclo ./Src/sysmem.d ./Src/sysmem.o ./Src/sysmem.su ./Src/system_stm32l4xx.cyclo ./Src/system_stm32l4xx.d ./Src/system_stm32l4xx.o ./Src/system_stm32l4xx.su ./Src/trigtabs.cyclo ./Src/trigtabs.d ./Src/trigtabs.o ./Src/trigtabs.su ./Src/user_diskio.cyclo ./Src/user_diskio.d ./Src/user_diskio.o ./Src/user_diskio.su

.PHONY: clean-Src

