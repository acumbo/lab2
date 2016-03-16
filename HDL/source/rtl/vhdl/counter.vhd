-------------------------------------------------------------------------------
--  Odsek za racunarsku tehniku i medjuracunarske komunikacije
--  Autor: LPRS2  <lprs2@rt-rk.com>                                           
--                                                                             
--  Ime modula: timer_counter                                                           
--                                                                             
--  Opis:                                                               
--                                                                             
--    Modul broji sekunde i prikazuje na LED diodama                                         
--                                                                             
-------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;



ENTITY counter IS 
		GENERIC (

				WIDTH    : positive := 10
		);
		PORT (
			   clk_i     : IN STD_LOGIC;
			   rst_i     : IN STD_LOGIC;
			   cnt_rst_i : IN STD_LOGIC;
			   cnt_en_i  : IN STD_LOGIC;
				cnt_o  : out std_logic_vector(WIDTH-1 downto 0)
			 );
END counter;




ARCHITECTURE rtl OF counter IS
	
	signal cnt : std_logic_vector(WIDTH-1 downto 0);
BEGIN

	process(clk_i,rst_i,cnt_rst_i) begin
		if rst_i = '0' or cnt_rst_i = '0' then
			cnt <= (others => '0');
		elsif rising_edge(clk_i) and cnt_en_i = '1' then
			cnt <= cnt + 1;
		end if;
	end process;

	cnt_o <= cnt;

END rtl;
