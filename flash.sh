#!/bin/bash
# flash an ESP8266, ESP8285 or ESP32 with the latest firmware with forced erase.
# requires platformio including tool-esptoolpy installed on the user
# and for ESP8266 additionally an installed Non-OS SDK

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
  $tooldir/esptool.py --chip=$chip --baud $speed --after hard_reset \
    write_flash $eraseall --compress \
    0 "$fw"
else
  # ESP8266 or ESP8285 firmware
  imgdir=$home/.platformio/packages/framework-esp8266-nonos-sdk/bin
  chip='esp8266'
  size='4m'
  last='0x3f'
  if [[ "${fw%_16m.bin}" != "$fw" ]]; then
    size='16m'
    last='0xff'
  elif [[ "${fw%_1m.bin}" != "$fw" ]]; then
    size='1m'
    last='0xf'
    speed=115200
  fi
  $tooldir/esptool.py --chip=$chip --baud $speed --after hard_reset \
    write_flash $eraseall --flash_size $size --compress \
    "${last}b000" "$imgdir/blank.bin" \
    "${last}c000" "$imgdir/esp_init_data_default.bin" \
    "${last}e000" "$imgdir/blank.bin" \
    0 "$fw"
fi
