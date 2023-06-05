LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY subbyte IS
    PORT (
        invalue : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
        outvalue : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
END subbyte;

ARCHITECTURE Behavioral OF subbyte IS

    COMPONENT sbox IS
        PORT (
            inval : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            outval : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
    END COMPONENT;

    --signal tempin: std_logic_vector (7 downto 0);
    --signal tempout: std_logic_vector (7 downto 0);
    --signal outread: std_logic_vector(127 downto 0):=
    --"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

    --sbox input: 19a09ae93df4c6f8e3e28d48be2b2a08
    --sbox output: d4e0b81e27bfb44111985d52aef1e530
    --bin:11010100111000001011100000011110001001111011111110110100010000010001000110011000010111010101001010101110011100101110010100110000
    --xxx:11010100111000001011100000011110001001111011111110110100010000010001000110011000010111010101001010101110111100011110010100110000

BEGIN

    sub : FOR i IN 15 DOWNTO 0 GENERATE
        subb : sbox PORT MAP(
            invalue ((i * 8) + 7 DOWNTO i * 8),
            outvalue ((i * 8) + 7 DOWNTO i * 8));
    END GENERATE sub;
