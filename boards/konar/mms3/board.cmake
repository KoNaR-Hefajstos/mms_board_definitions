# Include the common Blackmagic Probe runner configuration
if(CONFIG_BOARD_KONAR_MMS3_ESP32C6)
  if(NOT "${OPENOCD}" MATCHES "^${ESPRESSIF_TOOLCHAIN_PATH}/.*")
    set(OPENOCD OPENOCD-NOTFOUND)
  endif()
  find_program(OPENOCD openocd PATHS ${ESPRESSIF_TOOLCHAIN_PATH}/openocd-esp32/bin NO_DEFAULT_PATH)

  include(${ZEPHYR_BASE}/boards/common/esp32.board.cmake)
  include(${ZEPHYR_BASE}/boards/common/openocd.board.cmake)
elseif(CONFIG_BOARD_KONAR_MMS3_STM32F407XX)
  include(${ZEPHYR_BASE}/boards/common/blackmagicprobe.board.cmake)
endif()
