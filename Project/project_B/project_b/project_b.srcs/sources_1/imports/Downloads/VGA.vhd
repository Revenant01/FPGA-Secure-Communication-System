LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_textio.ALL;
USE std.textio.ALL;
USE IEEE.NUMERIC_STD.ALL;
ENTITY VGA IS

    PORT (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        output : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
        vgaRed : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        vgaGreen : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        vgaBlue : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        hsync : OUT STD_LOGIC;
        vsync : OUT STD_LOGIC

    );
END VGA;

ARCHITECTURE Behavioral OF VGA IS

    COMPONENT Clock_Divider IS
        PORT (
            clk, reset : IN STD_LOGIC;
            clock_out : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT wrapper IS

        PORT (
            clk : IN STD_LOGIC;
            xCoord : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
            yCoord : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
            pixOn : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL Clock_Out : STD_LOGIC;
    SIGNAL Video_Out : STD_LOGIC := '0';
    SIGNAL h : INTEGER RANGE 0 TO 800 := 0;
    SIGNAL v : INTEGER RANGE 0 TO 525 := 0;
    SIGNAL displayTextout : STRING (15 DOWNTO 0) := (OTHERS => 'm');
    SIGNAL intermediateData : STD_LOGIC_VECTOR (127 DOWNTO 0);
    SIGNAL S : STRING(15 DOWNTO 0);
    SIGNAL data : STD_LOGIC_VECTOR(7 DOWNTO 0);
    --signal output : std_logic_vector(127 downto 0);
    ----function to_hstring (SLV : std_logic_vector(7 downto 0)) return string is
    --    variable L : line;
    --  begin
    --    hwrite(L,SLV);
    --    return L.all;
    --  end function to_hstring;

    -- results
    SIGNAL d1 : STD_LOGIC := '0';

BEGIN
    --output <= "01101000011001010110110001101100011011110010000001110111011011110111001001101100011001000010000001101000011010010010000000101110";

    --process (Clock_Out) is 
    --begin
    --for i in 0 to 15 loop
    --data <= output ((8*(i+1) - 1 )downto (i)*8 );
    --S(i)<= character'val(to_integer(unsigned(data)));
    --displayTextout(i) <= S(i);
    --end loop;
    --end process;

    displayTextout(15) <= CHARACTER'val(to_integer(unsigned(output(7 DOWNTO 0))));
    displayTextout(14) <= CHARACTER'val(to_integer(unsigned(output(15 DOWNTO 8))));
    displayTextout(13) <= CHARACTER'val(to_integer(unsigned(output(23 DOWNTO 16))));
    displayTextout(12) <= CHARACTER'val(to_integer(unsigned(output(31 DOWNTO 24))));
    displayTextout(11) <= CHARACTER'val(to_integer(unsigned(output(39 DOWNTO 32))));
    displayTextout(10) <= CHARACTER'val(to_integer(unsigned(output(47 DOWNTO 40))));
    displayTextout(9) <= CHARACTER'val(to_integer(unsigned(output(55 DOWNTO 48))));
    displayTextout(8) <= CHARACTER'val(to_integer(unsigned(output(63 DOWNTO 56))));
    displayTextout(7) <= CHARACTER'val(to_integer(unsigned(output(71 DOWNTO 64))));
    displayTextout(6) <= CHARACTER'val(to_integer(unsigned(output(79 DOWNTO 72))));
    displayTextout(5) <= CHARACTER'val(to_integer(unsigned(output(87 DOWNTO 80))));
    displayTextout(4) <= CHARACTER'val(to_integer(unsigned(output(95 DOWNTO 88))));
    displayTextout(3) <= CHARACTER'val(to_integer(unsigned(output(103 DOWNTO 96))));
    displayTextout(2) <= CHARACTER'val(to_integer(unsigned(output(111 DOWNTO 104))));
    displayTextout(1) <= CHARACTER'val(to_integer(unsigned(output(119 DOWNTO 112))));
    displayTextout(0) <= CHARACTER'val(to_integer(unsigned(output(127 DOWNTO 120))));
    textElement1 : ENTITY work.Pixel_On_Text
        GENERIC MAP(
            textLength => 16
        )
        PORT MAP(
            clk => Clock_Out,
            displayText => displayTextout,
            position => (50, 50),
            horzCoord => h,
            vertCoord => v,
            pixel => d1
        );

    CD : Clock_Divider PORT MAP(clk, reset, Clock_Out);

    ----------------------------------------------------------------------------------------
    -- Process 1
    ----------------------------------------------------------------------------------------
    HL_Position : PROCESS (Clock_Out, reset)
    BEGIN
        IF (reset = '1') THEN
            h <= 0;
        ELSIF (rising_edge(Clock_Out)) THEN
            IF (h = 799) THEN
                h <= 0;
            ELSE
                h <= h + 1;
            END IF;
        END IF;
    END PROCESS;

    ----------------------------------------------------------------------------------------
    -- Process 2
    ----------------------------------------------------------------------------------------
    VL_Position : PROCESS (Clock_Out, reset, h)
    BEGIN
        IF (reset = '1') THEN
            v <= 0;
        ELSIF (rising_edge(Clock_Out)) THEN
            IF (h = 799) THEN
                IF (v = 525) THEN
                    v <= 0;
                ELSE
                    v <= v + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    ----------------------------------------------------------------------------------------
    -- Process 3
    ----------------------------------------------------------------------------------------
    HL_Sync : PROCESS (Clock_Out, reset, h)
    BEGIN
        IF (reset = '1') THEN
            Hsync <= '1';
        ELSIF (rising_edge(Clock_Out)) THEN
            IF (h > 655 AND h < 752) THEN
                Hsync <= '0';
            ELSE
                Hsync <= '1';
            END IF;
        END IF;
    END PROCESS;

    ----------------------------------------------------------------------------------------
    -- Process 4
    ----------------------------------------------------------------------------------------
    VL_Sync : PROCESS (Clock_Out, reset, v)
    BEGIN
        IF (reset = '1') THEN
            Vsync <= '1';
        ELSIF (rising_edge(Clock_Out)) THEN
            IF (v > 489 AND v < 492) THEN
                Vsync <= '0';
            ELSE
                Vsync <= '1';
            END IF;
        END IF;
    END PROCESS;

    ----------------------------------------------------------------------------------------
    -- Process 5
    ----------------------------------------------------------------------------------------
    Display : PROCESS (Clock_Out, reset, h, v)
    BEGIN
        IF (reset = '1') THEN
            Video_Out <= '0';
        ELSIF (rising_edge(Clock_Out)) THEN
            IF (v < 490 AND h < 656) THEN
                Video_Out <= '1';
            ELSE
                Video_Out <= '0';
            END IF;
        END IF;
    END PROCESS;

    ----------------------------------------------------------------------------------------
    -- Process 6
    ----------------------------------------------------------------------------------------
    PROCESS (Video_Out)
    BEGIN
        IF (Video_Out = '1') THEN
            IF (d1 = '1') THEN
                vgaRed <= "1111";
                vgaBlue <= "1111";
                vgaGreen <= "1111";
            END IF;
        ELSE
            vgaRed <= "0000";
            vgaBlue <= "0000";
            vgaGreen <= "0000";
        END IF;
    END PROCESS;
END Behavioral;