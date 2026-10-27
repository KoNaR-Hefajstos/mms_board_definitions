# Include the common Blackmagic Probe runner configuration
if(CONFIG_BOARD_KONAR_MMS3_ESP32C6)
  include(${ZEPHYR_BASE}/boards/common/esptool.board.cmake)
elseif(CONFIG_BOARD_KONAR_MMS3_STM32F407XX)
  include(${ZEPHYR_BASE}/boards/common/blackmagicprobe.board.cmake)
endif()
