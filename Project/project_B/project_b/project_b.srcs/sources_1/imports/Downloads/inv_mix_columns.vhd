LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY inv_mix_columns IS
  PORT (
    inval : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    outval : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
END inv_mix_columns;

ARCHITECTURE Behavioral OF inv_mix_columns IS

  COMPONENT mixMultip IS
    PORT (
      first, second, third, fourth : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8, temp9, temp10, temp11, temp12, temp13, temp14, temp15, temp16 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
  END COMPONENT;

  --constant matrix: std_logic_vector(127 downto 0):="0010001100010001000100100011000100010001001000110011000100010010";
  SIGNAL first, second, third, fourth, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen : STD_LOGIC_VECTOR(7 DOWNTO 0); --to store the column needed for multiplication
  SIGNAL m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13, m14, m15, m16 : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15, b16, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16 : STD_LOGIC_VECTOR(7 DOWNTO 0);

  --in: d4e0b81ebfb441275d52119830aef1e5
  --out:d4e0482866cbf8068119d326e59a7a4c
  --bi:11010100111000000100100000101000011001101100101111111000000001101000000100011001110100110010011011100101100110100111101001001100

BEGIN

  first <= inval((15 * 8) + 7 DOWNTO 15 * 8);
  second <= inval((15 * 8) + 7 - 32 DOWNTO 15 * 8 - 32);
  third <= inval((15 * 8) + 7 - 64 DOWNTO 15 * 8 - 64);
  fourth <= inval((15 * 8) + 7 - 96 DOWNTO 15 * 8 - 96);

  five <= inval((14 * 8) + 7 DOWNTO 14 * 8);
  six <= inval((14 * 8) + 7 - 32 DOWNTO 14 * 8 - 32);
  seven <= inval((14 * 8) + 7 - 64 DOWNTO 14 * 8 - 64);
  eight <= inval((14 * 8) + 7 - 96 DOWNTO 14 * 8 - 96);

  nine <= inval((13 * 8) + 7 DOWNTO 13 * 8);
  ten <= inval((13 * 8) + 7 - 32 DOWNTO 13 * 8 - 32);
  eleven <= inval((13 * 8) + 7 - 64 DOWNTO 13 * 8 - 64);
  twelve <= inval((13 * 8) + 7 - 96 DOWNTO 13 * 8 - 96);

  thirteen <= inval((12 * 8) + 7 DOWNTO 12 * 8);
  fourteen <= inval((12 * 8) + 7 - 32 DOWNTO 12 * 8 - 32);
  fifteen <= inval((12 * 8) + 7 - 64 DOWNTO 12 * 8 - 64);
  sixteen <= inval((12 * 8) + 7 - 96 DOWNTO 12 * 8 - 96);

  ----------------------------------
  p1 : mixMultip PORT MAP(first, second, third, fourth, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16);
  p2 : mixMultip PORT MAP(five, six, seven, eight, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15, b16);
  p3 : mixMultip PORT MAP(nine, ten, eleven, twelve, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16);
  p4 : mixMultip PORT MAP(thirteen, fourteen, fifteen, sixteen, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16);

  -----------------
  m1 <= a13 XOR a14 XOR a15 XOR a16;
  m2 <= a9 XOR a10 XOR a11 XOR a12;
  m3 <= a5 XOR a6 XOR a7 XOR a8;
  m4 <= a1 XOR a2 XOR a3 XOR a4;

  m8 <= b1 XOR b2 XOR b3 XOR b4;
  m7 <= b5 XOR b6 XOR b7 XOR b8;
  m6 <= b9 XOR b10 XOR b11 XOR b12;
  m5 <= b13 XOR b14 XOR b15 XOR b16;

  m12 <= c1 XOR c2 XOR c3 XOR c4;
  m11 <= c5 XOR c6 XOR c7 XOR c8;
  m10 <= c9 XOR c10 XOR c11 XOR c12;
  m9 <= c13 XOR c14 XOR c15 XOR c16;

  m16 <= d1 XOR d2 XOR d3 XOR d4;
  m15 <= d5 XOR d6 XOR d7 XOR d8;
  m14 <= d9 XOR d10 XOR d11 XOR d12;
  m13 <= d13 XOR d14 XOR d15 XOR d16;
  outval((15 * 8) + 7 DOWNTO 15 * 8) <= m1;
  outval((15 * 8) + 7 - 32 DOWNTO 15 * 8 - 32) <= m2;
  outval((15 * 8) + 7 - 64 DOWNTO 15 * 8 - 64) <= m3;
  outval((15 * 8) + 7 - 96 DOWNTO 15 * 8 - 96) <= m4;

  outval((14 * 8) + 7 DOWNTO 14 * 8) <= m5;
  outval((14 * 8) + 7 - 32 DOWNTO 14 * 8 - 32) <= m6;
  outval((14 * 8) + 7 - 64 DOWNTO 14 * 8 - 64) <= m7;
  outval((14 * 8) + 7 - 96 DOWNTO 14 * 8 - 96) <= m8;

  outval((13 * 8) + 7 DOWNTO 13 * 8) <= m9;
  outval((13 * 8) + 7 - 32 DOWNTO 13 * 8 - 32) <= m10;
  outval((13 * 8) + 7 - 64 DOWNTO 13 * 8 - 64) <= m11;
  outval((13 * 8) + 7 - 96 DOWNTO 13 * 8 - 96) <= m12;

  outval((12 * 8) + 7 DOWNTO 12 * 8) <= m13;
  outval((12 * 8) + 7 - 32 DOWNTO 12 * 8 - 32) <= m14;
  outval((12 * 8) + 7 - 64 DOWNTO 12 * 8 - 64) <= m15;
  outval((12 * 8) + 7 - 96 DOWNTO 12 * 8 - 96) <= m16;

END Behavioral;