----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2023 08:50:56 PM
-- Design Name: 
-- Module Name: encryption - Behavioral
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
ENTITY ENC_encryptionTop IS

    PORT (
        input : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
        output : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
END ENC_encryptionTop;

ARCHITECTURE Behavioral OF ENC_encryptionTop IS

    COMPONENT ENC_addKey IS

        GENERIC (index : INTEGER);

        PORT (
            inval : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
            outval : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
    END COMPONENT;

    COMPONENT ENC_mainRound IS

        GENERIC (index : INTEGER);

        PORT (
            input : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
            output : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
    END COMPONENT;

    COMPONENT ENC_finalRound IS
        PORT (
            input : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
            output : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
    END COMPONENT;

    SIGNAL r1 : STD_LOGIC_VECTOR(127 DOWNTO 0);
    SIGNAL r2 : STD_LOGIC_VECTOR(127 DOWNTO 0);
    SIGNAL r3 : STD_LOGIC_VECTOR(127 DOWNTO 0);
    SIGNAL r4 : STD_LOGIC_VECTOR(127 DOWNTO 0);
    SIGNAL r5 : STD_LOGIC_VECTOR(127 DOWNTO 0);
    SIGNAL r6 : STD_LOGIC_VECTOR(127 DOWNTO 0);
    SIGNAL r7 : STD_LOGIC_VECTOR(127 DOWNTO 0);
    SIGNAL r8 : STD_LOGIC_VECTOR(127 DOWNTO 0);
    SIGNAL r9 : STD_LOGIC_VECTOR(127 DOWNTO 0);
    SIGNAL r10 : STD_LOGIC_VECTOR(127 DOWNTO 0);
    SIGNAL r11 : STD_LOGIC_VECTOR(127 DOWNTO 0);

BEGIN

    round1 : ENC_addKey GENERIC MAP(1407) PORT MAP(input, r1);
    round2 : ENC_mainRound GENERIC MAP(1279) PORT MAP(r1, r2);
    round3 : ENC_mainRound GENERIC MAP(1151) PORT MAP(r2, r3);
    round4 : ENC_mainRound GENERIC MAP(1023) PORT MAP(r3, r4);
    round5 : ENC_mainRound GENERIC MAP(895) PORT MAP(r4, r5);
    round6 : ENC_mainRound GENERIC MAP(767) PORT MAP(r5, r6);
    round7 : ENC_mainRound GENERIC MAP(639) PORT MAP(r6, r7);
    round8 : ENC_mainRound GENERIC MAP(511) PORT MAP(r7, r8);
    round9 : ENC_mainRound GENERIC MAP(383) PORT MAP(r8, r9);
    round10 : ENC_mainRound GENERIC MAP(255) PORT MAP(r9, r10);
    round11 : ENC_finalRound PORT MAP(r10, r11);

    output <= r11;

END Behavioral;