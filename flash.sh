#!/bin/bash
# flash an ESP8266, ESP8285 or ESP32 with the latest firmware with forced erase.
# requires platformio including tool-esptoolpy (>=3.3) installed on the user account (~/.platformio/packages/tool-esptoolpy)
# and for ESP8266 additionally an installed Non-OS SDK.
# when run in WSL, usbipd can be used to forward the USB serial port into WSL with e.g. "usbipd wsl attach --busid 7-2".

fw=${1:-./dist/ebus-v3_d1mini.bin}
home=${HOMEDIR:-~}
eraseall='--erase-all'
speed=2000000
tooldir=$home/.platformio/packages/tool-esptoolpy
if [[ ! -d "$tooldir" ]]; then
  echo "missing platformio tool-esptoolpy, please check the folder $tooldir" >&2
  exit 1
fi
if ! "$tooldir/esptool.py" --help >/dev/null 2>/dev/null; then
  echo "platformio tool-esptoolpy is not executable, please check python installation for execution of $tooldir/esptool.py" >&2
  exit 1
fi
if [[ "${fw%32_factory.bin}" != "$fw" ]] || [[ "${fw%32.bin}" != "$fw" ]]; then
  # ESP32 firmware
  if [[ "${fw%32_factory.bin}" == "$fw" ]]; then
    echo "skipping erase. if you want it, then use one of the ...32_factory.bin images"
    echo
    eraseall=''
  fi
  chip='esp32'
  size='4MB'
  echo "checking flash size"
  detectsize=`$tooldir/esptool.py --chip=$chip --baud $speed -a no_reset flash_id`
  if [[ $? -ne 0 ]]; then
    echo "error checking flash size:" >&2
    echo "$detectsize" >&2
    exit 1
  fi
  detectsize=`echo "$detectsize"|grep "flash size"|sed -e 's#.*: ##'`
  if [[ "$detectsize" != "$size" ]]; then
    echo "flash size mismatch: expected $size, detected $detectsize." >&2
    exit 1
  fi
  echo "flashing $fw with size $size"
  $tooldir/esptool.py --chip=$chip --baud $speed --after hard_reset \
    write_flash $eraseall --flash_size $size --compress \
    0 "$fw"
else
  # ESP8266 or ESP8285 firmware
  imgdir=$home/.platformio/packages/framework-esp8266-nonos-sdk/bin
  chip='esp8266'
  size='4MB'
  last='0x3f'
  if [[ "${fw%_16m.bin}" != "$fw" ]]; then
    size='16MB'
    last='0xff'
  elif [[ "${fw%_1m.bin}" != "$fw" ]]; then
    size='1MB'
    last='0xf'
    speed=115200
  fi
  echo "checking flash size"
  detectsize=`$tooldir/esptool.py --chip=$chip --baud $speed -a no_reset flash_id`
  if [[ $? -ne 0 ]]; then
    echo "error checking flash size:" >&2
    echo "$detectsize" >&2
    exit 1
  fi
  detectsize=`echo "$detectsize"|grep "flash size"|sed -e 's#.*: ##'`
  if [[ "$detectsize" != "$size" ]]; then
    echo "flash size mismatch: expected $size, detected $detectsize." >&2
    exit 1
  fi
  echo "flashing $fw with size $size"
  $tooldir/esptool.py --chip=$chip --baud $speed --after hard_reset \
    write_flash $eraseall --flash_size $size --compress \
    "${last}b000" "$imgdir/blank.bin" \
    "${last}c000" "$imgdir/esp_init_data_default.bin" \
    "${last}e000" "$imgdir/blank.bin" \
    0 "$fw"
fi
