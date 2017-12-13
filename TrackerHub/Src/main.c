/**
  ******************************************************************************
  * File Name          : main.c
  * Description        : Main program body
  ******************************************************************************
  ** This notice applies to any and all portions of this file
  * that are not between comment pairs USER CODE BEGIN and
  * USER CODE END. Other portions of this file, whether 
  * inserted by the user or by software development tools
  * are owned by their respective copyright owners.
  *
  * COPYRIGHT(c) 2017 STMicroelectronics
  *
  * Redistribution and use in source and binary forms, with or without modification,
  * are permitted provided that the following conditions are met:
  *   1. Redistributions of source code must retain the above copyright notice,
  *      this list of conditions and the following disclaimer.
  *   2. Redistributions in binary form must reproduce the above copyright notice,
  *      this list of conditions and the following disclaimer in the documentation
  *      and/or other materials provided with the distribution.
  *   3. Neither the name of STMicroelectronics nor the names of its contributors
  *      may be used to endorse or promote products derived from this software
  *      without specific prior written permission.
  *
  * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
  * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
  * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
  * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  *
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "stm32l1xx_hal.h"

/* USER CODE BEGIN Includes */
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "enumerations.h"
#include "constants.h"
#include "structures.h"
/* USER CODE END Includes */

/* Private variables ---------------------------------------------------------*/
I2C_HandleTypeDef hi2c1;

RTC_HandleTypeDef hrtc;

UART_HandleTypeDef huart4;
UART_HandleTypeDef huart5;
UART_HandleTypeDef huart1;

/* USER CODE BEGIN PV */
/* Private variables ---------------------------------------------------------*/
static volatile uint8_t TRANSMITTING = 0;
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_UART4_Init(void);
static void MX_UART5_Init(void);
static void MX_I2C1_Init(void);
static void MX_RTC_Init(void);
static void MX_USART1_UART_Init(void);

/* USER CODE BEGIN PFP */
/* Private function prototypes -----------------------------------------------*/
static int64_t twosComplementToSignedInteger(uint32_t rawValue,SignBitIndex sbi);
static uint8_t unsolicitedResponseTX(uint8_t* data, uint8_t dataLength);
static UnsolicitedResponseTail buildTail(UnsolicitedResponseType urt);
static BarometerData getBarometerData();
static MagnetometerData getMagnetometerData();
static void get_m_axes(int32_t *pData);
static void get_m_axes_raw(int16_t *pData);
/* USER CODE END PFP */

/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

int main(void)
{

  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration----------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_UART4_Init();
  MX_UART5_Init();
  MX_I2C1_Init();
  MX_RTC_Init();
  MX_USART1_UART_Init();

  /* USER CODE BEGIN 2 */
  HAL_PWREx_EnableLowPowerRunMode();

  HAL_I2C_Mem_Write(&hi2c1,LPS22HB_ADDRESS,LPS22HB_CTRL_REG1,I2C_MEMADD_SIZE_8BIT,0x10,1,HAL_MAX_DELAY);
  while(HAL_I2C_IsDeviceReady(&hi2c1,LPS22HB_ADDRESS,1,HAL_MAX_DELAY) != HAL_OK);

  HAL_I2C_Mem_Write(&hi2c1,LSM303_MAG_ADDRESS,LSM303_CFG_REG_A_M,I2C_MEMADD_SIZE_8BIT,0x00,1,HAL_MAX_DELAY);
  while (HAL_I2C_IsDeviceReady(&hi2c1,LSM303_MAG_ADDRESS,1,HAL_MAX_DELAY) != HAL_OK);

  HAL_I2C_Mem_Write(&hi2c1,LSM303_MAG_ADDRESS,LSM303_CFG_REG_C_M,I2C_MEMADD_SIZE_8BIT,0x01,1,HAL_MAX_DELAY);
  while (HAL_I2C_IsDeviceReady(&hi2c1,LSM303_MAG_ADDRESS,1,HAL_MAX_DELAY) != HAL_OK);


  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
  /* USER CODE END WHILE */

  /* USER CODE BEGIN 3 */

	  if (TRANSMITTING) {
		  UnsolicitedResponseTail tail = buildTail(FLOOD_FRAME);
		  unsolicitedResponseTX(tail.data,tail.dataLength);
		  tail = buildTail(BAROMETER_FRAME);
		  unsolicitedResponseTX(tail.data,tail.dataLength);
		  tail = buildTail(MAGNETOMETER_FRAME);
		  unsolicitedResponseTX(tail.data,tail.dataLength);
		  TRANSMITTING = 0;
	  }
  }
  /* USER CODE END 3 */

}

/** System Clock Configuration
*/
void SystemClock_Config(void)
{

  RCC_OscInitTypeDef RCC_OscInitStruct;
  RCC_ClkInitTypeDef RCC_ClkInitStruct;
  RCC_PeriphCLKInitTypeDef PeriphClkInit;

    /**Configure the main internal regulator output voltage 
    */
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

    /**Initializes the CPU, AHB and APB busses clocks 
    */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_LSI|RCC_OSCILLATORTYPE_MSI;
  RCC_OscInitStruct.LSIState = RCC_LSI_ON;
  RCC_OscInitStruct.MSIState = RCC_MSI_ON;
  RCC_OscInitStruct.MSICalibrationValue = 0;
  RCC_OscInitStruct.MSIClockRange = RCC_MSIRANGE_5;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_NONE;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    _Error_Handler(__FILE__, __LINE__);
  }

    /**Initializes the CPU, AHB and APB busses clocks 
    */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_MSI;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_0) != HAL_OK)
  {
    _Error_Handler(__FILE__, __LINE__);
  }

  PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_RTC;
  PeriphClkInit.RTCClockSelection = RCC_RTCCLKSOURCE_LSI;
  if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK)
  {
    _Error_Handler(__FILE__, __LINE__);
  }

    /**Configure the Systick interrupt time 
    */
  HAL_SYSTICK_Config(HAL_RCC_GetHCLKFreq()/1000);

    /**Configure the Systick 
    */
  HAL_SYSTICK_CLKSourceConfig(SYSTICK_CLKSOURCE_HCLK);

  /* SysTick_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(SysTick_IRQn, 0, 0);
}

/* I2C1 init function */
static void MX_I2C1_Init(void)
{

  hi2c1.Instance = I2C1;
  hi2c1.Init.ClockSpeed = 100000;
  hi2c1.Init.DutyCycle = I2C_DUTYCYCLE_2;
  hi2c1.Init.OwnAddress1 = 0;
  hi2c1.Init.AddressingMode = I2C_ADDRESSINGMODE_7BIT;
  hi2c1.Init.DualAddressMode = I2C_DUALADDRESS_DISABLE;
  hi2c1.Init.OwnAddress2 = 0;
  hi2c1.Init.GeneralCallMode = I2C_GENERALCALL_DISABLE;
  hi2c1.Init.NoStretchMode = I2C_NOSTRETCH_DISABLE;
  if (HAL_I2C_Init(&hi2c1) != HAL_OK)
  {
    _Error_Handler(__FILE__, __LINE__);
  }

}

/* RTC init function */
static void MX_RTC_Init(void)
{

  RTC_TimeTypeDef sTime;
  RTC_DateTypeDef sDate;

    /**Initialize RTC Only 
    */
  hrtc.Instance = RTC;
  hrtc.Init.HourFormat = RTC_HOURFORMAT_24;
  hrtc.Init.AsynchPrediv = 127;
  hrtc.Init.SynchPrediv = 255;
  hrtc.Init.OutPut = RTC_OUTPUT_DISABLE;
  hrtc.Init.OutPutPolarity = RTC_OUTPUT_POLARITY_HIGH;
  hrtc.Init.OutPutType = RTC_OUTPUT_TYPE_OPENDRAIN;
  if (HAL_RTC_Init(&hrtc) != HAL_OK)
  {
    _Error_Handler(__FILE__, __LINE__);
  }

    /**Initialize RTC and set the Time and Date 
    */
  if(HAL_RTCEx_BKUPRead(&hrtc, RTC_BKP_DR0) != 0x32F2){
  sTime.Hours = 0x0;
  sTime.Minutes = 0x0;
  sTime.Seconds = 0x0;
  sTime.DayLightSaving = RTC_DAYLIGHTSAVING_NONE;
  sTime.StoreOperation = RTC_STOREOPERATION_RESET;
  if (HAL_RTC_SetTime(&hrtc, &sTime, RTC_FORMAT_BCD) != HAL_OK)
  {
    _Error_Handler(__FILE__, __LINE__);
  }

  sDate.WeekDay = RTC_WEEKDAY_MONDAY;
  sDate.Month = RTC_MONTH_JANUARY;
  sDate.Date = 0x1;
  sDate.Year = 0x0;

  if (HAL_RTC_SetDate(&hrtc, &sDate, RTC_FORMAT_BCD) != HAL_OK)
  {
    _Error_Handler(__FILE__, __LINE__);
  }

    HAL_RTCEx_BKUPWrite(&hrtc,RTC_BKP_DR0,0x32F2);
  }
    /**Enable the WakeUp 
    */
  if (HAL_RTCEx_SetWakeUpTimer_IT(&hrtc, 4625, RTC_WAKEUPCLOCK_RTCCLK_DIV16) != HAL_OK)
  {
    _Error_Handler(__FILE__, __LINE__);
  }

}

/* UART4 init function */
static void MX_UART4_Init(void)
{

  huart4.Instance = UART4;
  huart4.Init.BaudRate = 115200;
  huart4.Init.WordLength = UART_WORDLENGTH_8B;
  huart4.Init.StopBits = UART_STOPBITS_1;
  huart4.Init.Parity = UART_PARITY_NONE;
  huart4.Init.Mode = UART_MODE_TX_RX;
  huart4.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart4.Init.OverSampling = UART_OVERSAMPLING_16;
  if (HAL_UART_Init(&huart4) != HAL_OK)
  {
    _Error_Handler(__FILE__, __LINE__);
  }

}

/* UART5 init function */
static void MX_UART5_Init(void)
{

  huart5.Instance = UART5;
  huart5.Init.BaudRate = 115200;
  huart5.Init.WordLength = UART_WORDLENGTH_8B;
  huart5.Init.StopBits = UART_STOPBITS_1;
  huart5.Init.Parity = UART_PARITY_NONE;
  huart5.Init.Mode = UART_MODE_TX_RX;
  huart5.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart5.Init.OverSampling = UART_OVERSAMPLING_16;
  if (HAL_HalfDuplex_Init(&huart5) != HAL_OK)
  {
    _Error_Handler(__FILE__, __LINE__);
  }

}

/* USART1 init function */
static void MX_USART1_UART_Init(void)
{

  huart1.Instance = USART1;
  huart1.Init.BaudRate = 115200;
  huart1.Init.WordLength = UART_WORDLENGTH_8B;
  huart1.Init.StopBits = UART_STOPBITS_1;
  huart1.Init.Parity = UART_PARITY_NONE;
  huart1.Init.Mode = UART_MODE_TX_RX;
  huart1.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart1.Init.OverSampling = UART_OVERSAMPLING_16;
  if (HAL_UART_Init(&huart1) != HAL_OK)
  {
    _Error_Handler(__FILE__, __LINE__);
  }

}

/** Configure pins as 
        * Analog 
        * Input 
        * Output
        * EVENT_OUT
        * EXTI
        * Free pins are configured automatically as Analog (this feature is enabled through 
        * the Code Generation settings)
     PA2   ------> USART2_TX
     PA3   ------> USART2_RX
*/
static void MX_GPIO_Init(void)
{

  GPIO_InitTypeDef GPIO_InitStruct;

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOC_CLK_ENABLE();
  __HAL_RCC_GPIOH_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();
  __HAL_RCC_GPIOD_CLK_ENABLE();

  /*Configure GPIO pins : PC13 PC0 PC1 PC2 
                           PC3 PC4 PC5 PC6 
                           PC7 PC8 PC9 */
  GPIO_InitStruct.Pin = GPIO_PIN_13|GPIO_PIN_0|GPIO_PIN_1|GPIO_PIN_2 
                          |GPIO_PIN_3|GPIO_PIN_4|GPIO_PIN_5|GPIO_PIN_6 
                          |GPIO_PIN_7|GPIO_PIN_8|GPIO_PIN_9;
  GPIO_InitStruct.Mode = GPIO_MODE_ANALOG;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(GPIOC, &GPIO_InitStruct);

  /*Configure GPIO pins : PA0 PA1 */
  GPIO_InitStruct.Pin = GPIO_PIN_0|GPIO_PIN_1;
  GPIO_InitStruct.Mode = GPIO_MODE_IT_RISING;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  /*Configure GPIO pins : USART_TX_Pin USART_RX_Pin */
  GPIO_InitStruct.Pin = USART_TX_Pin|USART_RX_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
  GPIO_InitStruct.Alternate = GPIO_AF7_USART2;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  /*Configure GPIO pins : PA4 PA5 PA6 PA7 
                           PA8 PA11 PA12 PA15 */
  GPIO_InitStruct.Pin = GPIO_PIN_4|GPIO_PIN_5|GPIO_PIN_6|GPIO_PIN_7 
                          |GPIO_PIN_8|GPIO_PIN_11|GPIO_PIN_12|GPIO_PIN_15;
  GPIO_InitStruct.Mode = GPIO_MODE_ANALOG;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  /*Configure GPIO pins : PB0 PB1 PB2 PB10 
                           PB11 PB12 PB13 PB14 
                           PB15 PB4 PB5 PB6 
                           PB7 */
  GPIO_InitStruct.Pin = GPIO_PIN_0|GPIO_PIN_1|GPIO_PIN_2|GPIO_PIN_10 
                          |GPIO_PIN_11|GPIO_PIN_12|GPIO_PIN_13|GPIO_PIN_14 
                          |GPIO_PIN_15|GPIO_PIN_4|GPIO_PIN_5|GPIO_PIN_6 
                          |GPIO_PIN_7;
  GPIO_InitStruct.Mode = GPIO_MODE_ANALOG;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

  /*Configure GPIO pin : PD2 */
  GPIO_InitStruct.Pin = GPIO_PIN_2;
  GPIO_InitStruct.Mode = GPIO_MODE_ANALOG;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(GPIOD, &GPIO_InitStruct);

  /* EXTI interrupt init*/
  HAL_NVIC_SetPriority(EXTI0_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(EXTI0_IRQn);

  HAL_NVIC_SetPriority(EXTI1_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(EXTI1_IRQn);

}

/* USER CODE BEGIN 4 */
static uint8_t unsolicitedResponseTX(uint8_t* data, uint8_t dataLength) {
	if ((dataLength + 1 + sizeof(UNSOLICITED_RESPONSE_BASE)) > MESSAGE_MAX_LEN)
		return 0;
	else {
		/*
		 * Memory allocated with malloc never loses scope until it is forcefully freed using
		 * the free function or the program terminates.
		 */
		uint8_t* unsollicitedResponse = (uint8_t*) malloc((dataLength + 1 + sizeof(UNSOLICITED_RESPONSE_BASE)) * sizeof(uint8_t));

		for (uint8_t i = 0; i < sizeof(UNSOLICITED_RESPONSE_BASE); ++i)
			unsollicitedResponse[i] = UNSOLICITED_RESPONSE_BASE[i];

		unsollicitedResponse[sizeof(UNSOLICITED_RESPONSE_BASE)] = dataLength;

		for (uint8_t i = 0; i < dataLength; ++i)
			unsollicitedResponse[sizeof(UNSOLICITED_RESPONSE_BASE) + 1 + i] = data[i];
		free(data);

		HAL_UART_Transmit(&huart4, unsollicitedResponse, dataLength + 1 + sizeof(UNSOLICITED_RESPONSE_BASE),HAL_MAX_DELAY);
		free(unsollicitedResponse);
	}
	return 1;
}

static UnsolicitedResponseTail buildTail(UnsolicitedResponseType urt) {
	/*
	 * Memory allocated with malloc never loses scope until it is forcefully freed using
	 * the free function or the program terminates. Therefore a pointer to this memory
	 * location is passed as a return value so it can be freed later (after use).
	 */
	uint8_t* data = (uint8_t*) malloc((MESSAGE_MAX_LEN - sizeof(UNSOLICITED_RESPONSE_BASE)) * sizeof(uint8_t));
	uint8_t dataLength = 0;
	UnsolicitedResponseTail tail = {data,dataLength};
	int32_t magData[3];
	BarometerData barometerData;
	MagnetometerData magnetometerData;

	switch (urt) {
		case FLOOD_FRAME:
			dataLength = sizeof(FLOOD_TAIL);
			realloc(data,dataLength);
			memcpy(data,FLOOD_TAIL,dataLength);
			break;
		case COMPASS_FRAME:
			// do something
			break;
		case BAROMETER_FRAME:
			barometerData = getBarometerData();
			dataLength = sizeof(barometerData.pressure);
			realloc(data,dataLength);
			memcpy(data,&barometerData.pressure,dataLength);
			break;
		case MAGNETOMETER_FRAME:
			magnetometerData = getMagnetometerData();
			magData[0] = magnetometerData.xValue;
			magData[1] = magnetometerData.yValue;
			magData[2] = magnetometerData.zValue;
			dataLength = sizeof(magData)/sizeof(magData[0]);
			realloc(data,dataLength);
			memcpy(data,magData,dataLength);
			break;
		default:
			break;
	}
	tail.data = data;
	tail.dataLength = dataLength;
	return tail;
}

int64_t twosComplementToSignedInteger(uint32_t rawValue,SignBitIndex sbi) {
	switch (sbi) {
		case TWOS_COMPLEMENT_24_BIT:
		{
			if ((rawValue & 0x00800000) == 0)
				return (rawValue & 0x00FFFFFF);
			return ((int64_t)(~((rawValue & 0x00FFFFFF) - 1))) * -1;
		}
		case TWOS_COMPLEMENT_16_BIT:
		{
			if ((rawValue & 0x00008000) == 0)
				return (rawValue & 0x0000FFFF);
			return ((int64_t)(~((rawValue & 0x0000FFFF) - 1))) * -1;
		}
		default:
			return NAN;
	}
}

static BarometerData getBarometerData() {
	uint8_t rawSensorData[5];
	BarometerData barometerData;
	HAL_I2C_Mem_Read(&hi2c1,0xBA,0x28,I2C_MEMADD_SIZE_8BIT,rawSensorData,5,HAL_MAX_DELAY);

	uint32_t pressureTwosComplement = (rawSensorData[2] << 16) | (rawSensorData[1] << 8) | rawSensorData[0];
	int64_t pressureRaw = twosComplementToSignedInteger(pressureTwosComplement,TWOS_COMPLEMENT_24_BIT);
	barometerData.pressure = (int32_t)(pressureRaw/4096);

	uint32_t temperatureTwosComplement = (rawSensorData[4] << 8) | rawSensorData[3];
	int64_t temperatureRaw = twosComplementToSignedInteger(temperatureTwosComplement,TWOS_COMPLEMENT_16_BIT);
	barometerData.temperature = (int32_t)(temperatureRaw/100);

	return barometerData;
}

static MagnetometerData getMagnetometerData() {
	int32_t axes_m[3];
	get_m_axes(axes_m);
	MagnetometerData magnetoMeterData;
	magnetoMeterData.xValue = axes_m[0];
	magnetoMeterData.yValue = axes_m[1];
	magnetoMeterData.zValue = axes_m[2];
	return magnetoMeterData;
}

/**
 * @brief  Read raw data from LSM303AGR Magnetometer
 * @param  pData the pointer where the magnetomer raw data are stored
 */
static void get_m_axes(int32_t *pData) {
	int16_t pDataRaw[3];
	float sensitivity = 1.5;

	/* Read raw data from LSM303AGR output register. */
	get_m_axes_raw(pDataRaw);

	/* Calculate the data. */
	pData[0] = (int32_t) (pDataRaw[0] * sensitivity);
	pData[1] = (int32_t) (pDataRaw[1] * sensitivity);
	pData[2] = (int32_t) (pDataRaw[2] * sensitivity);
}

/**
 * @brief  Read raw data from LSM303AGR Magnetometer
 * @param  pData the pointer where the magnetomer raw data are stored
 */
void get_m_axes_raw(int16_t *pData) {
	uint8_t regValue[6] = {[0 ... 5] = 0};
	int16_t *regValueInt16;

	/* Read output registers from LSM303AGR_MAG_OUTX_L to LSM303AGR_MAG_OUTZ_H. */
	HAL_I2C_Mem_Read(&hi2c1,LSM303_MAG_ADDRESS,OUTX_L_REG_M,I2C_MEMADD_SIZE_8BIT,&regValue[0],1,100);
	HAL_I2C_Mem_Read(&hi2c1,LSM303_MAG_ADDRESS,OUTX_H_REG_M,I2C_MEMADD_SIZE_8BIT,&regValue[1],1,100);
	HAL_I2C_Mem_Read(&hi2c1,LSM303_MAG_ADDRESS,OUTY_L_REG_M,I2C_MEMADD_SIZE_8BIT,&regValue[2],1,100);
	HAL_I2C_Mem_Read(&hi2c1,LSM303_MAG_ADDRESS,OUTY_H_REG_M,I2C_MEMADD_SIZE_8BIT,&regValue[3],1,100);
	HAL_I2C_Mem_Read(&hi2c1,LSM303_MAG_ADDRESS,OUTZ_L_REG_M,I2C_MEMADD_SIZE_8BIT,&regValue[4],1,100);
	HAL_I2C_Mem_Read(&hi2c1,LSM303_MAG_ADDRESS,OUTZ_H_REG_M,I2C_MEMADD_SIZE_8BIT,&regValue[5],1,100);

	regValueInt16 = (int16_t *)regValue;

	/* Format the data. */
	pData[0] = regValueInt16[0];
	pData[1] = regValueInt16[1];
	pData[2] = regValueInt16[2];
}

void HAL_RTCEx_WakeUpTimerEventCallback(RTC_HandleTypeDef *hrtc) {
	if(!TRANSMITTING) TRANSMITTING = 1;
}
/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @param  None
  * @retval None
  */
void _Error_Handler(char * file, int line)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  while(1) 
  {
  }
  /* USER CODE END Error_Handler_Debug */ 
}

#ifdef USE_FULL_ASSERT

/**
   * @brief Reports the name of the source file and the source line number
   * where the assert_param error has occurred.
   * @param file: pointer to the source file name
   * @param line: assert_param error line source number
   * @retval None
   */
void assert_failed(uint8_t* file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
    ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */

}

#endif

/**
  * @}
  */ 

/**
  * @}
*/ 

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
