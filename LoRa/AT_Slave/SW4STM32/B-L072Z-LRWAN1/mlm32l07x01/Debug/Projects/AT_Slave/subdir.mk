################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/src/at.c \
C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/src/command.c \
C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/src/debug.c \
C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/src/hw_gpio.c \
C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/src/hw_rtc.c \
C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/src/hw_spi.c \
C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/src/lora.c \
C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/src/main.c \
C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/src/mlm32l0xx_hw.c \
C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/src/mlm32l0xx_it.c \
C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/src/test_rf.c \
C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/src/tiny_sscanf.c \
C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/src/tiny_vsnprintf.c \
C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/src/vcom.c 

OBJS += \
./Projects/AT_Slave/at.o \
./Projects/AT_Slave/command.o \
./Projects/AT_Slave/debug.o \
./Projects/AT_Slave/hw_gpio.o \
./Projects/AT_Slave/hw_rtc.o \
./Projects/AT_Slave/hw_spi.o \
./Projects/AT_Slave/lora.o \
./Projects/AT_Slave/main.o \
./Projects/AT_Slave/mlm32l0xx_hw.o \
./Projects/AT_Slave/mlm32l0xx_it.o \
./Projects/AT_Slave/test_rf.o \
./Projects/AT_Slave/tiny_sscanf.o \
./Projects/AT_Slave/tiny_vsnprintf.o \
./Projects/AT_Slave/vcom.o 

C_DEPS += \
./Projects/AT_Slave/at.d \
./Projects/AT_Slave/command.d \
./Projects/AT_Slave/debug.d \
./Projects/AT_Slave/hw_gpio.d \
./Projects/AT_Slave/hw_rtc.d \
./Projects/AT_Slave/hw_spi.d \
./Projects/AT_Slave/lora.d \
./Projects/AT_Slave/main.d \
./Projects/AT_Slave/mlm32l0xx_hw.d \
./Projects/AT_Slave/mlm32l0xx_it.d \
./Projects/AT_Slave/test_rf.d \
./Projects/AT_Slave/tiny_sscanf.d \
./Projects/AT_Slave/tiny_vsnprintf.d \
./Projects/AT_Slave/vcom.d 


# Each subdirectory must supply rules for building sources it contributes
Projects/AT_Slave/at.o: C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/src/at.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft -DSTM32L072xx -DUSE_BAND_868 -DUSE_B_L072Z_LRWAN1 -DUSE_FULL_LL_DRIVER -DREGION_EU868 -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/MLM32L07X01" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/STM32L0xx_HAL_Driver/Inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Device/ST/STM32L0xx/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Crypto" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Phy" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Utilities" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/X_NUCLEO_IKS01A1" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Core" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/Common" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/hts221" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps22hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps25hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/sx1276" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/B-L072Z-LRWAN1"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Projects/AT_Slave/command.o: C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/src/command.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft -DSTM32L072xx -DUSE_BAND_868 -DUSE_B_L072Z_LRWAN1 -DUSE_FULL_LL_DRIVER -DREGION_EU868 -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/MLM32L07X01" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/STM32L0xx_HAL_Driver/Inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Device/ST/STM32L0xx/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Crypto" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Phy" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Utilities" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/X_NUCLEO_IKS01A1" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Core" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/Common" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/hts221" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps22hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps25hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/sx1276" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/B-L072Z-LRWAN1"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Projects/AT_Slave/debug.o: C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/src/debug.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft -DSTM32L072xx -DUSE_BAND_868 -DUSE_B_L072Z_LRWAN1 -DUSE_FULL_LL_DRIVER -DREGION_EU868 -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/MLM32L07X01" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/STM32L0xx_HAL_Driver/Inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Device/ST/STM32L0xx/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Crypto" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Phy" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Utilities" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/X_NUCLEO_IKS01A1" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Core" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/Common" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/hts221" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps22hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps25hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/sx1276" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/B-L072Z-LRWAN1"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Projects/AT_Slave/hw_gpio.o: C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/src/hw_gpio.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft -DSTM32L072xx -DUSE_BAND_868 -DUSE_B_L072Z_LRWAN1 -DUSE_FULL_LL_DRIVER -DREGION_EU868 -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/MLM32L07X01" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/STM32L0xx_HAL_Driver/Inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Device/ST/STM32L0xx/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Crypto" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Phy" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Utilities" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/X_NUCLEO_IKS01A1" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Core" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/Common" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/hts221" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps22hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps25hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/sx1276" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/B-L072Z-LRWAN1"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Projects/AT_Slave/hw_rtc.o: C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/src/hw_rtc.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft -DSTM32L072xx -DUSE_BAND_868 -DUSE_B_L072Z_LRWAN1 -DUSE_FULL_LL_DRIVER -DREGION_EU868 -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/MLM32L07X01" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/STM32L0xx_HAL_Driver/Inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Device/ST/STM32L0xx/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Crypto" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Phy" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Utilities" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/X_NUCLEO_IKS01A1" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Core" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/Common" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/hts221" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps22hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps25hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/sx1276" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/B-L072Z-LRWAN1"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Projects/AT_Slave/hw_spi.o: C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/src/hw_spi.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft -DSTM32L072xx -DUSE_BAND_868 -DUSE_B_L072Z_LRWAN1 -DUSE_FULL_LL_DRIVER -DREGION_EU868 -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/MLM32L07X01" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/STM32L0xx_HAL_Driver/Inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Device/ST/STM32L0xx/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Crypto" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Phy" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Utilities" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/X_NUCLEO_IKS01A1" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Core" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/Common" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/hts221" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps22hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps25hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/sx1276" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/B-L072Z-LRWAN1"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Projects/AT_Slave/lora.o: C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/src/lora.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft -DSTM32L072xx -DUSE_BAND_868 -DUSE_B_L072Z_LRWAN1 -DUSE_FULL_LL_DRIVER -DREGION_EU868 -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/MLM32L07X01" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/STM32L0xx_HAL_Driver/Inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Device/ST/STM32L0xx/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Crypto" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Phy" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Utilities" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/X_NUCLEO_IKS01A1" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Core" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/Common" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/hts221" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps22hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps25hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/sx1276" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/B-L072Z-LRWAN1"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Projects/AT_Slave/main.o: C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/src/main.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft -DSTM32L072xx -DUSE_BAND_868 -DUSE_B_L072Z_LRWAN1 -DUSE_FULL_LL_DRIVER -DREGION_EU868 -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/MLM32L07X01" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/STM32L0xx_HAL_Driver/Inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Device/ST/STM32L0xx/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Crypto" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Phy" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Utilities" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/X_NUCLEO_IKS01A1" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Core" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/Common" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/hts221" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps22hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps25hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/sx1276" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/B-L072Z-LRWAN1"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Projects/AT_Slave/mlm32l0xx_hw.o: C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/src/mlm32l0xx_hw.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft -DSTM32L072xx -DUSE_BAND_868 -DUSE_B_L072Z_LRWAN1 -DUSE_FULL_LL_DRIVER -DREGION_EU868 -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/MLM32L07X01" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/STM32L0xx_HAL_Driver/Inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Device/ST/STM32L0xx/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Crypto" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Phy" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Utilities" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/X_NUCLEO_IKS01A1" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Core" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/Common" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/hts221" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps22hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps25hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/sx1276" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/B-L072Z-LRWAN1"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Projects/AT_Slave/mlm32l0xx_it.o: C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/src/mlm32l0xx_it.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft -DSTM32L072xx -DUSE_BAND_868 -DUSE_B_L072Z_LRWAN1 -DUSE_FULL_LL_DRIVER -DREGION_EU868 -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/MLM32L07X01" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/STM32L0xx_HAL_Driver/Inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Device/ST/STM32L0xx/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Crypto" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Phy" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Utilities" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/X_NUCLEO_IKS01A1" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Core" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/Common" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/hts221" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps22hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps25hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/sx1276" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/B-L072Z-LRWAN1"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Projects/AT_Slave/test_rf.o: C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/src/test_rf.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft -DSTM32L072xx -DUSE_BAND_868 -DUSE_B_L072Z_LRWAN1 -DUSE_FULL_LL_DRIVER -DREGION_EU868 -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/MLM32L07X01" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/STM32L0xx_HAL_Driver/Inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Device/ST/STM32L0xx/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Crypto" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Phy" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Utilities" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/X_NUCLEO_IKS01A1" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Core" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/Common" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/hts221" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps22hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps25hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/sx1276" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/B-L072Z-LRWAN1"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Projects/AT_Slave/tiny_sscanf.o: C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/src/tiny_sscanf.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft -DSTM32L072xx -DUSE_BAND_868 -DUSE_B_L072Z_LRWAN1 -DUSE_FULL_LL_DRIVER -DREGION_EU868 -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/MLM32L07X01" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/STM32L0xx_HAL_Driver/Inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Device/ST/STM32L0xx/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Crypto" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Phy" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Utilities" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/X_NUCLEO_IKS01A1" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Core" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/Common" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/hts221" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps22hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps25hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/sx1276" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/B-L072Z-LRWAN1"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Projects/AT_Slave/tiny_vsnprintf.o: C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/src/tiny_vsnprintf.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft -DSTM32L072xx -DUSE_BAND_868 -DUSE_B_L072Z_LRWAN1 -DUSE_FULL_LL_DRIVER -DREGION_EU868 -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/MLM32L07X01" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/STM32L0xx_HAL_Driver/Inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Device/ST/STM32L0xx/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Crypto" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Phy" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Utilities" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/X_NUCLEO_IKS01A1" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Core" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/Common" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/hts221" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps22hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps25hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/sx1276" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/B-L072Z-LRWAN1"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Projects/AT_Slave/vcom.o: C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/src/vcom.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft -DSTM32L072xx -DUSE_BAND_868 -DUSE_B_L072Z_LRWAN1 -DUSE_FULL_LL_DRIVER -DREGION_EU868 -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/MLM32L07X01" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/STM32L0xx_HAL_Driver/Inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Device/ST/STM32L0xx/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Crypto" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Phy" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Utilities" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/X_NUCLEO_IKS01A1" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Core" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/Common" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/hts221" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps22hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps25hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/sx1276" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/B-L072Z-LRWAN1"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


