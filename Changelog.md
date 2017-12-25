# build 20171225

* set hostname to "ebus-<chipid-hex>"
* added hostname to serial and HTML output
* always call EEPROM.begin and added 1 second delay before accessing EEPROM
* let LED flash 5 times on hard reset


# build 20171210

* added HTML configuration UI
* added echo for TCP as well
* turn LED off if TCP is disconnected
* added hard factory reset with "F"
* added AP mode if never configured before
* changed default ebus port to 9999
* changed default management port to 80
* added forced reset by setting D0=HIGH during boot
* removed password from AP in order to make SSID visible
* changed default mode to TCP
* changed default extra RX/TX LEDs to disabled


# build 20171022

* set default mode to now non-swapped
* fixed LED settings
* started mgmt server
* allow temporary echo in UDP mode
* do not wait for final off time in led flash
* fixed missing "set changed" when setting initial ports
* handle ebus traffic and tasks even if no TCP client connected


# build 20171020

* enhanced configuration menu:
  * allow setiting initial pin direction and output value
  * specify WiFi IP address manually in addition to DHCP
  * swap/no-swap RX/TX pins
  * define pins as ebus receive/send indicator


# build 20171014
* low latency WiFi to serial
