----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2023 05:02:13 PM
-- Design Name: 
-- Module Name: finalRound - Behavioral
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity finalRound is
    Port ( input: in std_logic_vector(127 downto 0);
           output: out std_logic_vector(127 downto 0));
end finalRound;

architecture Behavioral of finalRound is

Component subbyte is 

      Port ( invalue : in std_logic_vector(127 downto 0);
           outvalue: out std_logic_vector(127 downto 0));
      end component;
      
Component shiftrow is 
     
      Port ( inval : in std_logic_vector(127 downto 0);
           outval: out std_logic_vector(127 downto 0));
      end component;
      
Component addkey is 
      
      generic(index: integer);

      Port ( inval : in std_logic_vector(127 downto 0);
            outval: out std_logic_vector(127 downto 0));
      end component;

signal sub : std_logic_vector(127 downto 0);
signal row : std_logic_vector(127 downto 0);
signal key : std_logic_vector(127 downto 0);
      
begin

s : subbyte port map(input,sub);
r : shiftrow port map(sub,row);
k : addkey generic map (127) port map (row,key); 

output<=key;

end behavioral;
