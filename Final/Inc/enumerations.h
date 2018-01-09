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
	MAGNETOMETER_FRAME,
	ACCELEROMETER_FRAME,
	TEMPERATURE_FRAME,
} UnsolicitedResponseType;
typedef enum{
	startup,
	joining_network,
	wait_for_joining_network,
	verify_network_join,
	wait_for_verify_network_join,
	joined_network,
	tx_rx,
} LoRaWANState;

typedef enum {
	enabled,
	enabling,
	disabled,
	disabling,
} OutdoorSensorState;

typedef enum {
	waiting_for_command,
	receiving_command,
} Dash7ReceiveState;

#endif /* ENUMERATIONS_H_ */
