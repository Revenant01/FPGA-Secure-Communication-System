----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/19/2023 04:18:29 PM
-- Design Name: 
-- Module Name: inv_shift_rows - Behavioral
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
ENTITY inv_shift_rows IS
    PORT (
        input : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
        output : OUT STD_LOGIC_VECTOR (127 DOWNTO 0));
END inv_shift_rows;

ARCHITECTURE Behavioral OF inv_shift_rows IS
    SHARED VARIABLE count : INTEGER := 0;
    SIGNAL outp : STD_LOGIC_VECTOR (127 DOWNTO 0);
BEGIN
    PROCESS (input)
    BEGIN

        outp <= input;
        --second row
        outp(87 DOWNTO 80) <= input(95 DOWNTO 88);
        outp(79 DOWNTO 72) <= input(87 DOWNTO 80);
        outp(71 DOWNTO 64) <= input(79 DOWNTO 72);
        outp(95 DOWNTO 88) <= input(71 DOWNTO 64);

        --third row    
        outp(47 DOWNTO 40) <= input(63 DOWNTO 56);
        outp(39 DOWNTO 32) <= input(55 DOWNTO 48);
        outp(63 DOWNTO 56) <= input(47 DOWNTO 40);
        outp(55 DOWNTO 48) <= input(39 DOWNTO 32);

        --fourth row
        outp(7 DOWNTO 0) <= input(31 DOWNTO 24);
        outp(31 DOWNTO 24) <= input(23 DOWNTO 16);
        outp(23 DOWNTO 16) <= input(15 DOWNTO 8);
        outp(15 DOWNTO 8) <= input(7 DOWNTO 0);
    END PROCESS;
    output <= outp;

END Behavioral;