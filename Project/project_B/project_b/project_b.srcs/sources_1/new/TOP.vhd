----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/29/2023 02:06:12 PM
-- Design Name: 
-- Module Name: TOP - Behavioral
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
ENTITY TOP IS
    PORT (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        RX : IN STD_LOGIC; -- data to be transmitted 
        R : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        G : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        B : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        hsync : OUT STD_LOGIC;
        vsync : OUT STD_LOGIC);
END TOP;

ARCHITECTURE Behavioral OF TOP IS

    COMPONENT UART_RX3 IS
        GENERIC (
            BAUD_RATE : INTEGER := 10416
        );

        PORT (
            clk : IN STD_LOGIC;
            RX : IN STD_LOGIC;
            DATA_OUT : OUT STD_LOGIC_VECTOR(127 DOWNTO 0)
        );
    END COMPONENT;
    COMPONENT VGA IS

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
    END COMPONENT;

    COMPONENT Top_decryption IS
        PORT (
            input : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
            key : IN STD_LOGIC_VECTOR (1407 DOWNTO 0);
            output : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));
    END COMPONENT;

    SIGNAL output : STD_LOGIC_VECTOR(127 DOWNTO 0);
    CONSTANT key : STD_LOGIC_VECTOR(1407 DOWNTO 0) := X"2b28ab097eaef7cf15d2154f16a6883ca088232afa54a36cfe2c397617b13905f27a5973c296355995b980f6f2437a7f3d471e6d8016237a47fe7e887d3e443befa8b6db4452710ba55b25ad417f3b00d47cca11d183f2f9c69db815f887bcbc6d11dbca880bf900a33e86937afd41fd4e5f844e545fa6a6f7c94fdc0ef3b24feab5317fd28d2b8d73baf52921d2602fac192867775ad15c66dc2900f321416ed0c9e1b614ee3f63f9250c0ca889c8a6";
    SIGNAL RX_msg_out : STD_LOGIC_VECTOR(127 DOWNTO 0);
    SIGNAL dec_msg_out : STD_LOGIC_VECTOR(127 DOWNTO 0);
    SIGNAL dec_msg_in : STD_LOGIC_VECTOR(127 DOWNTO 0);
    SIGNAL dis_msg : STD_LOGIC_VECTOR(127 DOWNTO 0);

BEGIN

    reciever : UART_RX3 GENERIC MAP(10416) PORT MAP(clk => clk, Rx => RX, DATA_OUT => RX_msg_out);
    dec_msg_in <= RX_msg_out;
    decryption : Top_decryption PORT MAP(dec_msg_in, key, dec_msg_out);

    display1 : VGA PORT MAP(clk, reset, dec_msg_out, R, G, B, hsync, vsync);

END Behavioral;