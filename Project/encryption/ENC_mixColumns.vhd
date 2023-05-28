LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY ENC_mixColumns IS
    PORT (
        inval : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
        outval : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
END ENC_mixColumns;

ARCHITECTURE Behavioral OF ENC_mixColumns IS

    --constant matrix: std_logic_vector(127 downto 0):="0010001100010001000100100011000100010001001000110011000100010010";
    SHARED VARIABLE first, second, third, fourth, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen : STD_LOGIC_VECTOR(7 DOWNTO 0); --to store the column needed for multiplication
    SHARED VARIABLE temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8, temp9, temp10, temp11, temp12, temp13, temp14, temp15, temp16 : STD_LOGIC_VECTOR(7 DOWNTO 0); --to store the column needed for multiplication
    SIGNAL m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13, m14, m15, m16 : STD_LOGIC_VECTOR(7 DOWNTO 0);

    --in: d4e0b81ebfb441275d52119830aef1e5
    --out:d4e0482866cbf8068119d326e59a7a4c
    --bi:11010100111000000100100000101000011001101100101111111000000001101000000100011001110100110010011011100101100110100111101001001100

BEGIN
    PROCESS (inval)
    BEGIN
        first := inval((15 * 8) + 7 DOWNTO 15 * 8);
        second := inval((15 * 8) + 7 - 32 DOWNTO 15 * 8 - 32);
        third := inval((15 * 8) + 7 - 64 DOWNTO 15 * 8 - 64);
        fourth := inval((15 * 8) + 7 - 96 DOWNTO 15 * 8 - 96);

        five := inval((14 * 8) + 7 DOWNTO 14 * 8);
        six := inval((14 * 8) + 7 - 32 DOWNTO 14 * 8 - 32);
        seven := inval((14 * 8) + 7 - 64 DOWNTO 14 * 8 - 64);
        eight := inval((14 * 8) + 7 - 96 DOWNTO 14 * 8 - 96);

        nine := inval((13 * 8) + 7 DOWNTO 13 * 8);
        ten := inval((13 * 8) + 7 - 32 DOWNTO 13 * 8 - 32);
        eleven := inval((13 * 8) + 7 - 64 DOWNTO 13 * 8 - 64);
        twelve := inval((13 * 8) + 7 - 96 DOWNTO 13 * 8 - 96);

        thirteen := inval((12 * 8) + 7 DOWNTO 12 * 8);
        fourteen := inval((12 * 8) + 7 - 32 DOWNTO 12 * 8 - 32);
        fifteen := inval((12 * 8) + 7 - 64 DOWNTO 12 * 8 - 64);
        sixteen := inval((12 * 8) + 7 - 96 DOWNTO 12 * 8 - 96);

        -------------------

        IF (first(7) = '1') THEN
            temp1 := (first(6 DOWNTO 0) & "0")XOR "00011011";
        ELSE
            temp1 := (first(6 DOWNTO 0) & "0");
        END IF;

        IF (second(7) = '1') THEN
            temp2 := (second(6 DOWNTO 0) & "0") XOR "00011011";
        ELSE
            temp2 := second(6 DOWNTO 0) & "0";
        END IF;

        IF (third(7) = '1') THEN
            temp3 := (third(6 DOWNTO 0) & "0") XOR "00011011";
        ELSE
            temp3 := third(6 DOWNTO 0) & "0";

        END IF;

        IF (fourth(7) = '1') THEN
            temp4 := (fourth(6 DOWNTO 0) & "0") XOR "00011011";
        ELSE
            temp4 := fourth(6 DOWNTO 0) & "0";
        END IF;

        -----------------

        IF (five(7) = '1') THEN
            temp5 := (five(6 DOWNTO 0) & "0")XOR "00011011";
        ELSE
            temp5 := (five(6 DOWNTO 0) & "0");
        END IF;

        IF (six(7) = '1') THEN
            temp6 := (six(6 DOWNTO 0) & "0") XOR "00011011";
        ELSE
            temp6 := six(6 DOWNTO 0) & "0";
        END IF;

        IF (seven(7) = '1') THEN
            temp7 := (seven(6 DOWNTO 0) & "0") XOR "00011011";
        ELSE
            temp7 := seven(6 DOWNTO 0) & "0";

        END IF;

        IF (eight(7) = '1') THEN
            temp8 := (eight(6 DOWNTO 0) & "0") XOR "00011011";
        ELSE
            temp8 := eight(6 DOWNTO 0) & "0";
        END IF;

        -----------------

        IF (nine(7) = '1') THEN
            temp9 := (nine(6 DOWNTO 0) & "0")XOR "00011011";
        ELSE
            temp9 := (nine(6 DOWNTO 0) & "0");
        END IF;

        IF (ten(7) = '1') THEN
            temp10 := (ten(6 DOWNTO 0) & "0") XOR "00011011";
        ELSE
            temp10 := ten(6 DOWNTO 0) & "0";
        END IF;

        IF (eleven(7) = '1') THEN
            temp11 := (eleven(6 DOWNTO 0) & "0") XOR "00011011";
        ELSE
            temp11 := eleven(6 DOWNTO 0) & "0";

        END IF;

        IF (twelve(7) = '1') THEN
            temp12 := (twelve(6 DOWNTO 0) & "0") XOR "00011011";
        ELSE
            temp12 := twelve(6 DOWNTO 0) & "0";
        END IF;

        -----------------

        IF (thirteen(7) = '1') THEN
            temp13 := (thirteen(6 DOWNTO 0) & "0")XOR "00011011";
        ELSE
            temp13 := (thirteen(6 DOWNTO 0) & "0");
        END IF;

        IF (fourteen(7) = '1') THEN
            temp14 := (fourteen(6 DOWNTO 0) & "0") XOR "00011011";
        ELSE
            temp14 := fourteen(6 DOWNTO 0) & "0";
        END IF;

        IF (fifteen(7) = '1') THEN
            temp15 := (fifteen(6 DOWNTO 0) & "0") XOR "00011011";
        ELSE
            temp15 := fifteen(6 DOWNTO 0) & "0";

        END IF;

        IF (sixteen(7) = '1') THEN
            temp16 := (sixteen(6 DOWNTO 0) & "0") XOR "00011011";
        ELSE
            temp16 := sixteen(6 DOWNTO 0) & "0";
        END IF;

        -----------------
        m1 <= temp1 XOR (temp2 XOR second) XOR third XOR fourth;
        m2 <= first XOR temp2 XOR(temp3 XOR third) XOR fourth;
        m3 <= first XOR second XOR temp3 XOR (temp4 XOR fourth);
        m4 <= (temp1 XOR first) XOR second XOR third XOR temp4;

        m5 <= temp5 XOR (temp6 XOR six) XOR seven XOR eight;
        m6 <= five XOR temp6 XOR(temp7 XOR seven) XOR eight;
        m7 <= five XOR six XOR temp7 XOR (temp8 XOR eight);
        m8 <= (temp5 XOR five) XOR six XOR seven XOR temp8;

        m9 <= temp9 XOR (temp10 XOR ten) XOR eleven XOR twelve;
        m10 <= nine XOR temp10 XOR(temp11 XOR eleven) XOR twelve;
        m11 <= nine XOR ten XOR temp11 XOR (temp12 XOR twelve);
        m12 <= (temp9 XOR nine) XOR ten XOR eleven XOR temp12;

        m13 <= temp13 XOR (temp14 XOR fourteen) XOR fifteen XOR sixteen;
        m14 <= thirteen XOR temp14 XOR(temp15 XOR fifteen) XOR sixteen;
        m15 <= thirteen XOR fourteen XOR temp15 XOR (temp16 XOR sixteen);
        m16 <= (temp13 XOR thirteen) XOR fourteen XOR fifteen XOR temp16;

    END PROCESS;

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