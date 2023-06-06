----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/29/2023 05:59:41 PM
-- Design Name: 
-- Module Name: twoMultip - Behavioral
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
ENTITY twoMultip IS
    PORT (
        input : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        output : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
END twoMultip;

ARCHITECTURE Behavioral OF twoMultip IS
BEGIN
    PROCESS (input)
    BEGIN
        IF (input(7) = '1') THEN
            output <= (input(6 DOWNTO 0) & "0") XOR "00011011";
        ELSE
            output <= (input(6 DOWNTO 0) & "0");
        END IF;
    END PROCESS;
END Behavioral;