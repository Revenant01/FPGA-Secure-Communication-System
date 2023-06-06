LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

USE ieee.math_real.ALL;

PACKAGE commonPak IS

	CONSTANT ADDR_WIDTH : INTEGER := 11;
	CONSTANT DATA_WIDTH : INTEGER := 8;

	CONSTANT FONT_WIDTH : INTEGER := 8;
	CONSTANT FONT_HEIGHT : INTEGER := 16;
	------------------------------------------

	TYPE point_2d IS
	RECORD
	x : INTEGER;
	y : INTEGER;
END RECORD;

TYPE type_textColorMap IS ARRAY(NATURAL RANGE <>) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
------------------------------------------
TYPE type_drawElement IS
RECORD
pixelOn : BOOLEAN;
rgb : STD_LOGIC_VECTOR(7 DOWNTO 0);
END RECORD;
CONSTANT init_type_drawElement : type_drawElement := (pixelOn => false, rgb => (OTHERS => '0'));
TYPE type_drawElementArray IS ARRAY(NATURAL RANGE <>) OF type_drawElement;

------------------------------------------

TYPE type_inArbiterPort IS
RECORD
dataRequest : BOOLEAN;
addr : STD_LOGIC_VECTOR(ADDR_WIDTH - 1 DOWNTO 0);
writeRequest : BOOLEAN;
writeData : STD_LOGIC_VECTOR(DATA_WIDTH - 1 DOWNTO 0);
END RECORD;
CONSTANT init_type_inArbiterPort : type_inArbiterPort := (dataRequest => false, addr => (OTHERS => '0'), writeRequest => false, writeData => (OTHERS => '0'));
TYPE type_inArbiterPortArray IS ARRAY(NATURAL RANGE <>) OF type_inArbiterPort;
TYPE type_outArbiterPort IS
RECORD
dataWaiting : BOOLEAN;
data : STD_LOGIC_VECTOR(DATA_WIDTH - 1 DOWNTO 0);
dataWritten : BOOLEAN;
END RECORD;
CONSTANT init_type_outArbiterPort : type_outArbiterPort := (dataWaiting => false, data => (OTHERS => '0'), dataWritten => false);
TYPE type_outArbiterPortArray IS ARRAY(NATURAL RANGE <>) OF type_outArbiterPort;
----------------------

FUNCTION log2_float(val : POSITIVE) RETURN NATURAL;

END commonPak;

PACKAGE BODY commonPak IS
	FUNCTION log2_float(val : POSITIVE) RETURN NATURAL IS
	BEGIN
		RETURN INTEGER(ceil(log2(real(val))));
	END FUNCTION;
END commonPak;