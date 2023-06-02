
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ENTITY UART_controller IS

    PORT (
        clk : IN STD_LOGIC;
        tx_enable : IN STD_LOGIC;

        data_in : IN STD_LOGIC_VECTOR (15 DOWNTO 0);

        TX : OUT STD_LOGIC
    );
END UART_controller;
ARCHITECTURE Behavioral OF UART_controller IS

    COMPONENT button_debounce
        PORT (
            clk : IN STD_LOGIC;
            button_in : IN STD_LOGIC;
            button_out : OUT STD_LOGIC
        );
    END COMPONENT;
    COMPONENT UART_TX3
        PORT (
             clk : IN STD_LOGIC; -- 100 MHz  
        enable : IN STD_LOGIC; -- enable transmission 
        data_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0); -- data to be transmitted 
        TX : OUT STD_LOGIC -- serial output
        );
    END COMPONENT;

    SIGNAL button_pressed : STD_LOGIC;

BEGIN

    tx_button_controller : button_debounce
    PORT MAP(
        clk => clk,
        button_in => tx_enable,
        button_out => button_pressed
    );

    UART_transceiver : UART_TX3
    PORT MAP(
        clk => clk,
        enable => button_pressed,
        data_in => data_in,
        TX => TX
    );

END Behavioral;