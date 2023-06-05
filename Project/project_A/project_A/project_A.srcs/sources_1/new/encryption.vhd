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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity encryption is

    Port ( input: in std_logic_vector(127 downto 0);
           output: out std_logic_vector(127 downto 0));
end encryption;

architecture Behavioral of encryption is

Component addkey is 

      generic(index: integer);
      
      Port (inval : in std_logic_vector(127 downto 0);
            outval: out std_logic_vector(127 downto 0));
      end component;

component mainRound is

    generic(index: integer);

    Port ( input: in std_logic_vector(127 downto 0);
           output: out std_logic_vector(127 downto 0));
end component;

component finalRound is
    Port ( input: in std_logic_vector(127 downto 0);
           output: out std_logic_vector(127 downto 0));
end component;
      
signal r1 : std_logic_vector(127 downto 0);
signal r2 : std_logic_vector(127 downto 0);
signal r3 : std_logic_vector(127 downto 0);
signal r4 : std_logic_vector(127 downto 0);
signal r5 : std_logic_vector(127 downto 0);
signal r6 : std_logic_vector(127 downto 0);
signal r7 : std_logic_vector(127 downto 0);
signal r8 : std_logic_vector(127 downto 0);
signal r9 : std_logic_vector(127 downto 0);
signal r10 : std_logic_vector(127 downto 0);
signal r11 : std_logic_vector(127 downto 0);

begin

round1 : addkey generic map (1407) port map (input,r1);
round2 : mainRound generic map (1279) port map (r1,r2);
round3 : mainRound generic map (1151) port map (r2,r3);
round4 : mainRound generic map (1023) port map (r3,r4);
round5 : mainRound generic map (895)  port map (r4,r5);
round6 : mainRound generic map (767)  port map (r5,r6);
round7 : mainRound generic map (639)  port map (r6,r7);
round8 : mainRound generic map (511) port map (r7,r8);
round9 : mainRound generic map (383)  port map (r8,r9);
round10 : mainRound generic map (255) port map (r9,r10);
round11 : finalRound port map (r10,r11);

output<= r11;

end Behavioral;
