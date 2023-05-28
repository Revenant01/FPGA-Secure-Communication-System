
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ENTITY UART_controller IS

    PORT (
        clk : IN STD_LOGIC;
        tx_enable : IN STD_LOGIC;

        data_in : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
        data_out : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);

        RX : IN STD_LOGIC;
        TX : OUT STD_LOGIC;
        
        done : OUT STD_LOGIC
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
    COMPONENT UART
        PORT (
            clk : IN STD_LOGIC;

        data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);

        enable : IN STD_LOGIC;

        RX : IN STD_LOGIC;
        TX : OUT STD_LOGIC;

        done : OUT STD_LOGIC
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

    UART_transceiver : UART
    PORT MAP(
        clk => clk,
        enable => button_pressed,
        data_in => data_in,
        data_out => data_out,
        RX => RX,
        TX => TX, 
        done => done
    );

END Behavioral;