# Include the common Blackmagic Probe runner configuration
if(CONFIG_BOARD_KONAR_MMS3_ESP32C6)
  include(${ZEPHYR_BASE}/boards/common/esp32.board.cmake)

elseif(CONFIG_BOARD_KONAR_MMS3_STM32F405XX)
  board_runner_args(probe-rs "--chip=STM32F405RGTx" "--tool-opt=--protocol=swd")
  include(${ZEPHYR_BASE}/boards/common/probe-rs.board.cmake)
endif()
