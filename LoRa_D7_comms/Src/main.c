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
#include <stdlib.h>
/* USER CODE END Includes */

/* Private variables ---------------------------------------------------------*/
UART_HandleTypeDef huart4;
UART_HandleTypeDef huart5;
UART_HandleTypeDef huart2;

/* USER CODE BEGIN PV */
/* Private variables ---------------------------------------------------------*/
static volatile enum LoRaWANState {
	startup,
	joining_network,
	verify_network_join,
	joined_network,
	tx_rx,
} loRaWANState = startup;
static char AT_return_code[7] = "";//contains the AT_return_code
static char* loRaWANSendCmdAndData = NULL;//pointer to string used to build complete AT_send_cmd including data
//must be reset to all \0 using memset after every use

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_UART4_Init(void);
static void MX_USART2_UART_Init(void);
static void MX_UART5_Init(void);

/* USER CODE BEGIN PFP */
/* Private function prototypes -----------------------------------------------*/
static uint8_t joinLoRaWANnetwork();//must be called to join LoRaWAN network
static uint8_t transmitLoRaWANData(uint8_t*);//used to transmit data with AT commands
static uint8_t verifyLoRaNetworkjoin();
static uint8_t receiveD7Data();

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
  MX_USART2_UART_Init();
  MX_UART5_Init();

  /* USER CODE BEGIN 2 */
  char data[] = "51.2164:4.4025";
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
  /* USER CODE END WHILE */
  /* USER CODE BEGIN 3 */
	  switch(loRaWANState){
	  case startup:
		  loRaWANState = joining_network;//set state to joining network
		  HAL_UART_Transmit_IT(&huart2, "starting connection", strlen("starting connection"));
	  	  break;
	  case joining_network:
		  joinLoRaWANnetwork();
		  break;
	  case verify_network_join:
		  HAL_UART_Transmit_IT(&huart2, "nw join command issued", strlen("nw join command issued"));
		  verifyLoRaNetworkjoin();
		  break;
	  case joined_network:
		  HAL_UART_Transmit_IT(&huart2, "transmitting data", strlen("transmitting data"));
		  loRaWANState = tx_rx;
		  transmitLoRaWANData((uint8_t*)data);
		  break;
	  case tx_rx:
		  break;
	  default:
		  break;
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

    /**Configure the main internal regulator output voltage 
    */
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

    /**Initializes the CPU, AHB and APB busses clocks 
    */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = 16;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
  RCC_OscInitStruct.PLL.PLLMUL = RCC_PLL_MUL6;
  RCC_OscInitStruct.PLL.PLLDIV = RCC_PLL_DIV3;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    _Error_Handler(__FILE__, __LINE__);
  }

    /**Initializes the CPU, AHB and APB busses clocks 
    */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_1) != HAL_OK)
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

/* UART4 init function */
static void MX_UART4_Init(void)
{

  huart4.Instance = UART4;
  huart4.Init.BaudRate = 9600;
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
  if (HAL_UART_Init(&huart5) != HAL_OK)
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
*/
static void MX_GPIO_Init(void)
{

  GPIO_InitTypeDef GPIO_InitStruct;

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOC_CLK_ENABLE();
  __HAL_RCC_GPIOH_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOD_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();

  /*Configure GPIO pin : B1_Pin */
  GPIO_InitStruct.Pin = B1_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_IT_RISING;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(B1_GPIO_Port, &GPIO_InitStruct);

}

/* USER CODE BEGIN 4 */
uint8_t joinLoRaWANnetwork(){
	char AT_join_cmd[] = "AT+JOIN\r\n";
	if (HAL_UART_GetState(&huart4)!=HAL_UART_STATE_BUSY){
		__HAL_UART_FLUSH_DRREGISTER(&huart4);
		HAL_UART_Receive_IT(&huart4, (uint8_t*)AT_return_code,6);//receiving with interrupts just doesn't make sense here
		HAL_UART_Transmit_IT(&huart4, (uint8_t*)AT_join_cmd, strlen(AT_join_cmd));//strlen excludes \0 so it's ok
		// wait for max delay. Unfortunate but I wouldn't know how to fix through interrupts
		HAL_UART_Transmit_IT(&huart2, (uint8_t*)AT_return_code, strlen(AT_return_code));
		return 0;
		//if the UART was not busy, the command is being sent;
		//verify success once receive is done.
	}
	else return 1;
		// else the UART is busy with another operation, hold off
}

uint8_t verifyLoRaNetworkjoin(){
	char AT_NJS_cmd[] = "AT+NJS=?\r\n";
	if (HAL_UART_GetState(&huart4)!=HAL_UART_STATE_BUSY){
		__HAL_UART_FLUSH_DRREGISTER(&huart4);
		HAL_UART_Receive_IT(&huart4, (uint8_t*)AT_return_code, 3);
		HAL_UART_Transmit_IT(&huart4, (uint8_t*)AT_NJS_cmd, strlen(AT_NJS_cmd));//strlen excludes \0 so it's ok
		return 0;
		//if the UART was not busy, the command is being sent;
		//verify success once receive is done.
	}
	else return 1;
	// else the UART is busy, retry later
}

uint8_t transmitLoRaWANData(uint8_t* data){
	char AT_SEND_cmd[] = "AT+SEND=2:";
	if (HAL_UART_GetState(&huart4)!=HAL_UART_STATE_BUSY){
		if (loRaWANSendCmdAndData != NULL)
			free(loRaWANSendCmdAndData);
		loRaWANSendCmdAndData = (char*)malloc((strlen(data)+strlen(AT_SEND_cmd)+2)*sizeof(char));
		strncpy(loRaWANSendCmdAndData, AT_SEND_cmd, 10);
		strncpy(&loRaWANSendCmdAndData[10], data, strlen(data));
		strcpy(&loRaWANSendCmdAndData[strlen(data)+strlen(AT_SEND_cmd)], "\r\n");
		__HAL_UART_FLUSH_DRREGISTER(&huart4);
		//HAL_UART_Transmit(&huart2, "starting transmit", strlen("starting transmit"), HAL_MAX_DELAY);
		HAL_UART_Receive_IT(&huart4, (uint8_t*)AT_return_code,6);
		HAL_UART_Transmit_IT(&huart4, loRaWANSendCmdAndData, strlen(loRaWANSendCmdAndData));
		//HAL_UART_Transmit(&huart2, "verifying return code", strlen("verifying return code"), HAL_MAX_DELAY);
		//if these are equal the network was joined succesfully
		HAL_UART_Transmit_IT(&huart2, "freeing resources", strlen("freeing resources"));
		return 0;
	}
	else return 1;
	//return 1 is either UART busy, or one of the other possible return values of LoRaWAN Modem
}

void HAL_UART_RxCpltCallback(UART_HandleTypeDef *UartHandle){
	//callback on receive complete, might be usefull later on
	if (UartHandle == &huart2){
		//insert code here
	} else if(UartHandle == &huart4){
		switch(loRaWANState){
		case joining_network:
			if (strcmp(AT_return_code,"\r\nOK\r\n")==0){
				loRaWANState = verify_network_join;
				//if the command was unseccessful, it will be retried next main iteration
				//if the command was successful, we go to verification of network join
			}
			memset(AT_return_code, 0, sizeof(AT_return_code)/sizeof(char));
			//memset resets the AT_return_code
			break;
		case verify_network_join:
			if (strcmp(AT_return_code,"1\r\n")==0){
				loRaWANState = joined_network;
				//if the return value of verify_network_join is 1, we joined the network
				//else the join has not been completed (but is in progress)
			}
			memset(AT_return_code, 0, sizeof(AT_return_code)/sizeof(char));
			//again, reset the AT_return_buffer after complete
			break;
		case joined_network: break;
		case tx_rx:
			if (strcmp(AT_return_code,"\r\nOK\r\n")==0){
				HAL_UART_Transmit_IT(&huart2, "transmit_done", strlen("transmit_done"));
				loRaWANState = joined_network;
				//if the return code is OK the modem will take care of the rest of the
				//transmission, so we're fine
				//else the something went wrong, we can try again next main iteration
			}
			memset(AT_return_code, 0, sizeof(AT_return_code)/sizeof(char));
			//memset resets the AT_return_code
			break;
		default: break;
		}
	} else if(UartHandle == &huart5){
		//insert code here
	} else {
		//insert code here
	}

}

void HAL_UART_TxCpltCallback(UART_HandleTypeDef *UartHandle){
	//callback on transmit complete, might be usefull later on
	if (UartHandle == &huart2){
		//insert code here
	} else if(UartHandle == &huart4){
		//insert code here
	} else if(UartHandle == &huart5){
		//insert code here
	} else {
		//insert code here
	}
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
