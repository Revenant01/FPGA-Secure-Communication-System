# FPGA-Secure-Communication-System

This project demonstrates the encryption and decryption of a 128-bit message using the AES algorithm on two Basys3 FPGA boards. The input message is taken from a keyboard connected to the first Basys3 board, encrypted using AES, and then transmitted to the second Basys3 board using UART communication protocol. The second board performs the decryption and displays the original message on a VGA screen.

## Prerequisites
Two Basys3 FPGA boards
Vivado Design Suite (version X or later)
Keyboard (compatible with Basys3 board)
VGA monitor (compatible with Basys3 board)

## Hardware Setup
1.Connect the first Basys3 board to your computer.
2.Connect the keyboard to the appropriate input port on the first Basys3 board.
3.Connect the second Basys3 board to your computer.
4.Connect the VGA monitor to the appropriate output port on the second Basys3 board.

## Software Setup
1.Install Vivado Design Suite on your computer.
2.Open Vivado and create a new project.
3.Select the FPGA device compatible with Basys3 boards.
4Create a new VHDL project and import the necessary source files.
5.Set up the project constraints for both boards, including the UART pins and VGA output pins.

## Project Structure

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

## Implementation
1.The keyboard_interface module handles the input from the keyboard connected to the first Basys3 board and sends the 128-bit message to the aes_encrypt module.  
2.The aes_encrypt module encrypts the received message using the AES algorithm.  
3.The encrypted message is then transmitted from the first Basys3 board to the second Basys3 board using the uart_transmitter module.  
4.The uart_receiver module on the second Basys3 board receives the encrypted message.  
5.The received message is decrypted by the aes_decrypt module.  
6.The vga_display module displays the original decrypted message on the VGA screen connected to the second Basys3 board.  

## Usage
1.Set up the hardware as described in the "Hardware Setup" section.  
2.Configure the Vivado project with the correct device and pin assignments for both boards.  
3.Synthesize, implement, and generate the bitstream for each board.  
4.Program the bitstreams onto the respective Basys3 boards.  
5.Connect the UART pins between the two boards.  
6.Power on both boards.  
7.Type the 128-bit message using the keyboard connected to the first Basys3 board.  
8.Observe the encrypted message being transmitted to the second Basys3 board.  
9.The second Basys3 board will decrypt the message and display it on the VGA screen.  

## Contributing
Contributions to this project are welcome. If you find any issues or want to add new features, please feel free to submit a pull request.

## License
This project is licensed





