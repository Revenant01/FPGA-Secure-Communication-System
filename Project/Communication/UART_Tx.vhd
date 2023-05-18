LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY UART_tx IS

    GENERIC (
        BAUD_CLK_TICKS : INTEGER := 1041); -- clk/baud_rate (100 000 000 / 9600 = 1,041.6666666666666666666666666667)

    PORT (
        clk : IN STD_LOGIC; -- master clk (100 MHz)
        reset : IN STD_LOGIC; -- reset signal (active high)
        tx_start : IN STD_LOGIC; -- start signal to be used as an input from a button (active high)
        tx_data_in : IN STD_LOGIC_VECTOR (7 DOWNTO 0); -- data to be transmitted (8 bits) 
        tx_data_out : OUT STD_LOGIC -- serial output (1 bit) to be connected to the UART_rx module
    );
END UART_tx;
ARCHITECTURE Behavioral OF UART_tx IS

    TYPE tx_states_t IS (IDLE, START, DATA, STOP); -- states of the UART_tx_FSM process 
    SIGNAL tx_state : tx_states_t := IDLE; -- current state of the UART_tx_FSM process 
    SIGNAL baud_rate_clk : STD_LOGIC := '0'; -- baud rate clock (9600 Hz)

    SIGNAL data_index : INTEGER RANGE 0 TO 7 := 0; -- index of the stored_data vector (0 to 7) used to index the data vector to a serial output
    SIGNAL data_index_reset : STD_LOGIC := '1'; -- reset signal for the data_index_counter process
    SIGNAL stored_data : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0'); -- data to be transmitted (8 bits) stored during the transmission hold by the tx_start_detector process

    SIGNAL start_detected : STD_LOGIC := '0'; -- start impulse detected by the tx_start_detector process
    SIGNAL start_reset : STD_LOGIC := '0';  -- reset signal for the tx_start_detector process

BEGIN

    ----------------------------------------- BAUD_RATE_CLK_GENERATOR PROCESS --------------------------------------------------------------

    -- The baud_rate_clk_generator process generates the UART baud rate clock by
    -- setting the baud_rate_clk signal when the counter counts BAUD_CLK_TICKS
    -- ticks of the master clk. The BAUD_CLK_TICKS constant is specified in
    -- the package and reflects the ratio between the master clk and the baud rate.
    baud_rate_clk_generator : PROCESS (clk)
        VARIABLE baud_count : INTEGER RANGE 0 TO (BAUD_CLK_TICKS - 1) := (BAUD_CLK_TICKS - 1); -- counter for the baud_rate_clk_generator process
    BEGIN
        IF rising_edge(clk) THEN
            IF (reset = '1') THEN
                baud_rate_clk <= '0';
                baud_count := (BAUD_CLK_TICKS - 1);
            ELSE
                IF (baud_count = 0) THEN -- set baud_rate_clk when the counter reaches BAUD_CLK_TICKS
                    baud_rate_clk <= '1';
                    baud_count := (BAUD_CLK_TICKS - 1); -- reset the counter
                ELSE -- reset baud_rate_clk when the counter reaches BAUD_CLK_TICKS
                    baud_rate_clk <= '0';
                    baud_count := baud_count - 1;
                END IF;
            END IF;
        END IF;
    END PROCESS baud_rate_clk_generator;
    ----------------------------------------- TX_START_DETECTOR PROCESS --------------------------------------------------------------
    -- The tx_start_detector process works on the master clk frequency and catches
    -- short (one clk cycle long) impulses in the tx_start signal and keeps it for
    -- the UART_tx_FSM. tx_start_detector is needed because the UART_tx_FSM works on
    -- the baud rate frequency, but the button_debounce module generates one master clk
    -- cycle long impulse per one button push. start_detected keeps the information that
    -- such event has occurred.
    -- The second purpose of tx_start_detector is to secure the transmitting data.
    -- stored_data keeps the transmitting data saved during the transmission.

    tx_start_detector : PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF (reset = '1') OR (start_reset = '1') THEN -- reset tx_start_detector when reset or start_reset is active 
                start_detected <= '0';
            ELSE
                IF (tx_start = '1') AND (start_detected = '0') THEN -- catch the impulse and save the data to be transmitted
                    start_detected <= '1';
                    stored_data <= tx_data_in;
                END IF;
            END IF;
        END IF;
    END PROCESS tx_start_detector;
    ----------------------------------------- DATA_INDEX_COUNTER PROCESS --------------------------------------------------------------
    -- The data_index_counter process is a simple counter from 0 to 7 working on the baud
    -- rate frequency. It is used to perform transformation between the parallel
    -- data (stored_data) and the serial output (tx_data_out).
    -- The data_index signal is used in UART_tx_FSM to go over the stored_data vector
    -- and send the bits one by one.

    data_index_counter : PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF (reset = '1') OR (data_index_reset = '1') THEN -- reset data_index_counter when reset or data_index_reset is active
                data_index <= 0;
                ELSIF (baud_rate_clk = '1') THEN -- increment data_index_counter when baud_rate_clk is active
                    data_index <= data_index + 1;
            END IF;
        END IF;
    END PROCESS data_index_counter;

    ------------------------------------------- UART_TX_FSM PROCESS -------------------------------------------------------------------
    -- The UART_FSM_tx process represents a Finite State Machine which has
    -- four states (IDLE, START, DATA, STOP). See inline comments for more details.

    UART_tx_FSM : PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF (reset = '1') THEN
                tx_state <= IDLE;
                data_index_reset <= '1'; -- keep data_index_counter on hold
                start_reset <= '1'; -- keep tx_start_detector on hold
                tx_data_out <= '1'; -- keep tx line set along the standard
            ELSE
                IF (baud_rate_clk = '1') THEN -- the FSM works on the baud rate frequency
                    CASE tx_state IS

                        WHEN IDLE =>

                            data_index_reset <= '1'; -- keep data_index_counter on hold
                            start_reset <= '0'; -- enable tx_start_detector to wait for starting impulses
                            tx_data_out <= '1'; -- keep tx line set along the standard

                            IF (start_detected = '1') THEN
                                tx_state <= START;
                            END IF;

                        WHEN START =>

                            data_index_reset <= '0'; -- enable data_index_counter for DATA state
                            tx_data_out <= '0'; -- send '0' as a start bit

                            tx_state <= DATA;

                        WHEN DATA =>

                            tx_data_out <= stored_data(data_index); -- send one bit per one baud clock cycle 8 times

                            IF (data_index = 7) THEN
                                data_index_reset <= '1'; -- disable data_index_counter when it has reached 8
                                tx_state <= STOP;
                            END IF;

                        WHEN STOP =>

                            tx_data_out <= '1'; -- send '1' as a stop bit
                            start_reset <= '1'; -- prepare tx_start_detector to be ready detecting the next impuls in IDLE

                            tx_state <= IDLE;

                        WHEN OTHERS =>
                            tx_state <= IDLE; -- reset the FSM when it is in an undefined state 
                    END CASE;
                END IF;
            END IF;
        END IF;
    END PROCESS UART_tx_FSM;

END Behavioral;