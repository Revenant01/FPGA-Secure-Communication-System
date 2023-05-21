----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2023 04:51:19 PM
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
USE ieee.numeric_std.ALL;

ENTITY TOP IS

    GENERIC (
        DATA_BITS : POSITIVE := 8; -- Number of data bits
        BAUD_RATE : POSITIVE := 9600; -- Baud rate in bps
        BIT_COUNTER_MAX_VAL : POSITIVE := 10416 -- Baud rate in bps
    );
    PORT (
        CLK : IN STD_LOGIC;

        data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        data_OUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);

        enable : IN STD_LOGIC;

        RX : IN STD_LOGIC;
        TX : OUT STD_LOGIC;

        done : OUT STD_LOGIC
    );

END TOP;

ARCHITECTURE Behavioral OF TOP IS

    COMPONENT UART_TX3 IS
        GENERIC (
            BAUD_RATE : INTEGER := 10416
        );
        PORT (
            clk : IN STD_LOGIC; -- 100 MHz  
            enable : IN STD_LOGIC; -- enable transmission 
            Tx_data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0); -- data to be transmitted 
            TX : OUT STD_LOGIC -- serial output   
        );
    END COMPONENT;
    COMPONENT UART_RX3 IS
        GENERIC (
            BAUD_RATE : INTEGER := 10416
        );
        PORT (
            clk : IN STD_LOGIC;
            RX : IN STD_LOGIC;
            Rx_DATA_OUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            DONE : OUT STD_LOGIC
        );
    END COMPONENT;
BEGIN

    U_TX : UART_TX3
    PORT MAP(clk => CLK, enable => enable, Tx_data_in => data_in, TX => TX);
    U_RX : UART_RX3
    PORT MAP(clk => CLK, Rx => Rx, RX_DATA_OUT => data_out, done => done);
END Behavioral;