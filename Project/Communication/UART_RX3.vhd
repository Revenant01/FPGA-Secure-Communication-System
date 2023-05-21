LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ENTITY UART_RX3 IS
    GENERIC (
        BAUD_RATE : INTEGER := 10416
    );

    PORT (
        clk : IN STD_LOGIC;
        RX : IN STD_LOGIC;
        DATA_OUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        DONE : OUT STD_LOGIC
    );
END UART_RX3;
ARCHITECTURE RTL OF UART_RX3 IS

    TYPE state_type IS (IDLE, START, DATA, STOP);
    SIGNAL state : state_type := IDLE;

    SIGNAL DataReg : STD_LOGIC_VECTOR(7 DOWNTO 0) := (others => '0');
    SIGNAL clk_count : INTEGER  RANGE 0 TO (Baud_Rate - 1) := 0;
    SIGNAL data_index_counter : INTEGER  RANGE 0 TO 7 := 0;
    SIGNAL isDone : STD_LOGIC := '0';

BEGIN

    receiver : PROCESS (clk)
    begin
        IF (rising_edge(clk)) THEN

            CASE state IS
                WHEN IDLE =>
                    --RX <= '1';
                    clk_count <= 0;
                    data_index_counter <= 0;
                    isDone <= '0';

                    IF (RX = '0') THEN
                        state <= START;
                    END IF;
                WHEN Start =>
                    IF (clk_count = (Baud_Rate / 2) - 1) THEN
                        IF (RX = '0') THEN
                            state <= DATA;
                            clk_count <= 0;
                        ELSE
                            state <= IDLE;
                        END IF;

                    ELSE
                        clk_count <= clk_count + 1;
                    END IF;

                WHEN DATA =>

                    IF (clk_count = Baud_rate - 1) THEN
                        clk_count <= 0;
                        DataReg(data_index_counter) <= RX;
                        IF (data_index_counter = 7) THEN
                            state <= STOP;
                        ELSE
                            data_index_counter <= data_index_counter + 1;
                        END IF;
                    ELSE
                        clk_count <= clk_count + 1;
                    END IF;

                WHEN STOP =>
                    IF (clk_count = Baud_Rate - 1) THEN
                        clk_count <= 0;
                        state <= IDLE;
                        isDone <= '1';
                    ELSE
                        clk_count <= clk_count + 1;
                    END IF;
                WHEN OTHERS =>
                    state <= IDLE;
            END CASE;
        END IF;
    END PROCESS;

    DATA_OUT <= DataReg;
    DONE <= isDone;

END ARCHITECTURE RTL;