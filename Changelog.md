# build 20180916

* fix for initial port settings fixed to input for D5-D8
* made hostname configurable
* nicer serial configuration
* made PINs configurable via HTML and added auto refresh
* added JSON API for PINs on /pin URL


# build 20180915

* added hybrid software/hardware UART modes (with initial bus connect check disabled): D1(recv)+D4(TX1), RX+D2(send)
* added enhanced ebusd protocol mode with arbitration done by Wemos
* hide WIFI secret length in serial configuration


# build 20171230

* extended maximum WIFI secret length to 63 chars
* use a password field for the WIFI secret in HTML
* encrypt WIFI secret in EEPROM
* only wait 5 seconds for WIFI connection after reboot and retry infinitely
* dim LED while connecting WIFI
* validate SSID and WIFI secret length
* removed forced reset (by setting D0=HIGH during boot) again
* made "f" load factory defaults and only "F" erase the whole EEPROM
* track if ebusd is connected and active/inactive
* delayed background task handling to after second consecutive SYN symbol


# build 20171225

* set hostname to `"ebus-<chipid-hex>"`
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
