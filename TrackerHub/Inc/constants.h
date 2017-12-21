/*
 * constants.h
 *
 *  Created on: 4 dec. 2017
 *      Author: Robbe
 */

#ifndef CONSTANTS_H_
#define CONSTANTS_H_

// I2C slave addresses
#define LSM303_ACC_ADDR 		0x32
#define LSM303_MAG_ADDR 		0x3C
#define LPS22HB_ADDR 			0xBA

// LPS22HB register addresses
#define LPS22HB_CTRL_REG1 		0x10

// LPS22HB register settings
#define LPS22HB_ODR_1HZ			0x10
#define LPS22HB_ODR_10HZ		0x20
#define LPS22HB_ODR_25HZ		0x30
#define LPS22HB_ODR_50HZ		0x40
#define LPS22HB_ODR_75HZ		0x50

// LSM303AGR register addresses
#define LSM303_ACC_CTRL_REG1 	0x20
#define LSM303_ACC_CTRL_REG2 	0x21
#define LSM303_ACC_CTRL_REG3 	0x22
#define LSM303_ACC_CTRL_REG4 	0x23
#define LSM303_ACC_CTRL_REG5 	0x24
#define LSM303_ACC_CTRL_REG6 	0x25
#define LSM303_ACC_SREG 		0x27
#define LSM303_ACC_X_L 			0x28
#define LSM303_ACC_X_H 			0x29
#define LSM303_ACC_Y_L 			0x2A
#define LSM303_ACC_Y_H 			0x2B
#define LSM303_ACC_Z_L 			0x2C
#define LSM303_ACC_Z_H 			0x2D
#define LSM303_MAG_CFG_REGA 	0x60
#define LSM303_MAG_CFG_REGB 	0x61
#define LSM303_MAG_CFG_REGC 	0x62
#define LSM303_MAG_SREG			0x67
#define LSM303_MAG_X_L 			0x68
#define LSM303_MAG_X_H 			0x69
#define LSM303_MAG_Y_L 			0x6A
#define LSM303_MAG_Y_H 			0x6B
#define LSM303_MAG_Z_L 			0x6C
#define LSM303_MAG_Z_H 			0x6D

// LSM303AGR MAG register settings
#define LSM303_MAG_ODR_10HZ		0x00
#define LSM303_MAG_ODR_20HZ		0x04
#define LSM303_MAG_ODR_50HZ		0x08
#define LSM303_MAG_ODR_100HZ	0x0C
#define LSM303_MAG_REBOOT		0x40
#define LSM303_MAG_SOFT_RST		0x20
#define LSM303_MAG_LPEN			0x10
#define LSM303_MAG_MD_CON		0x00
#define LSM303_MAG_MD_SIN		0x01
#define LSM303_MAG_BDU			0x10
#define LSM303_MAG_INT			0x01

// LSM303AGR MAG register values
#define LSM303_MAG_XYZDA		0x04

// LSM303AGR ACC register settings
#define LSM303_ACC_ODR_1HZ		0x10
#define LSM303_ACC_ODR_10HZ		0x20
#define LSM303_ACC_ODR_25HZ		0x30
#define LSM303_ACC_ODR_50HZ		0x40
#define LSM303_ACC_ODR_100HZ	0x50
#define LSM303_ACC_LPEN			0x08
#define LSM303_ACC_XEN			0x01
#define LSM303_ACC_YEN			0x02
#define LSM303_ACC_ZEN			0x04
#define LSM303_ACC_XYZEN		0x07
#define LSM303_ACC_I1_DRDY2		0x08
#define LSM303_ACC_BDU			0x10
#define LSM303_ACC_FS_2G		0x00
#define LSM303_ACC_FS_4G		0x10
#define LSM303_ACC_FS_8G		0x20
#define LSM303_ACC_FS_16G		0x30
#define LSM303_ACC_BOOT			0x80
#define LSM303_ACC_MULTIREAD 	(LSM303_ACC_X_L | 0x80)

// LSM303AGR ACC register values
#define LSM303_ACC_XYZDA		0x04

const uint8_t MESSAGE_MAX_LEN	= 0xFF;
const uint8_t FLOOD_TAIL[] 		= {0x6B,0x61,0x6B,0x61};
const uint8_t TAIL_SEPARATOR 	= 0x3B;

const uint32_t LSM303_ACC_SENSITIVITY[3][4] = {
		/* HR 12-bit */
		{
				980, /* FS @2g */
				1950, /* FS @4g */
				3900, /* FS @8g */
				11720, /* FS @16g */
		},
		/* Normal 10-bit */
		{
				3900, /* FS @2g */
				7820, /* FS @4g */
				15630, /* FS @8g */
				46900, /* FS @16g */
		},
		/* LP 8-bit */
		{
				15630, /* FS @2g */
				31260, /* FS @4g */
				62520, /* FS @8g */
				187580, /* FS @16g */
		},};

const uint8_t UNSOLICITED_RESPONSE_BASE[] = {0x41,
											 0x54,
											 0x24,
											 0x44,
											 0xC0,
											 0x00,
											 0x12, // ALP command length
											 0x32, // ALP command control byte => forward action
											 0xD7, // ITF_ID for D7ASP
											 0x01, // ITF_LEN => 1 byte long + 1 byte offset?
											 0x00, // QoS
											 0x10, // TO
											 0x01, // TE
											 0x20,
											 0x01,
											 0x00};

#endif /* CONSTANTS_H_ */
