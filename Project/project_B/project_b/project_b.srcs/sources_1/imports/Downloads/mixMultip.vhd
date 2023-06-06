LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

PORT (
      first, second, third, fourth : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8, temp9, temp10, temp11, temp12, temp13, temp14, temp15, temp16 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END mixMultip;

ARCHITECTURE Behavioral OF mixMultip IS

      COMPONENT twoMultip IS
            PORT (
                  input : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
                  output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
      END COMPONENT;

      SIGNAL a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15, b16, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16 : STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN

      p1 : twoMultip PORT MAP(fourth, d1);
      d2 <= d1 XOR fourth;
      p2 : twoMultip PORT MAP(d2, d3);
      d4 <= d3 XOR fourth;
      p3 : twoMultip PORT MAP(d4, temp1);

      p4 : twoMultip PORT MAP(third, a1);
      p5 : twoMultip PORT MAP(a1, a2);
      p6 : twoMultip PORT MAP(a2, a3);
      temp2 <= a3 XOR third;

      p7 : twoMultip PORT MAP(second, c1);
      c2 <= c1 XOR second;
      p8 : twoMultip PORT MAP(c2, c3);
      p9 : twoMultip PORT MAP(c3, c4);
      temp3 <= c4 XOR second;

      p10 : twoMultip PORT MAP(first, b1);
      p11 : twoMultip PORT MAP(b1, b2);
      b3 <= b2 XOR first;
      p12 : twoMultip PORT MAP(b3, b4);
      temp4 <= b4 XOR first;

      -------

      p13 : twoMultip PORT MAP(fourth, b5);
      p14 : twoMultip PORT MAP(b5, b6);
      b7 <= b6 XOR fourth;
      p15 : twoMultip PORT MAP(b7, b8);
      temp5 <= b8 XOR fourth;

      p16 : twoMultip PORT MAP(third, d5);
      d6 <= d5 XOR third;
      p17 : twoMultip PORT MAP(d6, d7);
      d8 <= d7 XOR third;
      p18 : twoMultip PORT MAP(d8, temp6);

      p19 : twoMultip PORT MAP(second, a4);
      p20 : twoMultip PORT MAP(a4, a5);
      p21 : twoMultip PORT MAP(a5, a6);
      temp7 <= a6 XOR second;

      p22 : twoMultip PORT MAP(first, c5);
      c6 <= c5 XOR first;
      p23 : twoMultip PORT MAP(c6, c7);
      p24 : twoMultip PORT MAP(c7, c8);
      temp8 <= c8 XOR first;

      -------
      p25 : twoMultip PORT MAP(fourth, c9);
      c10 <= c9 XOR fourth;
      p26 : twoMultip PORT MAP(c10, c11);
      p27 : twoMultip PORT MAP(c11, c12);
      temp9 <= c12 XOR fourth;

      p28 : twoMultip PORT MAP(third, b9);
      p29 : twoMultip PORT MAP(b9, b10);
      b11 <= b10 XOR third;
      p30 : twoMultip PORT MAP(b11, b12);
      temp10 <= b12 XOR third;

      p31 : twoMultip PORT MAP(second, d9);
      d10 <= d9 XOR second;
      p32 : twoMultip PORT MAP(d10, d11);
      d12 <= d11 XOR second;
      p33 : twoMultip PORT MAP(d12, temp11);
      p34 : twoMultip PORT MAP(first, a7);
      p35 : twoMultip PORT MAP(a7, a8);
      p36 : twoMultip PORT MAP(a8, a9);
      temp12 <= a9 XOR first;

      --------
      p37 : twoMultip PORT MAP(fourth, a10);
      p38 : twoMultip PORT MAP(a10, a11);
      p39 : twoMultip PORT MAP(a11, a12);
      temp13 <= a12 XOR fourth;

      p40 : twoMultip PORT MAP(third, c13);
      c14 <= c13 XOR third;
      p41 : twoMultip PORT MAP(c14, c15);
      p42 : twoMultip PORT MAP(c15, c16);
      temp14 <= c16 XOR third;

      p43 : twoMultip PORT MAP(second, b13);
      p44 : twoMultip PORT MAP(b13, b14);
      b15 <= b14 XOR second;
      p45 : twoMultip PORT MAP(b15, b16);
      temp15 <= b16 XOR second;

      p46 : twoMultip PORT MAP(first, d13);
      d14 <= d13 XOR first;
      p47 : twoMultip PORT MAP(d14, d15);
      d16 <= d15 XOR first;
      p48 : twoMultip PORT MAP(d16, temp16);

END Behavioral;