----------------------------------------------------------------------------------
-- Company: German University in Cairo
-- Engineer: Khalid Abdelaziz
-- 
-- Create Date: 05/21/2023 03:45:43 PM
-- Design Name: 
-- Module Name: UART_TX - Behavioral
-- Project Name: 
-- Target Devices: BASYS3
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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ENTITY UART_TX3 IS

    GENERIC (
        BAUD_RATE : INTEGER := 10416 -- 9600 baud @ 100 MHz (100 000 000 / 9600 = 10416.6667)
        DATA_WIDTH : INTEGER := 127
    );

    PORT (
        clk : IN STD_LOGIC; -- 100 MHz  
        enable : IN STD_LOGIC; -- enable transmission 
        data_in : IN STD_LOGIC_VECTOR(DATA_WIDTH DOWNTO 0); -- data to be transmitted 
        TX : OUT STD_LOGIC -- serial output 
    );
END UART_TX3;

ARCHITECTURE RTL OF UART_TX3 IS

    -- state type 
    TYPE Tx_state IS (IDLE, START, DATA, STOP);

    -- state register 
    SIGNAL state : Tx_state := IDLE;

    -- The bit counter 
    SIGNAL data_Index : INTEGER RANGE 0 TO DATA_WIDTH := 0;

    -- The register that holds the data to be transmitted  
    SIGNAL dataReg : STD_LOGIC_VECTOR(DATA_WIDTH DOWNTO 0) := (OTHERS => '0');

    -- baud rate counter
    SIGNAL Clk_Count : INTEGER RANGE 0 TO BAUD_RATE - 1 := 0;

BEGIN

    Transmit : PROCESS (clk)
    BEGIN
        IF (rising_edge(clk)) THEN
            CASE state IS

                WHEN IDLE =>
                    tx <= '1';
                    Clk_Count <= 0;
                    data_Index <= 0;

                    IF (enable = '1') THEN
                        state <= START;
                    END IF;
                WHEN START =>
                    tx <= '0'; -- start bit
                    dataReg <= data_in;
                    IF (clk_Count < BAUD_RATE - 1) THEN
                        clk_Count <= clk_Count + 1;
                    ELSE
                        clk_Count <= 0;
                        state <= DATA;
                    END IF;
                WHEN DATA =>
                    tx <= dataReg(data_Index);
                    IF (clk_Count < baud_rate - 1) THEN
                        clk_Count <= clk_Count + 1;
                    ELSE
                        clk_Count <= 0;

                        IF (data_Index = DATA_WIDTH) THEN
                            state <= STOP;
                        ELSE
                            data_Index <= data_Index + 1;
                        END IF;
                    END IF;
                WHEN STOP =>
                    tx <= '1';
                    IF (clk_Count < baud_rate - 1) THEN
                        clk_Count <= clk_Count + 1;
                    ELSE
                        clk_Count <= 0;
                        state <= IDLE;
                    END IF;
                WHEN OTHERS =>
                    state <= IDLE;
            END CASE;
        END IF;
    END PROCESS;

END ARCHITECTURE RTL;

