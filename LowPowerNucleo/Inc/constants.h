/*
 * constants.h
 *
 *  Created on: 4 dec. 2017
 *      Author: Robbe
 */

#ifndef CONSTANTS_H_
#define CONSTANTS_H_

const char PREAMBLE_SEQUENCE[] = {"&&&&&"};
const uint8_t PREAMBLE_LENGTH = 5;
const uint8_t MESSAGE_MAX_LEN = 255;
const uint8_t UNSOLLICITED_RESPONSE_BASE_LEN = 16;
const uint8_t FLOOD_TAIL[] = {0x6B,0x61,0x6B,0x61};
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
