----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/19/2023 07:45:18 PM
-- Design Name: 
-- Module Name: inv_sub_bytes - Behavioral
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

ENTITY inv_sub_bytes IS
    PORT (
        input : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
        output : OUT STD_LOGIC_VECTOR (127 DOWNTO 0));
END inv_sub_bytes;

ARCHITECTURE Behavioral OF inv_sub_bytes IS

    COMPONENT inv_sbox IS
        PORT (
            input_byte : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
            output_byte : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
    END COMPONENT;

BEGIN

    sub : FOR i IN 15 DOWNTO 0 GENERATE
        subb : inv_sbox PORT MAP(
            input ((i * 8) + 7 DOWNTO i * 8),
            output ((i * 8) + 7 DOWNTO i * 8));
    END GENERATE sub;
