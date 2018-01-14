################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/MLM32L07X01/mlm32l07x01.c 

OBJS += \
./Drivers/BSP/MLM32L0X01/mlm32l07x01.o 

C_DEPS += \
./Drivers/BSP/MLM32L0X01/mlm32l07x01.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/MLM32L0X01/mlm32l07x01.o: C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/MLM32L07X01/mlm32l07x01.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft -DSTM32L072xx -DUSE_BAND_868 -DUSE_B_L072Z_LRWAN1 -DUSE_FULL_LL_DRIVER -DREGION_EU868 -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/MLM32L07X01" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/STM32L0xx_HAL_Driver/Inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Device/ST/STM32L0xx/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Crypto" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Phy" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Utilities" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/X_NUCLEO_IKS01A1" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Core" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/Common" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/hts221" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps22hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps25hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/sx1276" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/B-L072Z-LRWAN1"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


