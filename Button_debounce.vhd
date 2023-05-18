LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY button_debounce IS
    GENERIC (
        COUNTER_SIZE : INTEGER := 10_000 
    );
    PORT (
        clk : IN STD_LOGIC; -- master clock signal (100 MHz)
        reset : IN STD_LOGIC;  -- reset signal (active high)
        button_in : IN STD_LOGIC;  -- input signal from the button
        button_out : OUT STD_LOGIC);  -- output signal to the button
END button_debounce;

ARCHITECTURE Behavioral OF button_debounce IS

    SIGNAL flipflop_1 : STD_LOGIC := '0'; -- output of flip-flop 1
    SIGNAL flipflop_2 : STD_LOGIC := '0'; -- output of flip-flop 2
    SIGNAL flipflop_3 : STD_LOGIC := '0'; -- output of flip-flop 3
    SIGNAL flipflop_4 : STD_LOGIC := '0'; -- output of flip-flop 4
    SIGNAL count_start : STD_LOGIC := '0';

BEGIN

    -- The input_flipflops process creates two serial flip-flops (flip-flop 1 and
    -- flip-flop 2). The signal from button_in passes them one by one. If flip_flop_1
    -- and flip_flop_2 are different, it means the button has been activated, and
    -- count_start becomes '1' for one master clock cycle.

    input_flipflops : PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF (reset = '1') THEN
                flipflop_1 <= '0';
                flipflop_2 <= '0';
            ELSE
                flipflop_1 <= button_in;
                flipflop_2 <= flipflop_1;
            END IF;
        END IF;
    END PROCESS input_flipflops;
    -- The count_start signal triggers the pause_counter process to start counting

    count_start <= flipflop_1 XOR flipflop_2;

    -- The pause_counter process passes the button_in signal farther from flip-flop 2
    -- to flip-flop 3, but after COUNTER_SIZE master clock cycles. This allows
    -- the button_in signal to stabilize in a certain state before being passed to the output.

    pause_counter : PROCESS (clk)
        VARIABLE count : INTEGER RANGE 0 TO COUNTER_SIZE := 0;
    BEGIN
        IF rising_edge(clk) THEN
            IF (reset = '1') THEN
                count := 0;
                flipflop_3 <= '0';
            ELSE
                IF (count_start = '1') THEN
                    count := 0;
                ELSIF (count < COUNTER_SIZE) THEN
                    count := count + 1;
                ELSE
                    flipflop_3 <= flipflop_2;
                END IF;
            END IF;
        END IF;
    END PROCESS pause_counter;

    
    -- the purpose of the output_flipflop process is creating another flip-flop (flip-flop 4),
    -- which creates a delay between the flipflop_3 and flipflop_4 signals. The delay is
    -- one master clock cycle long.

    output_flipflop : PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF (reset = '1') THEN
                flipflop_4 <= '0';
            ELSE
                flipflop_4 <= flipflop_3;
            END IF;
        END IF;
    END PROCESS output_flipflop;
    -- The delay is needed to create one short (one master clock cycle long) impuls
    -- at the button_out output. When pause_counter has finished, the flipflop_3 signal gets
    -- the button_in information. At the moment flipflop_4 hasn't changed yet.
    -- This creates '1' at the button_out output for one master clock cycle, only if
    -- flipflop_3 is '1' (The button has been pressed, not released).

    WITH flipflop_3 SELECT
        button_out <= flipflop_3 XOR flipflop_4 WHEN '1',
        '0' WHEN OTHERS;
END Behavioral;