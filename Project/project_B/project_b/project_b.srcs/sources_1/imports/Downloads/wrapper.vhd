-- This is a wrapper made for calling Pixel_On_Text.vhd form verilog
-- Since I'm not familiar with mapping string and structure(point_2d) bewteen verilog and vhdl, this is a simple walkaround.
-- By using Pixel_On_Text2.vhd, this file may not be necessary anymore.
-- However, sometimes it's a bit more convenient to group all you text in one place.
-- I also include some sample code for acheiving dynamic text(a simple way).
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- note this line.The package is compiled to this directory by default.
-- so don't forget to include this directory. 
LIBRARY work;
-- this line also is must.This includes the particular package into your program.
USE work.commonPak.ALL;

ENTITY wrapper IS
	PORT (
		clk : IN STD_LOGIC;
		xCoord : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
		yCoord : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
		pixOn : OUT STD_LOGIC
	);
END wrapper;

ARCHITECTURE Behavioral OF wrapper IS

	SIGNAL h : INTEGER := to_integer(signed(xCoord));
	SIGNAL v : INTEGER := to_integer(signed(yCoord));

	-- results
	SIGNAL d1 : STD_LOGIC := '0';
	SIGNAL d2 : STD_LOGIC := '0';
	SIGNAL d3 : STD_LOGIC := '0';

BEGIN
	textElement1 : ENTITY work.Pixel_On_Text
		GENERIC MAP(
			textLength => 38
		)
		PORT MAP(
			clk => clk,
			displayText => "Pixel_On_Text -- test 1!@#$ at (50,50)",
			position => (50, 50),
			horzCoord => h,
			vertCoord => v,
			pixel => d1
		);

	textElement2 : ENTITY work.Pixel_On_Text
		GENERIC MAP(
			textLength => 39
		)
		PORT MAP(
			clk => clk,
			displayText => "Pixel_On_Text -- test 2%^&* at (500,50)",
			position => (500, 50),
			horzCoord => h,
			vertCoord => v,
			pixel => d2
		);

	textElement3 : ENTITY work.Pixel_On_Text
		GENERIC MAP(
			textLength => 41
		)
		PORT MAP(
			clk => clk,
			displayText => "Pixel_On_Text -- test 3()_+-= at (50,130)",
			position => (50, 130),
			horzCoord => h,
			vertCoord => v,
			pixel => d3
		);

	--  -- This is a simply way for a dynamic text. Of course, I know you probably have a better solution :)
	--  -- With a new input "timeDiv", we can switch on different string
	--	with timeDiv select
	--    timeDivDigitNum <=  "Time/Div: 0.8 sec/div  " when 0,
	--                        "Time/Div: 0.2 sec/div  " when 1,
	--                        "Time/Div: 0.1 sec/div  " when 2,
	--                        "Time/Div: 100 ms/div   " when 3,
	--                        "Time/Div: 50 ms/div    " when 4,
	--                        "Time/Div: 10 ms/div    " when 5,
	--                        "Time/Div: 1 ms/div     " when 6,
	--                        "Time/Div: 0.1ms/div    " when 7,
	--                        "Time/Div: unknown      " when OTHERS;

	--    textDrawElement4: entity work.Pixel_On_Text
	--    generic map (
	--        textLength => 23
	--    )
	--    port map(
	--        clk => clk,
	--        reset => reset,
	--        textPassage => timeDivDigitNum ,--& integer'image(timeDiv),
	--        position => (70, 90),
	--        hCount => h,
	--        vCount => v,
	--        drawElement => d4
	--    );

	pixelInTextGroup : PROCESS (clk)
	BEGIN

		IF rising_edge(clk) THEN
			-- the pixel is on when one of the text matched
			pixOn <= d1 OR d2 OR d3;

		END IF;
	END PROCESS;

END Behavioral;