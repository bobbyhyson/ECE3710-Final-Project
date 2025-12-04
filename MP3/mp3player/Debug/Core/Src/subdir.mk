################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/audio_player.c \
../Core/Src/bitstream.c \
../Core/Src/dct32.c \
../Core/Src/dequant.c \
../Core/Src/helix_mp3.c \
../Core/Src/huffman.c \
../Core/Src/hufftabs.c \
../Core/Src/imdct.c \
../Core/Src/main.c \
../Core/Src/mp3dec.c \
../Core/Src/stm32l4xx_hal_msp.c \
../Core/Src/stm32l4xx_it.c \
../Core/Src/syscalls.c \
../Core/Src/sysmem.c \
../Core/Src/system_stm32l4xx.c \
../Core/Src/trigtabs.c 

OBJS += \
./Core/Src/audio_player.o \
./Core/Src/bitstream.o \
./Core/Src/dct32.o \
./Core/Src/dequant.o \
./Core/Src/helix_mp3.o \
./Core/Src/huffman.o \
./Core/Src/hufftabs.o \
./Core/Src/imdct.o \
./Core/Src/main.o \
./Core/Src/mp3dec.o \
./Core/Src/stm32l4xx_hal_msp.o \
./Core/Src/stm32l4xx_it.o \
./Core/Src/syscalls.o \
./Core/Src/sysmem.o \
./Core/Src/system_stm32l4xx.o \
./Core/Src/trigtabs.o 

C_DEPS += \
./Core/Src/audio_player.d \
./Core/Src/bitstream.d \
./Core/Src/dct32.d \
./Core/Src/dequant.d \
./Core/Src/helix_mp3.d \
./Core/Src/huffman.d \
./Core/Src/hufftabs.d \
./Core/Src/imdct.d \
./Core/Src/main.d \
./Core/Src/mp3dec.d \
./Core/Src/stm32l4xx_hal_msp.d \
./Core/Src/stm32l4xx_it.d \
./Core/Src/syscalls.d \
./Core/Src/sysmem.d \
./Core/Src/system_stm32l4xx.d \
./Core/Src/trigtabs.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/%.o Core/Src/%.su Core/Src/%.cyclo: ../Core/Src/%.c Core/Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L476xx -c -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src

clean-Core-2f-Src:
	-$(RM) ./Core/Src/audio_player.cyclo ./Core/Src/audio_player.d ./Core/Src/audio_player.o ./Core/Src/audio_player.su ./Core/Src/bitstream.cyclo ./Core/Src/bitstream.d ./Core/Src/bitstream.o ./Core/Src/bitstream.su ./Core/Src/dct32.cyclo ./Core/Src/dct32.d ./Core/Src/dct32.o ./Core/Src/dct32.su ./Core/Src/dequant.cyclo ./Core/Src/dequant.d ./Core/Src/dequant.o ./Core/Src/dequant.su ./Core/Src/helix_mp3.cyclo ./Core/Src/helix_mp3.d ./Core/Src/helix_mp3.o ./Core/Src/helix_mp3.su ./Core/Src/huffman.cyclo ./Core/Src/huffman.d ./Core/Src/huffman.o ./Core/Src/huffman.su ./Core/Src/hufftabs.cyclo ./Core/Src/hufftabs.d ./Core/Src/hufftabs.o ./Core/Src/hufftabs.su ./Core/Src/imdct.cyclo ./Core/Src/imdct.d ./Core/Src/imdct.o ./Core/Src/imdct.su ./Core/Src/main.cyclo ./Core/Src/main.d ./Core/Src/main.o ./Core/Src/main.su ./Core/Src/mp3dec.cyclo ./Core/Src/mp3dec.d ./Core/Src/mp3dec.o ./Core/Src/mp3dec.su ./Core/Src/stm32l4xx_hal_msp.cyclo ./Core/Src/stm32l4xx_hal_msp.d ./Core/Src/stm32l4xx_hal_msp.o ./Core/Src/stm32l4xx_hal_msp.su ./Core/Src/stm32l4xx_it.cyclo ./Core/Src/stm32l4xx_it.d ./Core/Src/stm32l4xx_it.o ./Core/Src/stm32l4xx_it.su ./Core/Src/syscalls.cyclo ./Core/Src/syscalls.d ./Core/Src/syscalls.o ./Core/Src/syscalls.su ./Core/Src/sysmem.cyclo ./Core/Src/sysmem.d ./Core/Src/sysmem.o ./Core/Src/sysmem.su ./Core/Src/system_stm32l4xx.cyclo ./Core/Src/system_stm32l4xx.d ./Core/Src/system_stm32l4xx.o ./Core/Src/system_stm32l4xx.su ./Core/Src/trigtabs.cyclo ./Core/Src/trigtabs.d ./Core/Src/trigtabs.o ./Core/Src/trigtabs.su

.PHONY: clean-Core-2f-Src

