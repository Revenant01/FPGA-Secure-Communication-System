LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY UART_Rx IS

    GENERIC (
        BAUD_X16_CLK_TICKS : INTEGER := 65); -- (clk / baud_rate) / 16 => (100 000 000 / 9600) / 16 = 65.104166666666666666666666666667

    PORT (
        clk : IN STD_LOGIC; -- master clock (100 MHz)
        reset : IN STD_LOGIC; -- reset signal (active high)
        rx_data_in : IN STD_LOGIC; -- received data (active low) 
        rx_data_out : OUT STD_LOGIC_VECTOR (7 DOWNTO 0) -- received data (active low)
    );
END UART_Rx;

ARCHITECTURE Behavioral OF UART_rx IS

    TYPE rx_states_t IS (IDLE, START, DATA, STOP); -- FSM states
    SIGNAL rx_state : rx_states_t := IDLE; -- FSM state register (default state is IDLE)

    SIGNAL baud_rate_x16_clk : STD_LOGIC := '0'; -- oversampled clock (16 times faster than the baud rate clock)
    SIGNAL rx_stored_data : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0'); -- received data register

BEGIN
    -- The baud_rate_x16_clk_generator process generates an oversampled clock.
    -- The baud_rate_x16_clk signal is 16 times faster than the baud rate clock.
    -- Oversampling is needed to put the capture point at the middle of duration of
    -- the receiving bit.
    -- The BAUD_X16_CLK_TICKS constant reflects the ratio between the master clk
    -- and the x16 baud rate.

    ----------------------------------------- BAUD_RATE_x16_CLK_GENERATOR PROCESS -------------------------------------------------------------
    baud_rate_x16_clk_generator : PROCESS (clk)
        VARIABLE baud_x16_count : INTEGER RANGE 0 TO (BAUD_X16_CLK_TICKS - 1) := (BAUD_X16_CLK_TICKS - 1); -- counter
    BEGIN
        IF rising_edge(clk) THEN
            IF (reset = '1') THEN
                baud_rate_x16_clk <= '0';
                baud_x16_count := (BAUD_X16_CLK_TICKS - 1);
            ELSE
                IF (baud_x16_count = 0) THEN -- generate the baud_rate_x16_clk signal
                    baud_rate_x16_clk <= '1';
                    baud_x16_count := (BAUD_X16_CLK_TICKS - 1); -- reset the counter
                ELSE -- reset the baud_rate_x16_clk signal
                    baud_rate_x16_clk <= '0';
                    baud_x16_count := baud_x16_count - 1;
                END IF;
            END IF;
        END IF;
    END PROCESS baud_rate_x16_clk_generator;

    ----------------------------------------------- UART_RX_FSM PROCESS --------------------------------------------------------------
    -- The UART_rx_FSM process represents a Finite State Machine which has
    -- four states (IDLE, START, DATA, STOP). See inline comments for more details.

    UART_rx_FSM : PROCESS (clk)
        VARIABLE bit_duration_count : INTEGER RANGE 0 TO 15 := 0; -- counter (counts the duration of the receiving bit)
        VARIABLE bit_count : INTEGER RANGE 0 TO 7 := 0; -- counter (counts the number of received bits)
    BEGIN
        IF rising_edge(clk) THEN
            IF (reset = '1') THEN
                rx_state <= IDLE;
                rx_stored_data <= (OTHERS => '0');
                rx_data_out <= (OTHERS => '0');
                bit_duration_count := 0;
                bit_count := 0;
            ELSE
                IF (baud_rate_x16_clk = '1') THEN -- the FSM works 16 times faster the baud rate frequency
                    CASE rx_state IS

                        WHEN IDLE =>

                            rx_stored_data <= (OTHERS => '0'); -- clean the received data register
                            bit_duration_count := 0; -- keep bit data counter on hold
                            bit_count := 0; -- keep bit counter on hold

                            IF (rx_data_in = '0') THEN -- if the start bit received
                                rx_state <= START; -- transit to the START state
                            END IF;

                        WHEN START =>

                            IF (rx_data_in = '0') THEN -- verify that the start bit is preset
                                IF (bit_duration_count = 7) THEN -- wait a half of the baud rate cycle
                                    rx_state <= DATA; -- (it puts the capture point at the middle of duration of the receiving bit)
                                    bit_duration_count := 0;
                                ELSE
                                    bit_duration_count := bit_duration_count + 1;
                                END IF;
                            ELSE
                                rx_state <= IDLE; -- the start bit is not preset (false alarm)
                            END IF;

                        WHEN DATA =>

                            IF (bit_duration_count = 15) THEN -- wait for "one" baud rate cycle (not strictly one, about one)
                                rx_stored_data(bit_count) <= rx_data_in; -- fill in the receiving register with one received bit.
                                bit_duration_count := 0;
                                IF (bit_count = 7) THEN -- when all 8 bit received, go to the STOP state
                                    rx_state <= STOP;
                                    bit_duration_count := 0;
                                ELSE
                                    bit_count := bit_count + 1;
                                END IF;
                            ELSE
                                bit_duration_count := bit_duration_count + 1;
                            END IF;

                        WHEN STOP =>

                            IF (bit_duration_count = 15) THEN -- wait for "one" baud rate cycle
                                rx_data_out <= rx_stored_data; -- transfer the received data to the outside world
                                rx_state <= IDLE;
                            ELSE
                                bit_duration_count := bit_duration_count + 1;
                            END IF;

                        WHEN OTHERS =>
                            rx_state <= IDLE;
                    END CASE;
                END IF;
            END IF;
        END IF;
    END PROCESS UART_rx_FSM;

END Behavioral;