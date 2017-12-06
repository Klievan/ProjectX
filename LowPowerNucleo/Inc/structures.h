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
} unsolicitedResponseTail;

typedef struct {
	uint8_t TRANSMISSION_SUCCESSFUL;
	uint8_t *locationToBeFreed;
} unsolicitedResponseTXReturn;

#endif /* STRUCTURES_H_ */
