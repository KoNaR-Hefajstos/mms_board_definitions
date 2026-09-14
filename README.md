# mms_board_definitions

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

Zephyr RTOS board definition module for **Konar Mini-Moducard-System (MMS)** boards.

> **Source**: [KoNaR-Hefajstos/mms_board_definitions](https://github.com/KoNaR-Hefajstos/mms_board_definitions)

---

## Overview

This west module provides Zephyr RTOS board support for the **Konar MMS3** (Mini-Moducard-System-3) — a compact STM32-based development board designed for the Chainbus ecosystem. It exposes standard peripheral interfaces (UART, I2C, SPI, USB) along with user LEDs, buttons, and HAT socket selection lines.

## Installation

Add this module to your Zephyr workspace as a west module. Place it under `modules/` in your Zephyr base directory, or add it to your `west.yml`:

```yaml
manifest:
  projects:
    - name: mms_board_definitions
      url: https://github.com/KoNaR-Hefajstos/mms_board_definitions.git
      path: modules/mms_board_definitions
```

Then update the Zephyr environment:

```bash
west update
source zephyr/zephyr-env.sh
```

## Board Definitions

### `konar/mms3`

| Property       | Value                                |
|----------------|--------------------------------------|
| **Full Name**  | Mini-Moducard-System-3               |
| **Vendor**     | Konar                                |
| **SoC**        | STM32F405XX                          |
| **Core Clock** | 168 MHz (8 MHz HSE → PLL)            |

#### Enabled Peripherals

| Peripheral       | Instance | Pins                | Notes                          |
|------------------|----------|---------------------|--------------------------------|
| **Console / Shell** | USART3   | PC10 (TX), PC11 (RX) | 115200 baud, via USB CDC-ACM   |
| **I2C**          | I2C2     | PB10 (SCL), PB11 (SDA) | Fast mode                     |
| **SPI**          | SPI3     | PB3 (SCK), PB4 (MISO), PC12 (MOSI) | SWD debug via PA13/PA14       |
| **USB OTG FS**   | OTG_FS   | PA11 (DM), PA12 (DP) | CDC ACM serial over USB        |

#### LEDs

| Label        | GPIO    | Active |
|--------------|---------|--------|
| `USER_LED_0` | PB1     | High   |
| `USER_LED_1` | PB0     | High   |
| `USER_LED_2` | PC5     | High   |

#### Buttons

| Label         | GPIO   | Active |
|---------------|--------|--------|
| `USER_BUTTON_0` | PD2  | Low    |

#### HAT Socket Select Lines

The board provides 8 GPIO lines for HAT position selection (active-low), each mapping to a 3-bit address:

| Position | GPIO     | Address |
|----------|----------|---------|
| Pos 1    | PC9      | addr3   |
| Pos 2    | PB5      | addr4   |
| Pos 3    | PA7      | addr0   |
| Pos 4    | PA6      | addr1   |
| Pos 5    | PA5      | addr2   |
| Pos 6    | PC6      | addr5   |
| Pos 7    | PC7      | addr6   |
| Pos 8    | PC8      | addr7   |

#### Aliases

| Alias              | Node   |
|--------------------|--------|
| `chainbus-i2c`     | `&i2c2` |
| `chainbus-spi`     | `&spi3` |
| `chainbus-uart`    | `&usart3` |

## Building & Flashing

Build a sample application for the MMS3 board:

```bash
west build -b konar_mms3 samples/basic/blinky
```

Flash via the Blackmagic Probe (default runner configured in `board.cmake`):

```bash
west flash
```

Or use SWD directly:

```bash
west flash --runner openocd
```

> NOTE: The flasher may not work.

## Device Tree Source

The board is defined in `boards/konar/mms3/konar_mms3.dts`, which includes the STM32F405XG SoC DTSI and pin-control definitions. Clock configuration sets up an 8 MHz external crystal to derive the 168 MHz system clock via PLL.

## Configuration

The defconfig (`boards/konar/mms3/konar_mms3_defconfig`) enables:

- `CONFIG_CLOCK_CONTROL` — 168 MHz system clock
- `CONFIG_SERIAL`, `CONFIG_CONSOLE`, `CONFIG_UART_CONSOLE` — serial console support
- `CONFIG_PINCTRL`, `CONFIG_GPIO`, `CONFIG_I2C`, `CONFIG_SPI` — peripheral drivers
- `CONFIG_USB_DEVICE_STACK_NEXT` — USB device stack
- `CONFIG_CDC_ACM_SERIAL_INITIALIZE_AT_BOOT` — USB CDC ACM serial

## License

This project is licensed under the Apache License 2.0. See the [LICENSE](LICENSE) file for details.
