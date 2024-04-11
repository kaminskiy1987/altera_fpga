library ieee, ieee_proposed, composite, elementary, genop;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.math_real.all;

use elementary.utility.all;

entity D18_genop is 
	port(
		clk			: in std_logic; --211
		----------------------
		wf 			: in std_logic_vector(1 downto 0); --71,67
		pts 		: in std_logic_vector(2 downto 0); --65,68,63
		enable		: in std_logic; --66
		erase		: in std_logic; --61
		--nacklon		: in std_logic; --90
		----------------------------------------
		from_first	: in std_logic_vector(33 downto 0); --62,56,55,54,53,51,50,49,48,46,45,44,101,100,99,98,97,
		                                                --95,94,88,87,86,84,83,82,80,81,79,78,74,75,72,73,70
		foo :         in std_logic; --64
		--------------------------
														 
		opfx		: out std_logic_vector(7 downto 0); --174,173,171,132,131,129,128,127
														 
		opfy		: out std_logic_vector(7 downto 0) --141,172,138,169,168,167,166,164
		
		--nacklon12	: out std_logic_vector(1 downto 0); --117,118
		--fzap		: out std_logic; --120
		--fscs		: out std_logic; --121
		--ctrm		: out std_logic --122
	);

end entity D18_genop;

architecture bhv of D18_genop is
	--signal strob : std_logic;
	--signal strm_inn : std_logic;
	signal mask : std_logic_vector(opfx'range) := "11111111"; --"11110000";
	signal opfx_m : std_logic_vector(opfx'range);
	signal opfy_m : std_logic_vector(opfy'range);
begin

	--strob <= foo or strm_inn or erase;
	--ctrm <= strm_inn or erase;

	--nacklon12 <= "01" when nacklon = '1' else "10";
	--fzap <= clk and strob;
	--fscs <= clk and strob;
    genop_instance : entity work.gen_op_f
	
		generic map(

			--offset_array => (0,262, 328, 460, 592,592),
			offset_array => (0,65,197, 452, 584),
			--length_array => (263,66, 132, 132,263),
			length_array => (66 ,132, 255, 132),
			pts_code => (6,4,5,7),
			others_index => 0,
			pts_width => 3,
			--------------весовая -------------- 
			wf_a => (0.0, 0.58, 0.5, 0.54),
			wf_b => (0.0, 0.42, 0.5, 0.46),
			wf_width => 2,
			---------------------------------------- 
			data_width => 8,
			mifname_imag => "imag3.mif",
			mifname_real => "real3.mif"
		)
		port map(
			pts => pts,
			wf => wf,
			clk => clk,
			enable => enable,
			erase => erase,
			std_logic_vector(op_x) => opfx_m,
			std_logic_vector(op_y) => opfy_m
			--str_m => strm_inn
		);
	
	opfx <= opfx_m and mask;
	opfy <= opfy_m and mask;

end architecture bhv;