/*
 * enumerations.h
 *
 *  Created on: 10 dec. 2017
 *      Author: Robbe
 */

#ifndef ENUMERATIONS_H_
#define ENUMERATIONS_H_

typedef enum {
	TWOS_COMPLEMENT_24_BIT = 24,
	TWOS_COMPLEMENT_16_BIT = 16,
} SignBitIndex;

typedef enum {
	FLOOD_FRAME,
	COMPASS_FRAME,
	BAROMETER_FRAME,
} UnsolicitedResponseType;

#endif /* ENUMERATIONS_H_ */
