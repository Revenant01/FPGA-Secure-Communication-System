----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2023 04:38:04 PM
-- Design Name: 
-- Module Name: mainRound - Behavioral
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


ENTITY ENC_mainRound IS

    GENERIC (index : INTEGER);

    PORT (
        input : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
        output : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
END ENC_mainRound;

ARCHITECTURE Behavioral OF ENC_mainRound IS

    COMPONENT ENC_subBytes IS

        PORT (
            invalue : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
            outvalue : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
    END COMPONENT;

    COMPONENT ENC_shiftRows IS

        PORT (
            inval : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
            outval : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
    END COMPONENT;

    COMPONENT ENC_mixColumns IS
        PORT (
            inval : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
            outval : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
    END COMPONENT;

    COMPONENT ENC_addKey IS

        GENERIC (index : INTEGER);

        PORT (
            inval : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
            outval : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
    END COMPONENT;

    SIGNAL sub : STD_LOGIC_VECTOR(127 DOWNTO 0);
    SIGNAL row : STD_LOGIC_VECTOR(127 DOWNTO 0);
    SIGNAL mix : STD_LOGIC_VECTOR(127 DOWNTO 0);
    SIGNAL key : STD_LOGIC_VECTOR(127 DOWNTO 0);

BEGIN

    s : ENC_subBytes PORT MAP(input, sub);
    r : ENC_shiftRows PORT MAP(sub, row);
    m : ENC_mixColumns PORT MAP(row, mix);
    k : ENC_addKey GENERIC MAP(index) PORT MAP(mix, key);

    output <= key;

END behavioral;