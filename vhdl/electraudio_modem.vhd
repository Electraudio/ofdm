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
	signal rst : std_logic;
	signal iserial : std_logic;
	signal lucky_ramp_q : std_logic_vector(13 downto 0);
	signal lucky_ramp_d : std_logic_vector(13 downto 0);
	signal I_loop : std_logic_vector(13 downto 0);

begin

	lucky_ramp_d <= "00000000000000" when lucky_ramp_q >= "11111111111111"
	else lucky_ramp_q + 1;
	
	lucky_ramp_q <= lucky_ramp_d when rising_edge(clk_100);
	
	DAC_DA <= lucky_ramp_q;-- & "0000000";
	DAC_DB <= lucky_ramp_q;
	--DAC_DA <= I_loop;
	--DAC_DB <= I_loop;

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
	    Iin => ADC_DA(13 downto 2),
       Qin => (others=>'0')--ADC_DB(13 downto 2)
);

end arch;