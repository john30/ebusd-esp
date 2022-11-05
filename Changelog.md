# build 20221105

* feat: add links to firmware download and adapter docs
* fix: load all config items from eeprom even if WIFI was not configured completely
* feat: add passthrough mode for flashing/configuring adapter 3 PIC remotely


# build 20221023

* feat: support adapter 3.1
* feat: show jumper settings for adapter 3.* in UI
* feat: set WIFI high power to 19.5dBm for non-32 targets
* feat: add configurable AP mode
* feat: add logging
* feat: require 2x enter for serial config mode
* fix: allow up to 32 chars SSID
* fix: require at least 8 chars password
* chore: some smaller UI enhancements
* feat: update ESP32 platform


# build 20220731

* feat: set WIFI power to at least 17dBm
* feat: add high-speed serial mode for adapter 3
* chore: update SoftwareSerial to 6.16.1
* chore: some smaller UI enhancements


# build 20220327

* fix: current state of adapter 3 ready port shown in UI


# build 20211226

* chore: show board and flash ID
* feat: start support for Wemos D1 mini 32 and ESP01
* feat: add link to verbose info
* chore: changed lite+pro file names for clear indication of flash size


# build 20211205

* chore: handle WIFI clients more frequently
* chore: update SoftwareSerial to 6.13.2
* chore: use normal CPU speed and normal bandwidth lwip


# build 20211030

* chore: update Arduino core to 3.0.2
* fix: for 64 characters in WIFI password
* fix: for allowed number range in management and ebusd port
* feat: make phy mode configurable
* fix: initial signal detection with adapter in enhanced mode
* feat: ESP erase config when doing factory reset
* feat: double CPU speed and use high bandwidth LWIP for lower latency
* chore: update SoftwareSerial to 6.13.2
* chore: add link to firmware download
* fix: RSSI calculation when not connected
* feat: announce OTA via mDNS when activated


# build 20201122

* fix serial speed for adapter 3 non-enhanced mode
* fix LED for ESP32 after using PWM
* hide adapter 3 ready port on serial and API
* send enhanced protocol reset after client connection


# build 20201120

* updated Arduino core to 2.7.4
* updated to latest enhanced protocol
* add support for adapter 3 and set this as default
* add WIFI high power option
* wait longer for DHCP lease
* allow entering config mode when WIFI does not connect


# build 20200413

* add ESP32 support (starting with Lolin32)


# build 20200412

* set WIFI to mode N
* updated SoftwareSerial to 6.8.1


# build 20191229

* fix for SoftwareSerial initialization (introduced in 20191208)
* updated Arduino core to 2.6.3 and SoftwareSerial to 6.6.1
* built with PlatformIO instead of Arduino
* sharpen keepalive options for eBUS TCP port


# build 20191212

* fix for setting network mask


# build 20191208

* potential fix for DHCP sometimes not working
* updated to new enhanced ebusd protocol
* updated Arduino core to 2.6.2 and SoftwareSerial to 6.3.0


# build 20191110

* added support for 1-wire temperature sensors to UI and /sensor URL
* show initial eBUS signal detection result
* updated Arduino core to 2.6.0
* updated SoftwareSerial to 5.4.0
* added more time for WIFI connect
* added keepalive to eBUS TCP port


# build 20190407

* show RSSI in percent as well
* updated SoftwareSerial to 4.0.0


# build 20190406

* added RSSI information
* updated Arduino core to 2.5.0
* added analog input PIN with value and voltage


# build 20181125

* fixed reboot loop after starting access point


# build 20181020

* built with Arduino using core 2.4.0 instead of PlatformIO using core 2.4.2
* added Wemos D1 mini Lite variant


# build 20180923

* modernized HTML UI
* allow direct serial ebusd connection in mode "mixed software D1 + TX1 D4 (GPIO5+2)"
* deny API pin update for non-output pins
* show internal pullup/down in HTML pins page
* added factory reset buttons to HTML config page
* fix for HTML protocol selector
* better check for pressed return key during startup


# build 20180922

* added "o" action for eanbling OTA and manual firmware upload
* only show connection string and reveal current DHCP address when WIFI client is connected
* added "c" action for re-connecting WIFI
* updated Arduino core from 2.4.0 to 2.4.2


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
