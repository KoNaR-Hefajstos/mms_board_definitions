# Konar MMS3 — STM32F405XX Board

## Overview

The STM32F405XX variant of the Konar MMS3 is an STM32-based development board designed for the Chainbus ecosystem. It runs at 168 MHz (8 MHz HSE → PLL) and exposes standard peripheral interfaces along with user LEDs, buttons, and HAT socket selection lines.

## Build Target

```bash
west build -b konar_mms3_stm32f405xx <application>
```

## Enabled Peripherals

| Peripheral | Instance | Pins | Notes |
|------------|----------|------|-------|
| Console / Shell | USART3 | PC10 (TX), PC11 (RX) | 115200 baud, via USB CDC-ACM |
| I2C | I2C2 | PB10 (SCL), PB11 (SDA) | Fast mode |
| SPI | SPI3 | PB3 (SCK), PB4 (MISO), PC12 (MOSI) | CS: PA15 (active low) |
| USB OTG FS | OTG_FS | PA11 (DM), PA12 (DP) | CDC ACM serial over USB |

> **Note:** PB3, PB4, and PA15 are shared with JTAG pins (JTDO, NJTRST, JTDI). Use SWD (PA13/PA14) for debug.

## LEDs

| Label | GPIO | Active |
|-------|------|--------|
| USER_LED_0 | PB1 | High |
| USER_LED_1 | PB0 | High |
| USER_LED_2 | PC5 | High |

## Buttons

| Label | GPIO | Active |
|-------|------|--------|
| USER_BUTTON_0 | PD2 | Low |

## HAT Socket Select Lines

8 GPIO lines for HAT position selection (active-low), each mapping to a 3-bit address:

| Position | GPIO | Address |
|----------|------|---------|
| Pos 1 | PC9 | addr3 |
| Pos 2 | PB5 | addr4 |
| Pos 3 | PA7 | addr0 |
| Pos 4 | PA6 | addr1 |
| Pos 5 | PA5 | addr2 |
| Pos 6 | PC6 | addr5 |
| Pos 7 | PC7 | addr6 |
| Pos 8 | PC8 | addr7 |

## Aliases

| Alias | Node |
|-------|------|
| chainbus-i2c | &i2c2 |
| chainbus-spi | &spi3 |
| chainbus-uart | &usart3 |

## Device Tree

The board is defined in `boards/konar/mms3/konar_mms3_stm32f405xx.dts`, which includes the STM32F405XG SoC DTSI and pin-control definitions. Clock configuration sets up an 8 MHz external crystal to derive the 168 MHz system clock via PLL.

## Kconfig Options

- `CONFIG_BOARD_KONAR_MMS3_STM32F405XX` — Select STM32F405XX SoC support

## Defconfig Highlights

- `CONFIG_CLOCK_CONTROL` — 168 MHz system clock
- `CONFIG_SERIAL`, `CONFIG_CONSOLE`, `CONFIG_UART_CONSOLE` — serial console support
- `CONFIG_PINCTRL`, `CONFIG_GPIO`, `CONFIG_I2C`, `CONFIG_SPI` — peripheral drivers
- `CONFIG_USB_DEVICE_STACK_NEXT` — USB device stack
- `CONFIG_CDC_ACM_SERIAL_INITIALIZE_AT_BOOT` — USB CDC ACM serial