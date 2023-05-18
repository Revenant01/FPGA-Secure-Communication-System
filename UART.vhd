LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY UART IS

    PORT (
        clk : IN STD_LOGIC; -- 100 MHz
        reset : IN STD_LOGIC; -- active high
        tx_start : IN STD_LOGIC; -- active high

        data_in : IN STD_LOGIC_VECTOR (7 DOWNTO 0);  -- data to be transmitted by UART 
        data_out : OUT STD_LOGIC_VECTOR (7 DOWNTO 0); -- data received from UART 

        rx : IN STD_LOGIC; -- UART rx pin 
        tx : OUT STD_LOGIC -- UART tx pin
    );
END UART;
ARCHITECTURE Behavioral OF UART IS

    -- UART transmitter and receiver components 
    COMPONENT UART_tx
        PORT (
            clk : IN STD_LOGIC;
            reset : IN STD_LOGIC;
            tx_start : IN STD_LOGIC;
            tx_data_in : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            tx_data_out : OUT STD_LOGIC
        );
    END COMPONENT;
    COMPONENT UART_rx
        PORT (
            clk : IN STD_LOGIC;
            reset : IN STD_LOGIC;
            rx_data_in : IN STD_LOGIC;
            rx_data_out : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
        );
    END COMPONENT;

BEGIN

    transmitter : UART_tx
    PORT MAP(
        clk => clk,
        reset => reset,
        tx_start => tx_start,
        tx_data_in => data_in,
        tx_data_out => tx
    );
    receiver : UART_rx
    PORT MAP(
        clk => clk,
        reset => reset,
        rx_data_in => rx,
        rx_data_out => data_out
    );
END Behavioral;