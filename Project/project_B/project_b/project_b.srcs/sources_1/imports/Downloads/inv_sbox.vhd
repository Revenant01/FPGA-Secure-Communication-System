----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/20/2023 07:32:31 PM
-- Design Name: 
-- Module Name: inv_sbox - Behavioral
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
ENTITY inv_sbox IS
	PORT (
		input_byte : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		output_byte : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
END inv_sbox;

ARCHITECTURE Behavioral OF inv_sbox IS

BEGIN

	PROCESS (input_byte)
	BEGIN
		CASE input_byte IS
			WHEN x"00" => output_byte <= x"52";
			WHEN x"01" => output_byte <= x"09";
			WHEN x"02" => output_byte <= x"6a";
			WHEN x"03" => output_byte <= x"d5";
			WHEN x"04" => output_byte <= x"30";
			WHEN x"05" => output_byte <= x"36";
			WHEN x"06" => output_byte <= x"a5";
			WHEN x"07" => output_byte <= x"38";
			WHEN x"08" => output_byte <= x"bf";
			WHEN x"09" => output_byte <= x"40";
			WHEN x"0a" => output_byte <= x"a3";
			WHEN x"0b" => output_byte <= x"9e";
			WHEN x"0c" => output_byte <= x"81";
			WHEN x"0d" => output_byte <= x"f3";
			WHEN x"0e" => output_byte <= x"d7";
			WHEN x"0f" => output_byte <= x"fb";
			WHEN x"10" => output_byte <= x"7c";
			WHEN x"11" => output_byte <= x"e3";
			WHEN x"12" => output_byte <= x"39";
			WHEN x"13" => output_byte <= x"82";
			WHEN x"14" => output_byte <= x"9b";
			WHEN x"15" => output_byte <= x"2f";
			WHEN x"16" => output_byte <= x"ff";
			WHEN x"17" => output_byte <= x"87";
			WHEN x"18" => output_byte <= x"34";
			WHEN x"19" => output_byte <= x"8e";
			WHEN x"1a" => output_byte <= x"43";
			WHEN x"1b" => output_byte <= x"44";
			WHEN x"1c" => output_byte <= x"c4";
			WHEN x"1d" => output_byte <= x"de";
			WHEN x"1e" => output_byte <= x"e9";
			WHEN x"1f" => output_byte <= x"cb";
			WHEN x"20" => output_byte <= x"54";
			WHEN x"21" => output_byte <= x"7b";
			WHEN x"22" => output_byte <= x"94";
			WHEN x"23" => output_byte <= x"32";
			WHEN x"24" => output_byte <= x"a6";
			WHEN x"25" => output_byte <= x"c2";
			WHEN x"26" => output_byte <= x"23";
			WHEN x"27" => output_byte <= x"3d";
			WHEN x"28" => output_byte <= x"ee";
			WHEN x"29" => output_byte <= x"4c";
			WHEN x"2a" => output_byte <= x"95";
			WHEN x"2b" => output_byte <= x"0b";
			WHEN x"2c" => output_byte <= x"42";
			WHEN x"2d" => output_byte <= x"fa";
			WHEN x"2e" => output_byte <= x"c3";
			WHEN x"2f" => output_byte <= x"4e";
			WHEN x"30" => output_byte <= x"08";
			WHEN x"31" => output_byte <= x"2e";
			WHEN x"32" => output_byte <= x"a1";
			WHEN x"33" => output_byte <= x"66";
			WHEN x"34" => output_byte <= x"28";
			WHEN x"35" => output_byte <= x"d9";
			WHEN x"36" => output_byte <= x"24";
			WHEN x"37" => output_byte <= x"b2";
			WHEN x"38" => output_byte <= x"76";
			WHEN x"39" => output_byte <= x"5b";
			WHEN x"3a" => output_byte <= x"a2";
			WHEN x"3b" => output_byte <= x"49";
			WHEN x"3c" => output_byte <= x"6d";
			WHEN x"3d" => output_byte <= x"8b";
			WHEN x"3e" => output_byte <= x"d1";
			WHEN x"3f" => output_byte <= x"25";
			WHEN x"40" => output_byte <= x"72";
			WHEN x"41" => output_byte <= x"f8";
			WHEN x"42" => output_byte <= x"f6";
			WHEN x"43" => output_byte <= x"64";
			WHEN x"44" => output_byte <= x"86";
			WHEN x"45" => output_byte <= x"68";
			WHEN x"46" => output_byte <= x"98";
			WHEN x"47" => output_byte <= x"16";
			WHEN x"48" => output_byte <= x"d4";
			WHEN x"49" => output_byte <= x"a4";
			WHEN x"4a" => output_byte <= x"5c";
			WHEN x"4b" => output_byte <= x"cc";
			WHEN x"4c" => output_byte <= x"5d";
			WHEN x"4d" => output_byte <= x"65";
			WHEN x"4e" => output_byte <= x"b6";
			WHEN x"4f" => output_byte <= x"92";
			WHEN x"50" => output_byte <= x"6c";
			WHEN x"51" => output_byte <= x"70";
			WHEN x"52" => output_byte <= x"48";
			WHEN x"53" => output_byte <= x"50";
			WHEN x"54" => output_byte <= x"fd";
			WHEN x"55" => output_byte <= x"ed";
			WHEN x"56" => output_byte <= x"b9";
			WHEN x"57" => output_byte <= x"da";
			WHEN x"58" => output_byte <= x"5e";
			WHEN x"59" => output_byte <= x"15";
			WHEN x"5a" => output_byte <= x"46";
			WHEN x"5b" => output_byte <= x"57";
			WHEN x"5c" => output_byte <= x"a7";
			WHEN x"5d" => output_byte <= x"8d";
			WHEN x"5e" => output_byte <= x"9d";
			WHEN x"5f" => output_byte <= x"84";
			WHEN x"60" => output_byte <= x"90";
			WHEN x"61" => output_byte <= x"d8";
			WHEN x"62" => output_byte <= x"ab";
			WHEN x"63" => output_byte <= x"00";
			WHEN x"64" => output_byte <= x"8c";
			WHEN x"65" => output_byte <= x"bc";
			WHEN x"66" => output_byte <= x"d3";
			WHEN x"67" => output_byte <= x"0a";
			WHEN x"68" => output_byte <= x"f7";
			WHEN x"69" => output_byte <= x"e4";
			WHEN x"6a" => output_byte <= x"58";
			WHEN x"6b" => output_byte <= x"05";
			WHEN x"6c" => output_byte <= x"b8";
			WHEN x"6d" => output_byte <= x"b3";
			WHEN x"6e" => output_byte <= x"45";
			WHEN x"6f" => output_byte <= x"06";
			WHEN x"70" => output_byte <= x"d0";
			WHEN x"71" => output_byte <= x"2c";
			WHEN x"72" => output_byte <= x"1e";
			WHEN x"73" => output_byte <= x"8f";
			WHEN x"74" => output_byte <= x"ca";
			WHEN x"75" => output_byte <= x"3f";
			WHEN x"76" => output_byte <= x"0f";
			WHEN x"77" => output_byte <= x"02";
			WHEN x"78" => output_byte <= x"c1";
			WHEN x"79" => output_byte <= x"af";
			WHEN x"7a" => output_byte <= x"bd";
			WHEN x"7b" => output_byte <= x"03";
			WHEN x"7c" => output_byte <= x"01";
			WHEN x"7d" => output_byte <= x"13";
			WHEN x"7e" => output_byte <= x"8a";
			WHEN x"7f" => output_byte <= x"6b";
			WHEN x"80" => output_byte <= x"3a";
			WHEN x"81" => output_byte <= x"91";
			WHEN x"82" => output_byte <= x"11";
			WHEN x"83" => output_byte <= x"41";
			WHEN x"84" => output_byte <= x"4f";
			WHEN x"85" => output_byte <= x"67";
			WHEN x"86" => output_byte <= x"dc";
			WHEN x"87" => output_byte <= x"ea";
			WHEN x"88" => output_byte <= x"97";
			WHEN x"89" => output_byte <= x"f2";
			WHEN x"8a" => output_byte <= x"cf";
			WHEN x"8b" => output_byte <= x"ce";
			WHEN x"8c" => output_byte <= x"f0";
			WHEN x"8d" => output_byte <= x"b4";
			WHEN x"8e" => output_byte <= x"e6";
			WHEN x"8f" => output_byte <= x"73";
			WHEN x"90" => output_byte <= x"96";
			WHEN x"91" => output_byte <= x"ac";
			WHEN x"92" => output_byte <= x"74";
			WHEN x"93" => output_byte <= x"22";
			WHEN x"94" => output_byte <= x"e7";
			WHEN x"95" => output_byte <= x"ad";
			WHEN x"96" => output_byte <= x"35";
			WHEN x"97" => output_byte <= x"85";
			WHEN x"98" => output_byte <= x"e2";
			WHEN x"99" => output_byte <= x"f9";
			WHEN x"9a" => output_byte <= x"37";
			WHEN x"9b" => output_byte <= x"e8";
			WHEN x"9c" => output_byte <= x"1c";
			WHEN x"9d" => output_byte <= x"75";
			WHEN x"9e" => output_byte <= x"df";
			WHEN x"9f" => output_byte <= x"6e";
			WHEN x"a0" => output_byte <= x"47";
			WHEN x"a1" => output_byte <= x"f1";
			WHEN x"a2" => output_byte <= x"1a";
			WHEN x"a3" => output_byte <= x"71";
			WHEN x"a4" => output_byte <= x"1d";
			WHEN x"a5" => output_byte <= x"29";
			WHEN x"a6" => output_byte <= x"c5";
			WHEN x"a7" => output_byte <= x"89";
			WHEN x"a8" => output_byte <= x"6f";
			WHEN x"a9" => output_byte <= x"b7";
			WHEN x"aa" => output_byte <= x"62";
			WHEN x"ab" => output_byte <= x"0e";
			WHEN x"ac" => output_byte <= x"aa";
			WHEN x"ad" => output_byte <= x"18";
			WHEN x"ae" => output_byte <= x"be";
			WHEN x"af" => output_byte <= x"1b";
			WHEN x"b0" => output_byte <= x"fc";
			WHEN x"b1" => output_byte <= x"56";
			WHEN x"b2" => output_byte <= x"3e";
			WHEN x"b3" => output_byte <= x"4b";
			WHEN x"b4" => output_byte <= x"c6";
			WHEN x"b5" => output_byte <= x"d2";
			WHEN x"b6" => output_byte <= x"79";
			WHEN x"b7" => output_byte <= x"20";
			WHEN x"b8" => output_byte <= x"9a";
			WHEN x"b9" => output_byte <= x"db";
			WHEN x"ba" => output_byte <= x"c0";
			WHEN x"bb" => output_byte <= x"fe";
			WHEN x"bc" => output_byte <= x"78";
			WHEN x"bd" => output_byte <= x"cd";
			WHEN x"be" => output_byte <= x"5a";
			WHEN x"bf" => output_byte <= x"f4";
			WHEN x"c0" => output_byte <= x"1f";
			WHEN x"c1" => output_byte <= x"dd";
			WHEN x"c2" => output_byte <= x"a8";
			WHEN x"c3" => output_byte <= x"33";
			WHEN x"c4" => output_byte <= x"88";
			WHEN x"c5" => output_byte <= x"07";
			WHEN x"c6" => output_byte <= x"c7";
			WHEN x"c7" => output_byte <= x"31";
			WHEN x"c8" => output_byte <= x"b1";
			WHEN x"c9" => output_byte <= x"12";
			WHEN x"ca" => output_byte <= x"10";
			WHEN x"cb" => output_byte <= x"59";
			WHEN x"cc" => output_byte <= x"27";
			WHEN x"cd" => output_byte <= x"80";
			WHEN x"ce" => output_byte <= x"ec";
			WHEN x"cf" => output_byte <= x"5f";
			WHEN x"d0" => output_byte <= x"60";
			WHEN x"d1" => output_byte <= x"51";
			WHEN x"d2" => output_byte <= x"7f";
			WHEN x"d3" => output_byte <= x"a9";
			WHEN x"d4" => output_byte <= x"19";
			WHEN x"d5" => output_byte <= x"b5";
			WHEN x"d6" => output_byte <= x"4a";
			WHEN x"d7" => output_byte <= x"0d";
			WHEN x"d8" => output_byte <= x"2d";
			WHEN x"d9" => output_byte <= x"e5";
			WHEN x"da" => output_byte <= x"7a";
			WHEN x"db" => output_byte <= x"9f";
			WHEN x"dc" => output_byte <= x"93";
			WHEN x"dd" => output_byte <= x"c9";
			WHEN x"de" => output_byte <= x"9c";
			WHEN x"df" => output_byte <= x"ef";
			WHEN x"e0" => output_byte <= x"a0";
			WHEN x"e1" => output_byte <= x"e0";
			WHEN x"e2" => output_byte <= x"3b";
			WHEN x"e3" => output_byte <= x"4d";
			WHEN x"e4" => output_byte <= x"ae";
			WHEN x"e5" => output_byte <= x"2a";
			WHEN x"e6" => output_byte <= x"f5";
			WHEN x"e7" => output_byte <= x"b0";
			WHEN x"e8" => output_byte <= x"c8";
			WHEN x"e9" => output_byte <= x"eb";
			WHEN x"ea" => output_byte <= x"bb";
			WHEN x"eb" => output_byte <= x"3c";
			WHEN x"ec" => output_byte <= x"83";
			WHEN x"ed" => output_byte <= x"53";
			WHEN x"ee" => output_byte <= x"99";
			WHEN x"ef" => output_byte <= x"61";
			WHEN x"f0" => output_byte <= x"17";
			WHEN x"f1" => output_byte <= x"2b";
			WHEN x"f2" => output_byte <= x"04";
			WHEN x"f3" => output_byte <= x"7e";
			WHEN x"f4" => output_byte <= x"ba";
			WHEN x"f5" => output_byte <= x"77";
			WHEN x"f6" => output_byte <= x"d6";
			WHEN x"f7" => output_byte <= x"26";
			WHEN x"f8" => output_byte <= x"e1";
			WHEN x"f9" => output_byte <= x"69";
			WHEN x"fa" => output_byte <= x"14";
			WHEN x"fb" => output_byte <= x"63";
			WHEN x"fc" => output_byte <= x"55";
			WHEN x"fd" => output_byte <= x"21";
			WHEN x"fe" => output_byte <= x"0c";
			WHEN x"ff" => output_byte <= x"7d";
			WHEN OTHERS => NULL; -- GHDL complains without this statement
		END CASE;

	END PROCESS;

END behavioral;