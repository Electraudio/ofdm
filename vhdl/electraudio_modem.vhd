library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity electraudio_modem is
  port ( iCLK_50 	: in  std_logic;
         KEY 		: in  std_logic_vector(3 downto 0);
         LEDG 		: out std_logic_vector(8 downto 0);
         ADC_DA 	: in std_logic_vector(13 downto 0);
			ADC_DB 	: in std_logic_vector(13 downto 0);
			DAC_DA 	: out std_logic_vector(13 downto 0);
			DAC_DB 	: out std_logic_vector(13 downto 0);
			ADC_CLK_A : out std_logic;
			ADC_CLK_B : out std_logic;
			DAC_CLK_A : out std_logic;
			DAC_CLK_B : out std_logic;
			ADC_OEB_A : out std_logic;
			ADC_OEB_B : out std_logic;
			DAC_WRT_A : out std_logic;
			DAC_WRT_B : out std_logic;
			DAC_MODE  : out std_logic;
			POWER_ON  : out std_logic
         );
end electraudio_modem;

architecture arch of electraudio_modem is
	signal clk_10 : std_logic;
	signal clk_100 : std_logic;
	signal clk_50 : std_logic;
	signal clk_en : std_logic;
	signal rst,rst_n : std_logic;
	signal iserial : std_logic;
	signal lucky_ramp_q : std_logic_vector(7 downto 0);
	signal lucky_ramp_d : std_logic_vector(7 downto 0);
	signal I_loop : std_logic_vector(13 downto 0);
	signal phi : std_logic_vector(31 downto 0) := "00001100110011001100110011001101";
	signal I_Tx,I_Rx : std_logic_vector(23 downto 0);
	signal fsin_o : std_logic_vector(9 downto 0);
	signal filter_out : std_logic_vector(32 downto 0);

begin

	clk_en <= '1';

	lucky_ramp_d <= "00000000" when lucky_ramp_q >= "11111111"
	else lucky_ramp_q + 1;
	
	lucky_ramp_q <= lucky_ramp_d when rising_edge(clk_100);
	
	DAC_DB <= not(I_Tx(23)) & I_Tx(22 downto 10);
	--DAC_DA <= I_loop;
	--DAC_DB <= I_loop;

	rst_n <= KEY(0);
	rst <= not(KEY(0));
	iserial <= not(KEY(3));
	
	ADC_CLK_A <= clk_50;
	ADC_CLK_B <= clk_50;
	DAC_CLK_A <= clk_100;
	DAC_CLK_B <= clk_100;
	
	ADC_OEB_A <= '0';
	ADC_OEB_B <= '0';
	
	DAC_WRT_A <= clk_100;
	DAC_WRT_B <= clk_100;
	
	POWER_ON <= '1';
	DAC_MODE <= '1';

FIR0 : entity work.Hlp
    PORT MAP (
              clk                              => clk_50,
              clk_enable                       => clk_en,
              reset                            => rst,
              filter_in                        => not(I_Rx(23)) & I_Rx(22 downto 10),
              filter_out                       => filter_out
	);
	
	
N0 : entity work.nco
	PORT MAP (
		phi_inc_i  =>  phi,
		fsin_o  =>  fsin_o,
--		fcos_o  =>  fcos_o,
		clk  =>  clk_100,
		reset_n  =>  rst_n,
		clken  =>  clk_en
--		out_valid  =>  out_valid
	);
	
LPM0 : entity work.lpm PORT MAP (
		dataa	 => lucky_ramp_q & "000000",
	--   dataa	 => I_loop,
		datab	 => fsin_o,
		result	 => I_Tx
	);
	
LPM1 : entity work.lpm PORT MAP (
	dataa	 => ADC_DA,
	datab	 => fsin_o,
	result	 => I_Rx
);
	
	
	
P0 : entity work.pll port map(
		inclk0	 => iCLK_50,
		areset => rst,
		c0	 => clk_10,
		c1	 => clk_100,
		c2	 => clk_50);

M0 : entity work.modem port map(
		 clk => clk_10,
       rsti => rst,
       rxserial => iserial,
       txserial => LEDG(7),
       Iout => I_loop,
--       Qout => DAC_DB,
--       Iin => I_loop(13 downto 2),
	    Iin => I_Rx(23 downto 12),
       Qin => (others=>'0')--ADC_DB(13 downto 2)
);

end arch;