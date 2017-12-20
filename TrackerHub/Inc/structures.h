/*
 * structures.h
 *
 *  Created on: 3 dec. 2017
 *      Author: Robbe
 */

#ifndef STRUCTURES_H_
#define STRUCTURES_H_

/**
 * @note WARNING: free the data pointer after use!
 */
typedef struct {
	uint8_t *data;
	uint8_t dataLength;
} UnsolicitedResponseTail;

typedef struct {
	int32_t pressure;
	int32_t temperature;
} BarometerData;

typedef struct {
	int32_t xValue;
	int32_t yValue;
	int32_t zValue;
} MagnetometerData;

#endif /* STRUCTURES_H_ */
