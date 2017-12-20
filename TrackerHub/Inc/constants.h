/*
 * constants.h
 *
 *  Created on: 4 dec. 2017
 *      Author: Robbe
 */

#ifndef CONSTANTS_H_
#define CONSTANTS_H_

#define LSM303_ACC_ADDRESS 0x32
#define LSM303_MAG_ADDRESS 0x3C
#define LPS22HB_ADDRESS 0xBA

#define LPS22HB_CTRL_REG1 0x10
#define LSM303_ACC_CTRL_REG1_A 0x20
#define LSM303_ACC_CTRL_REG2_A 0x21
#define LSM303_ACC_CTRL_REG3_A 0x22
#define LSM303_ACC_CTRL_REG4_A 0x23
#define LSM303_ACC_CTRL_REG5_A 0x24
#define LSM303_ACC_CTRL_REG6_A 0x25
#define LSM303_CFG_REG_A_M 0x60
#define LSM303_CFG_REG_C_M 0x62
#define LSM303_ACC_X_L_A 0x28
#define LSM303_ACC_X_H_A 0x29
#define LSM303_ACC_Y_L_A 0x2A
#define LSM303_ACC_Y_H_A 0x2B
#define LSM303_ACC_Z_L_A 0x2C
#define LSM303_ACC_Z_H_A 0x2D
#define LSM303_STATUS_REG_A 0x27
#define OUTX_L_REG_M 0x68
#define OUTX_H_REG_M 0x69
#define OUTY_L_REG_M 0x6A
#define OUTY_H_REG_M 0x6B
#define OUTZ_L_REG_M 0x6C
#define OUTZ_H_REG_M 0x6D

#define LSM303_ACC_MULTIREAD (LSM303_ACC_X_L_A | 0x80)

const uint8_t MESSAGE_MAX_LEN = 255;
const uint8_t FLOOD_TAIL[] = {0x6B,0x61,0x6B,0x61};
const uint8_t TAIL_SEPARATOR = 0x3B;

const uint32_t LSM303_ACC_Sensitivity_List[3][4] = {
		/* HR 12-bit */
		{ 980, /* FS @2g */
				1950, /* FS @4g */
				3900, /* FS @8g */
				11720, /* FS @16g */
		},

		/* Normal 10-bit */
		{ 3900, /* FS @2g */
				7820, /* FS @4g */
				15630, /* FS @8g */
				46900, /* FS @16g */
		},

		/* LP 8-bit */
		{ 15630, /* FS @2g */
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
