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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY mainRound IS

      GENERIC (index : INTEGER);

      PORT (
            input : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
            output : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
END mainRound;

ARCHITECTURE Behavioral OF mainRound IS

      COMPONENT subbyte IS

            PORT (
                  invalue : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
                  outvalue : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
      END COMPONENT;

      COMPONENT shiftrow IS

            PORT (
                  inval : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
                  outval : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
      END COMPONENT;

      COMPONENT mixcolumn IS
            PORT (
                  inval : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
                  outval : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
      END COMPONENT;

      COMPONENT addkey IS

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

      s : subbyte PORT MAP(input, sub);
      r : shiftrow PORT MAP(sub, row);
      m : mixcolumn PORT MAP(row, mix);
      k : addkey GENERIC MAP(index) PORT MAP(mix, key);

      output <= key;

END behavioral;