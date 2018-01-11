/*
 * structures.h
 *
 *  Created on: 3 dec. 2017
 *      Author: Robbe
 */

#ifndef STRUCTURES_H_
#define STRUCTURES_H_

typedef struct {
	uint8_t *data; /**< Pointer to data location. @note Needs to be freed after use! */
	uint8_t dataLength; /**< Length of data in bytes. */
} UnsolicitedResponseTail;

typedef struct {
	int32_t pressure; /**< Pressure in mbar. */
	int32_t temperature; /**< Temperature in °C. */
} BarometerData;

typedef struct {
	int32_t xValue;
	int32_t yValue;
	int32_t zValue;
} MagnetometerData;

typedef struct {
	int32_t xValue;
	int32_t yValue;
	int32_t zValue;
} AccelerometerData;

typedef struct {
	double pitch; /**< Pitch angle in radians, also known as &theta;. */
	double roll; /**< Roll angle in radians, also known as &phi;. */
	double yaw; /**< Yaw angle in radians, also known as &psi;. */
} CompassData;

#endif /* STRUCTURES_H_ */
