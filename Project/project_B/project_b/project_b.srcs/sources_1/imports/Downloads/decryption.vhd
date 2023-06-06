----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/25/2023 06:57:30 PM
-- Design Name: 
-- Module Name: decryption - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY Decryption_round IS
    PORT (
        input : IN STD_LOGIC_VECTOR(127 DOWNTO 0); -- input block
        round_key : IN STD_LOGIC_VECTOR(127 DOWNTO 0); -- input round subkey
        is_last_round : IN STD_LOGIC; -- determines whether round is last
        output : OUT STD_LOGIC_VECTOR(127 DOWNTO 0)); -- output block
END Decryption_round;

ARCHITECTURE Behavioural OF Decryption_round IS
    COMPONENT inv_sbox
        PORT (
            input_byte : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            output_byte : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
    END COMPONENT;

    COMPONENT inv_shift_rows
        PORT (
            input : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
            output : OUT STD_LOGIC_VECTOR (127 DOWNTO 0));
    END COMPONENT;

    COMPONENT inv_mix_columns IS
        PORT (
            inval : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
            outval : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
    END COMPONENT;

    SIGNAL after_shift_rows : STD_LOGIC_VECTOR(127 DOWNTO 0);
    SIGNAL after_byte_substitution : STD_LOGIC_VECTOR(127 DOWNTO 0);
    SIGNAL after_mix_columns : STD_LOGIC_VECTOR(127 DOWNTO 0);
    SIGNAL temp : STD_LOGIC_VECTOR(127 DOWNTO 0);
BEGIN
    -- first is the step of shifting rows
    shift_rows_map : inv_shift_rows PORT MAP(input, after_shift_rows);

    -- generate SBoxes for each byte of shifted block
    generate_sboxes : FOR i IN 15 DOWNTO 0 GENERATE
        sbox_map : inv_sbox
        PORT MAP(
            input_byte => after_shift_rows(8 * i + 7 DOWNTO 8 * i),
            output_byte => after_byte_substitution(8 * i + 7 DOWNTO 8 * i));
    END GENERATE generate_sboxes;

    -- add round key
    temp <= after_byte_substitution XOR round_key;

    -- perform the step of mixing columns
    mix_columns_map : inv_mix_columns PORT MAP(temp, after_mix_columns);

    -- in case IS_LAST_ROUND is 1, it's the last round and the mix columns step is skipped
    output <= after_mix_columns WHEN IS_LAST_ROUND = '0' ELSE
        temp;
END ARCHITECTURE;