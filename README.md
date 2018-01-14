# ProjectX

## Final
The program running on the STM32L152RE Nucleo can be found [here](Final). The project works with the SW4STM32 plugin for Eclipse and was generated using STM32CubeMX.

## Overview
The following chart gives a high-level overview of the system in its entirety. Green arrows indicate communication links of some kind while red and orange arrows indicate power lines of 3.3V and 5V respectively. The arrow heads indicate the direction in which current/information flows. Labels provide additional information about the power lines as well as the comm links. Specifically, in case of the latter, the labels indicate the type of comm link.

![Overview chart](https://i.imgur.com/Z7YOUQ6.png)

## Backend
[bootstrapper.py](Backend/bootstrapper.py) is the back-end python script. Other scripts in this folder are either debug-scripts or scripts to regenerate tokens in case these are outdated.
![Backend flowchart](https://i.imgur.com/xDnhAh0.png)

## Power

![LoRa Benchmark](https://i.imgur.com/YsSOBOx.png)
![D7 Benchmark](https://i.imgur.com/p6ZXHSL.png)

## Code conventions
Eclipse default:
* Parenthesis after function headers (not below)
* Lower Camelcase for functions
* Constants all caps & underscores
