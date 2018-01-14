################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac/LoRaMac.c \
C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac/LoRaMacCrypto.c \
C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac/region/Region.c \
C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac/region/RegionAS923.c \
C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac/region/RegionAU915.c \
C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac/region/RegionCN470.c \
C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac/region/RegionCN779.c \
C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac/region/RegionCommon.c \
C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac/region/RegionEU433.c \
C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac/region/RegionEU868.c \
C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac/region/RegionIN865.c \
C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac/region/RegionKR920.c \
C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac/region/RegionUS915-Hybrid.c \
C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac/region/RegionUS915.c 

OBJS += \
./Middlewares/Lora/Mac/LoRaMac.o \
./Middlewares/Lora/Mac/LoRaMacCrypto.o \
./Middlewares/Lora/Mac/Region.o \
./Middlewares/Lora/Mac/RegionAS923.o \
./Middlewares/Lora/Mac/RegionAU915.o \
./Middlewares/Lora/Mac/RegionCN470.o \
./Middlewares/Lora/Mac/RegionCN779.o \
./Middlewares/Lora/Mac/RegionCommon.o \
./Middlewares/Lora/Mac/RegionEU433.o \
./Middlewares/Lora/Mac/RegionEU868.o \
./Middlewares/Lora/Mac/RegionIN865.o \
./Middlewares/Lora/Mac/RegionKR920.o \
./Middlewares/Lora/Mac/RegionUS915-Hybrid.o \
./Middlewares/Lora/Mac/RegionUS915.o 

C_DEPS += \
./Middlewares/Lora/Mac/LoRaMac.d \
./Middlewares/Lora/Mac/LoRaMacCrypto.d \
./Middlewares/Lora/Mac/Region.d \
./Middlewares/Lora/Mac/RegionAS923.d \
./Middlewares/Lora/Mac/RegionAU915.d \
./Middlewares/Lora/Mac/RegionCN470.d \
./Middlewares/Lora/Mac/RegionCN779.d \
./Middlewares/Lora/Mac/RegionCommon.d \
./Middlewares/Lora/Mac/RegionEU433.d \
./Middlewares/Lora/Mac/RegionEU868.d \
./Middlewares/Lora/Mac/RegionIN865.d \
./Middlewares/Lora/Mac/RegionKR920.d \
./Middlewares/Lora/Mac/RegionUS915-Hybrid.d \
./Middlewares/Lora/Mac/RegionUS915.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/Lora/Mac/LoRaMac.o: C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac/LoRaMac.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft -DSTM32L072xx -DUSE_BAND_868 -DUSE_B_L072Z_LRWAN1 -DUSE_FULL_LL_DRIVER -DREGION_EU868 -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/MLM32L07X01" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/STM32L0xx_HAL_Driver/Inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Device/ST/STM32L0xx/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Crypto" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Phy" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Utilities" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/X_NUCLEO_IKS01A1" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Core" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/Common" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/hts221" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps22hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps25hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/sx1276" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/B-L072Z-LRWAN1"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Middlewares/Lora/Mac/LoRaMacCrypto.o: C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac/LoRaMacCrypto.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft -DSTM32L072xx -DUSE_BAND_868 -DUSE_B_L072Z_LRWAN1 -DUSE_FULL_LL_DRIVER -DREGION_EU868 -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/MLM32L07X01" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/STM32L0xx_HAL_Driver/Inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Device/ST/STM32L0xx/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Crypto" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Phy" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Utilities" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/X_NUCLEO_IKS01A1" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Core" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/Common" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/hts221" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps22hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps25hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/sx1276" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/B-L072Z-LRWAN1"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Middlewares/Lora/Mac/Region.o: C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac/region/Region.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft -DSTM32L072xx -DUSE_BAND_868 -DUSE_B_L072Z_LRWAN1 -DUSE_FULL_LL_DRIVER -DREGION_EU868 -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/MLM32L07X01" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/STM32L0xx_HAL_Driver/Inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Device/ST/STM32L0xx/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Crypto" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Phy" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Utilities" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/X_NUCLEO_IKS01A1" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Core" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/Common" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/hts221" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps22hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps25hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/sx1276" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/B-L072Z-LRWAN1"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Middlewares/Lora/Mac/RegionAS923.o: C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac/region/RegionAS923.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft -DSTM32L072xx -DUSE_BAND_868 -DUSE_B_L072Z_LRWAN1 -DUSE_FULL_LL_DRIVER -DREGION_EU868 -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/MLM32L07X01" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/STM32L0xx_HAL_Driver/Inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Device/ST/STM32L0xx/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Crypto" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Phy" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Utilities" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/X_NUCLEO_IKS01A1" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Core" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/Common" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/hts221" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps22hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps25hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/sx1276" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/B-L072Z-LRWAN1"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Middlewares/Lora/Mac/RegionAU915.o: C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac/region/RegionAU915.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft -DSTM32L072xx -DUSE_BAND_868 -DUSE_B_L072Z_LRWAN1 -DUSE_FULL_LL_DRIVER -DREGION_EU868 -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/MLM32L07X01" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/STM32L0xx_HAL_Driver/Inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Device/ST/STM32L0xx/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Crypto" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Phy" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Utilities" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/X_NUCLEO_IKS01A1" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Core" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/Common" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/hts221" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps22hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps25hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/sx1276" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/B-L072Z-LRWAN1"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Middlewares/Lora/Mac/RegionCN470.o: C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac/region/RegionCN470.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft -DSTM32L072xx -DUSE_BAND_868 -DUSE_B_L072Z_LRWAN1 -DUSE_FULL_LL_DRIVER -DREGION_EU868 -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/MLM32L07X01" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/STM32L0xx_HAL_Driver/Inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Device/ST/STM32L0xx/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Crypto" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Phy" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Utilities" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/X_NUCLEO_IKS01A1" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Core" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/Common" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/hts221" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps22hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps25hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/sx1276" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/B-L072Z-LRWAN1"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Middlewares/Lora/Mac/RegionCN779.o: C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac/region/RegionCN779.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft -DSTM32L072xx -DUSE_BAND_868 -DUSE_B_L072Z_LRWAN1 -DUSE_FULL_LL_DRIVER -DREGION_EU868 -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/MLM32L07X01" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/STM32L0xx_HAL_Driver/Inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Device/ST/STM32L0xx/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Crypto" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Phy" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Utilities" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/X_NUCLEO_IKS01A1" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Core" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/Common" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/hts221" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps22hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps25hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/sx1276" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/B-L072Z-LRWAN1"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Middlewares/Lora/Mac/RegionCommon.o: C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac/region/RegionCommon.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft -DSTM32L072xx -DUSE_BAND_868 -DUSE_B_L072Z_LRWAN1 -DUSE_FULL_LL_DRIVER -DREGION_EU868 -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/MLM32L07X01" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/STM32L0xx_HAL_Driver/Inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Device/ST/STM32L0xx/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Crypto" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Phy" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Utilities" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/X_NUCLEO_IKS01A1" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Core" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/Common" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/hts221" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps22hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps25hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/sx1276" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/B-L072Z-LRWAN1"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Middlewares/Lora/Mac/RegionEU433.o: C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac/region/RegionEU433.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft -DSTM32L072xx -DUSE_BAND_868 -DUSE_B_L072Z_LRWAN1 -DUSE_FULL_LL_DRIVER -DREGION_EU868 -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/MLM32L07X01" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/STM32L0xx_HAL_Driver/Inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Device/ST/STM32L0xx/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Crypto" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Phy" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Utilities" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/X_NUCLEO_IKS01A1" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Core" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/Common" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/hts221" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps22hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps25hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/sx1276" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/B-L072Z-LRWAN1"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Middlewares/Lora/Mac/RegionEU868.o: C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac/region/RegionEU868.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft -DSTM32L072xx -DUSE_BAND_868 -DUSE_B_L072Z_LRWAN1 -DUSE_FULL_LL_DRIVER -DREGION_EU868 -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/MLM32L07X01" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/STM32L0xx_HAL_Driver/Inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Device/ST/STM32L0xx/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Crypto" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Phy" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Utilities" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/X_NUCLEO_IKS01A1" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Core" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/Common" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/hts221" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps22hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps25hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/sx1276" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/B-L072Z-LRWAN1"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Middlewares/Lora/Mac/RegionIN865.o: C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac/region/RegionIN865.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft -DSTM32L072xx -DUSE_BAND_868 -DUSE_B_L072Z_LRWAN1 -DUSE_FULL_LL_DRIVER -DREGION_EU868 -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/MLM32L07X01" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/STM32L0xx_HAL_Driver/Inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Device/ST/STM32L0xx/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Crypto" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Phy" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Utilities" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/X_NUCLEO_IKS01A1" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Core" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/Common" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/hts221" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps22hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps25hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/sx1276" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/B-L072Z-LRWAN1"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Middlewares/Lora/Mac/RegionKR920.o: C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac/region/RegionKR920.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft -DSTM32L072xx -DUSE_BAND_868 -DUSE_B_L072Z_LRWAN1 -DUSE_FULL_LL_DRIVER -DREGION_EU868 -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/MLM32L07X01" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/STM32L0xx_HAL_Driver/Inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Device/ST/STM32L0xx/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Crypto" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Phy" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Utilities" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/X_NUCLEO_IKS01A1" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Core" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/Common" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/hts221" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps22hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps25hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/sx1276" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/B-L072Z-LRWAN1"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Middlewares/Lora/Mac/RegionUS915-Hybrid.o: C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac/region/RegionUS915-Hybrid.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft -DSTM32L072xx -DUSE_BAND_868 -DUSE_B_L072Z_LRWAN1 -DUSE_FULL_LL_DRIVER -DREGION_EU868 -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/MLM32L07X01" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/STM32L0xx_HAL_Driver/Inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Device/ST/STM32L0xx/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Crypto" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Phy" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Utilities" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/X_NUCLEO_IKS01A1" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Core" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/Common" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/hts221" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps22hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps25hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/sx1276" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/B-L072Z-LRWAN1"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Middlewares/Lora/Mac/RegionUS915.o: C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac/region/RegionUS915.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m0plus -mthumb -mfloat-abi=soft -DSTM32L072xx -DUSE_BAND_868 -DUSE_B_L072Z_LRWAN1 -DUSE_FULL_LL_DRIVER -DREGION_EU868 -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Projects/Multi/Applications/LoRa/AT_Slave/inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/MLM32L07X01" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/STM32L0xx_HAL_Driver/Inc" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Device/ST/STM32L0xx/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/CMSIS/Include" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Crypto" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Mac" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Phy" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Utilities" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/X_NUCLEO_IKS01A1" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Middlewares/Third_Party/Lora/Core" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/Common" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/hts221" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps22hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/lps25hb" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/Components/sx1276" -I"C:/Users/Joost/Desktop/STM32CubeExpansion_LRWAN_V1.1.2/Drivers/BSP/B-L072Z-LRWAN1"  -Os -g3 -Wall -fmessage-length=0 -Wno-strict-aliasing -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


