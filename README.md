# FPGA-Secure-Communication-System

This project demonstrates the encryption and decryption of a 128-bit message using the AES algorithm on two Basys3 FPGA boards. The input message is taken from a keyboard connected to the first Basys3 board, encrypted using AES, and then transmitted to the second Basys3 board using UART communication protocol. The second board performs the decryption and displays the original message on a VGA screen.

Prerequisites
Two Basys3 FPGA boards
Vivado Design Suite (version X or later)
Keyboard (compatible with Basys3 board)
VGA monitor (compatible with Basys3 board)

Hardware Setup
Connect the first Basys3 board to your computer.
Connect the keyboard to the appropriate input port on the first Basys3 board.
Connect the second Basys3 board to your computer.
Connect the VGA monitor to the appropriate output port on the second Basys3 board.
Software Setup
Install Vivado Design Suite on your computer.
Open Vivado and create a new project.
Select the FPGA device compatible with Basys3 boards.
Create a new VHDL project and import the necessary source files.
Set up the project constraints for both boards, including the UART pins and VGA output pins.
Project Structure
css
Copy code
project/
├── src/
│   ├── aes_encrypt.vhd
│   ├── aes_decrypt.vhd
│   ├── uart_transmitter.vhd
│   ├── uart_receiver.vhd
│   ├── keyboard_interface.vhd
│   ├── vga_display.vhd
│   ├── top_module.vhd
│   └── ...
├── constraints/
│   ├── first_board.xdc
│   ├── second_board.xdc
│   └── ...
├── README.md
└── ...
src/: Contains the VHDL source files for each component of the project.
constraints/: Contains the constraint files defining pin assignments for each board.
README.md: The documentation file you're currently reading.
Implementation
The keyboard_interface module handles the input from the keyboard connected to the first Basys3 board and sends the 128-bit message to the aes_encrypt module.
The aes_encrypt module encrypts the received message using the AES algorithm.
The encrypted message is then transmitted from the first Basys3 board to the second Basys3 board using the uart_transmitter module.
The uart_receiver module on the second Basys3 board receives the encrypted message.
The received message is decrypted by the aes_decrypt module.
The vga_display module displays the original decrypted message on the VGA screen connected to the second Basys3 board.
Usage
Set up the hardware as described in the "Hardware Setup" section.
Configure the Vivado project with the correct device and pin assignments for both boards.
Synthesize, implement, and generate the bitstream for each board.
Program the bitstreams onto the respective Basys3 boards.
Connect the UART pins between the two boards.
Power on both boards.
Type the 128-bit message using the keyboard connected to the first Basys3 board.
Observe the encrypted message being transmitted to the second Basys3 board.
The second Basys3 board will decrypt the message and display it on the VGA screen.
Contributing
Contributions to this project are welcome. If you find any issues or want to add new features, please feel free to submit a pull request.

License
This project is licensed





