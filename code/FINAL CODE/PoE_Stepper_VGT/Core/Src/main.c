/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2022 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "lwip.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include <stdio.h>
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
SPI_HandleTypeDef hspi1;
SPI_HandleTypeDef hspi3;

TIM_HandleTypeDef htim4;

UART_HandleTypeDef huart1;
DMA_HandleTypeDef hdma_usart1_rx;

/* USER CODE BEGIN PV */

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_SPI1_Init(void);
static void MX_SPI3_Init(void);
static void MX_TIM4_Init(void);
static void MX_DMA_Init(void);
static void MX_USART1_UART_Init(void);
/* USER CODE BEGIN PFP */
uint8_t SPI_2660_Init(void);
uint8_t SPI_429_Init(uint8_t *spi_buf);
void const_vel_test_429 (uint8_t * spi_buf);
void const_vel_test_429_pos (uint8_t * spi_buf);
void set_motor_pos(uint32_t position, uint8_t * spi_buf);
void read_position(uint8_t * spi_buffer, uint8_t reg);
void read_ifx(uint8_t * spi_buf);
void write_ifx(uint8_t * spi_buf);
void read_common_reg(uint8_t * spi_buf);


uint32_t set_current_scaling(uint8_t * c_scale);
uint32_t set_motor_x(uint8_t * pos, uint8_t * spi_buf);
uint32_t set_motor_vel(uint8_t * vel, uint8_t * spi_buf);
void get_position(uint8_t * spi_buf);
uint8_t* get_velocity(uint8_t * spi_buf);
void set_const_vel_test(uint8_t * spi_buf);
/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */
extern struct netif gnetif;
uint8_t Rx_data[10];  //  creating a buffer of 10 bytes


void HAL_UART_RxHalfCpltCallback(UART_HandleTypeDef *huart)
{
  HAL_GPIO_TogglePin(GPIOE, GPIO_PIN_4);  // toggle PA0
}

void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart)
{
  HAL_UART_Receive_DMA(&huart1, Rx_data, 4);
}

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

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
  MX_SPI1_Init();
  MX_SPI3_Init();
  MX_TIM4_Init();
  MX_DMA_Init();
  MX_USART1_UART_Init();
  MX_LWIP_Init();
  /* USER CODE BEGIN 2 */


  //  TIM1->CCR4 = 4; //set duty cycle of tim1 ch4
     //set duty cycle of tim4 ch1

    //HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_4); //start tim1 ch4 pwm

  //  HAL_TIM_Base_Start(&htim4);
  TIM4->CCR1 = 1;
  HAL_TIM_PWM_Start(&htim4, TIM_CHANNEL_1); //start tim4 ch1 pwm

  uint8_t spi_buf[4];


  SPI_429_Init(spi_buf);
  SPI_2660_Init();



  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  // read_ifx(spi_buf);

  HAL_UART_Receive_DMA(&huart1, Rx_data, 4);  // Receive 4 Bytes of data

  while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
//	int j;
//	j=0;
//	char MSG[500] = {'\0'};
//
//
//		sprintf(MSG, "RX_DATA:%x, %x, %x, %x \r\n", (Rx_data[0]), (Rx_data[1]), (Rx_data[2]), (Rx_data[3]));

	  //HAL_UART_Transmit(&huart1, (uint8_t *)Rx_data, 4, HAL_MAX_DELAY);

//	 ethernetif_input(&gnetif);
//	 sys_check_timeouts();



//	 read_common_reg(spi_buf);

	 switch (Rx_data[0]) {
		 case 0x01: // set pos

//			 HAL_GPIO_WritePin(GPIOE, GPIO_PIN_4, GPIO_PIN_SET);
			 set_motor_x(Rx_data, spi_buf);
			 break;

		 case 0x02: // get pos
			 get_position(spi_buf);
			 //set_const_vel_test(spi_buf);

			 break;

		 case 0x04: // set vel
			 set_motor_vel(Rx_data, spi_buf);
			 break;

		 case 0x08: // get vel
			 break;

		 case 0x0F: // set current scale
			 set_current_scaling(Rx_data);
			 break;

	 }

	 uint8_t test[4];
	 test[0] = Rx_data[0];
	 test[1] = Rx_data[1];
	 test[2] = Rx_data[2];
	 test[3] = Rx_data[3];

//	 HAL_Delay(1000);



//	 MSG[500] = {'\0'};
//	HAL_GPIO_TogglePin(GPIOE, GPIO_PIN_4);
//	HAL_Delay(50);
//	set_motor_pos(1, spi_buf);

  // read_ifx(spi_buf);
	//const_vel_test_429(spi_buf);
  //HAL_Delay(1000);
  //const_vel_test_429_pos(spi_buf);


//	HAL_GPIO_WritePin(GPIOA, GPIO_PIN_15, GPIO_PIN_RESET);
//	HAL_SPI_Transmit(&hspi3,(uint8_t *)spi_buf, 3, 100);
//	HAL_GPIO_WritePin(GPIOA, GPIO_PIN_15, GPIO_PIN_SET);



  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
  */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);
  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLM = 4;
  RCC_OscInitStruct.PLL.PLLN = 128;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLQ = 4;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }
  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV4;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_4) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief SPI1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_SPI1_Init(void)
{

  /* USER CODE BEGIN SPI1_Init 0 */

  /* USER CODE END SPI1_Init 0 */

  /* USER CODE BEGIN SPI1_Init 1 */

  /* USER CODE END SPI1_Init 1 */
  /* SPI1 parameter configuration*/
  hspi1.Instance = SPI1;
  hspi1.Init.Mode = SPI_MODE_MASTER;
  hspi1.Init.Direction = SPI_DIRECTION_2LINES;
  hspi1.Init.DataSize = SPI_DATASIZE_8BIT;
  hspi1.Init.CLKPolarity = SPI_POLARITY_HIGH;
  hspi1.Init.CLKPhase = SPI_PHASE_2EDGE;
  hspi1.Init.NSS = SPI_NSS_SOFT;
  hspi1.Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_64;
  hspi1.Init.FirstBit = SPI_FIRSTBIT_MSB;
  hspi1.Init.TIMode = SPI_TIMODE_DISABLE;
  hspi1.Init.CRCCalculation = SPI_CRCCALCULATION_DISABLE;
  hspi1.Init.CRCPolynomial = 10;
  if (HAL_SPI_Init(&hspi1) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN SPI1_Init 2 */

  /* USER CODE END SPI1_Init 2 */

}

/**
  * @brief SPI3 Initialization Function
  * @param None
  * @retval None
  */
static void MX_SPI3_Init(void)
{

  /* USER CODE BEGIN SPI3_Init 0 */

  /* USER CODE END SPI3_Init 0 */

  /* USER CODE BEGIN SPI3_Init 1 */

  /* USER CODE END SPI3_Init 1 */
  /* SPI3 parameter configuration*/
  hspi3.Instance = SPI3;
  hspi3.Init.Mode = SPI_MODE_MASTER;
  hspi3.Init.Direction = SPI_DIRECTION_2LINES;
  hspi3.Init.DataSize = SPI_DATASIZE_8BIT;
  hspi3.Init.CLKPolarity = SPI_POLARITY_HIGH;
  hspi3.Init.CLKPhase = SPI_PHASE_2EDGE;
  hspi3.Init.NSS = SPI_NSS_SOFT;
  hspi3.Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_32;
  hspi3.Init.FirstBit = SPI_FIRSTBIT_MSB;
  hspi3.Init.TIMode = SPI_TIMODE_DISABLE;
  hspi3.Init.CRCCalculation = SPI_CRCCALCULATION_DISABLE;
  hspi3.Init.CRCPolynomial = 10;
  if (HAL_SPI_Init(&hspi3) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN SPI3_Init 2 */

  /* USER CODE END SPI3_Init 2 */

}

/**
  * @brief TIM4 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM4_Init(void)
{

  /* USER CODE BEGIN TIM4_Init 0 */

  /* USER CODE END TIM4_Init 0 */

  TIM_ClockConfigTypeDef sClockSourceConfig = {0};
  TIM_MasterConfigTypeDef sMasterConfig = {0};
  TIM_OC_InitTypeDef sConfigOC = {0};

  /* USER CODE BEGIN TIM4_Init 1 */

  /* USER CODE END TIM4_Init 1 */
  htim4.Instance = TIM4;
  htim4.Init.Prescaler = 1;
  htim4.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim4.Init.Period = 2-1;
  htim4.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim4.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  if (HAL_TIM_Base_Init(&htim4) != HAL_OK)
  {
    Error_Handler();
  }
  sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_INTERNAL;
  if (HAL_TIM_ConfigClockSource(&htim4, &sClockSourceConfig) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_Init(&htim4) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim4, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sConfigOC.OCMode = TIM_OCMODE_PWM1;
  sConfigOC.Pulse = 0;
  sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
  sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
  if (HAL_TIM_PWM_ConfigChannel(&htim4, &sConfigOC, TIM_CHANNEL_1) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM4_Init 2 */

  /* USER CODE END TIM4_Init 2 */
  HAL_TIM_MspPostInit(&htim4);

}

/**
  * @brief USART1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_USART1_UART_Init(void)
{

  /* USER CODE BEGIN USART1_Init 0 */

  /* USER CODE END USART1_Init 0 */

  /* USER CODE BEGIN USART1_Init 1 */

  /* USER CODE END USART1_Init 1 */
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
    Error_Handler();
  }
  /* USER CODE BEGIN USART1_Init 2 */

  /* USER CODE END USART1_Init 2 */

}

/**
  * Enable DMA controller clock
  */
static void MX_DMA_Init(void)
{

  /* DMA controller clock enable */
  __HAL_RCC_DMA2_CLK_ENABLE();

  /* DMA interrupt init */
  /* DMA2_Stream2_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(DMA2_Stream2_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA2_Stream2_IRQn);

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOE_CLK_ENABLE();
  __HAL_RCC_GPIOH_CLK_ENABLE();
  __HAL_RCC_GPIOC_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOE, GPIO_PIN_2|GPIO_PIN_3|GPIO_PIN_4, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOA, SPI1_CS_Pin|SPI3_CS_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pins : PE2 PE3 PE4 */
  GPIO_InitStruct.Pin = GPIO_PIN_2|GPIO_PIN_3|GPIO_PIN_4;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOE, &GPIO_InitStruct);

  /*Configure GPIO pins : SPI1_CS_Pin SPI3_CS_Pin */
  GPIO_InitStruct.Pin = SPI1_CS_Pin|SPI3_CS_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

}

/* USER CODE BEGIN 4 */


HAL_StatusTypeDef SPI_2660_Transmit(uint8_t * dataBuffer){
    HAL_StatusTypeDef err;
    uint8_t spi_buf[3];

    HAL_GPIO_WritePin(GPIOA, GPIO_PIN_15, GPIO_PIN_RESET);
    err = HAL_SPI_TransmitReceive(&hspi3, (uint8_t *)dataBuffer, (uint8_t *)spi_buf,  3, 100);
    while(HAL_SPI_GetState(&hspi3) != HAL_SPI_STATE_READY);
//    while(HAL_SPI_GetState(&hspi3) != HAL_SPI_STATE_READY);
    HAL_GPIO_WritePin(GPIOA, GPIO_PIN_15, GPIO_PIN_SET);

    return err;
}

uint8_t SPI_2660_Init(void){
    uint8_t wData[3];
    wData[0] = 0x09;            // SPI = $94557  Constant toff mode
    wData[1] = 0x01;
    wData[2] = 0xB4;
    SPI_2660_Transmit(wData);


    wData[0] = 0x0D;            // SPI = $D001F  Current setting: $d001F (max. current) (D000A = 1/3 current)
    wData[1] = 0x00;
    wData[2] = 0x0A;//0x0A;
    SPI_2660_Transmit(wData);

    wData[0] = 0x0E;            // SPI = $E0090  low driver strength, StallGuard2 read, SDOFF=1
    wData[1] = 0x00;            //  1110 0000 0000 1001 0000
    wData[2] = 0x10;
    SPI_2660_Transmit(wData);

    wData[0] = 0x00;            // SPI = $00000  256 microstep setting
    wData[1] = 0x00;
    wData[2] = 0x00; // 64 micro step setting // 0x00; 08-full
    SPI_2660_Transmit(wData);

    return 0;

}


HAL_StatusTypeDef SPI_429_Transmit(uint8_t * dataBuffer, uint8_t *spi_buf){
    HAL_StatusTypeDef err;
    // uint8_t spi_buf[4];


    HAL_GPIO_WritePin(GPIOE, GPIO_PIN_2, GPIO_PIN_RESET);
    err = HAL_SPI_TransmitReceive(&hspi1, (uint8_t *)dataBuffer, (uint8_t *)spi_buf,  4, 10000);
    while(HAL_SPI_GetState(&hspi1) != HAL_SPI_STATE_READY);
//  HAL_SPI_Receive(&hspi3, (uint8_t *)spi_buf, 5, 100);
//    while(HAL_SPI_GetState(&hspi3) != HAL_SPI_STATE_READY);
    HAL_GPIO_WritePin(GPIOE, GPIO_PIN_2, GPIO_PIN_SET);

    return err;
}

uint8_t SPI_429_Init(uint8_t *spi_buf){
    uint8_t wData[4];
    wData[0] = 0x04;            // SPI = $04 00 00 07
    wData[1] = 0x00;
    wData[2] = 0x00;
    wData[3] = 0x07;
    SPI_429_Transmit(wData,spi_buf);
    //0000 0100 0000 0000 0[000 0000 0111]
    //IDX: 0010
    //vmin: 7

    wData[0] = 0x06;            // SPI = $06 00 07 FF
    wData[1] = 0x00;
    wData[2] = 0x07;
    wData[3] = 0x00;
    SPI_429_Transmit(wData,spi_buf);
    //0000 0110 0000 0000 0[111 1111 1111]
    //IDX: 0011
    //vmax:2047

    wData[0] = 0x18;// end now 07 //0x14;            // SPI = $14 00 33 00
    wData[1] = 0x00;
    wData[2] = 0x33;
    wData[3] = 0x00;//0x07; //usrs res 111 64 microstep
    SPI_429_Transmit(wData, spi_buf);
    //0001 1000 0000 0000 [0011] [0011] 0000 [0111]
    //IDX:1100 18
    //PULSE_DIV: 3
    //RAMP_DIV: 3
    //USRS: 7


//    //NEW ADD
//    wData[0] = 0x14;            // SPI = $14 00 03 00
//    wData[1] = 0x00;
//    wData[2] = 0x03;            // ref_conf = (refrnl, softstop, disavle stop r. disable stop 1) = 0b011
//    wData[3] = 0x00;          //0x02;
//    SPI_429_Transmit(wData, spi_buf);
//    //0001 0100 0000 0000 0000 [0011] 0000 00[00]
//    //IDX: 1010
//    //REF_CONF = 3
//    //R_M = 2
//    //00-ramp mode(set pos), 01 soft mode, 10 velocity mode

    //ENABLE REFERENCE SWITCHES
    wData[0] = 0x14;            // SPI = $14 00 03 00
    wData[1] = 0x00;
    wData[2] = 0x00;            // ref_conf = (refrnl, softstop, disavle stop r. disable stop 1) = 0b011
    wData[3] = 0x00;          //0x02;
    SPI_429_Transmit(wData, spi_buf);

    wData[0] = 0x0C;            // SPI = $0C 00 00 0A
    wData[1] = 0x00;
    wData[2] = 0x00;
    wData[3] = 0x0A;
    SPI_429_Transmit(wData, spi_buf);
    //0000 1100 0000 0000 0000 0[000 0000 1010]
    //IDX:0110
    //A_MAX: 10


    wData[0] = 0x12;            // SPI = $12 00 1E 08
    wData[1] = 0x00;
    wData[2] = 0x1E;
    wData[3] = 0x08;
    SPI_429_Transmit(wData, spi_buf);
    //0001 0010 0000 0000 1[110 1000] 0000 [1000]
    //IDX:1001
    //1: 1
    //PMUL:158-128 = 30
    //PDIV:8

    wData[0] = 0x0A;            // SPI = $0A 00 03 00
    wData[1] = 0x00;
    wData[2] = 0x03;
    wData[3] = 0x00;
    SPI_429_Transmit(wData, spi_buf);
    //0000 1010 0000 0000 0000 [0011 0000 0000]
    //IDX:0101
    //VACTUAL: 768


//    //WRITE TO FX
//    wData[0] = 0x68;
//    wData[1] = 0x00;
//    wData[2] = 0x00;
//    wData[3] = 0x20;
//    //ENABLE step/dir mode

    //INVERSE REF SWITCH
    wData[0] = 0x68;
    wData[1] = 0x00;
    wData[2] = 0x00;
    wData[3] = 0x21;
    //ENABLE step/dir mode

    SPI_429_Transmit(wData, spi_buf);


//    set refmux, mot2r

    wData[0] = 0x7E;
    wData[1] = 0x20;
    wData[2] = 0x0F;
    wData[3] = 0x00;

    SPI_429_Transmit(wData, spi_buf);


    return 0;
    //64 micros/ full step       200 steps/ rev
}

void const_vel_test_429 (uint8_t * spi_buf){
	  uint8_t wData[4];

    wData[0] = 0x08;            // SPI = 0000 1000 0000 0000 0000 [0000 0001 0000]
    wData[1] = 0x00;
    wData[2] = 0x00;
    wData[3] = 0x10;
    SPI_429_Transmit(wData, spi_buf);

    read_position(spi_buf, 1);
}


void read_common_reg(uint8_t * spi_buf){

    spi_buf[0] = 0x00;
    spi_buf[1] = 0x00;
    spi_buf[2] = 0x00;  //HAL_UART_Transmit(&huart1, (uint8_t *)MSG, sizeof(MSG), HAL_MAX_DELAY);
    spi_buf[3] = 0x00;

    uint8_t rData[4];
//    0111 1111
    rData[0] = 0x7F;
    rData[1] = 0x00;
    rData[2] = 0x00;
    rData[3] = 0x00;

    SPI_429_Transmit(rData, spi_buf);

    uint8_t LData[4];
//    0111 1111
    LData[0] = spi_buf[0];
    LData[1] = spi_buf[1];
    LData[2] = spi_buf[2];
    LData[3] = spi_buf[3];

    int j=0;
//    HAL_UART_Transmit(&huart1, (uint8_t *)MSG, sizeof(MSG), HAL_MAX_DELAY);
}

void read_position(uint8_t * spi_buf, uint8_t reg){
    int j;
    j=0;
    char MSG[500] = {'\0'};
    //j += sprintf(MSG+j, "Output of target setting:0x0%lx\r\n", (uint32_t)(*spi_buf));
    //IDX:0000
    //24 bits position
    spi_buf[0] = ((reg & 0x0F) << 1) + 1;
    spi_buf[1] = 0x00;
    spi_buf[2] = 0x00;  //HAL_UART_Transmit(&huart1, (uint8_t *)MSG, sizeof(MSG), HAL_MAX_DELAY);
    spi_buf[3] = 0x00;

    uint8_t rData[4];
    rData[0] = (uint8_t)(((reg & 0x0F) << 1) + 1);
    rData[1] = 0x00;
    rData[2] = 0x00;
    rData[3] = 0x00;

    SPI_429_Transmit(rData, spi_buf);
    j += sprintf(MSG+j, "REGISTER:%u\n", reg);
    j += sprintf(MSG+j, "VAL_INSIDE:0x0%lx, %lx, %lx \r\n", (uint32_t)(spi_buf[1]), (uint32_t)(spi_buf[2]), (uint32_t)(spi_buf[3]));
    HAL_UART_Transmit(&huart1, (uint8_t *)MSG, sizeof(MSG), HAL_MAX_DELAY);
}

void read_ifx(uint8_t * spi_buf){
    int j;
    j=0;
    char MSG[500] = {'\0'};
    //j += sprintf(MSG+j, "Output of target setting:0x0%lx\r\n", (uint32_t)(*spi_buf));
    //IDX:0000
    //24 bits position
    //0110 1001 ......0 0000 0000
    //6     9
    spi_buf[0] = 0x00;
    spi_buf[1] = 0x00;
    spi_buf[2] = 0x00;  //HAL_UART_Transmit(&huart1, (uint8_t *)MSG, sizeof(MSG), HAL_MAX_DELAY);
    spi_buf[3] = 0x00;

    uint8_t rData[4];
    rData[0] = 0x69;
    rData[1] = 0x00;
    rData[2] = 0x00;
    rData[3] = 0x00;

    SPI_429_Transmit(rData, spi_buf);
    j += sprintf(MSG+j, "VAL_INSIDE IFX:0x0%lx, %lx, %lx \r\n", (uint32_t)(spi_buf[1]), (uint32_t)(spi_buf[2]), (uint32_t)(spi_buf[3]));
    HAL_UART_Transmit(&huart1, (uint8_t *)MSG, sizeof(MSG), HAL_MAX_DELAY);
}

void write_ifx(uint8_t * spi_buf){

    uint8_t wData[4];
    wData[0] = 0x69;
    wData[1] = 0x00;
    wData[2] = 0x00;
    wData[3] = 0x20;

    SPI_429_Transmit(wData, spi_buf);
}

void const_vel_test_429_pos (uint8_t * spi_buf){
	  uint8_t wData[4];

    wData[0] = 0x08;            // SPI = 0000 1000 0000 0000 0000 [0000 0001 0000]
    wData[1] = 0x00;
    wData[2] = 0x00;
    wData[3] = 0x10;
    SPI_429_Transmit(wData, spi_buf);
}

void set_motor_pos(uint32_t position, uint8_t * spi_buf){

	// set motor position: 0 00 0000 0 xxxxxxxx xxxxxxxx xxxxxxxx (24-bit position)
	// set ramp mode: 010 1010 0 (0x54) xxxxxxx(lp) xxxxaaaa(ref_conf) xxxxxxaa(ramp mode)

	 uint8_t wData[4];
	 wData[0] = 0x00;
	 wData[1] = 0x00;
	 wData[2] = 0xCE;
	 wData[3] = 0x40;
	 SPI_429_Transmit(wData, spi_buf);

	 //0x006720 = 180 degrees
	 //0x00CE40

//   read_position(spi_buf, 0);

   HAL_Delay(5000);
//   read_position(spi_buf, 1);


	 wData[0] = 0x00;
	 wData[1] = 0x00;
	 wData[2] = 0x00;
	 wData[3] = 0x00;
	 SPI_429_Transmit(wData, spi_buf);

//   read_position(spi_buf, 0);

   HAL_Delay(5000);
//   read_position(spi_buf, 1);


}

uint32_t set_motor_vel(uint8_t * vel, uint8_t * spi_buf){

    // set velocity mode
    uint8_t wData[4];

    wData[0] = 0x14;            // SPI = $14 00 03 00
    wData[1] = 0x00;
    wData[2] = 0x00;            // ref_conf = (refrnl, softstop, disavle stop r. disable stop 1) = 0b011
    wData[3] = 0x02;          //0x02 velocity mode;

    SPI_429_Transmit(wData, spi_buf);

    // set vel target

    wData[0] = 0x08;
    wData[1] = 0x00;
    wData[2] = vel[2];
    wData[3] = vel[3];

    SPI_429_Transmit(wData, spi_buf);

    return 0;

}


uint32_t set_current_scaling(uint8_t * c_scale){

	uint8_t wData[3];

    wData[0] = 0x0D;            // SPI = $D001F  Current setting: $d001F (max. current) (D000A = 1/3 current)
    wData[1] = 0x01 & (c_scale[2]);
    wData[2] = c_scale[3];//0x0A;
    SPI_2660_Transmit(wData);

    return 0;

}



uint32_t set_motor_x(uint8_t * pos, uint8_t * spi_buf){

    // set ramp mode
    uint8_t wData[4];

    wData[0] = 0x14;            // SPI = $14 00 03 00
    wData[1] = 0x00;
    wData[2] = 0x00;            // ref_conf = (refrnl, softstop, disavle stop r. disable stop 1) = 0b011
    wData[3] = 0x00;          //0x00 ramp mode;

    SPI_429_Transmit(wData, spi_buf);

    // set x target
    wData[0] = 0x00;
    wData[1] = pos[1];
    wData[2] = pos[2];
    wData[3] = pos[3];

    SPI_429_Transmit(wData, spi_buf);

    return 0;

}

void set_const_vel_test(uint8_t * spi_buf){
    uint8_t wData[4];

    //SET TO VELOCITY MODE
    wData[0] = 0x14;            // SPI = $14 00 03 00
    wData[1] = 0x00;
    wData[2] = 0x03;            // ref_conf = (refrnl, softstop, disavle stop r. disable stop 1) = 0b011
    wData[3] = 0x02;          //0x02;
    SPI_429_Transmit(wData, spi_buf);

    //SET VEOLOCITY
    wData[0] = 0x08;            // SPI = 0000 1000 0000 0000 0000 [0000 0001 0000]
    wData[1] = 0x00;
    wData[2] = 0x37;
    wData[3] = 0x10;
    SPI_429_Transmit(wData, spi_buf);
    int cnt = 10;


    while(cnt>0){
      read_position(spi_buf, 1);
      get_position(spi_buf);
      cnt = cnt - 1;
    }

    HAL_Delay(1000);
    //SET BACK TO RAMP MODE
    wData[0] = 0x14;            // SPI = $14 00 03 00
    wData[1] = 0x00;
    wData[2] = 0x03;            // ref_conf = (refrnl, softstop, disavle stop r. disable stop 1) = 0b011
    wData[3] = 0x02;          //0x02;
    SPI_429_Transmit(wData, spi_buf);
}
void get_position(uint8_t * spi_buf){

	spi_buf[0] = 0;
	spi_buf[1] = 0;
	spi_buf[2] = 0;
	spi_buf[3] = 0;

    //24 bits position

//    uint8_t urmum[4];

    uint8_t rData[4];
    rData[0] = 0x03;
    rData[1] = 0x00;
    rData[2] = 0x00;
    rData[3] = 0x00;

    SPI_429_Transmit(rData, spi_buf);
    SPI_429_Transmit(rData, spi_buf);
    SPI_429_Transmit(rData, spi_buf);
    SPI_429_Transmit(rData, spi_buf);
    SPI_429_Transmit(rData, spi_buf);
    SPI_429_Transmit(rData, spi_buf);
    SPI_429_Transmit(rData, spi_buf);
    SPI_429_Transmit(rData, spi_buf);
    SPI_429_Transmit(rData, spi_buf);

    uint8_t uart_data[4];

    uart_data[0] = spi_buf[0];
    uart_data[1] = spi_buf[1];
    uart_data[2] = spi_buf[2];
    uart_data[3] = spi_buf[3];


    HAL_UART_Transmit(&huart1, uart_data, 4, 1000);


//    return spi_buf;
}

uint8_t* get_velocity(uint8_t * spi_buf){
    spi_buf[0] = 0x00;//((reg & 0x0F) << 1) + 1;
    spi_buf[1] = 0x00;
    spi_buf[2] = 0x00;
    spi_buf[3] = 0x00;

    uint8_t rData[4];
    rData[0] = (uint8_t)(((5 & 0x0F) << 1) + 1);
    rData[1] = 0x00;
    rData[2] = 0x00;
    rData[3] = 0x00;

    SPI_429_Transmit(rData, spi_buf);
    return spi_buf;
}

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

