----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2023 11:16:03 AM
-- Design Name: 
-- Module Name: ps2_keyboard - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ps2_keyboard IS
    GENERIC (
        clk_freq : INTEGER := 100_000_000; --system clock frequency in Hz
        debounce_counter_size : INTEGER := 9); --set such that 2^size/clk_freq = 5.12us (size = 8 for 50MHz)
    PORT (
        clk : IN STD_LOGIC; --system clock
        ps2_clk : IN STD_LOGIC; --clock signal from PS2 keyboard
        ps2_data : IN STD_LOGIC; --data signal from PS2 keyboard
        ps2_code_new : OUT STD_LOGIC; --flag that new PS/2 code is available on ps2_code bus
        ps2_code : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) --code received from PS/2
    );
END ps2_keyboard;

ARCHITECTURE Behavioral OF ps2_keyboard IS
    SIGNAL start : STD_LOGIC; -- signal to indicate start bit (Active LOW) 
    SIGNAL ps2_code_sig : STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL counter : INTEGER RANGE 0 TO 10;
BEGIN
    PROCESS (ps2_clk)
    BEGIN
        IF falling_edge(ps2_clk) THEN

            -- Indicates the initialization of transmission as the start bit is received (0) , then it will reset again and wait for the next start bit
            -- while not receiving anything from the ps2_data line bus , we will set the counter to be 0 , the line will again be set to HIGH, 
            -- The ps2_code_new is still to LOW because we are not able to receive new key from the ps2_data line bus  
            IF (ps2_data = '0'AND start = '0') THEN

                counter <= 0;
                start <= '1';
                ps2_code_new <= '0';

            -- The process of receiving from the ps2 data lines is taking place and the counter is increamented to receive the 8 bits of data.
            -- since the communication is synchronous , we will wait for the next falling edge of the ps2_clk to receive the next bit of data, 
            -- then it's placed in the register ps2_code_sig and the counter is increamented to receive the next bit of data.
            -- The ps2_code_new is set to LOW because we are not able to receive new key from the ps2_data line bus    
            ELSIF (counter < 8) THEN

                counter <= counter + 1;
                ps2_code_sig(counter) <= ps2_data;
                ps2_code_new <= '0';
                start <= '1';

            -- The counter reaches 8 means all data bits have been transmitted.    
            ELSIF (counter = 8) THEN

                ps2_code_new <= '0';
                start <= '1';
                counter <= counter + 1;
            ELSE

                start <= '0';
                ps2_code <= ps2_code_sig;
                ps2_code_new <= '1';

            END IF;
        END IF;

    END PROCESS;
END Behavioral;