-- Pixel_On_Text determines if the current pixel is on text
-- param:
--   textlength, use to init the string
-- input: 
--   VGA clock(the clk you used to update VGA)
--   display text
--   top left corner of the text box
--   current X and Y position
-- output:
--   a bit that represent whether is the pixel in text

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- note this line.The package is compiled to this directory by default.
-- so don't forget to include this directory. 
LIBRARY work;
-- this line also is must.This includes the particular package into your program.
USE work.commonPak.ALL;

ENTITY Pixel_On_Text IS
	GENERIC (
		-- needed for init displayText, the default value 11 is just a random number
		textLength : INTEGER := 11
	);
	PORT (
		clk : IN STD_LOGIC;
		displayText : IN STRING (1 TO textLength) := (OTHERS => NUL);
		-- top left corner of the text
		position : IN point_2d := (0, 0);
		-- current pixel postion
		horzCoord : IN INTEGER;
		vertCoord : IN INTEGER;

		pixel : OUT STD_LOGIC := '0'
	);

END Pixel_On_Text;

ARCHITECTURE Behavioral OF Pixel_On_Text IS

	SIGNAL fontAddress : INTEGER;
	-- A row of bit in a charactor, we check if our current (x,y) is 1 in char row
	SIGNAL charBitInRow : STD_LOGIC_VECTOR(FONT_WIDTH - 1 DOWNTO 0) := (OTHERS => '0');
	-- char in ASCII code
	SIGNAL charCode : INTEGER := 0;
	-- the position(column) of a charactor in the given text
	SIGNAL charPosition : INTEGER := 0;
	-- the bit position(column) in a charactor
	SIGNAL bitPosition : INTEGER := 0;
BEGIN
	-- (horzCoord - position.x): x positionin the top left of the whole text
	charPosition <= (horzCoord - position.x)/FONT_WIDTH + 1;
	bitPosition <= (horzCoord - position.x) MOD FONT_WIDTH;
	charCode <= CHARACTER'pos(displayText(charPosition));
	-- charCode*16: first row of the char
	fontAddress <= charCode * 16 + (vertCoord - position.y);
	fontRom : ENTITY work.Font_Rom
		PORT MAP(
			clk => clk,
			addr => fontAddress,
			fontRow => charBitInRow
		);

	pixelOn : PROCESS (clk)
		VARIABLE inXRange : BOOLEAN := false;
		VARIABLE inYRange : BOOLEAN := false;
	BEGIN
		IF rising_edge(clk) THEN

			-- reset
			inXRange := false;
			inYRange := false;
			pixel <= '0';
			-- If current pixel is in the horizontal range of text
			IF horzCoord >= position.x AND horzCoord < position.x + (FONT_WIDTH * textlength) THEN
				inXRange := true;
			END IF;

			-- If current pixel is in the vertical range of text
			IF vertCoord >= position.y AND vertCoord < position.y + FONT_HEIGHT THEN
				inYRange := true;
			END IF;

			-- need to check if the pixel is on for text
			IF inXRange AND inYRange THEN
				-- FONT_WIDTH-bitPosition: we are reverting the charactor
				IF charBitInRow(FONT_WIDTH - bitPosition) = '1' THEN
					pixel <= '1';
				END IF;
			END IF;

		END IF;
	END PROCESS;
END Behavioral;