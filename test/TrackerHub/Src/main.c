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
  * COPYRIGHT(c) 2018 STMicroelectronics
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
#include "macros.h"

#define NSERDEBUG // comment to turn on serial debug over UART2
#define NCOMPASS // comment to turn on compass data retrieval

/* USER CODE END Includes */

/* Private variables ---------------------------------------------------------*/
I2C_HandleTypeDef hi2c1;

RTC_HandleTypeDef hrtc;

UART_HandleTypeDef huart4;
UART_HandleTypeDef huart2;

/* USER CODE BEGIN PV */
/* Private variables ---------------------------------------------------------*/
static volatile uint8_t TRANSMITTING = 0;
static int32_t hardIronFault[] = {0, 0, 0};
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_UART4_Init(void);
static void MX_I2C1_Init(void);
static void MX_RTC_Init(void);
static void MX_USART2_UART_Init(void);

/* USER CODE BEGIN PFP */
/* Private function prototypes -----------------------------------------------*/
static int64_t twosComplementToSignedInteger(uint32_t rawValue,SignBitIndex sbi);
static uint8_t unsolicitedResponseTX(uint8_t* data, uint8_t dataLength);
static UnsolicitedResponseTail buildTail(UnsolicitedResponseType urt);
static UnsolicitedResponseTail mergeTails(UnsolicitedResponseTail firstTail,UnsolicitedResponseTail secondTail);
static CompassData getCompassData();
static BarometerData getBarometerData();
static MagnetometerData getMagnetometerData();
static AccelerometerData getAccelerometerData();
static void get_m_axes(int32_t *pData);
static void get_m_axes_raw(int16_t *pData);
static void get_a_axes(int32_t *pData);
static void get_a_axes_raw(int16_t *pData);
static void enterStopMode(uint32_t regulator);
static void enterSleepMode(uint32_t regulator);
static void getHardIronFault();

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
  MX_I2C1_Init();
  MX_RTC_Init();
  MX_USART2_UART_Init();

  /* USER CODE BEGIN 2 */
#if defined(NCOMPASS) && defined(NSERDEBUG)
  HAL_UART_DeInit(&huart2);
#endif

  HAL_PWREx_EnableLowPowerRunMode();

  uint8_t REG_VALUE = LPS22HB_ODR_1HZ;
  HAL_I2C_Mem_Write(&hi2c1,LPS22HB_ADDR,LPS22HB_CTRL_REG1,I2C_MEMADD_SIZE_8BIT,&REG_VALUE,1,HAL_MAX_DELAY);
  while(HAL_I2C_IsDeviceReady(&hi2c1,LPS22HB_ADDR,1,HAL_MAX_DELAY) != HAL_OK);

  REG_VALUE = LSM303_MAG_SOFT_RST | LSM303_MAG_LPEN | LSM303_MAG_ODR_10HZ | LSM303_MAG_MD_IDLE;
  HAL_I2C_Mem_Write(&hi2c1,LSM303_MAG_ADDR,LSM303_MAG_CFG_REGA,I2C_MEMADD_SIZE_8BIT,&REG_VALUE,1,HAL_MAX_DELAY);
  while (HAL_I2C_IsDeviceReady(&hi2c1,LSM303_MAG_ADDR,1,HAL_MAX_DELAY) != HAL_OK);

  REG_VALUE = LSM303_MAG_LPF;
  HAL_I2C_Mem_Write(&hi2c1,LSM303_MAG_ADDR,LSM303_MAG_CFG_REGB,I2C_MEMADD_SIZE_8BIT,&REG_VALUE,1,HAL_MAX_DELAY);
  while (HAL_I2C_IsDeviceReady(&hi2c1,LSM303_MAG_ADDR,1,HAL_MAX_DELAY) != HAL_OK);

  REG_VALUE = LSM303_MAG_BDU;
  HAL_I2C_Mem_Write(&hi2c1,LSM303_MAG_ADDR,LSM303_MAG_CFG_REGC,I2C_MEMADD_SIZE_8BIT,&REG_VALUE,1,HAL_MAX_DELAY);
  while (HAL_I2C_IsDeviceReady(&hi2c1,LSM303_MAG_ADDR,1,HAL_MAX_DELAY) != HAL_OK);

  HAL_Delay(10); // ACC startup time < 5ms

  REG_VALUE = LSM303_ACC_PWR_DWN | LSM303_ACC_XYZEN | LSM303_ACC_LPEN;
  HAL_I2C_Mem_Write(&hi2c1,LSM303_ACC_ADDR,LSM303_ACC_CTRL_REG1,I2C_MEMADD_SIZE_8BIT,&REG_VALUE,1,HAL_MAX_DELAY);
  while (HAL_I2C_IsDeviceReady(&hi2c1,LSM303_ACC_ADDR,1,HAL_MAX_DELAY) != HAL_OK);

  REG_VALUE = LSM303_ACC_I1_DRDY2;
  HAL_I2C_Mem_Write(&hi2c1,LSM303_ACC_ADDR,LSM303_ACC_CTRL_REG3,I2C_MEMADD_SIZE_8BIT,&REG_VALUE,1,HAL_MAX_DELAY);
  while (HAL_I2C_IsDeviceReady(&hi2c1,LSM303_ACC_ADDR,1,HAL_MAX_DELAY) != HAL_OK);

  REG_VALUE = LSM303_ACC_BDU | LSM303_ACC_FS_2G;
  HAL_I2C_Mem_Write(&hi2c1,LSM303_ACC_ADDR,LSM303_ACC_CTRL_REG4,I2C_MEMADD_SIZE_8BIT,&REG_VALUE,1,HAL_MAX_DELAY);
  while (HAL_I2C_IsDeviceReady(&hi2c1,LSM303_ACC_ADDR,1,HAL_MAX_DELAY) != HAL_OK);

  REG_VALUE = LSM303_ACC_BOOT;
  HAL_I2C_Mem_Write(&hi2c1,LSM303_ACC_ADDR,LSM303_ACC_CTRL_REG5,I2C_MEMADD_SIZE_8BIT,&REG_VALUE,1,HAL_MAX_DELAY);
  while (HAL_I2C_IsDeviceReady(&hi2c1,LSM303_ACC_ADDR,1,HAL_MAX_DELAY) != HAL_OK);

  HAL_Delay(10); // wait for changes to take effect

#ifndef NCOMPASS
  getHardIronFault();
#endif

  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
  /* USER CODE END WHILE */

  /* USER CODE BEGIN 3 */
	  enterSleepMode(PWR_LOWPOWERREGULATOR_ON);
	  HAL_PWREx_EnableLowPowerRunMode();

	  if (TRANSMITTING) {
		  UnsolicitedResponseTail firstTail = buildTail(BAROMETER_FRAME);
		  UnsolicitedResponseTail secondTail = buildTail(MAGNETOMETER_FRAME);
		  UnsolicitedResponseTail thirdTail = buildTail(ACCELEROMETER_FRAME);
#ifndef NCOMPASS
		  UnsolicitedResponseTail fourthTail = buildTail(COMPASS_FRAME);
		  UnsolicitedResponseTail tail = mergeTails(mergeTails(firstTail,secondTail),mergeTails(thirdTail,fourthTail));
#else
		  UnsolicitedResponseTail tail = mergeTails(mergeTails(firstTail,secondTail),thirdTail);
#endif
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
  if (HAL_RTCEx_SetWakeUpTimer_IT(&hrtc, 23125, RTC_WAKEUPCLOCK_RTCCLK_DIV16) != HAL_OK)
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

/* USART2 init function */
static void MX_USART2_UART_Init(void)
{

  huart2.Instance = USART2;
  huart2.Init.BaudRate = 115200;
  huart2.Init.WordLength = UART_WORDLENGTH_8B;
  huart2.Init.StopBits = UART_STOPBITS_1;
  huart2.Init.Parity = UART_PARITY_NONE;
  huart2.Init.Mode = UART_MODE_TX_RX;
  huart2.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart2.Init.OverSampling = UART_OVERSAMPLING_16;
  if (HAL_UART_Init(&huart2) != HAL_OK)
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
                           PC7 PC8 PC9 PC12 */
  GPIO_InitStruct.Pin = GPIO_PIN_13|GPIO_PIN_0|GPIO_PIN_1|GPIO_PIN_2 
                          |GPIO_PIN_3|GPIO_PIN_4|GPIO_PIN_5|GPIO_PIN_6 
                          |GPIO_PIN_7|GPIO_PIN_8|GPIO_PIN_9|GPIO_PIN_12;
  GPIO_InitStruct.Mode = GPIO_MODE_ANALOG;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(GPIOC, &GPIO_InitStruct);

  /*Configure GPIO pins : PA0 PA1 PA4 PA5 
                           PA6 PA7 PA8 PA9 
                           PA10 PA11 PA12 PA15 */
  GPIO_InitStruct.Pin = GPIO_PIN_0|GPIO_PIN_1|GPIO_PIN_4|GPIO_PIN_5 
                          |GPIO_PIN_6|GPIO_PIN_7|GPIO_PIN_8|GPIO_PIN_9 
                          |GPIO_PIN_10|GPIO_PIN_11|GPIO_PIN_12|GPIO_PIN_15;
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

}

/* USER CODE BEGIN 4 */
static void getHardIronFault() {
	int32_t mag_temp[3] = {0, 0, 0};
	int32_t mag_max[3] = {-2147483647, -2147483647, -2147483647};
	int32_t mag_min[3] = {2147483647, 2147483647, 2147483647};

	// start calibration by pressing s key
	uint8_t temp[1];
	do
		HAL_UART_Receive(&huart2,temp,1,HAL_MAX_DELAY);
	while (*temp != 0x73);

	char message[255];
	sprintf(message, "Calibration started.\r\n");
	HAL_UART_Transmit(&huart2, (uint8_t *) message, strlen(message), HAL_MAX_DELAY);

	for(uint16_t i = 0; i < 300; ++i) {
		get_m_axes(mag_temp);
		for (int j = 0; j < 3; ++j) {
			if(mag_temp[j] > mag_max[j]) mag_max[j] = mag_temp[j];
			if(mag_temp[j] < mag_min[j]) mag_min[j] = mag_temp[j];
		}
		HAL_Delay(100);
	}

	hardIronFault[X] = (mag_max[X] + mag_min[X]) / 2;
	hardIronFault[Y] = (mag_max[Y] + mag_min[Y]) / 2;
	hardIronFault[Z] = (mag_max[Z] + mag_min[Z]) / 2;

	sprintf(message, "Calibration is done!\r\n");
	HAL_UART_Transmit(&huart2, (uint8_t *) message, strlen(message), HAL_MAX_DELAY);

#ifdef NSERDEBUG
	HAL_UART_DeInit(&huart2);
#endif
}

static uint8_t unsolicitedResponseTX(uint8_t* data, uint8_t dataLength) {
	if ((dataLength + 1 + sizeof(UNSOLICITED_RESPONSE_BASE)) <= MESSAGE_MAX_LEN) {
		// Memory allocated with malloc never loses scope until forcefully freed or program termination occurs.
		uint8_t* unsollicitedResponse = (uint8_t*) malloc((dataLength + 1 + sizeof(UNSOLICITED_RESPONSE_BASE)) * sizeof(uint8_t));

		for (uint8_t i = 0; i < sizeof(UNSOLICITED_RESPONSE_BASE); ++i)
			unsollicitedResponse[i] = ((i == 6) ? (0x0B + 1 + dataLength) : (UNSOLICITED_RESPONSE_BASE[i]));

		unsollicitedResponse[sizeof(UNSOLICITED_RESPONSE_BASE)] = dataLength;

		for (uint8_t i = 0; i < dataLength; ++i)
			unsollicitedResponse[sizeof(UNSOLICITED_RESPONSE_BASE) + 1 + i] = data[i];
		free(data);

		HAL_UART_Transmit(&huart4, unsollicitedResponse, dataLength + 1 + sizeof(UNSOLICITED_RESPONSE_BASE),HAL_MAX_DELAY);
		free(unsollicitedResponse);

		return 1;
	}
	return 0;
}

static UnsolicitedResponseTail buildTail(UnsolicitedResponseType urt) {
	/*
	 * Memory allocated with malloc never loses scope until it is forcefully freed using
	 * the free function or when the program terminates. Therefore a pointer to this memory
	 * location is passed as a return value so it can be freed later (after use).
	 */
	uint8_t* data = (uint8_t*) malloc((MESSAGE_MAX_LEN - sizeof(UNSOLICITED_RESPONSE_BASE)) * sizeof(uint8_t));
	uint8_t dataLength = 0;
	UnsolicitedResponseTail tail = {data,dataLength};
	int32_t magData[3];
	int32_t accData[3];
	double compData[3];
	BarometerData barometerData;
	MagnetometerData magnetometerData;
	AccelerometerData accelerometerData;
	CompassData compassData;

	switch (urt) {
		case FLOOD_FRAME:
			dataLength = sizeof(FLOOD_TAIL);
			realloc(data,dataLength);
			memcpy(data,FLOOD_TAIL,dataLength);
			break;
		case COMPASS_FRAME:
			compassData = getCompassData();
			compData[0] = compassData.pitch;
			compData[1] = compassData.roll;
			compData[2] = compassData.yaw;
			dataLength = sizeof(compData);
			realloc(data,dataLength);
			memcpy(data,compData,dataLength);
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
			dataLength = sizeof(magData);
			realloc(data,dataLength);
			memcpy(data,magData,dataLength);
			break;
		case ACCELEROMETER_FRAME:
			accelerometerData = getAccelerometerData();
			accData[0] = accelerometerData.xValue;
			accData[1] = accelerometerData.yValue;
			accData[2] = accelerometerData.zValue;
			dataLength = sizeof(accData);
			realloc(data,dataLength);
			memcpy(data,accData,dataLength);
			break;
		case TEMPERATURE_FRAME:
			barometerData = getBarometerData();
			dataLength = sizeof(barometerData.temperature);
			realloc(data,dataLength);
			memcpy(data,&barometerData.temperature,dataLength);
			break;
		default:
			break;
	}
	tail.data = data;
	tail.dataLength = dataLength;
	return tail;
}

static UnsolicitedResponseTail mergeTails(UnsolicitedResponseTail firstTail,UnsolicitedResponseTail secondTail) {
	UnsolicitedResponseTail tempTail;
	// memory allocated with malloc never loses scope until it is forcefully freed
	uint8_t* tempData = malloc((firstTail.dataLength+1+secondTail.dataLength));
	memcpy(tempData,firstTail.data,firstTail.dataLength);
	memcpy(tempData+firstTail.dataLength,&TAIL_SEPARATOR,1);
	memcpy(tempData+firstTail.dataLength+1,secondTail.data,secondTail.dataLength);
	free(firstTail.data);
	free(secondTail.data);
	tempTail.data = tempData;
	tempTail.dataLength = firstTail.dataLength+1+secondTail.dataLength;
	return tempTail;
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

static CompassData getCompassData() {
	double temp[] = {0.0,0.0,0.0};
	int32_t magData[] = {0,0,0};
	int32_t accData[] = {0,0,0};
	MagnetometerData magnetometerData;
	AccelerometerData accelerometerData;
	CompassData compassData;
	double pitch = 0;
	double roll = 0;
	double yaw = 0;
	double degrees = 0;

	accelerometerData = getAccelerometerData();
	accData[0] = accelerometerData.xValue;
	accData[1] = accelerometerData.yValue;
	accData[2] = accelerometerData.zValue;

	magnetometerData = getMagnetometerData();
	magData[0] = magnetometerData.xValue;
	magData[1] = magnetometerData.yValue;
	magData[2] = magnetometerData.zValue;

	roll = atan2((float)accData[Y],accData[Z]); // phi
	temp[0] = magData[Y] * cos(roll) - magData[Z] * sin(roll);
	temp[1] = magData[Y] * sin(roll) + magData[Z] * cos(roll);
	temp[2] = accData[Y] * sin(roll) + accData[Z] * cos(roll);
	//pitch = atan((-1 * accData[X]) / temp[2]); // theta
	pitch = atan2(accData[X] , temp[2]); // theta

#ifndef NSERDEBUG
	char message[255];
	sprintf(message, "Pitch: %6lf\t Roll: %6lf\r\n", pitch, roll);
	HAL_UART_Transmit(&huart2, (uint8_t *) message, strlen(message), HAL_MAX_DELAY);
#endif

	//Determining the compass heading
	temp[2] = magData[X] * cos(pitch) + temp[1] * sin(pitch);
	temp[1] = (-1 * magData[X]) * sin(pitch) + temp[1] * cos(pitch);
	yaw = atan2(-1 * temp[0], temp[2]); // psi
	degrees = yaw * 57.2958; // 180/PI = 57.2958

#ifndef NSERDEBUG
	//Obtaining wind direction
	if(degrees > 360) degrees -= 360;
	if(degrees < 0) degrees += 360;

	sprintf(message, "Degrees: %6lf\r\n", degrees);
	HAL_UART_Transmit(&huart2, (uint8_t *) message, strlen(message), HAL_MAX_DELAY);

	if(degrees > 22.5 && degrees < 67.5)
		sprintf(message, "Direction: North-East\r\n");
	else if(degrees > 67.5 && degrees < 112.5)
		sprintf(message, "Direction: East\r\n");
	else if(degrees > 112.5 && degrees < 157.5)
		sprintf(message, "Direction: South-East\r\n");
	else if(degrees > 157.5 && degrees < 202.5)
		sprintf(message, "Direction: South\r\n");
	else if(degrees > 202.5 && degrees < 247.5)
		sprintf(message, "Direction: South-West\r\n");
	else if(degrees > 247.5 && degrees < 292.5)
		sprintf(message, "Direction: West\r\n");
	else if(degrees > 292.5 && degrees < 337.25)
		sprintf(message, "Direction: North-West\r\n");
	else if(degrees > 337.25 || degrees < 22.5)
		sprintf(message, "Direction: North\r\n");

	HAL_UART_Transmit(&huart2, (uint8_t *) message, strlen(message), HAL_MAX_DELAY);
#endif

	compassData.pitch = pitch;
	compassData.roll = roll;
	compassData.yaw = yaw;
	return compassData;
}

static MagnetometerData getMagnetometerData() {
	int32_t axes_m[3];
	get_m_axes(axes_m);
	MagnetometerData magnetometerData;
	magnetometerData.xValue = axes_m[0] - hardIronFault[X];
	magnetometerData.yValue = axes_m[1] - hardIronFault[Y];
	magnetometerData.zValue = axes_m[2] - hardIronFault[Z];
	return magnetometerData;
}

static AccelerometerData getAccelerometerData() {
	int32_t axes_a[3];
	get_a_axes(axes_a);
	AccelerometerData accelerometerData;
	accelerometerData.xValue = axes_a[0];
	accelerometerData.yValue = axes_a[1];
	accelerometerData.zValue = axes_a[2];
	return accelerometerData;
}

static void get_m_axes(int32_t *pData) {
	int16_t pDataRaw[3];

	get_m_axes_raw(pDataRaw);

	// multiply by 1.5 through addition and shift right
	pData[0] = (int32_t) (pDataRaw[0] + (pDataRaw[0] >> 1));
	pData[1] = (int32_t) (pDataRaw[1] + (pDataRaw[1] >> 1));
	pData[2] = (int32_t) (pDataRaw[2] + (pDataRaw[2] >> 1));
}

static void get_m_axes_raw(int16_t *pData) {
	uint8_t status[1];
	uint8_t regValue[6] = {[0 ... 5] = 0};
	int16_t *regValueInt16;

	// turn on magnetometer
	uint8_t REG_VALUE = LSM303_MAG_LPEN | LSM303_MAG_ODR_10HZ | LSM303_MAG_MD_CON;
	HAL_I2C_Mem_Write(&hi2c1,LSM303_MAG_ADDR,LSM303_MAG_CFG_REGA,I2C_MEMADD_SIZE_8BIT,&REG_VALUE,1,HAL_MAX_DELAY);
	while (HAL_I2C_IsDeviceReady(&hi2c1,LSM303_MAG_ADDR,1,HAL_MAX_DELAY) != HAL_OK);

	do
		HAL_I2C_Mem_Read(&hi2c1,LSM303_MAG_ADDR,LSM303_MAG_SREG,I2C_MEMADD_SIZE_8BIT,status,1,100);
	while(!CHECK_BIT(*status,LSM303_MAG_XYZDA));

	// turn off magnetometer
	REG_VALUE = LSM303_MAG_LPEN | LSM303_MAG_ODR_10HZ | LSM303_MAG_MD_IDLE;
	HAL_I2C_Mem_Write(&hi2c1,LSM303_MAG_ADDR,LSM303_MAG_CFG_REGA,I2C_MEMADD_SIZE_8BIT,&REG_VALUE,1,HAL_MAX_DELAY);
	while (HAL_I2C_IsDeviceReady(&hi2c1,LSM303_MAG_ADDR,1,HAL_MAX_DELAY) != HAL_OK);

	HAL_I2C_Mem_Read(&hi2c1,LSM303_MAG_ADDR,LSM303_MAG_X_L,I2C_MEMADD_SIZE_8BIT,&regValue[0],1,100);
	HAL_I2C_Mem_Read(&hi2c1,LSM303_MAG_ADDR,LSM303_MAG_X_H,I2C_MEMADD_SIZE_8BIT,&regValue[1],1,100);
	HAL_I2C_Mem_Read(&hi2c1,LSM303_MAG_ADDR,LSM303_MAG_Y_L,I2C_MEMADD_SIZE_8BIT,&regValue[2],1,100);
	HAL_I2C_Mem_Read(&hi2c1,LSM303_MAG_ADDR,LSM303_MAG_Y_H,I2C_MEMADD_SIZE_8BIT,&regValue[3],1,100);
	HAL_I2C_Mem_Read(&hi2c1,LSM303_MAG_ADDR,LSM303_MAG_Z_L,I2C_MEMADD_SIZE_8BIT,&regValue[4],1,100);
	HAL_I2C_Mem_Read(&hi2c1,LSM303_MAG_ADDR,LSM303_MAG_Z_H,I2C_MEMADD_SIZE_8BIT,&regValue[5],1,100);

	regValueInt16 = (int16_t *)regValue;

	pData[0] = regValueInt16[0];
	pData[1] = regValueInt16[1];
	pData[2] = regValueInt16[2];
}

static void get_a_axes(int32_t *pData) {
	int16_t pDataRaw[3];

	get_a_axes_raw(pDataRaw);

	pData[0] = (int32_t) (((pDataRaw[0] >> 8) * LSM303_ACC_SENSITIVITY[2][0] + 500) / 1000);
	pData[1] = (int32_t) (((pDataRaw[1] >> 8) * LSM303_ACC_SENSITIVITY[2][0] + 500) / 1000);
	pData[2] = (int32_t) (((pDataRaw[2] >> 8) * LSM303_ACC_SENSITIVITY[2][0] + 500) / 1000);
}

static void get_a_axes_raw(int16_t *pData) {
	uint8_t status[1];
	uint8_t regValue[6] = {[0 ... 5] = 0};
	int16_t regValueInt16[3] = {[0 ... 2] = 0};

	// turn on accelerometer
	uint8_t REG_VALUE = LSM303_ACC_ODR_1HZ | LSM303_ACC_XYZEN | LSM303_ACC_LPEN;
	HAL_I2C_Mem_Write(&hi2c1,LSM303_ACC_ADDR,LSM303_ACC_CTRL_REG1,I2C_MEMADD_SIZE_8BIT,&REG_VALUE,1,HAL_MAX_DELAY);
	while (HAL_I2C_IsDeviceReady(&hi2c1,LSM303_ACC_ADDR,1,HAL_MAX_DELAY) != HAL_OK);

	do
		HAL_I2C_Mem_Read(&hi2c1,LSM303_ACC_ADDR,LSM303_ACC_SREG,I2C_MEMADD_SIZE_8BIT,status,1,100);
	while(!CHECK_BIT(*status,LSM303_ACC_XYZDA));

	// turn off accelerometer
	REG_VALUE = LSM303_ACC_PWR_DWN | LSM303_ACC_XYZEN | LSM303_ACC_LPEN;
	HAL_I2C_Mem_Write(&hi2c1,LSM303_ACC_ADDR,LSM303_ACC_CTRL_REG1,I2C_MEMADD_SIZE_8BIT,&REG_VALUE,1,HAL_MAX_DELAY);
	while (HAL_I2C_IsDeviceReady(&hi2c1,LSM303_ACC_ADDR,1,HAL_MAX_DELAY) != HAL_OK);

	HAL_I2C_Mem_Read(&hi2c1,LSM303_ACC_ADDR,LSM303_ACC_X_L,I2C_MEMADD_SIZE_8BIT,&regValue[0],1,100);
	HAL_I2C_Mem_Read(&hi2c1,LSM303_ACC_ADDR,LSM303_ACC_X_H,I2C_MEMADD_SIZE_8BIT,&regValue[1],1,100);
	HAL_I2C_Mem_Read(&hi2c1,LSM303_ACC_ADDR,LSM303_ACC_Y_L,I2C_MEMADD_SIZE_8BIT,&regValue[2],1,100);
	HAL_I2C_Mem_Read(&hi2c1,LSM303_ACC_ADDR,LSM303_ACC_Y_H,I2C_MEMADD_SIZE_8BIT,&regValue[3],1,100);
	HAL_I2C_Mem_Read(&hi2c1,LSM303_ACC_ADDR,LSM303_ACC_Z_L,I2C_MEMADD_SIZE_8BIT,&regValue[4],1,100);
	HAL_I2C_Mem_Read(&hi2c1,LSM303_ACC_ADDR,LSM303_ACC_Z_H,I2C_MEMADD_SIZE_8BIT,&regValue[5],1,100);

	regValueInt16[0] = (regValue[1] << 8) | regValue[0];
	regValueInt16[1] = (regValue[3] << 8) | regValue[2];
	regValueInt16[2] = (regValue[5] << 8) | regValue[4];

	pData[0] = regValueInt16[0];
	pData[1] = regValueInt16[1];
	pData[2] = regValueInt16[2];
}

static void enterStopMode(uint32_t regulator) {
	HAL_SuspendTick();
	__HAL_RCC_PWR_CLK_ENABLE();
	HAL_PWR_EnterSTOPMode(regulator, PWR_SLEEPENTRY_WFI);
	HAL_ResumeTick();
}

static void enterSleepMode(uint32_t regulator) {
	HAL_SuspendTick();
	__HAL_RCC_PWR_CLK_ENABLE();
	HAL_PWR_EnterSLEEPMode(regulator, PWR_SLEEPENTRY_WFI);
	HAL_ResumeTick();
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
