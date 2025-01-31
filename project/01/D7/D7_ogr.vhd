library ieee, ieee_proposed, composite, elementary, genop;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.math_real.all;

use elementary.utility.all;

entity D7_ogr is 
	port(
		x_in 	: in std_logic_vector ( 8 downto 0 );--181,183,182,184,186,185,188,127,128
		y_in 	: in std_logic_vector ( 8 downto 0 );--129,131,132,133,134,136,137,138,141
		addres 	: in std_logic_vector ( 1 downto 0 );
		clk 	: in std_logic;--
		--nacklon	: in std_logic;
		--clk_out : in std_logic;
		x_out 	: out std_logic_vector ( 8 downto 0 );
		y_out 	: out std_logic_vector ( 8 downto 0 );
		
		--nacklon12	: out std_logic_vector(1 downto 0); --117,118
		--fzap		: out std_logic; --120
		--fscs		: out std_logic; --121
		m2		: out std_logic --122
	);

end entity D7_ogr;


architecture bhv of D7_ogr is

--signal x_n : std_logic_vector(x_in'range);
--signal y_n : std_logic_vector(y_in'range);
signal x_out_t : std_logic_vector(x_out'range);
signal y_out_t : std_logic_vector(y_out'range);
signal m1_1 : std_logic;
signal m1_2 : std_logic;

begin

 ogr_instance : entity work.ogr
	
		generic map(

		data_width 	=> 9,
		inn_data_width => 9,
		level1 => 14,
		level2 => 7,
		integer_width => 5,
		frac_width 	=> -11
		)
		port map(
			x_in =>signed( x_in),
			y_in =>signed( y_in),
			clk_in => clk,
			clk_out => clk,
			addres => addres,
			--nacklon => nacklon,
			std_logic_vector(x_out) => x_out_t,
			std_logic_vector(y_out) => y_out_t
			--str_m => strm_inn
		);
		
	x_out <= x_out_t;
    y_out <= y_out_t;
        
p3 : process (clk) is

	begin
		if ( clk'event and clk = '1' ) then
		
--		x_out_t <= x_in ;
--		y_out_t <= y_in ;
		
	
			m1_1 <= x_out_t(0) xor x_out_t(1) xor x_out_t(2) xor x_out_t(3) xor x_out_t(4) xor x_out_t(5)
			xor x_out_t(6) xor x_out_t(7) xor x_out_t(8);
	  
			m1_2 <= y_out_t(0) xor y_out_t(1) xor y_out_t(2) xor y_out_t(3) xor y_out_t(4) xor y_out_t(5)
			xor y_out_t(6) xor y_out_t(7) xor y_out_t(8);
	  
			m2 <= m1_1 xor m1_2;
			--m2 <= x_out_t xor y_out_t;
		
		--x_out <= x_out_t;
		--y_out <= y_out_t;
		end if;
		
		
end process p3;


--x_out <= x_out_t when addres ="00" else (others => '0') ;
--y_out <= y_out_t when addres ="00" else (others => '0') ;
		
end architecture bhv;