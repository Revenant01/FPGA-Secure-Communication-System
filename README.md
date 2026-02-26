# FPGA Secure Communication System

An AES-128 encrypted communication system implemented on two Xilinx Basys3 FPGA boards. Board A accepts keyboard input, encrypts it using AES-128, and transmits the ciphertext over UART. Board B receives the data, decrypts it, and displays the plaintext on a VGA monitor.

---

## Table of Contents

- [System Overview](#system-overview)
- [Architecture](#architecture)
- [Directory Structure](#directory-structure)
- [Hardware Requirements](#hardware-requirements)
- [Module Documentation](#module-documentation)
  - [Board A – Encryption Side](#board-a--encryption-side)
  - [Board B – Decryption Side](#board-b--decryption-side)
  - [Shared / Communication Modules](#shared--communication-modules)
- [AES-128 Cryptographic Details](#aes-128-cryptographic-details)
- [UART Communication Protocol](#uart-communication-protocol)
- [Pin Assignments](#pin-assignments)
- [Timing Specifications](#timing-specifications)
- [Build & Deployment](#build--deployment)
- [Usage](#usage)
- [Key Parameters Reference](#key-parameters-reference)

---

## System Overview

```
+--------------------------------------+    UART (9600 baud)    +--------------------------------------+
|           BOARD A                    | ----------------------> |           BOARD B                    |
|  (Basys3 - Encryption)               |       TX -----> RX      |  (Basys3 - Decryption)               |
|                                      |                         |                                      |
|  PS/2 Keyboard                       |                         |                         VGA Monitor  |
|       |                              |                         |                              |       |
|       v                              |                         |                              |       |
|  Scancode -> ASCII                   |                         |  UART RX -> AES Decrypt --> VGA      |
|       |                              |                         |                                      |
|       v                              |                         |                                      |
|  AES-128 Encrypt                     |                         |                                      |
|       |                              |                         |                                      |
|       v                              |                         |                                      |
|  UART TX --------------------------------------------------------->                                  |
+--------------------------------------+                         +--------------------------------------+
```

The user types a 16-character message on a PS/2 keyboard connected to Board A. After all 16 characters are entered, the system encrypts the 128-bit block with AES-128 and streams it via UART to Board B. Board B decrypts the ciphertext and renders the recovered plaintext on a VGA display.

---

## Architecture

### High-Level Data Flow

**Encryption Path (Board A)**

```
PS/2 Keyboard
    |  (scancodes)
    v
ps2_keyboard.vhd            <-- Low-level PS/2 protocol handler
    |  (8-bit scancode)
    v
ps2_keyboard_to_ascii.vhd   <-- Scancode -> ASCII, accumulates 16 characters (128 bits)
    |  (128-bit plaintext)
    v
encryption.vhd              <-- AES-128: 1 initial AddKey + 9 MainRounds + 1 FinalRound
    |  (128-bit ciphertext)
    v
UART_TX3.vhd                <-- Serial transmitter @ 9600 baud
    |  (TX pin)
    v
-------------------------------------> UART cable ---------------------------------------->
```

**Decryption Path (Board B)**

```
-------------------------------------> UART cable ---------------------------------------->
    |  (RX pin)
    v
UART_RX3.vhd                <-- Serial receiver @ 9600 baud, captures 128 bits
    |  (128-bit ciphertext)
    v
Top_decryption.vhd          <-- AES-128 inverse: 1 initial AddKey + 9 DecRounds + 1 FinalDecRound
    |  (128-bit plaintext)
    v
VGA.vhd                     <-- Converts 128 bits to 16 ASCII characters
    |
    +-- Clock_Divider.vhd   <-- Generates pixel clock
    +-- Font_Rom.vhd        <-- 8x16 character glyphs
    +-- Pixel_On_Text.vhd   <-- Rasterises characters onto VGA framebuffer
    |  (RGB + Sync signals)
    v
VGA Monitor
```

---

## Directory Structure

```
FPGA-Secure-Communication-System/
|
+-- README.md
|
+-- Project/
    |
    +-- Communication/                  # Standalone UART and debouncing modules
    |   +-- UART.vhd                    # Wrapper combining TX and RX
    |   +-- UART_TX3.vhd                # UART transmitter (16-bit data)
    |   +-- UART_RX3.vhd                # UART receiver  (8-bit data)
    |   +-- UART_controller.vhd         # Debounced transmission controller
    |   +-- Button_debounce.vhd         # 4-stage switch debounce filter
    |
    +-- keyboard/                       # Standalone PS/2 keyboard modules
    |   +-- ps2_keyboard.vhd            # PS/2 protocol handler
    |   +-- ps2_keyboard_to_ascii.vhd   # Scancode-to-ASCII converter
    |
    +-- project_A/                      # Vivado project - Encryption board
    |   +-- project_A/
    |       +-- project_A.srcs/
    |           +-- sources_1/new/
    |           |   +-- TOP.vhd                     # Top-level (Board A)
    |           |   +-- encryption.vhd              # AES-128 encryption top
    |           |   +-- mainRound.vhd               # Rounds 1-9
    |           |   +-- finalRound.vhd              # Round 10 (no MixColumns)
    |           |   +-- addkey.vhd                  # AddRoundKey (XOR with key)
    |           |   +-- subbyte.vhd                 # SubBytes (16x S-box)
    |           |   +-- shiftrow.vhd                # ShiftRows permutation
    |           |   +-- mixcolumn.vhd               # MixColumns (GF(2^8))
    |           |   +-- sbox.vhd                    # 256-entry forward S-box
    |           |   +-- UART_TX3.vhd                # UART transmitter
    |           |   +-- ps2_keyboard.vhd            # PS/2 handler
    |           |   +-- ps2_keyboard_to_ascii.vhd   # ASCII converter
    |           +-- constrs_1/new/
    |               +-- BoardA.xdc                  # Board A pin constraints
    |
    +-- project_B/                      # Vivado project - Decryption board
        +-- project_b/
            +-- project_b.srcs/
            |   +-- sources_1/
            |       +-- new/
            |       |   +-- TOP.vhd                 # Top-level (Board B)
            |       +-- imports/Downloads/
            |           +-- decryption.vhd          # Single decryption round
            |           +-- Top_decryption.vhd      # AES-128 decryption top
            |           +-- inv_sbox.vhd            # 256-entry inverse S-box
            |           +-- inv_shift_rows.vhd      # Inverse ShiftRows
            |           +-- inv_mix_columns.vhd     # Inverse MixColumns (GF(2^8))
            |           +-- inv_sub_bytes.vhd       # InvSubBytes (16x inv S-box)
            |           +-- VGA.vhd                 # VGA display controller
            |           +-- Clock_Divider.vhd       # Pixel clock generator
            |           +-- Font_Rom.vhd            # Character glyph ROM
            |           +-- Pixel_On_Text.vhd       # Text rasteriser
            |           +-- wrapper.vhd             # Display subsystem wrapper
            |           +-- UART_RX3.vhd            # UART receiver
            |           +-- twoMultip.vhd           # GF multiply-by-2 helper
            |           +-- mixMultip.vhd           # GF multiplication helper
            |           +-- commonPak.vhd           # Shared type/constant package
            +-- constrs_1/imports/Downloads/
                +-- Basys3_Master.xdc               # Board B pin constraints
```

---

## Hardware Requirements

| Item | Qty | Notes |
|------|-----|-------|
| Xilinx Basys3 FPGA Board | 2 | Artix-7 XC7A35T |
| PS/2 Keyboard | 1 | Connected to Board A |
| VGA Monitor | 1 | Connected to Board B |
| UART Jumper Wires | 1 set | TX (Board A) -> RX (Board B) + shared GND |
| USB Programming Cables | 2 | One per board |
| Xilinx Vivado Design Suite | — | 2019.x or later recommended |

**UART Wiring:**

```
Board A  J1 (TX)  ------------------>  Board B  RX pin
Board A  GND      ------------------>  Board B  GND
```

---

## Module Documentation

### Board A – Encryption Side

---

#### `TOP.vhd` (project_A)

Top-level integrator for the encryption board.

**Ports**

| Name | Dir | Width | Description |
|------|-----|-------|-------------|
| `clk` | in | 1 | 100 MHz system clock |
| `ps2_clk` | in | 1 | PS/2 clock from keyboard |
| `ps2_data` | in | 1 | PS/2 data from keyboard |
| `Enable` | in | 1 | Initiates UART transmission (slide switch SW0) |
| `TX` | out | 1 | UART serial output |

**Behavior:** Waits until the keyboard module signals that 16 characters have been entered (`isDone`). The 128-bit ASCII plaintext is then passed through the AES pipeline. When `Enable` is asserted, the resulting 128-bit ciphertext is serialised by `UART_TX3` and driven on `TX`.

---

#### `encryption.vhd`

AES-128 encryption pipeline (fully combinatorial).

**Ports**

| Name | Dir | Width | Description |
|------|-----|-------|-------------|
| `input` | in | 128 | Plaintext block |
| `output` | out | 128 | Ciphertext block |

**Round Structure**

```
input
  |
  v
AddKey  (key[1407:1280])     <-- Round 0  (initial whitening)
  |
  v
MainRound (key[1279:1152])   <-- Round 1
  |
  v
MainRound (key[1151:1024])   <-- Round 2
  |
  ...  (rounds 3 through 8 follow the same pattern)
  |
  v
MainRound (key[255:128])     <-- Round 9
  |
  v
FinalRound (key[127:0])      <-- Round 10 (no MixColumns)
  |
  v
output
```

The pre-computed 1408-bit expanded key is stored as a constant inside `addkey.vhd`.

---

#### `mainRound.vhd`

Implements one full AES main round (used for rounds 1–9).

**Generic Parameters**

| Name | Description |
|------|-------------|
| `index` | MSB position of the 128-bit round-key slice within the 1408-bit expanded key |

**Internal Cascade**

```
input --> subbyte --> shiftrow --> mixcolumn --> addkey --> output
```

---

#### `finalRound.vhd`

Implements AES round 10 (final round). Identical to `mainRound` except the MixColumns step is omitted, as required by FIPS 197.

**Internal Cascade**

```
input --> subbyte --> shiftrow --> addkey (index=127) --> output
```

---

#### `addkey.vhd`

AddRoundKey transformation. XORs the 128-bit state with a 128-bit slice of the pre-computed expanded key.

**Generic Parameters**

| Name | Description |
|------|-------------|
| `index` | MSB position; selects `key(index downto index-127)` from the 1408-bit constant |

**Operation**

```
output <= input XOR key(index downto index-127)
```

The expanded key constant is the standard AES key schedule applied to the hardcoded 128-bit master key.

---

#### `subbyte.vhd`

SubBytes transformation. Instantiates 16 parallel `sbox` components, one per byte of the 128-bit state, so all 16 bytes are substituted simultaneously.

---

#### `sbox.vhd`

256-entry combinatorial lookup table implementing the AES forward S-box (FIPS 197, Section 5.1.1).

**Sample Mappings**

| Input | Output |
|-------|--------|
| `0x00` | `0x63` |
| `0x01` | `0x7C` |
| `0x53` | `0xED` |
| `0xFF` | `0x16` |

---

#### `shiftrow.vhd`

ShiftRows transformation. Rotates each row of the 4x4 state matrix left by its row index.

| Row | Left Rotation |
|-----|---------------|
| 0 | 0 bytes (unchanged) |
| 1 | 1 byte |
| 2 | 2 bytes |
| 3 | 3 bytes |

---

#### `mixcolumn.vhd`

MixColumns transformation. Treats each 4-byte column as a polynomial over GF(2^8) and multiplies it by the fixed AES matrix:

```
[ 02  03  01  01 ]
[ 01  02  03  01 ]
[ 01  01  02  03 ]
[ 03  01  01  02 ]
```

All 4 columns are processed in parallel (fully combinatorial). Multiplication by 2 in GF(2^8) is implemented as a left shift with conditional XOR of `0x1B` (the AES irreducible polynomial reduction).

---

#### `ps2_keyboard.vhd`

Low-level PS/2 serial protocol handler.

**Ports**

| Name | Dir | Width | Description |
|------|-----|-------|-------------|
| `clk` | in | 1 | 100 MHz system clock |
| `ps2_clk` | in | 1 | PS/2 clock (10–16 kHz, keyboard-generated) |
| `ps2_data` | in | 1 | PS/2 serial data line |
| `ps2_code` | out | 8 | Captured scancode byte |
| `ps2_code_new` | out | 1 | Pulses high for one cycle when `ps2_code` is valid |

**Operation:** Each PS/2 frame is captured on the falling edge of `ps2_clk`. After receiving the start bit and 8 data bits the module asserts `ps2_code_new` for one system clock cycle.

---

#### `ps2_keyboard_to_ascii.vhd`

Scancode-to-ASCII translator and 16-character accumulator.

**Ports**

| Name | Dir | Width | Description |
|------|-----|-------|-------------|
| `clk` | in | 1 | 100 MHz system clock |
| `ps2_clk` | in | 1 | PS/2 clock |
| `ps2_data` | in | 1 | PS/2 data |
| `ascii_code` | out | 128 | 16 ASCII characters packed into 128 bits |

**State Machine**

```
ready --> new_code --> translate --> output --> ready
```

**Supported Input**
- Letters A–Z with Shift and Caps Lock support
- Digits 0–9 and their shifted symbol variants
- Space, Backspace, Tab, Enter, Escape, Delete
- All printable ASCII symbols on a standard US keyboard layout

Characters are accumulated into a 128-bit shift register. After 16 characters are collected, `isDone` is asserted, signalling the top level to proceed with encryption.

---

#### `UART_TX3.vhd`

UART transmitter supporting 16-bit parallel data input.

**Ports**

| Name | Dir | Width | Description |
|------|-----|-------|-------------|
| `clk` | in | 1 | 100 MHz system clock |
| `enable` | in | 1 | Starts transmission on rising edge |
| `data_in` | in | 16 | Parallel data to transmit |
| `TX` | out | 1 | Serial output (idle HIGH) |

**Generic Parameters**

| Name | Default | Description |
|------|---------|-------------|
| `BAUD_RATE` | 10416 | Clock cycles per bit (yields 9600 baud @ 100 MHz) |

**Frame Format:** 1 start bit (LOW) + 16 data bits (LSB-first) + 1 stop bit (HIGH)

**State Machine:** `IDLE -> START -> DATA -> STOP`

---

### Board B – Decryption Side

---

#### `TOP.vhd` (project_B)

Top-level integrator for the decryption board.

**Ports**

| Name | Dir | Width | Description |
|------|-----|-------|-------------|
| `clk` | in | 1 | 100 MHz system clock |
| `reset` | in | 1 | Active-high system reset |
| `RX` | in | 1 | UART serial input |
| `R`, `G`, `B` | out | 4 each | VGA colour channels (4-bit each) |
| `hsync`, `vsync` | out | 1 each | VGA horizontal / vertical sync |

**Data Flow:** `RX --> UART_RX3 --> Top_decryption --> VGA`

---

#### `Top_decryption.vhd`

AES-128 decryption pipeline (fully combinatorial, mirrors encryption in reverse).

**Ports**

| Name | Dir | Width | Description |
|------|-----|-------|-------------|
| `ciphertext` | in | 128 | Encrypted block |
| `plaintext` | out | 128 | Recovered plaintext |

**Round Key Ordering**

Decryption applies round keys in reverse order compared to encryption:

| Step | Key Slice | is_last_round |
|------|-----------|---------------|
| 0 (initial AddKey) | `key[127:0]` | — |
| Round 1 | `key[255:128]` | 0 |
| Round 2 | `key[383:256]` | 0 |
| ... | ... | ... |
| Round 9 | `key[1279:1152]` | 0 |
| Round 10 (final) | `key[1407:1280]` | 1 (skips InvMixColumns) |

---

#### `decryption.vhd` (Decryption_round)

Single inverse AES round.

**Ports**

| Name | Dir | Width | Description |
|------|-----|-------|-------------|
| `input` | in | 128 | Round input |
| `round_key` | in | 128 | This round's key slice |
| `is_last_round` | in | 1 | When '1', InvMixColumns is bypassed |
| `output` | out | 128 | Round output |

**Internal Cascade**

```
input --> InvShiftRows --> InvSubBytes --> AddRoundKey --> InvMixColumns --> output
                                                               ^
                                           (bypassed when is_last_round = '1')
```

---

#### `inv_sbox.vhd`

256-entry combinatorial lookup table implementing the AES inverse S-box. The exact bitwise inverse of `sbox.vhd`.

---

#### `inv_shift_rows.vhd`

Inverse ShiftRows. Rotates each row *right* (inverse of encryption's left rotation):

| Row | Right Rotation |
|-----|----------------|
| 0 | 0 bytes (unchanged) |
| 1 | 1 byte |
| 2 | 2 bytes |
| 3 | 3 bytes |

---

#### `inv_mix_columns.vhd`

Inverse MixColumns. Multiplies each column by the AES inverse matrix over GF(2^8):

```
[ 0E  0B  0D  09 ]
[ 09  0E  0B  0D ]
[ 0D  09  0E  0B ]
[ 0B  0D  09  0E ]
```

Helper modules `twoMultip.vhd` and `mixMultip.vhd` provide the required GF(2^8) field multiplication primitives.

---

#### `UART_RX3.vhd`

UART receiver that reassembles 8-bit bytes from the serial stream.

**Ports**

| Name | Dir | Width | Description |
|------|-----|-------|-------------|
| `clk` | in | 1 | 100 MHz system clock |
| `RX` | in | 1 | Serial input (idle HIGH) |
| `DATA_OUT` | out | 8 | Received byte |
| `DONE` | out | 1 | Pulses high for one cycle when a byte is complete |

**Generic Parameters**

| Name | Default | Description |
|------|---------|-------------|
| `BAUD_RATE` | 20833 | Half-period cycles; samples at bit centre for noise immunity |

**State Machine:** `IDLE -> START -> DATA -> STOP`

The receiver detects the falling edge of the start bit, waits `BAUD_RATE/2` cycles to reach bit centre, then samples each subsequent data bit every `BAUD_RATE` cycles.

---

#### `VGA.vhd`

VGA display controller. Converts the 128-bit plaintext into 16 ASCII characters and renders them on screen.

**Ports**

| Name | Dir | Width | Description |
|------|-----|-------|-------------|
| `clk` | in | 1 | 100 MHz system clock |
| `reset` | in | 1 | Active-high reset |
| `output` | in | 128 | Decrypted plaintext block |
| `vgaRed`, `vgaGreen`, `vgaBlue` | out | 4 each | VGA colour channels |
| `hsync`, `vsync` | out | 1 each | VGA sync signals |

**Display:** 800x600 resolution. Text is rendered starting at pixel position (50, 50).

**Character Mapping:**
```
displayTextout(15) <- output(7   downto  0)   -- first character received
displayTextout(14) <- output(15  downto  8)
...
displayTextout(0)  <- output(127 downto 120)  -- last character received
```

---

#### `Clock_Divider.vhd`

Divides the 100 MHz system clock down to the ~40 MHz pixel clock required for 800x600 @ 60 Hz VGA output.

---

#### `Font_Rom.vhd`

Read-only memory storing 8x16 pixel glyph bitmaps for the printable ASCII character set. Addressed by character code and row index.

---

#### `Pixel_On_Text.vhd`

Determines whether a given (x, y) VGA pixel coordinate falls within a rendered character glyph. Reads the appropriate bitmap row from `Font_Rom` and outputs a single bit that drives the display colour logic.

---

### Shared / Communication Modules

---

#### `UART.vhd`

Convenience wrapper that combines `UART_TX3` and `UART_RX3` into one component for designs requiring full-duplex UART.

**Ports**

| Name | Dir | Width | Description |
|------|-----|-------|-------------|
| `clk` | in | 1 | 100 MHz clock |
| `data_in` | in | 8 | Byte to transmit |
| `enable` | in | 1 | Trigger transmission |
| `RX` | in | 1 | Serial receive |
| `TX` | out | 1 | Serial transmit |
| `data_out` | out | 8 | Received byte |
| `done` | out | 1 | Byte received flag |

---

#### `UART_controller.vhd`

Combines `Button_debounce` and `UART_TX3`. Ensures a single noisy button press triggers exactly one clean UART transmission.

---

#### `Button_debounce.vhd`

Hardware switch debouncer using a 4-stage cascaded flip-flop filter.

**Generic Parameters**

| Name | Default | Description |
|------|---------|-------------|
| `COUNTER_SIZE` | 10000 | Debounce window in clock cycles (= 100 µs @ 100 MHz) |

**Stages:**
1. Two input flip-flops detect level transitions.
2. A counter waits `COUNTER_SIZE` cycles for the signal to settle.
3. An output flip-flop delivers a single, clean pulse on each confirmed press.

---

## AES-128 Cryptographic Details

This implementation follows **FIPS 197 – Advanced Encryption Standard (AES)** with a 128-bit key and 128-bit block size (AES-128), providing 10 rounds of encryption and decryption.

### Encryption Rounds

| Round | Transformations Applied |
|-------|------------------------|
| 0 (initial) | AddRoundKey |
| 1–9 (main) | SubBytes → ShiftRows → MixColumns → AddRoundKey |
| 10 (final) | SubBytes → ShiftRows → AddRoundKey |

### Decryption Rounds

| Round | Transformations Applied |
|-------|------------------------|
| 0 (initial) | AddRoundKey |
| 1–9 | InvShiftRows → InvSubBytes → AddRoundKey → InvMixColumns |
| 10 (final) | InvShiftRows → InvSubBytes → AddRoundKey |

### Key Schedule

The 128-bit master key is expanded to **1408 bits** (11 x 128-bit round keys) using the standard AES key expansion algorithm. The complete expanded key is **pre-computed offline and stored as a constant** in `addkey.vhd`. This makes the encryption and decryption pipelines entirely combinatorial with no runtime latency for key expansion.

### Implementation Characteristics

- **Fully combinatorial pipeline** – all 10 rounds are purely combinational; output is valid within one clock period of stable input.
- **Parallel S-box instantiation** – 16 independent `sbox` (or `inv_sbox`) instances substitute all 16 bytes simultaneously.
- **GF(2^8) arithmetic** – MixColumns uses XOR for field addition and a left-shift plus conditional XOR of `0x1B` for multiplication by 2; no RAM-based lookup tables are used for field arithmetic.
- **No pipeline registers** – the design trades timing closure at high frequencies for simplicity and minimum latency.

---

## UART Communication Protocol

| Parameter | Value |
|-----------|-------|
| Baud rate | 9600 bps |
| Data bits (TX) | 16 |
| Data bits (RX) | 8 |
| Parity | None |
| Stop bits | 1 |
| Idle state | HIGH |
| Bit order | LSB first |

`UART_TX3` transmits 16-bit words. Sending the full 128-bit ciphertext requires 8 back-to-back transmissions (8 x 16 bits). `UART_RX3` captures 8-bit bytes and the top-level on Board B assembles them into the 128-bit block before decryption.

---

## Pin Assignments

### Board A – `BoardA.xdc`

| Signal | Pin | I/O Standard | Notes |
|--------|-----|-------------|-------|
| `clk` | W5 | LVCMOS33 | 100 MHz on-board oscillator |
| `Enable` | V17 | LVCMOS33 | Slide switch SW0 |
| `TX` | J1 | LVCMOS33 | UART output – JA PMOD header, pin 1 |
| `ps2_clk` | C17 | LVCMOS33 | PS/2 clock, internal pull-up enabled |
| `ps2_data` | B17 | LVCMOS33 | PS/2 data, internal pull-up enabled |

### Board B – `Basys3_Master.xdc`

| Signal | Pin(s) | I/O Standard | Notes |
|--------|--------|-------------|-------|
| `clk` | W5 | LVCMOS33 | 100 MHz on-board oscillator |
| `vgaRed[3:0]` | G19, H19, J19, N19 | LVCMOS33 | VGA red channel |
| `vgaGreen[3:0]` | J17, H17, G17, D17 | LVCMOS33 | VGA green channel |
| `vgaBlue[3:0]` | N18, L18, K18, J18 | LVCMOS33 | VGA blue channel |
| `hsync` | P19 | LVCMOS33 | Horizontal sync |
| `vsync` | R19 | LVCMOS33 | Vertical sync |
| `RX` | — | LVCMOS33 | Uncomment the appropriate PMOD pin in the XDC |
| `reset` | — | LVCMOS33 | Uncomment the desired button or switch in the XDC |

---

## Timing Specifications

### UART Timing

| Metric | Value | Calculation |
|--------|-------|-------------|
| Bit period | 104.17 µs | 10,416 cycles / 100 MHz |
| 16-bit frame duration | ~1.88 ms | 18 bits x 104.17 µs |
| Full 128-bit transfer | ~15 ms | 8 frames x 1.88 ms |

### PS/2 Keyboard Timing

| Metric | Value |
|--------|-------|
| PS/2 clock frequency | 10–16 kHz (keyboard-generated) |
| Bit capture edge | Falling edge of ps2_clk |
| Synchroniser debounce | ~5.12 µs (2^9 cycles / 100 MHz) |

### AES Encryption / Decryption

| Metric | Value |
|--------|-------|
| Pipeline registers | 0 (fully combinatorial) |
| Latency | < 1 clock cycle (combinatorial propagation delay only) |
| Throughput | One 128-bit block per clock cycle once input is stable |

### VGA Timing

| Metric | Value |
|--------|-------|
| Target resolution | 800 x 600 |
| Refresh rate | 60 Hz |
| Pixel clock | ~40 MHz (generated by Clock_Divider) |

---

## Build & Deployment

### Prerequisites

- Xilinx Vivado 2019.1 or later
- Basys3 board files installed in Vivado
- Two Basys3 boards and the required peripherals

### Building Board A (Encryption)

1. Open Vivado and load the existing project, or create a new RTL project targeting **xc7a35tcpg236-1**.
2. Add all VHDL sources from `Project/project_A/project_A/project_A.srcs/sources_1/new/`.
3. Add the constraint file `Project/project_A/project_A/project_A.srcs/constrs_1/new/BoardA.xdc`.
4. Set `TOP.vhd` (project_A) as the top-level design unit.
5. Run **Synthesis**, then **Implementation**, then **Generate Bitstream**.
6. Connect Board A via USB, open **Hardware Manager**, and click **Program Device**.

### Building Board B (Decryption)

1. Open Vivado and load the existing project, or create a new RTL project targeting **xc7a35tcpg236-1**.
2. Add all VHDL sources from `Project/project_B/project_b/project_b.srcs/sources_1/` (both `new/` and `imports/Downloads/` subdirectories).
3. Add the constraint file `Project/project_B/project_b/project_b.srcs/constrs_1/imports/Downloads/Basys3_Master.xdc`.
   - Uncomment the RX pin assignment that matches your wiring to Board A.
   - Uncomment a reset button or switch assignment.
4. Set `TOP.vhd` (project_B) as the top-level design unit.
5. Run **Synthesis**, then **Implementation**, then **Generate Bitstream**.
6. Connect Board B via USB, open **Hardware Manager**, and click **Program Device**.

---

## Usage

1. **Wire the boards** – connect Board A's TX pin (J1 on the JA PMOD header) to Board B's RX pin. Connect a common ground wire between both boards.
2. **Connect peripherals** – attach the PS/2 keyboard to Board A and the VGA monitor to Board B.
3. **Power and program** – program each board with its respective bitstream as described above.
4. **Type your message** – type exactly **16 characters** on the PS/2 keyboard. Each character is accumulated into the 128-bit plaintext register as you type.
5. **Transmit** – flip slide switch **SW0** (pin V17) on Board A to high. This triggers the AES encryption and UART transmission of the 128-bit ciphertext.
6. **View output** – the decrypted 16-character message appears at position (50, 50) on the VGA monitor connected to Board B.

> **Note on message length:** The system uses a fixed 16-character (128-bit) block. If fewer than 16 characters are typed before transmission, the lower bytes of the plaintext register will contain residual data from previous entries.

---

## Key Parameters Reference

| Parameter | Value | Defined In |
|-----------|-------|-----------|
| AES block size | 128 bits | `encryption.vhd`, `Top_decryption.vhd` |
| AES key size | 128 bits | `addkey.vhd` |
| AES rounds | 10 | `encryption.vhd`, `Top_decryption.vhd` |
| Expanded key size | 1408 bits | `addkey.vhd` |
| System clock | 100 MHz | `TOP.vhd` (both boards) |
| UART baud rate | 9600 bps | `UART_TX3.vhd`, `UART_RX3.vhd` |
| TX baud counter | 10,416 cycles/bit | `UART_TX3.vhd` |
| RX baud counter | 20,833 (half-period) | `UART_RX3.vhd` |
| Message length | 16 characters | `ps2_keyboard_to_ascii.vhd` |
| Button debounce window | 10,000 cycles (100 µs) | `Button_debounce.vhd` |
| PS/2 synchroniser depth | 512 cycles (5.12 µs) | `ps2_keyboard.vhd` |
| VGA resolution | 800 x 600 | `VGA.vhd` |
| VGA text position | (50, 50) px | `VGA.vhd` |
| S-box entries | 256 | `sbox.vhd`, `inv_sbox.vhd` |
| Parallel S-box instances | 16 | `subbyte.vhd`, `inv_sub_bytes.vhd` |
