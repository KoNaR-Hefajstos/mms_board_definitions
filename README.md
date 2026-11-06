# mms_board_definitions

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

Zephyr RTOS board definition module for **Konar Mini-Moducard-System (MMS)** boards.

> **Source**: [KoNaR-Hefajstos/mms_board_definitions](https://github.com/KoNaR-Hefajstos/mms_board_definitions)

---

## Overview

This west module provides Zephyr RTOS board support for **Konar MMS3** (Mini-Moducard-System-3) boards. The MMS3 is a compact development board designed for the Chainbus ecosystem, exposing standard peripheral interfaces (UART, I2C, SPI, USB) along with user LEDs, buttons, and HAT socket selection lines.

The module supports **two hardware targets**:

| Target | Microcontroller | Build Target |
|--------|----------------|--------------|
| **MMS3 STM32F405XX** | STM32F405XX | `konar_mms3_stm32f405xx` |
| **MMS3 ESP32-C6** | ESP32-C6 | `konar_mms3_esp32c6_hpcore`, `konar_mms3_esp32c6_lpcore` |

See the individual board documentation for hardware-specific details:
- [STM32F405XX Board](./docs/boards/konar_mms3_stm32f405xx/board-stm32f405xx.md)
- [ESP32-C6 Board](./docs/boards/konar_mms3_esp32c6/board-esp32c6.md)

---

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

---

## Building

Choose one of the two build targets below.

### STM32F405XX Target

```bash
west build -b konar_mms3_stm32f405xx samples/basic/blinky
```

### ESP32-C6 Targets

**HP Core (High Performance Core):**

```bash
west build -b konar_mms3_esp32c6_hpcore samples/basic/blinky
```

**LP Core (Low Power Core):**

```bash
west build -b konar_mms3_esp32c6_lpcore samples/basic/blinky
```

---

## Flashing

### STM32F405XX

Flashes via the Blackmagic Probe (default runner configured in `board.cmake`):

```bash
west flash
```

Or use SWD directly:

```bash
west flash --runner openocd
```

> NOTE: The flasher may not work.

### ESP32-C6

Flashing uses OpenOCD via the Espressif toolchain:

```bash
west flash --runner openocd
```

---

## License

This project is licensed under the Apache License 2.0. See the [LICENSE](LICENSE) file for details.