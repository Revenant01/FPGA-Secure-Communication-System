LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY shiftrow IS
    PORT (
        inval : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
        outval : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
END shiftrow;

ARCHITECTURE Behavioral OF shiftrow IS

    SHARED VARIABLE count : INTEGER := 0;
    SIGNAL outp : STD_LOGIC_VECTOR (127 DOWNTO 0);
    --input:d4e0b81e27bfb44111985d52aef1e530
    --output:d4e0b81ebfb441275d52119830aef1e5
    --bin:11010100111000001011100000011110101111111011010001000001001001110101110101010010000100011001100000110000101011101111000111100101
    --xxx:11010100111000001011100000011110101111111011010001000001001001110101110101010010000100011001100000110000101011101111000111100101

BEGIN

    PROCESS (inval)
    BEGIN

        outp <= inval;
        --second row
        outp(95 DOWNTO 88) <= inval(87 DOWNTO 80);
        outp(87 DOWNTO 80) <= inval(79 DOWNTO 72);
        outp(79 DOWNTO 72) <= inval(71 DOWNTO 64);
        outp(71 DOWNTO 64) <= inval(95 DOWNTO 88);

        --third row    
        outp(63 DOWNTO 56) <= inval(47 DOWNTO 40);
        outp(55 DOWNTO 48) <= inval(39 DOWNTO 32);
        outp(47 DOWNTO 40) <= inval(63 DOWNTO 56);
        outp(39 DOWNTO 32) <= inval(55 DOWNTO 48);

        --fourth row
        outp(31 DOWNTO 24) <= inval(7 DOWNTO 0);
        outp(23 DOWNTO 16) <= inval(31 DOWNTO 24);
        outp(15 DOWNTO 8) <= inval(23 DOWNTO 16);
        outp(7 DOWNTO 0) <= inval(15 DOWNTO 8);
    END PROCESS;
    outval <= outp;
END Behavioral;