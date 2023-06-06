----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/28/2023 04:17:32 PM
-- Design Name: 
-- Module Name: Top_decryption - Behavioral
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
ENTITY Top_decryption IS
    PORT (
        input : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
        key : IN STD_LOGIC_VECTOR (1407 DOWNTO 0);
        output : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
END Top_decryption;

ARCHITECTURE Behavioral OF Top_decryption IS
    COMPONENT decryption_round
        PORT (
            input : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
            round_key : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
            is_last_round : IN STD_LOGIC;
            output : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
    END COMPONENT;

    SIGNAL r0, r1, r2, r3, r4, r5, r6, r7, r8, r9 : STD_LOGIC_VECTOR(127 DOWNTO 0);
    SIGNAL op : STD_LOGIC_VECTOR(127 DOWNTO 0);
BEGIN
    r0 <= input XOR key(127 DOWNTO 0);
    round_1 : Decryption_round PORT MAP(r0, KEY(255 DOWNTO 128), '0', r1);
    round_2 : Decryption_round PORT MAP(r1, KEY(383 DOWNTO 256), '0', r2);
    round_3 : Decryption_round PORT MAP(r2, KEY(511 DOWNTO 384), '0', r3);
    round_4 : Decryption_round PORT MAP(r3, KEY(639 DOWNTO 512), '0', r4);
    round_5 : Decryption_round PORT MAP(r4, KEY(767 DOWNTO 640), '0', r5);
    round_6 : Decryption_round PORT MAP(r5, KEY(895 DOWNTO 768), '0', r6);
    round_7 : Decryption_round PORT MAP(r6, KEY(1023 DOWNTO 896), '0', r7);
    round_8 : Decryption_round PORT MAP(r7, KEY(1151 DOWNTO 1024), '0', r8);
    round_9 : Decryption_round PORT MAP(r8, KEY(1279 DOWNTO 1152), '0', r9);
    round_10 : Decryption_round PORT MAP(r9, KEY(1407 DOWNTO 1280), '1', op);

    output <= op;
END Behavioral;