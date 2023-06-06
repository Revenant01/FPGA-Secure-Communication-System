LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Clock_Divider IS
    PORT (
        clk, reset : IN STD_LOGIC;
        clock_out : OUT STD_LOGIC);
END Clock_Divider;

ARCHITECTURE Behavioral OF Clock_Divider IS

    SIGNAL count : INTEGER := 0;
    SIGNAL tmp : STD_LOGIC := '0';

BEGIN

    PROCESS (clk, reset)
    BEGIN
        IF (reset = '1') THEN
            count <= 0;
            tmp <= '0';
        ELSIF (clk'event AND clk = '1') THEN
            count <= count + 1;
            IF (count = 1) THEN
                tmp <= NOT tmp;
                count <= 0;
            END IF;
        END IF;
        clock_out <= tmp;
    END PROCESS;

END Behavioral;