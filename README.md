# ProjectX

## Final
The program running on the STM32L152RE Nucleo can be found [here](Final).

## Overview
The following chart gives a high-level overview of the system in its entirety. Green arrows indicate communication links of some kind while red and orange arrows indicate power lines of 3.3V and 5V respectively.
![Overview chart](https://i.imgur.com/Z7YOUQ6.png)

## Backend
[bootstrapper.py](Backend/bootstrapper.py) is the back-end python script. Other scripts in this folder are either debug-scripts or scripts to regenerate tokens in case these are outdated.
![Backend flowchart](https://i.imgur.com/xDnhAh0.png)

## Code conventions
Eclipse default:
* Parenthesis after function headers (not below)
* Lower Camelcase for functions
* Constants all caps & underscores
