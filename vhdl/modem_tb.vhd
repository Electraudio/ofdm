--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   04:17:53 01/13/2014
-- Design Name:   
-- Module Name:   C:/Users/Mempf/Desktop/ofdm/trunk/vhdl/modem_tb.vhd
-- Project Name:  ofdm
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: modem
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY modem_tb IS
END modem_tb;
 
ARCHITECTURE behavior OF modem_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT modem
    PORT(
         clk : IN  std_logic;
         rsti : IN  std_logic;
         rxserial : IN  std_logic;
         txserial : OUT  std_logic;
         pmem_ready : OUT  std_logic;
         pIin : OUT  std_logic_vector(13 downto 0);
         pmem_block : OUT  std_logic;
         pOutput_enable : OUT  std_logic;
         pwen : OUT  std_logic;
         paddress_read : OUT  std_logic_vector(5 downto 0);
         paddress_write : OUT  std_logic_vector(6 downto 0);
         Iout_rx : OUT  std_logic_vector(13 downto 0);
         Qout_rx : OUT  std_logic_vector(13 downto 0);
         Output_enable_rx : OUT  std_logic;
         addrout_out_rx : OUT  std_logic_vector(5 downto 0);
         mem_block_tx : OUT  std_logic;
         mem_ready_tx : OUT  std_logic;
         wen_tx : OUT  std_logic;
         address_tx : OUT  std_logic_vector(5 downto 0);
         i_tx : OUT  std_logic_vector(11 downto 0);
         q_tx : OUT  std_logic_vector(11 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rsti : std_logic := '0';
   signal rxserial : std_logic := '0';

 	--Outputs
   signal txserial : std_logic;
   signal pmem_ready : std_logic;
   signal pIin : std_logic_vector(13 downto 0);
   signal pmem_block : std_logic;
   signal pOutput_enable : std_logic;
   signal pwen : std_logic;
   signal paddress_read : std_logic_vector(5 downto 0);
   signal paddress_write : std_logic_vector(6 downto 0);
   signal Iout_rx : std_logic_vector(13 downto 0);
   signal Qout_rx : std_logic_vector(13 downto 0);
   signal Output_enable_rx : std_logic;
   signal addrout_out_rx : std_logic_vector(5 downto 0);
   signal mem_block_tx : std_logic;
   signal mem_ready_tx : std_logic;
   signal wen_tx : std_logic;
   signal address_tx : std_logic_vector(5 downto 0);
   signal i_tx : std_logic_vector(11 downto 0);
   signal q_tx : std_logic_vector(11 downto 0);

   -- Clock period definitions
   constant clk_period : time := 125 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: modem PORT MAP (
          clk => clk,
          rsti => rsti,
          rxserial => rxserial,
          txserial => txserial,
          pmem_ready => pmem_ready,
          pIin => pIin,
          pmem_block => pmem_block,
          pOutput_enable => pOutput_enable,
          pwen => pwen,
          paddress_read => paddress_read,
          paddress_write => paddress_write,
          Iout_rx => Iout_rx,
          Qout_rx => Qout_rx,
          Output_enable_rx => Output_enable_rx,
          addrout_out_rx => addrout_out_rx,
          mem_block_tx => mem_block_tx,
          mem_ready_tx => mem_ready_tx,
          wen_tx => wen_tx,
          address_tx => address_tx,
          i_tx => i_tx,
          q_tx => q_tx
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
	
	serial_process :process
   begin
		wait for 500 ns;
		rxserial <= '1';
		wait for clk_period*4;
		rxserial <= '0';
		wait for clk_period*4;
		wait for clk_period*218;
		wait for clk_period*4;
		rxserial <= '1';
		wait for clk_period*4;
		rxserial <= '0';
		wait for clk_period*4;
		wait for clk_period*218;
		wait for clk_period*8;
		rxserial <= '1';
		wait for clk_period*4;
		rxserial <= '0';
		wait for clk_period*4;
		wait for clk_period*218;
		wait for clk_period*12;
		rxserial <= '1';
		wait for clk_period*4;
		rxserial <= '0';
		wait;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		rsti <= '1';
    wait for 500 ns;
		rsti <= '0';

      -- insert stimulus here

      wait;
   end process;

END;
