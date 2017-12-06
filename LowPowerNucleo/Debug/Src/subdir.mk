################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Src/main.c \
../Src/stm32l1xx_hal_msp.c \
../Src/stm32l1xx_it.c \
../Src/system_stm32l1xx.c 

OBJS += \
./Src/main.o \
./Src/stm32l1xx_hal_msp.o \
./Src/stm32l1xx_it.o \
./Src/system_stm32l1xx.o 

C_DEPS += \
./Src/main.d \
./Src/stm32l1xx_hal_msp.d \
./Src/stm32l1xx_it.d \
./Src/system_stm32l1xx.d 


# Each subdirectory must supply rules for building sources it contributes
Src/%.o: ../Src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -mfloat-abi=soft '-D__weak=__attribute__((weak))' '-D__packed=__attribute__((__packed__))' -DUSE_HAL_DRIVER -DSTM32L152xE -I"C:/STM32Toolchain/cubemx-out/LowPowerNucleo/Inc" -I"C:/STM32Toolchain/cubemx-out/LowPowerNucleo/Drivers/STM32L1xx_HAL_Driver/Inc" -I"C:/STM32Toolchain/cubemx-out/LowPowerNucleo/Drivers/STM32L1xx_HAL_Driver/Inc/Legacy" -I"C:/STM32Toolchain/cubemx-out/LowPowerNucleo/Drivers/CMSIS/Device/ST/STM32L1xx/Include" -I"C:/STM32Toolchain/cubemx-out/LowPowerNucleo/Drivers/CMSIS/Include" -I"C:/STM32Toolchain/cubemx-out/LowPowerNucleo/Inc"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


