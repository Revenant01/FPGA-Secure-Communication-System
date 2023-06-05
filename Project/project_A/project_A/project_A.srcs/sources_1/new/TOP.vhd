----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/29/2023 11:59:04 AM
-- Design Name: 
-- Module Name: TOP - Behavioral
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

ENTITY TOP IS
  PORT (
    clk : IN STD_LOGIC;
    ps2_clk : IN STD_LOGIC; --clock signal from PS2 keyboard
    ps2_data : IN STD_LOGIC; --data signal from PS2 keyboard;
    Enable : IN STD_LOGIC;
    TX : OUT STD_LOGIC
  );
END TOP;

ARCHITECTURE Behavioral OF TOP IS

  COMPONENT UART_TX3 IS

    GENERIC (
      BAUD_RATE : INTEGER := 10416 -- 9600 baud @ 100 MHz (100 000 000 / 9600 = 10416.6667)
    );

    PORT (
      clk : IN STD_LOGIC; -- 100 MHz  
      enable : IN STD_LOGIC; -- enable transmission 
      data_in : IN STD_LOGIC_VECTOR(127 DOWNTO 0); -- data to be transmitted 
      TX : OUT STD_LOGIC -- serial output 
    );
  END COMPONENT;

  COMPONENT ps2_keyboard_to_ascii IS
    GENERIC (
      clk_freq : INTEGER := 100_000_000; --system clock frequency in Hz
      ps2_debounce_counter_size : INTEGER := 9); --set such that 2^size/clk_freq = 5us (size = 8 for 50MHz)
    PORT (
      clk : IN STD_LOGIC; --system clock input
      ps2_clk : IN STD_LOGIC; --clock signal from PS2 keyboard
      ps2_data : IN STD_LOGIC; --data signal from PS2 keyboard
      ascii_code : OUT STD_LOGIC_VECTOR(127 DOWNTO 0)); --ASCII value
  END COMPONENT;

  COMPONENT encryption IS

    PORT (
      input : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
      output : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
  END COMPONENT;

  SIGNAL Transmission_in : STD_LOGIC_VECTOR (127 DOWNTO 0);
  SIGNAL enable_Transmission : STD_LOGIC;
  SIGNAL keyBoard_out : STD_LOGIC_VECTOR(127 DOWNTO 0);
  SIGNAL ENC_out : STD_LOGIC_VECTOR(127 DOWNTO 0);

BEGIN

  keyboard_int : ps2_keyboard_to_ascii
  GENERIC MAP(clk_freq => 100_000_000, ps2_debounce_counter_size => 9)
  PORT MAP(
    clk => clk,
    ps2_clk => ps2_clk,
    ps2_data => ps2_data,
    ascii_code => keyBoard_out);

  encrypt : encryption PORT MAP(keyBoard_out, ENC_out);
  Transmission_in <= ENC_out;
  transmission : UART_TX3 GENERIC MAP(BAUD_RATE => 10416)
  PORT MAP(clk => clk, enable => Enable, data_in => Transmission_in, TX => TX);
END Behavioral;