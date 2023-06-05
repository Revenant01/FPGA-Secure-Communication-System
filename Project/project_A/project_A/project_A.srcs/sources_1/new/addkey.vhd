
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity addkey is

 generic(index: integer);
 
 Port (inval: in std_logic_vector(127 downto 0);
       outval: out std_logic_vector (127 downto 0) );
end addkey;

architecture Behavioral of addkey is

--a088232afa54a36cfe2c397617b13905
constant key: std_logic_vector(1407 downto 0):=X"2b28ab097eaef7cf15d2154f16a6883ca088232afa54a36cfe2c397617b13905f27a5973c296355995b980f6f2437a7f3d471e6d8016237a47fe7e887d3e443befa8b6db4452710ba55b25ad417f3b00d47cca11d183f2f9c69db815f887bcbc6d11dbca880bf900a33e86937afd41fd4e5f844e545fa6a6f7c94fdc0ef3b24feab5317fd28d2b8d73baf52921d2602fac192867775ad15c66dc2900f321416ed0c9e1b614ee3f63f9250c0ca889c8a6";

begin

outval<= inval xor key(index downto index-127);

end Behavioral;
