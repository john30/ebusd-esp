# ebusd-esp
Firmware for ESP8266 allowing eBUS communication for ebusd

## Flashing
First of all, you need to flash the firmware to the ESP board. Currently, only Wemos D1 mini boards are supported, but others might work as well.

In order to flash the firmware to the ESP board, you need a tool like [NodeMCU Flasher](https://nodemcu.readthedocs.io/en/master/en/flash/#nodemcu-flasher) or [esptool.py](https://nodemcu.readthedocs.io/en/master/en/flash/#esptoolpy).

Using that tool, simply flash the binary from the [dist folder](https://github.com/john30/ebusd-esp/tree/master/dist) to the board at address 0x0000.

## Configuration
The firmware can be configured using the serial link, for Wemos D1 mini using the onboard USB serial converter. Simply connect with e.g. Putty to the COM port after connecting the board to your computer and you will see the following configuration options:

```
Welcome to eBUS adapter 2.0, build 20171020
ebusd port: udp:0.0.0.0:10000
Entering configuration mode.
Chip ID: ********
Free heap: 45768


Configuration:
 1. WIFI SSID: EBUS
 2. WIFI secret: ebus
 3. WIFI IP address: DHCP
 4. ebusd TCP/UDP mode: UDP
 5. ebusd UDP port: 10000
 6. ebusd RX+TX PINs: swapped D8+D7 (GPIO13+15)
#7. Management TCP port: 9999
 8. LED PINs: RX:D5, TX:D0
 9. Initial PIN direction: all input

 d. Set current PIN direction: D0:L
 t. Toggle current output PIN
 e. Dump EEPROM content
 f. Factory reset
 r. Reboot (without saving)
 0. Start

Enter your choice:
```

By entering one of the characters at the start of each configuration line and submitting by pressing ENTER, you can change the corresponding configuration item or initiate the action behind it.
