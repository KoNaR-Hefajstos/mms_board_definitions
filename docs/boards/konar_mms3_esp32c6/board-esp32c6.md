# Konar MMS3 — ESP32-C6 Board

## Overview

The ESP32-C6 variant of the Konar MMS3 is an ESP32-C6-based development board. It supports both the High Performance (HP) core and the Low Power (LP) core.

## Build Targets

### HP Core (High Performance Core)

```bash
west build -b konar_mms3_esp32c6_hpcore <application>
```

### LP Core (Low Power Core)

```bash
west build -b konar_mms3_esp32c6_lpcore <application>
```

## Peripherals (HP Core)

| Peripheral | Instance | Pins | Notes |
|------------|----------|------|-------|
| Console / Shell | UART0 | GPIO16 (TX), GPIO17 (RX) | 115200 baud |
| UART1 | UART1 | GPIO5 (TX), GPIO4 (RX) | 115200 baud |
| I2C | I2C0 | GPIO6 (SDA), GPIO7 (SCL) | Fast mode, with PCA9555 GPIO expander at 0x25 |
| SPI | SPI2 | GPIO18 (SCK), GPIO19 (MOSI), GPIO20 (MISO) | — |

## LEDs (HP Core)

| Label | GPIO | Description |
|-------|------|-------------|
| UPSTREAM RJ45 RX LED | Baseboard expander 7 | — |
| UPSTREAM RJ45 TX LED | Baseboard expander 4 | — |
| DOWNSTREAM RJ45 RX LED | Baseboard expander 5 | — |
| DOWNSTREAM RJ45 TX LED | Baseboard expander 6 | — |
| FIX LED 1 | Baseboard expander 4 | — |
| FIX LED 2 | Baseboard expander 3 | — |
| FIX LED 4 | Baseboard expander 12 | — |

## Buttons (HP Core)

| Label | GPIO | Active |
|-------|------|--------|
| USER_BUTTON_0 | Baseboard expander 10 | Low |

## I2C Devices (HP Core)

| Device | Address | Description |
|--------|---------|-------------|
| PCA9555 GPIO Expander | 0x25 | Baseboard GPIO expansion |
| AT24 EEPROM | 0x50 | 32 KB EEPROM |

## Aliases

| Alias | Node |
|-------|------|
| chainbus-i2c | &i2c0 |
| chainbus-spi | &spi2 |
| chainbus-uart | &uart1 |

## Device Tree

- HP Core: `boards/konar/mms3/konar_mms3_esp32c6_hpcore.dts`
- LP Core: `boards/konar/mms3/konar_mms3_esp32c6_lpcore.dts`
- Pin control: `boards/konar/mms3/konar_mms3_esp32c6-pinctrl.dtsi`

## Kconfig Options

- `CONFIG_BOARD_KONAR_MMS3_ESP32C6_HPCORE` — Select ESP32-C6 HP core support
- `CONFIG_BOARD_KONAR_MMS3_ESP32C6_LPCORE` — Select ESP32-C6 LP core support

## Defconfig Highlights

**HP Core:**
- `CONFIG_SERIAL`, `CONFIG_CONSOLE`, `CONFIG_UART_CONSOLE` — serial console
- `CONFIG_PINCTRL`, `CONFIG_GPIO`, `CONFIG_I2C`, `CONFIG_SPI` — peripheral drivers
- Heap memory pool: 98304 bytes

**LP Core:**
- Heap memory pool: 98304 bytes