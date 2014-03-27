--IP Functional Simulation Model
--VERSION_BEGIN 12.1SP1 cbx_mgl 2013:01:31:18:08:27:SJ cbx_simgen 2013:01:31:18:04:59:SJ  VERSION_END


-- Copyright (C) 1991-2012 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- You may only use these simulation model output files for simulation
-- purposes and expressly not for synthesis or any other purposes (in which
-- event Altera disclaims all warranties of any kind).


--synopsys translate_off

 LIBRARY altera_mf;
 USE altera_mf.altera_mf_components.all;

 LIBRARY lpm;
 USE lpm.lpm_components.all;

 LIBRARY sgate;
 USE sgate.sgate_pack.all;

--synthesis_resources = altmult_add 2 altsyncram 3 lpm_add_sub 4 lpm_counter 1 lut 134 mux21 232 oper_add 2 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  nco IS 
	 PORT 
	 ( 
		 clk	:	IN  STD_LOGIC;
		 clken	:	IN  STD_LOGIC;
		 fcos_o	:	OUT  STD_LOGIC_VECTOR (9 DOWNTO 0);
		 fsin_o	:	OUT  STD_LOGIC_VECTOR (9 DOWNTO 0);
		 out_valid	:	OUT  STD_LOGIC;
		 phi_inc_i	:	IN  STD_LOGIC_VECTOR (31 DOWNTO 0);
		 reset_n	:	IN  STD_LOGIC
	 ); 
 END nco;

 ARCHITECTURE RTL OF nco IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL  wire_nl1Ol_dataa	:	STD_LOGIC_VECTOR (19 DOWNTO 0);
	 SIGNAL  wire_nl1Ol_datab	:	STD_LOGIC_VECTOR (19 DOWNTO 0);
	 SIGNAL  wire_nl1Ol_result	:	STD_LOGIC_VECTOR (20 DOWNTO 0);
	 SIGNAL  wire_nl1OO_dataa	:	STD_LOGIC_VECTOR (19 DOWNTO 0);
	 SIGNAL  wire_nl1OO_datab	:	STD_LOGIC_VECTOR (19 DOWNTO 0);
	 SIGNAL  wire_nl1OO_result	:	STD_LOGIC_VECTOR (20 DOWNTO 0);
	 SIGNAL  wire_nl1ll_address_a	:	STD_LOGIC_VECTOR (6 DOWNTO 0);
	 SIGNAL  wire_nl1ll_address_b	:	STD_LOGIC_VECTOR (6 DOWNTO 0);
	 SIGNAL  wire_nl1ll_data_a	:	STD_LOGIC_VECTOR (9 DOWNTO 0);
	 SIGNAL  wire_nl1ll_data_b	:	STD_LOGIC_VECTOR (9 DOWNTO 0);
	 SIGNAL  wire_nl1ll_q_a	:	STD_LOGIC_VECTOR (9 DOWNTO 0);
	 SIGNAL  wire_nl1ll_q_b	:	STD_LOGIC_VECTOR (9 DOWNTO 0);
	 SIGNAL  wire_gnd	:	STD_LOGIC;
	 SIGNAL  wire_nl1lO_address_a	:	STD_LOGIC_VECTOR (6 DOWNTO 0);
	 SIGNAL  wire_nl1lO_q_a	:	STD_LOGIC_VECTOR (9 DOWNTO 0);
	 SIGNAL  wire_nl1Oi_address_a	:	STD_LOGIC_VECTOR (6 DOWNTO 0);
	 SIGNAL  wire_nl1Oi_q_a	:	STD_LOGIC_VECTOR (9 DOWNTO 0);
	 SIGNAL	 nlO00i3	:	STD_LOGIC := '0';
	 SIGNAL	 nlO00i4	:	STD_LOGIC := '0';
	 SIGNAL  wire_nlO00i4_w_lg_q72w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL	 nlO01l5	:	STD_LOGIC := '0';
	 SIGNAL	 nlO01l6	:	STD_LOGIC := '0';
	 SIGNAL	 nlO0iO1	:	STD_LOGIC := '0';
	 SIGNAL	 nlO0iO2	:	STD_LOGIC := '0';
	 SIGNAL	 nlO10O17	:	STD_LOGIC := '0';
	 SIGNAL	 nlO10O18	:	STD_LOGIC := '0';
	 SIGNAL	 nlO1il15	:	STD_LOGIC := '0';
	 SIGNAL	 nlO1il16	:	STD_LOGIC := '0';
	 SIGNAL  wire_nlO1il16_w_lg_w_lg_q627w628w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_nlO1il16_w_lg_q627w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL	 nlO1iO13	:	STD_LOGIC := '0';
	 SIGNAL	 nlO1iO14	:	STD_LOGIC := '0';
	 SIGNAL  wire_nlO1iO14_w_lg_w_lg_q618w619w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_nlO1iO14_w_lg_q618w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL	 nlO1li11	:	STD_LOGIC := '0';
	 SIGNAL	 nlO1li12	:	STD_LOGIC := '0';
	 SIGNAL  wire_nlO1li12_w_lg_w_lg_q496w497w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_nlO1li12_w_lg_q496w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL	 nlO1ll10	:	STD_LOGIC := '0';
	 SIGNAL	 nlO1ll9	:	STD_LOGIC := '0';
	 SIGNAL	 nlO1Ol7	:	STD_LOGIC := '0';
	 SIGNAL	 nlO1Ol8	:	STD_LOGIC := '0';
	 SIGNAL	n00i	:	STD_LOGIC := '0';
	 SIGNAL	n0lil	:	STD_LOGIC := '0';
	 SIGNAL	n0lli	:	STD_LOGIC := '0';
	 SIGNAL	n0lll	:	STD_LOGIC := '0';
	 SIGNAL	n0llO	:	STD_LOGIC := '0';
	 SIGNAL	n0lOi	:	STD_LOGIC := '0';
	 SIGNAL	n0lOl	:	STD_LOGIC := '0';
	 SIGNAL	n0lOO	:	STD_LOGIC := '0';
	 SIGNAL	n0O0i	:	STD_LOGIC := '0';
	 SIGNAL	n0O0l	:	STD_LOGIC := '0';
	 SIGNAL	n0O0O	:	STD_LOGIC := '0';
	 SIGNAL	n0O1i	:	STD_LOGIC := '0';
	 SIGNAL	n0O1l	:	STD_LOGIC := '0';
	 SIGNAL	n0O1O	:	STD_LOGIC := '0';
	 SIGNAL	n0Oii	:	STD_LOGIC := '0';
	 SIGNAL	n0Oil	:	STD_LOGIC := '0';
	 SIGNAL	n1l0i	:	STD_LOGIC := '0';
	 SIGNAL	n1l0l	:	STD_LOGIC := '0';
	 SIGNAL	n1l0O	:	STD_LOGIC := '0';
	 SIGNAL	n1l1i	:	STD_LOGIC := '0';
	 SIGNAL	n1l1l	:	STD_LOGIC := '0';
	 SIGNAL	n1l1O	:	STD_LOGIC := '0';
	 SIGNAL	n1lii	:	STD_LOGIC := '0';
	 SIGNAL	n1lil	:	STD_LOGIC := '0';
	 SIGNAL	n1liO	:	STD_LOGIC := '0';
	 SIGNAL	n1lli	:	STD_LOGIC := '0';
	 SIGNAL	n1lll	:	STD_LOGIC := '0';
	 SIGNAL	n1llO	:	STD_LOGIC := '0';
	 SIGNAL	n1lO	:	STD_LOGIC := '0';
	 SIGNAL	n1lOi	:	STD_LOGIC := '0';
	 SIGNAL	n1lOl	:	STD_LOGIC := '0';
	 SIGNAL	n1lOO	:	STD_LOGIC := '0';
	 SIGNAL	n1O0i	:	STD_LOGIC := '0';
	 SIGNAL	n1O0l	:	STD_LOGIC := '0';
	 SIGNAL	n1O0O	:	STD_LOGIC := '0';
	 SIGNAL	n1O1i	:	STD_LOGIC := '0';
	 SIGNAL	n1O1l	:	STD_LOGIC := '0';
	 SIGNAL	n1O1O	:	STD_LOGIC := '0';
	 SIGNAL	n1Oii	:	STD_LOGIC := '0';
	 SIGNAL	n1Oil	:	STD_LOGIC := '0';
	 SIGNAL	n1OiO	:	STD_LOGIC := '0';
	 SIGNAL	n1Oli	:	STD_LOGIC := '0';
	 SIGNAL	n1Oll	:	STD_LOGIC := '0';
	 SIGNAL	ni0ii	:	STD_LOGIC := '0';
	 SIGNAL	ni0il	:	STD_LOGIC := '0';
	 SIGNAL	ni0iO	:	STD_LOGIC := '0';
	 SIGNAL	ni0li	:	STD_LOGIC := '0';
	 SIGNAL	ni0ll	:	STD_LOGIC := '0';
	 SIGNAL	ni0lO	:	STD_LOGIC := '0';
	 SIGNAL	ni0Oi	:	STD_LOGIC := '0';
	 SIGNAL	ni0Ol	:	STD_LOGIC := '0';
	 SIGNAL	ni0OO	:	STD_LOGIC := '0';
	 SIGNAL	nii0i	:	STD_LOGIC := '0';
	 SIGNAL	nii0l	:	STD_LOGIC := '0';
	 SIGNAL	nii0O	:	STD_LOGIC := '0';
	 SIGNAL	nii1i	:	STD_LOGIC := '0';
	 SIGNAL	nii1l	:	STD_LOGIC := '0';
	 SIGNAL	nii1O	:	STD_LOGIC := '0';
	 SIGNAL	niiii	:	STD_LOGIC := '0';
	 SIGNAL	niiil	:	STD_LOGIC := '0';
	 SIGNAL	niiiO	:	STD_LOGIC := '0';
	 SIGNAL	niili	:	STD_LOGIC := '0';
	 SIGNAL	niill	:	STD_LOGIC := '0';
	 SIGNAL	nilll	:	STD_LOGIC := '0';
	 SIGNAL	nl00i	:	STD_LOGIC := '0';
	 SIGNAL	nl00l	:	STD_LOGIC := '0';
	 SIGNAL	nl00O	:	STD_LOGIC := '0';
	 SIGNAL	nl01O	:	STD_LOGIC := '0';
	 SIGNAL	nl0ii	:	STD_LOGIC := '0';
	 SIGNAL	nl0il	:	STD_LOGIC := '0';
	 SIGNAL	nl0iO	:	STD_LOGIC := '0';
	 SIGNAL	nl0li	:	STD_LOGIC := '0';
	 SIGNAL	nl0ll	:	STD_LOGIC := '0';
	 SIGNAL	nl0lO	:	STD_LOGIC := '0';
	 SIGNAL	nll0O	:	STD_LOGIC := '0';
	 SIGNAL	nlliO	:	STD_LOGIC := '0';
	 SIGNAL	nllli	:	STD_LOGIC := '0';
	 SIGNAL	nllll	:	STD_LOGIC := '0';
	 SIGNAL	nlllO	:	STD_LOGIC := '0';
	 SIGNAL	nllOi	:	STD_LOGIC := '0';
	 SIGNAL	nllOl	:	STD_LOGIC := '0';
	 SIGNAL	nllOO	:	STD_LOGIC := '0';
	 SIGNAL	nlO0ll	:	STD_LOGIC := '0';
	 SIGNAL	nlO0lO	:	STD_LOGIC := '0';
	 SIGNAL	nlO0Oi	:	STD_LOGIC := '0';
	 SIGNAL	nlO0Ol	:	STD_LOGIC := '0';
	 SIGNAL	nlO0OO	:	STD_LOGIC := '0';
	 SIGNAL	nlO1i	:	STD_LOGIC := '0';
	 SIGNAL	nlO1l	:	STD_LOGIC := '0';
	 SIGNAL	nlO1O	:	STD_LOGIC := '0';
	 SIGNAL	nlOi0i	:	STD_LOGIC := '0';
	 SIGNAL	nlOi0l	:	STD_LOGIC := '0';
	 SIGNAL	nlOi0O	:	STD_LOGIC := '0';
	 SIGNAL	nlOi1i	:	STD_LOGIC := '0';
	 SIGNAL	nlOi1l	:	STD_LOGIC := '0';
	 SIGNAL	nlOi1O	:	STD_LOGIC := '0';
	 SIGNAL	nlOiii	:	STD_LOGIC := '0';
	 SIGNAL	nlOiil	:	STD_LOGIC := '0';
	 SIGNAL	nlOiiO	:	STD_LOGIC := '0';
	 SIGNAL	nlOili	:	STD_LOGIC := '0';
	 SIGNAL	nlOill	:	STD_LOGIC := '0';
	 SIGNAL	nlOilO	:	STD_LOGIC := '0';
	 SIGNAL	nlOiOi	:	STD_LOGIC := '0';
	 SIGNAL	nlOiOl	:	STD_LOGIC := '0';
	 SIGNAL	nlOiOO	:	STD_LOGIC := '0';
	 SIGNAL	nlOl0i	:	STD_LOGIC := '0';
	 SIGNAL	nlOl0l	:	STD_LOGIC := '0';
	 SIGNAL	nlOl0O	:	STD_LOGIC := '0';
	 SIGNAL	nlOl1i	:	STD_LOGIC := '0';
	 SIGNAL	nlOl1l	:	STD_LOGIC := '0';
	 SIGNAL	nlOl1O	:	STD_LOGIC := '0';
	 SIGNAL	nlOlii	:	STD_LOGIC := '0';
	 SIGNAL	nlOlil	:	STD_LOGIC := '0';
	 SIGNAL	nlOliO	:	STD_LOGIC := '0';
	 SIGNAL	nlOlli	:	STD_LOGIC := '0';
	 SIGNAL	nlOlll	:	STD_LOGIC := '0';
	 SIGNAL	wire_n01O_CLRN	:	STD_LOGIC;
	 SIGNAL  wire_n01O_w_lg_nl01O185w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_n01O_w_lg_nlliO115w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_n0liO_aclr	:	STD_LOGIC;
	 SIGNAL  wire_n0liO_dataa	:	STD_LOGIC_VECTOR (18 DOWNTO 0);
	 SIGNAL  wire_n0liO_datab	:	STD_LOGIC_VECTOR (18 DOWNTO 0);
	 SIGNAL  wire_n0liO_result	:	STD_LOGIC_VECTOR (18 DOWNTO 0);
	 SIGNAL  wire_nl01i_aclr	:	STD_LOGIC;
	 SIGNAL  wire_nl01i_cin	:	STD_LOGIC;
	 SIGNAL  wire_n01O_w_lg_nl0lO186w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_nl01i_dataa	:	STD_LOGIC_VECTOR (9 DOWNTO 0);
	 SIGNAL  wire_nl01i_datab	:	STD_LOGIC_VECTOR (9 DOWNTO 0);
	 SIGNAL  wire_nl01i_result	:	STD_LOGIC_VECTOR (9 DOWNTO 0);
	 SIGNAL  wire_nllii_aclr	:	STD_LOGIC;
	 SIGNAL  wire_nllii_cin	:	STD_LOGIC;
	 SIGNAL  wire_n01O_w_lg_nlO1O116w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_nllii_dataa	:	STD_LOGIC_VECTOR (9 DOWNTO 0);
	 SIGNAL  wire_nllii_datab	:	STD_LOGIC_VECTOR (9 DOWNTO 0);
	 SIGNAL  wire_nllii_result	:	STD_LOGIC_VECTOR (9 DOWNTO 0);
	 SIGNAL  wire_nlO0li_aclr	:	STD_LOGIC;
	 SIGNAL  wire_nlO0li_dataa	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
	 SIGNAL  wire_nlO0li_datab	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
	 SIGNAL  wire_nlO0li_result	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
	 SIGNAL  wire_n1Oi_w_lg_w_lg_w_lg_w_lg_w_q_range62w64w67w70w73w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_n1Oi_w_lg_w_lg_w_lg_w_q_range62w64w67w70w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_n1Oi_w_lg_w_lg_w_q_range62w64w67w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_n1Oi_w_lg_w_q_range62w64w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_n1Oi_w_lg_w_q_range65w66w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_n1Oi_w_lg_w_q_range68w69w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_n1Oi_aclr	:	STD_LOGIC;
	 SIGNAL  wire_n1Oi_q	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
	 SIGNAL  wire_n1Oi_w_q_range65w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_n1Oi_w_q_range62w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_n1Oi_w_q_range68w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_n1Oi_w_q_range63w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL	wire_n000i_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n000l_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n000O_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n001i_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n001l_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n001O_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n00ii_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n00il_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n00iO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n00li_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n00ll_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n00lO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n00Oi_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n00Ol_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n00OO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n010i_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n010l_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n010O_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n011i_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n011l_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n011O_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n01i_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n01ii_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n01il_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n01iO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n01li_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n01ll_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n01lO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n01Oi_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n01Ol_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n01OO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n0i0i_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n0i0l_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n0i0O_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n0i1i_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n0i1l_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n0i1O_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n0iii_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n0iil_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n0iiO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n0ili_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n0ill_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n0ilO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n0iOi_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n0iOl_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n0iOO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n0l1i_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n0l1l_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n0l1O_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n0OiO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n0Oli_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n0Oll_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n0OlO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n0OOi_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n0OOl_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n0OOO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n100i_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n100l_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n100O_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n101i_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n101l_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n101O_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n10i_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n10ii_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n10il_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n10iO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n10l_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n10li_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n10ll_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n10lO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n10O_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n10Oi_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n10Ol_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n10OO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n110i_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n110l_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n110O_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n111i_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n111l_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n111O_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n11i_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n11ii_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n11il_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n11iO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n11l_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n11li_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n11ll_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n11lO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n11O_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n11Oi_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n11Ol_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n11OO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n1i0i_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n1i0l_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n1i0O_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n1i1i_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n1i1l_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n1i1O_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n1ii_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n1iii_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n1iil_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n1iiO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n1il_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n1ili_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n1ill_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n1ilO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n1iOi_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n1iOl_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n1iOO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n1li_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n1ll_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n1OlO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n1OO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n1OOi_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n1OOl_dataout	:	STD_LOGIC;
	 SIGNAL	wire_n1OOO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_ni00i_dataout	:	STD_LOGIC;
	 SIGNAL	wire_ni00l_dataout	:	STD_LOGIC;
	 SIGNAL	wire_ni00O_dataout	:	STD_LOGIC;
	 SIGNAL	wire_ni01i_dataout	:	STD_LOGIC;
	 SIGNAL	wire_ni01l_dataout	:	STD_LOGIC;
	 SIGNAL	wire_ni01O_dataout	:	STD_LOGIC;
	 SIGNAL	wire_ni10i_dataout	:	STD_LOGIC;
	 SIGNAL	wire_ni10l_dataout	:	STD_LOGIC;
	 SIGNAL	wire_ni10O_dataout	:	STD_LOGIC;
	 SIGNAL	wire_ni11i_dataout	:	STD_LOGIC;
	 SIGNAL	wire_ni11l_dataout	:	STD_LOGIC;
	 SIGNAL	wire_ni11O_dataout	:	STD_LOGIC;
	 SIGNAL	wire_ni1ii_dataout	:	STD_LOGIC;
	 SIGNAL	wire_ni1il_dataout	:	STD_LOGIC;
	 SIGNAL	wire_ni1iO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_ni1li_dataout	:	STD_LOGIC;
	 SIGNAL	wire_ni1ll_dataout	:	STD_LOGIC;
	 SIGNAL	wire_ni1lO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_ni1Oi_dataout	:	STD_LOGIC;
	 SIGNAL	wire_ni1Ol_dataout	:	STD_LOGIC;
	 SIGNAL	wire_ni1OO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_niilO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_niiOi_dataout	:	STD_LOGIC;
	 SIGNAL	wire_niiOl_dataout	:	STD_LOGIC;
	 SIGNAL	wire_niiOO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nil0i_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nil0l_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nil0O_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nil1i_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nil1l_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nil1O_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nilii_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nilil_dataout	:	STD_LOGIC;
	 SIGNAL	wire_niliO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nilli_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nillO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nilOi_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nilOl_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nilOO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_niO0i_dataout	:	STD_LOGIC;
	 SIGNAL	wire_niO0l_dataout	:	STD_LOGIC;
	 SIGNAL	wire_niO0O_dataout	:	STD_LOGIC;
	 SIGNAL	wire_niO1i_dataout	:	STD_LOGIC;
	 SIGNAL	wire_niO1l_dataout	:	STD_LOGIC;
	 SIGNAL	wire_niO1O_dataout	:	STD_LOGIC;
	 SIGNAL	wire_niOii_dataout	:	STD_LOGIC;
	 SIGNAL	wire_niOil_dataout	:	STD_LOGIC;
	 SIGNAL	wire_niOiO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_niOli_dataout	:	STD_LOGIC;
	 SIGNAL	wire_niOll_dataout	:	STD_LOGIC;
	 SIGNAL	wire_niOlO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_niOOi_dataout	:	STD_LOGIC;
	 SIGNAL	wire_niOOl_dataout	:	STD_LOGIC;
	 SIGNAL	wire_niOOO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nl0Oi_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nl0Ol_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nl0OO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nl10i_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nl10l_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nl10O_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nl11i_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nl11l_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nl11O_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nl1ii_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nl1il_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nl1iO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nli0i_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nli0l_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nli0O_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nli1i_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nli1l_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nli1O_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nliii_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nliil_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nliiO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nlili_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nlill_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nlilO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nliOi_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nliOl_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nliOO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nll0i_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nll0l_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nll1i_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nll1l_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nlO0i_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nlO0l_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nlO0O_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nlOii_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nlOil_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nlOiO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nlOli_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nlOll_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nlOllO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nlOlO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nlOlOi_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nlOlOl_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nlOlOO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nlOO0i_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nlOO0l_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nlOO0O_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nlOO1i_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nlOO1l_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nlOO1O_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nlOOi_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nlOOii_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nlOOil_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nlOOiO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nlOOl_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nlOOli_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nlOOll_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nlOOlO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nlOOO_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nlOOOi_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nlOOOl_dataout	:	STD_LOGIC;
	 SIGNAL	wire_nlOOOO_dataout	:	STD_LOGIC;
	 SIGNAL  wire_n0l0i_a	:	STD_LOGIC_VECTOR (9 DOWNTO 0);
	 SIGNAL  wire_n0l0i_b	:	STD_LOGIC_VECTOR (9 DOWNTO 0);
	 SIGNAL  wire_n0l0i_o	:	STD_LOGIC_VECTOR (9 DOWNTO 0);
	 SIGNAL  wire_nl1li_a	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_nl1li_b	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_nl1li_o	:	STD_LOGIC_VECTOR (7 DOWNTO 0);
	 SIGNAL  wire_w_lg_clken74w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_nlO01i79w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_nlO1Oi149w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_reset_n78w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  nlO01i :	STD_LOGIC;
	 SIGNAL  nlO0ii :	STD_LOGIC;
	 SIGNAL  nlO1Oi :	STD_LOGIC;
 BEGIN

	wire_gnd <= '0';
	wire_w_lg_clken74w(0) <= clken AND wire_n1Oi_w_lg_w_lg_w_lg_w_lg_w_q_range62w64w67w70w73w(0);
	wire_w_lg_nlO01i79w(0) <= NOT nlO01i;
	wire_w_lg_nlO1Oi149w(0) <= NOT nlO1Oi;
	wire_w_lg_reset_n78w(0) <= NOT reset_n;
	fcos_o <= ( wire_nllii_result(9 DOWNTO 0));
	fsin_o <= ( wire_nl01i_result(9 DOWNTO 0));
	nlO01i <= ((((((((((((NOT wire_nl1Ol_result(9)) AND (NOT wire_nl1Ol_result(10))) AND (NOT wire_nl1Ol_result(11))) AND (NOT wire_nl1Ol_result(12))) AND (NOT wire_nl1Ol_result(13))) AND (NOT wire_nl1Ol_result(14))) AND (NOT wire_nl1Ol_result(15))) AND (NOT wire_nl1Ol_result(16))) AND (NOT wire_nl1Ol_result(17))) AND (NOT wire_nl1Ol_result(18))) AND (NOT wire_nl1Ol_result(19))) AND (nlO1Ol8 XOR nlO1Ol7));
	nlO0ii <= '1';
	nlO1Oi <= ((((((((((((NOT wire_nl1OO_result(9)) AND (NOT wire_nl1OO_result(10))) AND (NOT wire_nl1OO_result(11))) AND (NOT wire_nl1OO_result(12))) AND (NOT wire_nl1OO_result(13))) AND (NOT wire_nl1OO_result(14))) AND (NOT wire_nl1OO_result(15))) AND (NOT wire_nl1OO_result(16))) AND (NOT wire_nl1OO_result(17))) AND (NOT wire_nl1OO_result(18))) AND (NOT wire_nl1OO_result(19))) AND (nlO1ll10 XOR nlO1ll9));
	out_valid <= n00i;
	wire_nl1Ol_dataa <= ( wire_nl1ll_q_a(9 DOWNTO 0) & wire_nl1ll_q_b(9 DOWNTO 0));
	wire_nl1Ol_datab <= ( wire_nl1lO_q_a(9 DOWNTO 0) & wire_nl1Oi_q_a(9 DOWNTO 0));
	nl1Ol :  altmult_add
	  GENERIC MAP (
		ACCUM_DIRECTION => "ADD",
		ACCUM_SLOAD_ACLR => "ACLR3",
		ACCUM_SLOAD_PIPELINE_ACLR => "ACLR3",
		ACCUM_SLOAD_PIPELINE_REGISTER => "CLOCK0",
		ACCUM_SLOAD_REGISTER => "CLOCK0",
		ACCUMULATOR => "NO",
		ADDER1_ROUNDING => "NO",
		ADDER3_ROUNDING => "NO",
		ADDNSUB1_ROUND_ACLR => "ACLR3",
		ADDNSUB1_ROUND_PIPELINE_ACLR => "ACLR3",
		ADDNSUB1_ROUND_PIPELINE_REGISTER => "CLOCK0",
		ADDNSUB1_ROUND_REGISTER => "CLOCK0",
		ADDNSUB3_ROUND_ACLR => "ACLR3",
		ADDNSUB3_ROUND_PIPELINE_ACLR => "ACLR3",
		ADDNSUB3_ROUND_PIPELINE_REGISTER => "CLOCK0",
		ADDNSUB3_ROUND_REGISTER => "CLOCK0",
		ADDNSUB_MULTIPLIER_ACLR1 => "ACLR3",
		ADDNSUB_MULTIPLIER_ACLR3 => "ACLR3",
		ADDNSUB_MULTIPLIER_PIPELINE_ACLR1 => "ACLR3",
		ADDNSUB_MULTIPLIER_PIPELINE_ACLR3 => "ACLR3",
		ADDNSUB_MULTIPLIER_PIPELINE_REGISTER1 => "CLOCK0",
		ADDNSUB_MULTIPLIER_PIPELINE_REGISTER3 => "CLOCK0",
		ADDNSUB_MULTIPLIER_REGISTER1 => "CLOCK0",
		ADDNSUB_MULTIPLIER_REGISTER3 => "CLOCK0",
		CHAINOUT_ACLR => "ACLR3",
		CHAINOUT_ADDER => "NO",
		CHAINOUT_REGISTER => "CLOCK0",
		CHAINOUT_ROUND_ACLR => "ACLR3",
		CHAINOUT_ROUND_OUTPUT_ACLR => "ACLR3",
		CHAINOUT_ROUND_OUTPUT_REGISTER => "CLOCK0",
		CHAINOUT_ROUND_PIPELINE_ACLR => "ACLR3",
		CHAINOUT_ROUND_PIPELINE_REGISTER => "CLOCK0",
		CHAINOUT_ROUND_REGISTER => "CLOCK0",
		CHAINOUT_ROUNDING => "NO",
		CHAINOUT_SATURATE_ACLR => "ACLR3",
		CHAINOUT_SATURATE_OUTPUT_ACLR => "ACLR3",
		CHAINOUT_SATURATE_OUTPUT_REGISTER => "CLOCK0",
		CHAINOUT_SATURATE_PIPELINE_ACLR => "ACLR3",
		CHAINOUT_SATURATE_PIPELINE_REGISTER => "CLOCK0",
		CHAINOUT_SATURATE_REGISTER => "CLOCK0",
		CHAINOUT_SATURATION => "NO",
		COEF0_0 => 0,
		COEF0_1 => 0,
		COEF0_2 => 0,
		COEF0_3 => 0,
		COEF0_4 => 0,
		COEF0_5 => 0,
		COEF0_6 => 0,
		COEF0_7 => 0,
		COEF1_0 => 0,
		COEF1_1 => 0,
		COEF1_2 => 0,
		COEF1_3 => 0,
		COEF1_4 => 0,
		COEF1_5 => 0,
		COEF1_6 => 0,
		COEF1_7 => 0,
		COEF2_0 => 0,
		COEF2_1 => 0,
		COEF2_2 => 0,
		COEF2_3 => 0,
		COEF2_4 => 0,
		COEF2_5 => 0,
		COEF2_6 => 0,
		COEF2_7 => 0,
		COEF3_0 => 0,
		COEF3_1 => 0,
		COEF3_2 => 0,
		COEF3_3 => 0,
		COEF3_4 => 0,
		COEF3_5 => 0,
		COEF3_6 => 0,
		COEF3_7 => 0,
		COEFSEL0_ACLR => "ACLR0",
		COEFSEL0_REGISTER => "CLOCK0",
		COEFSEL1_ACLR => "ACLR0",
		COEFSEL1_REGISTER => "CLOCK0",
		COEFSEL2_ACLR => "ACLR0",
		COEFSEL2_REGISTER => "CLOCK0",
		COEFSEL3_ACLR => "ACLR0",
		COEFSEL3_REGISTER => "CLOCK0",
		DSP_BLOCK_BALANCING => "AUTO",
		EXTRA_LATENCY => 0,
		INPUT_ACLR_A0 => "ACLR3",
		INPUT_ACLR_A1 => "ACLR3",
		INPUT_ACLR_A2 => "ACLR3",
		INPUT_ACLR_A3 => "ACLR3",
		INPUT_ACLR_B0 => "ACLR3",
		INPUT_ACLR_B1 => "ACLR3",
		INPUT_ACLR_B2 => "ACLR3",
		INPUT_ACLR_B3 => "ACLR3",
		INPUT_ACLR_C0 => "ACLR0",
		INPUT_REGISTER_A0 => "CLOCK0",
		INPUT_REGISTER_A1 => "CLOCK0",
		INPUT_REGISTER_A2 => "CLOCK0",
		INPUT_REGISTER_A3 => "CLOCK0",
		INPUT_REGISTER_B0 => "CLOCK0",
		INPUT_REGISTER_B1 => "CLOCK0",
		INPUT_REGISTER_B2 => "CLOCK0",
		INPUT_REGISTER_B3 => "CLOCK0",
		INPUT_REGISTER_C0 => "CLOCK0",
		INPUT_SOURCE_A0 => "DATAA",
		INPUT_SOURCE_A1 => "DATAA",
		INPUT_SOURCE_A2 => "DATAA",
		INPUT_SOURCE_A3 => "DATAA",
		INPUT_SOURCE_B0 => "DATAB",
		INPUT_SOURCE_B1 => "DATAB",
		INPUT_SOURCE_B2 => "DATAB",
		INPUT_SOURCE_B3 => "DATAB",
		INTENDED_DEVICE_FAMILY => "Cyclone II",
		LOADCONST_VALUE => 64,
		MULT01_ROUND_ACLR => "ACLR3",
		MULT01_ROUND_REGISTER => "CLOCK0",
		MULT01_SATURATION_ACLR => "ACLR2",
		MULT01_SATURATION_REGISTER => "CLOCK0",
		MULT23_ROUND_ACLR => "ACLR3",
		MULT23_ROUND_REGISTER => "CLOCK0",
		MULT23_SATURATION_ACLR => "ACLR3",
		MULT23_SATURATION_REGISTER => "CLOCK0",
		MULTIPLIER01_ROUNDING => "NO",
		MULTIPLIER01_SATURATION => "NO",
		MULTIPLIER1_DIRECTION => "SUB",
		MULTIPLIER23_ROUNDING => "NO",
		MULTIPLIER23_SATURATION => "NO",
		MULTIPLIER3_DIRECTION => "ADD",
		MULTIPLIER_ACLR0 => "ACLR3",
		MULTIPLIER_ACLR1 => "ACLR3",
		MULTIPLIER_ACLR2 => "ACLR3",
		MULTIPLIER_ACLR3 => "ACLR3",
		MULTIPLIER_REGISTER0 => "CLOCK0",
		MULTIPLIER_REGISTER1 => "CLOCK0",
		MULTIPLIER_REGISTER2 => "CLOCK0",
		MULTIPLIER_REGISTER3 => "CLOCK0",
		NUMBER_OF_MULTIPLIERS => 2,
		OUTPUT_ACLR => "ACLR3",
		OUTPUT_REGISTER => "CLOCK0",
		OUTPUT_ROUND_ACLR => "ACLR3",
		OUTPUT_ROUND_PIPELINE_ACLR => "ACLR3",
		OUTPUT_ROUND_PIPELINE_REGISTER => "CLOCK0",
		OUTPUT_ROUND_REGISTER => "CLOCK0",
		OUTPUT_ROUND_TYPE => "NEAREST_INTEGER",
		OUTPUT_ROUNDING => "NO",
		OUTPUT_SATURATE_ACLR => "ACLR3",
		OUTPUT_SATURATE_PIPELINE_ACLR => "ACLR3",
		OUTPUT_SATURATE_PIPELINE_REGISTER => "CLOCK0",
		OUTPUT_SATURATE_REGISTER => "CLOCK0",
		OUTPUT_SATURATE_TYPE => "ASYMMETRIC",
		OUTPUT_SATURATION => "NO",
		port_addnsub1 => "PORT_UNUSED",
		port_addnsub3 => "PORT_UNUSED",
		PORT_CHAINOUT_SAT_IS_OVERFLOW => "PORT_UNUSED",
		PORT_OUTPUT_IS_OVERFLOW => "PORT_UNUSED",
		port_signa => "PORT_CONNECTIVITY",
		port_signb => "PORT_CONNECTIVITY",
		PREADDER_DIRECTION_0 => "ADD",
		PREADDER_DIRECTION_1 => "ADD",
		PREADDER_DIRECTION_2 => "ADD",
		PREADDER_DIRECTION_3 => "ADD",
		PREADDER_MODE => "SIMPLE",
		REPRESENTATION_A => "SIGNED",
		REPRESENTATION_B => "SIGNED",
		ROTATE_ACLR => "ACLR3",
		ROTATE_OUTPUT_ACLR => "ACLR3",
		ROTATE_OUTPUT_REGISTER => "CLOCK0",
		ROTATE_PIPELINE_ACLR => "ACLR3",
		ROTATE_PIPELINE_REGISTER => "CLOCK0",
		ROTATE_REGISTER => "CLOCK0",
		SCANOUTA_ACLR => "ACLR3",
		SCANOUTA_REGISTER => "UNREGISTERED",
		SHIFT_MODE => "NO",
		SHIFT_RIGHT_ACLR => "ACLR3",
		SHIFT_RIGHT_OUTPUT_ACLR => "ACLR3",
		SHIFT_RIGHT_OUTPUT_REGISTER => "CLOCK0",
		SHIFT_RIGHT_PIPELINE_ACLR => "ACLR3",
		SHIFT_RIGHT_PIPELINE_REGISTER => "CLOCK0",
		SHIFT_RIGHT_REGISTER => "CLOCK0",
		SIGNED_ACLR_A => "ACLR3",
		SIGNED_ACLR_B => "ACLR3",
		SIGNED_PIPELINE_ACLR_A => "ACLR3",
		SIGNED_PIPELINE_ACLR_B => "ACLR3",
		SIGNED_PIPELINE_REGISTER_A => "CLOCK0",
		SIGNED_PIPELINE_REGISTER_B => "CLOCK0",
		SIGNED_REGISTER_A => "CLOCK0",
		SIGNED_REGISTER_B => "CLOCK0",
		SYSTOLIC_ACLR1 => "ACLR0",
		SYSTOLIC_ACLR3 => "ACLR0",
		SYSTOLIC_DELAY1 => "UNREGISTERED",
		SYSTOLIC_DELAY3 => "UNREGISTERED",
		WIDTH_A => 10,
		WIDTH_B => 10,
		WIDTH_C => 22,
		WIDTH_CHAININ => 1,
		WIDTH_COEF => 18,
		WIDTH_MSB => 17,
		WIDTH_RESULT => 21,
		WIDTH_SATURATE_SIGN => 1,
		ZERO_CHAINOUT_OUTPUT_ACLR => "ACLR3",
		ZERO_CHAINOUT_OUTPUT_REGISTER => "CLOCK0",
		ZERO_LOOPBACK_ACLR => "ACLR3",
		ZERO_LOOPBACK_OUTPUT_ACLR => "ACLR3",
		ZERO_LOOPBACK_OUTPUT_REGISTER => "CLOCK0",
		ZERO_LOOPBACK_PIPELINE_ACLR => "ACLR3",
		ZERO_LOOPBACK_PIPELINE_REGISTER => "CLOCK0",
		ZERO_LOOPBACK_REGISTER => "CLOCK0"
	  )
	  PORT MAP ( 
		clock0 => clk,
		dataa => wire_nl1Ol_dataa,
		datab => wire_nl1Ol_datab,
		ena0 => clken,
		result => wire_nl1Ol_result
	  );
	wire_nl1OO_dataa <= ( wire_nl1lO_q_a(9 DOWNTO 0) & wire_nl1ll_q_a(9 DOWNTO 0));
	wire_nl1OO_datab <= ( wire_nl1ll_q_b(9 DOWNTO 0) & wire_nl1Oi_q_a(9 DOWNTO 0));
	nl1OO :  altmult_add
	  GENERIC MAP (
		ACCUM_DIRECTION => "ADD",
		ACCUM_SLOAD_ACLR => "ACLR3",
		ACCUM_SLOAD_PIPELINE_ACLR => "ACLR3",
		ACCUM_SLOAD_PIPELINE_REGISTER => "CLOCK0",
		ACCUM_SLOAD_REGISTER => "CLOCK0",
		ACCUMULATOR => "NO",
		ADDER1_ROUNDING => "NO",
		ADDER3_ROUNDING => "NO",
		ADDNSUB1_ROUND_ACLR => "ACLR3",
		ADDNSUB1_ROUND_PIPELINE_ACLR => "ACLR3",
		ADDNSUB1_ROUND_PIPELINE_REGISTER => "CLOCK0",
		ADDNSUB1_ROUND_REGISTER => "CLOCK0",
		ADDNSUB3_ROUND_ACLR => "ACLR3",
		ADDNSUB3_ROUND_PIPELINE_ACLR => "ACLR3",
		ADDNSUB3_ROUND_PIPELINE_REGISTER => "CLOCK0",
		ADDNSUB3_ROUND_REGISTER => "CLOCK0",
		ADDNSUB_MULTIPLIER_ACLR1 => "ACLR3",
		ADDNSUB_MULTIPLIER_ACLR3 => "ACLR3",
		ADDNSUB_MULTIPLIER_PIPELINE_ACLR1 => "ACLR3",
		ADDNSUB_MULTIPLIER_PIPELINE_ACLR3 => "ACLR3",
		ADDNSUB_MULTIPLIER_PIPELINE_REGISTER1 => "CLOCK0",
		ADDNSUB_MULTIPLIER_PIPELINE_REGISTER3 => "CLOCK0",
		ADDNSUB_MULTIPLIER_REGISTER1 => "CLOCK0",
		ADDNSUB_MULTIPLIER_REGISTER3 => "CLOCK0",
		CHAINOUT_ACLR => "ACLR3",
		CHAINOUT_ADDER => "NO",
		CHAINOUT_REGISTER => "CLOCK0",
		CHAINOUT_ROUND_ACLR => "ACLR3",
		CHAINOUT_ROUND_OUTPUT_ACLR => "ACLR3",
		CHAINOUT_ROUND_OUTPUT_REGISTER => "CLOCK0",
		CHAINOUT_ROUND_PIPELINE_ACLR => "ACLR3",
		CHAINOUT_ROUND_PIPELINE_REGISTER => "CLOCK0",
		CHAINOUT_ROUND_REGISTER => "CLOCK0",
		CHAINOUT_ROUNDING => "NO",
		CHAINOUT_SATURATE_ACLR => "ACLR3",
		CHAINOUT_SATURATE_OUTPUT_ACLR => "ACLR3",
		CHAINOUT_SATURATE_OUTPUT_REGISTER => "CLOCK0",
		CHAINOUT_SATURATE_PIPELINE_ACLR => "ACLR3",
		CHAINOUT_SATURATE_PIPELINE_REGISTER => "CLOCK0",
		CHAINOUT_SATURATE_REGISTER => "CLOCK0",
		CHAINOUT_SATURATION => "NO",
		COEF0_0 => 0,
		COEF0_1 => 0,
		COEF0_2 => 0,
		COEF0_3 => 0,
		COEF0_4 => 0,
		COEF0_5 => 0,
		COEF0_6 => 0,
		COEF0_7 => 0,
		COEF1_0 => 0,
		COEF1_1 => 0,
		COEF1_2 => 0,
		COEF1_3 => 0,
		COEF1_4 => 0,
		COEF1_5 => 0,
		COEF1_6 => 0,
		COEF1_7 => 0,
		COEF2_0 => 0,
		COEF2_1 => 0,
		COEF2_2 => 0,
		COEF2_3 => 0,
		COEF2_4 => 0,
		COEF2_5 => 0,
		COEF2_6 => 0,
		COEF2_7 => 0,
		COEF3_0 => 0,
		COEF3_1 => 0,
		COEF3_2 => 0,
		COEF3_3 => 0,
		COEF3_4 => 0,
		COEF3_5 => 0,
		COEF3_6 => 0,
		COEF3_7 => 0,
		COEFSEL0_ACLR => "ACLR0",
		COEFSEL0_REGISTER => "CLOCK0",
		COEFSEL1_ACLR => "ACLR0",
		COEFSEL1_REGISTER => "CLOCK0",
		COEFSEL2_ACLR => "ACLR0",
		COEFSEL2_REGISTER => "CLOCK0",
		COEFSEL3_ACLR => "ACLR0",
		COEFSEL3_REGISTER => "CLOCK0",
		DSP_BLOCK_BALANCING => "AUTO",
		EXTRA_LATENCY => 0,
		INPUT_ACLR_A0 => "ACLR3",
		INPUT_ACLR_A1 => "ACLR3",
		INPUT_ACLR_A2 => "ACLR3",
		INPUT_ACLR_A3 => "ACLR3",
		INPUT_ACLR_B0 => "ACLR3",
		INPUT_ACLR_B1 => "ACLR3",
		INPUT_ACLR_B2 => "ACLR3",
		INPUT_ACLR_B3 => "ACLR3",
		INPUT_ACLR_C0 => "ACLR0",
		INPUT_REGISTER_A0 => "CLOCK0",
		INPUT_REGISTER_A1 => "CLOCK0",
		INPUT_REGISTER_A2 => "CLOCK0",
		INPUT_REGISTER_A3 => "CLOCK0",
		INPUT_REGISTER_B0 => "CLOCK0",
		INPUT_REGISTER_B1 => "CLOCK0",
		INPUT_REGISTER_B2 => "CLOCK0",
		INPUT_REGISTER_B3 => "CLOCK0",
		INPUT_REGISTER_C0 => "CLOCK0",
		INPUT_SOURCE_A0 => "DATAA",
		INPUT_SOURCE_A1 => "DATAA",
		INPUT_SOURCE_A2 => "DATAA",
		INPUT_SOURCE_A3 => "DATAA",
		INPUT_SOURCE_B0 => "DATAB",
		INPUT_SOURCE_B1 => "DATAB",
		INPUT_SOURCE_B2 => "DATAB",
		INPUT_SOURCE_B3 => "DATAB",
		INTENDED_DEVICE_FAMILY => "Cyclone II",
		LOADCONST_VALUE => 64,
		MULT01_ROUND_ACLR => "ACLR3",
		MULT01_ROUND_REGISTER => "CLOCK0",
		MULT01_SATURATION_ACLR => "ACLR2",
		MULT01_SATURATION_REGISTER => "CLOCK0",
		MULT23_ROUND_ACLR => "ACLR3",
		MULT23_ROUND_REGISTER => "CLOCK0",
		MULT23_SATURATION_ACLR => "ACLR3",
		MULT23_SATURATION_REGISTER => "CLOCK0",
		MULTIPLIER01_ROUNDING => "NO",
		MULTIPLIER01_SATURATION => "NO",
		MULTIPLIER1_DIRECTION => "ADD",
		MULTIPLIER23_ROUNDING => "NO",
		MULTIPLIER23_SATURATION => "NO",
		MULTIPLIER3_DIRECTION => "ADD",
		MULTIPLIER_ACLR0 => "ACLR3",
		MULTIPLIER_ACLR1 => "ACLR3",
		MULTIPLIER_ACLR2 => "ACLR3",
		MULTIPLIER_ACLR3 => "ACLR3",
		MULTIPLIER_REGISTER0 => "CLOCK0",
		MULTIPLIER_REGISTER1 => "CLOCK0",
		MULTIPLIER_REGISTER2 => "CLOCK0",
		MULTIPLIER_REGISTER3 => "CLOCK0",
		NUMBER_OF_MULTIPLIERS => 2,
		OUTPUT_ACLR => "ACLR3",
		OUTPUT_REGISTER => "CLOCK0",
		OUTPUT_ROUND_ACLR => "ACLR3",
		OUTPUT_ROUND_PIPELINE_ACLR => "ACLR3",
		OUTPUT_ROUND_PIPELINE_REGISTER => "CLOCK0",
		OUTPUT_ROUND_REGISTER => "CLOCK0",
		OUTPUT_ROUND_TYPE => "NEAREST_INTEGER",
		OUTPUT_ROUNDING => "NO",
		OUTPUT_SATURATE_ACLR => "ACLR3",
		OUTPUT_SATURATE_PIPELINE_ACLR => "ACLR3",
		OUTPUT_SATURATE_PIPELINE_REGISTER => "CLOCK0",
		OUTPUT_SATURATE_REGISTER => "CLOCK0",
		OUTPUT_SATURATE_TYPE => "ASYMMETRIC",
		OUTPUT_SATURATION => "NO",
		port_addnsub1 => "PORT_UNUSED",
		port_addnsub3 => "PORT_UNUSED",
		PORT_CHAINOUT_SAT_IS_OVERFLOW => "PORT_UNUSED",
		PORT_OUTPUT_IS_OVERFLOW => "PORT_UNUSED",
		port_signa => "PORT_CONNECTIVITY",
		port_signb => "PORT_CONNECTIVITY",
		PREADDER_DIRECTION_0 => "ADD",
		PREADDER_DIRECTION_1 => "ADD",
		PREADDER_DIRECTION_2 => "ADD",
		PREADDER_DIRECTION_3 => "ADD",
		PREADDER_MODE => "SIMPLE",
		REPRESENTATION_A => "SIGNED",
		REPRESENTATION_B => "SIGNED",
		ROTATE_ACLR => "ACLR3",
		ROTATE_OUTPUT_ACLR => "ACLR3",
		ROTATE_OUTPUT_REGISTER => "CLOCK0",
		ROTATE_PIPELINE_ACLR => "ACLR3",
		ROTATE_PIPELINE_REGISTER => "CLOCK0",
		ROTATE_REGISTER => "CLOCK0",
		SCANOUTA_ACLR => "ACLR3",
		SCANOUTA_REGISTER => "UNREGISTERED",
		SHIFT_MODE => "NO",
		SHIFT_RIGHT_ACLR => "ACLR3",
		SHIFT_RIGHT_OUTPUT_ACLR => "ACLR3",
		SHIFT_RIGHT_OUTPUT_REGISTER => "CLOCK0",
		SHIFT_RIGHT_PIPELINE_ACLR => "ACLR3",
		SHIFT_RIGHT_PIPELINE_REGISTER => "CLOCK0",
		SHIFT_RIGHT_REGISTER => "CLOCK0",
		SIGNED_ACLR_A => "ACLR3",
		SIGNED_ACLR_B => "ACLR3",
		SIGNED_PIPELINE_ACLR_A => "ACLR3",
		SIGNED_PIPELINE_ACLR_B => "ACLR3",
		SIGNED_PIPELINE_REGISTER_A => "CLOCK0",
		SIGNED_PIPELINE_REGISTER_B => "CLOCK0",
		SIGNED_REGISTER_A => "CLOCK0",
		SIGNED_REGISTER_B => "CLOCK0",
		SYSTOLIC_ACLR1 => "ACLR0",
		SYSTOLIC_ACLR3 => "ACLR0",
		SYSTOLIC_DELAY1 => "UNREGISTERED",
		SYSTOLIC_DELAY3 => "UNREGISTERED",
		WIDTH_A => 10,
		WIDTH_B => 10,
		WIDTH_C => 22,
		WIDTH_CHAININ => 1,
		WIDTH_COEF => 18,
		WIDTH_MSB => 17,
		WIDTH_RESULT => 21,
		WIDTH_SATURATE_SIGN => 1,
		ZERO_CHAINOUT_OUTPUT_ACLR => "ACLR3",
		ZERO_CHAINOUT_OUTPUT_REGISTER => "CLOCK0",
		ZERO_LOOPBACK_ACLR => "ACLR3",
		ZERO_LOOPBACK_OUTPUT_ACLR => "ACLR3",
		ZERO_LOOPBACK_OUTPUT_REGISTER => "CLOCK0",
		ZERO_LOOPBACK_PIPELINE_ACLR => "ACLR3",
		ZERO_LOOPBACK_PIPELINE_REGISTER => "CLOCK0",
		ZERO_LOOPBACK_REGISTER => "CLOCK0"
	  )
	  PORT MAP ( 
		clock0 => clk,
		dataa => wire_nl1OO_dataa,
		datab => wire_nl1OO_datab,
		ena0 => clken,
		result => wire_nl1OO_result
	  );
	wire_nl1ll_address_a <= ( ni0ii & ni0il & ni0iO & ni0li & ni0ll & ni0lO & ni0Oi);
	wire_nl1ll_address_b <= ( ni0Ol & ni0OO & nii1i & nii1l & nii1O & nii0i & nii0l);
	wire_nl1ll_data_a <= ( "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0");
	wire_nl1ll_data_b <= ( "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0");
	nl1ll :  altsyncram
	  GENERIC MAP (
		ADDRESS_ACLR_A => "NONE",
		ADDRESS_ACLR_B => "NONE",
		ADDRESS_REG_B => "CLOCK0",
		BYTE_SIZE => 8,
		BYTEENA_ACLR_A => "NONE",
		BYTEENA_ACLR_B => "NONE",
		BYTEENA_REG_B => "CLOCK1",
		CLOCK_ENABLE_CORE_A => "USE_INPUT_CLKEN",
		CLOCK_ENABLE_CORE_B => "USE_INPUT_CLKEN",
		CLOCK_ENABLE_INPUT_A => "NORMAL",
		CLOCK_ENABLE_INPUT_B => "NORMAL",
		CLOCK_ENABLE_OUTPUT_A => "NORMAL",
		CLOCK_ENABLE_OUTPUT_B => "NORMAL",
		ECC_PIPELINE_STAGE_ENABLED => "FALSE",
		ENABLE_ECC => "FALSE",
		INDATA_ACLR_A => "NONE",
		INDATA_ACLR_B => "NONE",
		INDATA_REG_B => "CLOCK0",
		INIT_FILE => "nco_sin_c.hex",
		INIT_FILE_LAYOUT => "PORT_A",
		INTENDED_DEVICE_FAMILY => "Cyclone II",
		NUMWORDS_A => 128,
		NUMWORDS_B => 128,
		OPERATION_MODE => "BIDIR_DUAL_PORT",
		OUTDATA_ACLR_A => "NONE",
		OUTDATA_ACLR_B => "NONE",
		OUTDATA_REG_A => "CLOCK0",
		OUTDATA_REG_B => "CLOCK0",
		RAM_BLOCK_TYPE => "AUTO",
		RDCONTROL_ACLR_B => "NONE",
		RDCONTROL_REG_B => "CLOCK1",
		READ_DURING_WRITE_MODE_MIXED_PORTS => "DONT_CARE",
		READ_DURING_WRITE_MODE_PORT_A => "NEW_DATA_NO_NBE_READ",
		READ_DURING_WRITE_MODE_PORT_B => "NEW_DATA_NO_NBE_READ",
		WIDTH_A => 10,
		WIDTH_B => 10,
		WIDTH_BYTEENA_A => 1,
		WIDTH_BYTEENA_B => 1,
		WIDTH_ECCSTATUS => 3,
		WIDTHAD_A => 7,
		WIDTHAD_B => 7,
		WRCONTROL_ACLR_A => "NONE",
		WRCONTROL_ACLR_B => "NONE",
		WRCONTROL_WRADDRESS_REG_B => "CLOCK0",
		lpm_hint => "WIDTH_BYTEENA=1"
	  )
	  PORT MAP ( 
		address_a => wire_nl1ll_address_a,
		address_b => wire_nl1ll_address_b,
		clock0 => clk,
		clocken0 => clken,
		data_a => wire_nl1ll_data_a,
		data_b => wire_nl1ll_data_b,
		q_a => wire_nl1ll_q_a,
		q_b => wire_nl1ll_q_b,
		wren_a => wire_gnd,
		wren_b => wire_gnd
	  );
	wire_nl1lO_address_a <= ( nii0O & niiii & niiil & niiiO & niili & niill & nilll);
	nl1lO :  altsyncram
	  GENERIC MAP (
		ADDRESS_ACLR_A => "NONE",
		ADDRESS_ACLR_B => "NONE",
		ADDRESS_REG_B => "CLOCK1",
		BYTE_SIZE => 8,
		BYTEENA_ACLR_A => "NONE",
		BYTEENA_ACLR_B => "NONE",
		BYTEENA_REG_B => "CLOCK1",
		CLOCK_ENABLE_CORE_A => "USE_INPUT_CLKEN",
		CLOCK_ENABLE_CORE_B => "USE_INPUT_CLKEN",
		CLOCK_ENABLE_INPUT_A => "NORMAL",
		CLOCK_ENABLE_INPUT_B => "NORMAL",
		CLOCK_ENABLE_OUTPUT_A => "NORMAL",
		CLOCK_ENABLE_OUTPUT_B => "NORMAL",
		ECC_PIPELINE_STAGE_ENABLED => "FALSE",
		ENABLE_ECC => "FALSE",
		INDATA_ACLR_A => "NONE",
		INDATA_ACLR_B => "NONE",
		INDATA_REG_B => "CLOCK1",
		INIT_FILE => "nco_sin_f.hex",
		INIT_FILE_LAYOUT => "PORT_A",
		INTENDED_DEVICE_FAMILY => "Cyclone II",
		NUMWORDS_A => 128,
		NUMWORDS_B => 1,
		OPERATION_MODE => "ROM",
		OUTDATA_ACLR_A => "NONE",
		OUTDATA_ACLR_B => "NONE",
		OUTDATA_REG_A => "CLOCK0",
		OUTDATA_REG_B => "UNREGISTERED",
		RAM_BLOCK_TYPE => "AUTO",
		RDCONTROL_ACLR_B => "NONE",
		RDCONTROL_REG_B => "CLOCK1",
		READ_DURING_WRITE_MODE_MIXED_PORTS => "DONT_CARE",
		READ_DURING_WRITE_MODE_PORT_A => "NEW_DATA_NO_NBE_READ",
		READ_DURING_WRITE_MODE_PORT_B => "NEW_DATA_NO_NBE_READ",
		WIDTH_A => 10,
		WIDTH_B => 1,
		WIDTH_BYTEENA_A => 1,
		WIDTH_BYTEENA_B => 1,
		WIDTH_ECCSTATUS => 3,
		WIDTHAD_A => 7,
		WIDTHAD_B => 1,
		WRCONTROL_ACLR_A => "NONE",
		WRCONTROL_ACLR_B => "NONE",
		WRCONTROL_WRADDRESS_REG_B => "CLOCK1",
		lpm_hint => "WIDTH_BYTEENA=1"
	  )
	  PORT MAP ( 
		address_a => wire_nl1lO_address_a,
		clock0 => clk,
		clocken0 => clken,
		q_a => wire_nl1lO_q_a
	  );
	wire_nl1Oi_address_a <= ( nii0O & niiii & niiil & niiiO & niili & niill & nilll);
	nl1Oi :  altsyncram
	  GENERIC MAP (
		ADDRESS_ACLR_A => "NONE",
		ADDRESS_ACLR_B => "NONE",
		ADDRESS_REG_B => "CLOCK1",
		BYTE_SIZE => 8,
		BYTEENA_ACLR_A => "NONE",
		BYTEENA_ACLR_B => "NONE",
		BYTEENA_REG_B => "CLOCK1",
		CLOCK_ENABLE_CORE_A => "USE_INPUT_CLKEN",
		CLOCK_ENABLE_CORE_B => "USE_INPUT_CLKEN",
		CLOCK_ENABLE_INPUT_A => "NORMAL",
		CLOCK_ENABLE_INPUT_B => "NORMAL",
		CLOCK_ENABLE_OUTPUT_A => "NORMAL",
		CLOCK_ENABLE_OUTPUT_B => "NORMAL",
		ECC_PIPELINE_STAGE_ENABLED => "FALSE",
		ENABLE_ECC => "FALSE",
		INDATA_ACLR_A => "NONE",
		INDATA_ACLR_B => "NONE",
		INDATA_REG_B => "CLOCK1",
		INIT_FILE => "nco_cos_f.hex",
		INIT_FILE_LAYOUT => "PORT_A",
		INTENDED_DEVICE_FAMILY => "Cyclone II",
		NUMWORDS_A => 128,
		NUMWORDS_B => 1,
		OPERATION_MODE => "ROM",
		OUTDATA_ACLR_A => "NONE",
		OUTDATA_ACLR_B => "NONE",
		OUTDATA_REG_A => "CLOCK0",
		OUTDATA_REG_B => "UNREGISTERED",
		RAM_BLOCK_TYPE => "AUTO",
		RDCONTROL_ACLR_B => "NONE",
		RDCONTROL_REG_B => "CLOCK1",
		READ_DURING_WRITE_MODE_MIXED_PORTS => "DONT_CARE",
		READ_DURING_WRITE_MODE_PORT_A => "NEW_DATA_NO_NBE_READ",
		READ_DURING_WRITE_MODE_PORT_B => "NEW_DATA_NO_NBE_READ",
		WIDTH_A => 10,
		WIDTH_B => 1,
		WIDTH_BYTEENA_A => 1,
		WIDTH_BYTEENA_B => 1,
		WIDTH_ECCSTATUS => 3,
		WIDTHAD_A => 7,
		WIDTHAD_B => 1,
		WRCONTROL_ACLR_A => "NONE",
		WRCONTROL_ACLR_B => "NONE",
		WRCONTROL_WRADDRESS_REG_B => "CLOCK1",
		lpm_hint => "WIDTH_BYTEENA=1"
	  )
	  PORT MAP ( 
		address_a => wire_nl1Oi_address_a,
		clock0 => clk,
		clocken0 => clken,
		q_a => wire_nl1Oi_q_a
	  );
	PROCESS (clk)
	BEGIN
		IF (clk = '1' AND clk'event) THEN nlO00i3 <= nlO00i4;
		END IF;
		if (now = 0 ns) then
			nlO00i3 <= '1' after 1 ps;
		end if;
	END PROCESS;
	PROCESS (clk)
	BEGIN
		IF (clk = '1' AND clk'event) THEN nlO00i4 <= nlO00i3;
		END IF;
	END PROCESS;
	wire_nlO00i4_w_lg_q72w(0) <= nlO00i4 XOR nlO00i3;
	PROCESS (clk)
	BEGIN
		IF (clk = '1' AND clk'event) THEN nlO01l5 <= nlO01l6;
		END IF;
		if (now = 0 ns) then
			nlO01l5 <= '1' after 1 ps;
		end if;
	END PROCESS;
	PROCESS (clk)
	BEGIN
		IF (clk = '1' AND clk'event) THEN nlO01l6 <= nlO01l5;
		END IF;
	END PROCESS;
	PROCESS (clk)
	BEGIN
		IF (clk = '1' AND clk'event) THEN nlO0iO1 <= nlO0iO2;
		END IF;
		if (now = 0 ns) then
			nlO0iO1 <= '1' after 1 ps;
		end if;
	END PROCESS;
	PROCESS (clk)
	BEGIN
		IF (clk = '1' AND clk'event) THEN nlO0iO2 <= nlO0iO1;
		END IF;
	END PROCESS;
	PROCESS (clk)
	BEGIN
		IF (clk = '1' AND clk'event) THEN nlO10O17 <= nlO10O18;
		END IF;
		if (now = 0 ns) then
			nlO10O17 <= '1' after 1 ps;
		end if;
	END PROCESS;
	PROCESS (clk)
	BEGIN
		IF (clk = '1' AND clk'event) THEN nlO10O18 <= nlO10O17;
		END IF;
	END PROCESS;
	PROCESS (clk)
	BEGIN
		IF (clk = '1' AND clk'event) THEN nlO1il15 <= nlO1il16;
		END IF;
		if (now = 0 ns) then
			nlO1il15 <= '1' after 1 ps;
		end if;
	END PROCESS;
	PROCESS (clk)
	BEGIN
		IF (clk = '1' AND clk'event) THEN nlO1il16 <= nlO1il15;
		END IF;
	END PROCESS;
	wire_nlO1il16_w_lg_w_lg_q627w628w(0) <= wire_nlO1il16_w_lg_q627w(0) AND n1l1O;
	wire_nlO1il16_w_lg_q627w(0) <= nlO1il16 XOR nlO1il15;
	PROCESS (clk)
	BEGIN
		IF (clk = '1' AND clk'event) THEN nlO1iO13 <= nlO1iO14;
		END IF;
		if (now = 0 ns) then
			nlO1iO13 <= '1' after 1 ps;
		end if;
	END PROCESS;
	PROCESS (clk)
	BEGIN
		IF (clk = '1' AND clk'event) THEN nlO1iO14 <= nlO1iO13;
		END IF;
	END PROCESS;
	wire_nlO1iO14_w_lg_w_lg_q618w619w(0) <= wire_nlO1iO14_w_lg_q618w(0) AND n1lli;
	wire_nlO1iO14_w_lg_q618w(0) <= nlO1iO14 XOR nlO1iO13;
	PROCESS (clk)
	BEGIN
		IF (clk = '1' AND clk'event) THEN nlO1li11 <= nlO1li12;
		END IF;
		if (now = 0 ns) then
			nlO1li11 <= '1' after 1 ps;
		end if;
	END PROCESS;
	PROCESS (clk)
	BEGIN
		IF (clk = '1' AND clk'event) THEN nlO1li12 <= nlO1li11;
		END IF;
	END PROCESS;
	wire_nlO1li12_w_lg_w_lg_q496w497w(0) <= wire_nlO1li12_w_lg_q496w(0) AND n0lli;
	wire_nlO1li12_w_lg_q496w(0) <= nlO1li12 XOR nlO1li11;
	PROCESS (clk)
	BEGIN
		IF (clk = '1' AND clk'event) THEN nlO1ll10 <= nlO1ll9;
		END IF;
	END PROCESS;
	PROCESS (clk)
	BEGIN
		IF (clk = '1' AND clk'event) THEN nlO1ll9 <= nlO1ll10;
		END IF;
		if (now = 0 ns) then
			nlO1ll9 <= '1' after 1 ps;
		end if;
	END PROCESS;
	PROCESS (clk)
	BEGIN
		IF (clk = '1' AND clk'event) THEN nlO1Ol7 <= nlO1Ol8;
		END IF;
		if (now = 0 ns) then
			nlO1Ol7 <= '1' after 1 ps;
		end if;
	END PROCESS;
	PROCESS (clk)
	BEGIN
		IF (clk = '1' AND clk'event) THEN nlO1Ol8 <= nlO1Ol7;
		END IF;
	END PROCESS;
	PROCESS (clk, wire_n01O_CLRN)
	BEGIN
		IF (wire_n01O_CLRN = '0') THEN
				n00i <= '0';
				n0lil <= '0';
				n0lli <= '0';
				n0lll <= '0';
				n0llO <= '0';
				n0lOi <= '0';
				n0lOl <= '0';
				n0lOO <= '0';
				n0O0i <= '0';
				n0O0l <= '0';
				n0O0O <= '0';
				n0O1i <= '0';
				n0O1l <= '0';
				n0O1O <= '0';
				n0Oii <= '0';
				n0Oil <= '0';
				n1l0i <= '0';
				n1l0l <= '0';
				n1l0O <= '0';
				n1l1i <= '0';
				n1l1l <= '0';
				n1l1O <= '0';
				n1lii <= '0';
				n1lil <= '0';
				n1liO <= '0';
				n1lli <= '0';
				n1lll <= '0';
				n1llO <= '0';
				n1lO <= '0';
				n1lOi <= '0';
				n1lOl <= '0';
				n1lOO <= '0';
				n1O0i <= '0';
				n1O0l <= '0';
				n1O0O <= '0';
				n1O1i <= '0';
				n1O1l <= '0';
				n1O1O <= '0';
				n1Oii <= '0';
				n1Oil <= '0';
				n1OiO <= '0';
				n1Oli <= '0';
				n1Oll <= '0';
				ni0ii <= '0';
				ni0il <= '0';
				ni0iO <= '0';
				ni0li <= '0';
				ni0ll <= '0';
				ni0lO <= '0';
				ni0Oi <= '0';
				ni0Ol <= '0';
				ni0OO <= '0';
				nii0i <= '0';
				nii0l <= '0';
				nii0O <= '0';
				nii1i <= '0';
				nii1l <= '0';
				nii1O <= '0';
				niiii <= '0';
				niiil <= '0';
				niiiO <= '0';
				niili <= '0';
				niill <= '0';
				nilll <= '0';
				nl00i <= '0';
				nl00l <= '0';
				nl00O <= '0';
				nl01O <= '0';
				nl0ii <= '0';
				nl0il <= '0';
				nl0iO <= '0';
				nl0li <= '0';
				nl0ll <= '0';
				nl0lO <= '0';
				nll0O <= '0';
				nlliO <= '0';
				nllli <= '0';
				nllll <= '0';
				nlllO <= '0';
				nllOi <= '0';
				nllOl <= '0';
				nllOO <= '0';
				nlO0ll <= '0';
				nlO0lO <= '0';
				nlO0Oi <= '0';
				nlO0Ol <= '0';
				nlO0OO <= '0';
				nlO1i <= '0';
				nlO1l <= '0';
				nlO1O <= '0';
				nlOi0i <= '0';
				nlOi0l <= '0';
				nlOi0O <= '0';
				nlOi1i <= '0';
				nlOi1l <= '0';
				nlOi1O <= '0';
				nlOiii <= '0';
				nlOiil <= '0';
				nlOiiO <= '0';
				nlOili <= '0';
				nlOill <= '0';
				nlOilO <= '0';
				nlOiOi <= '0';
				nlOiOl <= '0';
				nlOiOO <= '0';
				nlOl0i <= '0';
				nlOl0l <= '0';
				nlOl0O <= '0';
				nlOl1i <= '0';
				nlOl1l <= '0';
				nlOl1O <= '0';
				nlOlii <= '0';
				nlOlil <= '0';
				nlOliO <= '0';
				nlOlli <= '0';
				nlOlll <= '0';
		ELSIF (clk = '1' AND clk'event) THEN
				n00i <= wire_n1OO_dataout;
				n0lil <= wire_n1OlO_dataout;
				n0lli <= wire_ni1ii_dataout;
				n0lll <= wire_ni10O_dataout;
				n0llO <= wire_ni10l_dataout;
				n0lOi <= wire_ni10i_dataout;
				n0lOl <= wire_ni11O_dataout;
				n0lOO <= wire_ni11l_dataout;
				n0O0i <= wire_n0OOi_dataout;
				n0O0l <= wire_n0OlO_dataout;
				n0O0O <= wire_n0Oll_dataout;
				n0O1i <= wire_ni11i_dataout;
				n0O1l <= wire_n0OOO_dataout;
				n0O1O <= wire_n0OOl_dataout;
				n0Oii <= wire_n0Oli_dataout;
				n0Oil <= wire_n0OiO_dataout;
				n1l0i <= wire_n000l_dataout;
				n1l0l <= wire_n000i_dataout;
				n1l0O <= wire_n001O_dataout;
				n1l1i <= wire_nlOllO_dataout;
				n1l1l <= wire_n00ii_dataout;
				n1l1O <= wire_n000O_dataout;
				n1lii <= wire_n001l_dataout;
				n1lil <= wire_n001i_dataout;
				n1liO <= wire_n01OO_dataout;
				n1lli <= wire_n01Ol_dataout;
				n1lll <= wire_n01Oi_dataout;
				n1llO <= wire_n01lO_dataout;
				n1lO <= wire_nlO0i_dataout;
				n1lOi <= wire_n01ll_dataout;
				n1lOl <= wire_n01li_dataout;
				n1lOO <= wire_n01iO_dataout;
				n1O0i <= wire_n010l_dataout;
				n1O0l <= wire_n010i_dataout;
				n1O0O <= wire_n011O_dataout;
				n1O1i <= wire_n01il_dataout;
				n1O1l <= wire_n01ii_dataout;
				n1O1O <= wire_n010O_dataout;
				n1Oii <= wire_n011l_dataout;
				n1Oil <= wire_n011i_dataout;
				n1OiO <= wire_n1OOO_dataout;
				n1Oli <= wire_n1OOl_dataout;
				n1Oll <= wire_n1OOi_dataout;
				ni0ii <= wire_niO1O_dataout;
				ni0il <= wire_niO1l_dataout;
				ni0iO <= wire_niO1i_dataout;
				ni0li <= wire_nilOO_dataout;
				ni0ll <= wire_nilOl_dataout;
				ni0lO <= wire_nilOi_dataout;
				ni0Oi <= wire_nillO_dataout;
				ni0Ol <= wire_nilli_dataout;
				ni0OO <= wire_niliO_dataout;
				nii0i <= wire_nil0l_dataout;
				nii0l <= wire_nil0i_dataout;
				nii0O <= wire_nil1O_dataout;
				nii1i <= wire_nilil_dataout;
				nii1l <= wire_nilii_dataout;
				nii1O <= wire_nil0O_dataout;
				niiii <= wire_nil1l_dataout;
				niiil <= wire_nil1i_dataout;
				niiiO <= wire_niiOO_dataout;
				niili <= wire_niiOl_dataout;
				niill <= wire_niiOi_dataout;
				nilll <= wire_niilO_dataout;
				nl00i <= wire_nli0O_dataout;
				nl00l <= wire_nli0l_dataout;
				nl00O <= wire_nli0i_dataout;
				nl01O <= wire_nliii_dataout;
				nl0ii <= wire_nli1O_dataout;
				nl0il <= wire_nli1l_dataout;
				nl0iO <= wire_nli1i_dataout;
				nl0li <= wire_nl0OO_dataout;
				nl0ll <= wire_nl0Ol_dataout;
				nl0lO <= wire_nll0i_dataout;
				nll0O <= wire_nl0Oi_dataout;
				nlliO <= wire_nlOOi_dataout;
				nllli <= wire_nlOlO_dataout;
				nllll <= wire_nlOll_dataout;
				nlllO <= wire_nlOli_dataout;
				nllOi <= wire_nlOiO_dataout;
				nllOl <= wire_nlOil_dataout;
				nllOO <= wire_nlOii_dataout;
				nlO0ll <= wire_n11Oi_dataout;
				nlO0lO <= wire_n11lO_dataout;
				nlO0Oi <= wire_n11ll_dataout;
				nlO0Ol <= wire_n11li_dataout;
				nlO0OO <= wire_n11iO_dataout;
				nlO1i <= wire_nlO0O_dataout;
				nlO1l <= wire_nlO0l_dataout;
				nlO1O <= wire_n1li_dataout;
				nlOi0i <= wire_n110l_dataout;
				nlOi0l <= wire_n110i_dataout;
				nlOi0O <= wire_n111O_dataout;
				nlOi1i <= wire_n11il_dataout;
				nlOi1l <= wire_n11ii_dataout;
				nlOi1O <= wire_n110O_dataout;
				nlOiii <= wire_n111l_dataout;
				nlOiil <= wire_n111i_dataout;
				nlOiiO <= wire_nlOOOO_dataout;
				nlOili <= wire_nlOOOl_dataout;
				nlOill <= wire_nlOOOi_dataout;
				nlOilO <= wire_nlOOlO_dataout;
				nlOiOi <= wire_nlOOll_dataout;
				nlOiOl <= wire_nlOOli_dataout;
				nlOiOO <= wire_nlOOiO_dataout;
				nlOl0i <= wire_nlOO0l_dataout;
				nlOl0l <= wire_nlOO0i_dataout;
				nlOl0O <= wire_nlOO1O_dataout;
				nlOl1i <= wire_nlOOil_dataout;
				nlOl1l <= wire_nlOOii_dataout;
				nlOl1O <= wire_nlOO0O_dataout;
				nlOlii <= wire_nlOO1l_dataout;
				nlOlil <= wire_nlOO1i_dataout;
				nlOliO <= wire_nlOlOO_dataout;
				nlOlli <= wire_nlOlOl_dataout;
				nlOlll <= wire_nlOlOi_dataout;
		END IF;
		if (now = 0 ns) then
			n00i <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n0lil <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n0lli <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n0lll <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n0llO <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n0lOi <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n0lOl <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n0lOO <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n0O0i <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n0O0l <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n0O0O <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n0O1i <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n0O1l <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n0O1O <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n0Oii <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n0Oil <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n1l0i <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n1l0l <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n1l0O <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n1l1i <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n1l1l <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n1l1O <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n1lii <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n1lil <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n1liO <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n1lli <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n1lll <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n1llO <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n1lO <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n1lOi <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n1lOl <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n1lOO <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n1O0i <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n1O0l <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n1O0O <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n1O1i <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n1O1l <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n1O1O <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n1Oii <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n1Oil <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n1OiO <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n1Oli <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			n1Oll <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			ni0ii <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			ni0il <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			ni0iO <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			ni0li <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			ni0ll <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			ni0lO <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			ni0Oi <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			ni0Ol <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			ni0OO <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nii0i <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nii0l <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nii0O <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nii1i <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nii1l <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nii1O <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			niiii <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			niiil <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			niiiO <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			niili <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			niill <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nilll <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nl00i <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nl00l <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nl00O <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nl01O <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nl0ii <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nl0il <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nl0iO <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nl0li <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nl0ll <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nl0lO <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nll0O <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlliO <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nllli <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nllll <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlllO <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nllOi <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nllOl <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nllOO <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlO0ll <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlO0lO <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlO0Oi <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlO0Ol <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlO0OO <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlO1i <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlO1l <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlO1O <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlOi0i <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlOi0l <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlOi0O <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlOi1i <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlOi1l <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlOi1O <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlOiii <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlOiil <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlOiiO <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlOili <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlOill <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlOilO <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlOiOi <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlOiOl <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlOiOO <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlOl0i <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlOl0l <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlOl0O <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlOl1i <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlOl1l <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlOl1O <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlOlii <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlOlil <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlOliO <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlOlli <= '1' after 1 ps;
		end if;
		if (now = 0 ns) then
			nlOlll <= '1' after 1 ps;
		end if;
	END PROCESS;
	wire_n01O_CLRN <= (nlO0iO2 XOR nlO0iO1);
	wire_n01O_w_lg_nl01O185w(0) <= NOT nl01O;
	wire_n01O_w_lg_nlliO115w(0) <= NOT nlliO;
	wire_n0liO_aclr <= wire_w_lg_reset_n78w(0);
	wire_n0liO_dataa <= ( wire_nlO0li_result(31 DOWNTO 13));
	wire_n0liO_datab <= ( n1O1O & n1O1O & n1O1O & n1O1O & n1O1O & n1O1O & n1O1O & n1O1O & n1O1O & n1O1O & n1O0i & n1O0l & n1O0O & n1Oii & n1Oil & n1OiO & n1Oli & n1Oll & n0lil);
	n0liO :  lpm_add_sub
	  GENERIC MAP (
		LPM_DIRECTION => "ADD",
		LPM_PIPELINE => 1,
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 19
	  )
	  PORT MAP ( 
		aclr => wire_n0liO_aclr,
		clken => clken,
		clock => clk,
		dataa => wire_n0liO_dataa,
		datab => wire_n0liO_datab,
		result => wire_n0liO_result
	  );
	wire_nl01i_aclr <= wire_w_lg_reset_n78w(0);
	wire_nl01i_cin <= wire_n01O_w_lg_nl0lO186w(0);
	wire_n01O_w_lg_nl0lO186w(0) <= nl0lO AND wire_n01O_w_lg_nl01O185w(0);
	wire_nl01i_dataa <= ( nl01O & nl00i & nl00l & nl00O & nl0ii & nl0il & nl0iO & nl0li & nl0ll & nll0O);
	wire_nl01i_datab <= ( "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0");
	nl01i :  lpm_add_sub
	  GENERIC MAP (
		LPM_DIRECTION => "ADD",
		LPM_PIPELINE => 1,
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 10
	  )
	  PORT MAP ( 
		aclr => wire_nl01i_aclr,
		cin => wire_nl01i_cin,
		clken => clken,
		clock => clk,
		dataa => wire_nl01i_dataa,
		datab => wire_nl01i_datab,
		result => wire_nl01i_result
	  );
	wire_nllii_aclr <= wire_w_lg_reset_n78w(0);
	wire_nllii_cin <= wire_n01O_w_lg_nlO1O116w(0);
	wire_n01O_w_lg_nlO1O116w(0) <= nlO1O AND wire_n01O_w_lg_nlliO115w(0);
	wire_nllii_dataa <= ( nlliO & nllli & nllll & nlllO & nllOi & nllOl & nllOO & nlO1i & nlO1l & n1lO);
	wire_nllii_datab <= ( "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0");
	nllii :  lpm_add_sub
	  GENERIC MAP (
		LPM_DIRECTION => "ADD",
		LPM_PIPELINE => 1,
		LPM_REPRESENTATION => "SIGNED",
		LPM_WIDTH => 10
	  )
	  PORT MAP ( 
		aclr => wire_nllii_aclr,
		cin => wire_nllii_cin,
		clken => clken,
		clock => clk,
		dataa => wire_nllii_dataa,
		datab => wire_nllii_datab,
		result => wire_nllii_result
	  );
	wire_nlO0li_aclr <= wire_w_lg_reset_n78w(0);
	wire_nlO0li_dataa <= ( nlO0ll & nlO0lO & nlO0Oi & nlO0Ol & nlO0OO & nlOi1i & nlOi1l & nlOi1O & nlOi0i & nlOi0l & nlOi0O & nlOiii & nlOiil & nlOiiO & nlOili & nlOill & nlOilO & nlOiOi & nlOiOl & nlOiOO & nlOl1i & nlOl1l & nlOl1O & nlOl0i & nlOl0l & nlOl0O & nlOlii & nlOlil & nlOliO & nlOlli & nlOlll & n1l1i);
	wire_nlO0li_datab <= ( wire_nlO0li_result(31 DOWNTO 0));
	nlO0li :  lpm_add_sub
	  GENERIC MAP (
		LPM_DIRECTION => "ADD",
		LPM_PIPELINE => 1,
		LPM_REPRESENTATION => "UNSIGNED",
		LPM_WIDTH => 32
	  )
	  PORT MAP ( 
		aclr => wire_nlO0li_aclr,
		clken => clken,
		clock => clk,
		dataa => wire_nlO0li_dataa,
		datab => wire_nlO0li_datab,
		result => wire_nlO0li_result
	  );
	wire_n1Oi_w_lg_w_lg_w_lg_w_lg_w_q_range62w64w67w70w73w(0) <= wire_n1Oi_w_lg_w_lg_w_lg_w_q_range62w64w67w70w(0) AND wire_nlO00i4_w_lg_q72w(0);
	wire_n1Oi_w_lg_w_lg_w_lg_w_q_range62w64w67w70w(0) <= wire_n1Oi_w_lg_w_lg_w_q_range62w64w67w(0) AND wire_n1Oi_w_lg_w_q_range68w69w(0);
	wire_n1Oi_w_lg_w_lg_w_q_range62w64w67w(0) <= wire_n1Oi_w_lg_w_q_range62w64w(0) AND wire_n1Oi_w_lg_w_q_range65w66w(0);
	wire_n1Oi_w_lg_w_q_range62w64w(0) <= wire_n1Oi_w_q_range62w(0) AND wire_n1Oi_w_q_range63w(0);
	wire_n1Oi_w_lg_w_q_range65w66w(0) <= NOT wire_n1Oi_w_q_range65w(0);
	wire_n1Oi_w_lg_w_q_range68w69w(0) <= NOT wire_n1Oi_w_q_range68w(0);
	wire_n1Oi_aclr <= wire_w_lg_reset_n78w(0);
	wire_n1Oi_w_q_range65w(0) <= wire_n1Oi_q(0);
	wire_n1Oi_w_q_range62w(0) <= wire_n1Oi_q(1);
	wire_n1Oi_w_q_range68w(0) <= wire_n1Oi_q(2);
	wire_n1Oi_w_q_range63w(0) <= wire_n1Oi_q(3);
	n1Oi :  lpm_counter
	  GENERIC MAP (
		LPM_DIRECTION => "UP",
		LPM_MODULUS => 0,
		LPM_PORT_UPDOWN => "PORT_CONNECTIVITY",
		LPM_WIDTH => 4
	  )
	  PORT MAP ( 
		aclr => wire_n1Oi_aclr,
		clk_en => clken,
		clock => clk,
		q => wire_n1Oi_q
	  );
	wire_n000i_dataout <= wire_n0iOO_dataout OR wire_w_lg_reset_n78w(0);
	wire_n000l_dataout <= wire_n0l1i_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n000O_dataout <= wire_n0l1l_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n001i_dataout <= wire_n0ilO_dataout OR wire_w_lg_reset_n78w(0);
	wire_n001l_dataout <= wire_n0iOi_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n001O_dataout <= wire_n0iOl_dataout OR wire_w_lg_reset_n78w(0);
	wire_n00ii_dataout <= wire_n0l1O_dataout OR wire_w_lg_reset_n78w(0);
	wire_n00il_dataout <= wire_n0l0i_o(0) WHEN clken = '1'  ELSE n0lil;
	wire_n00iO_dataout <= wire_n0l0i_o(1) WHEN clken = '1'  ELSE n1Oll;
	wire_n00li_dataout <= wire_n0l0i_o(2) WHEN clken = '1'  ELSE n1Oli;
	wire_n00ll_dataout <= wire_n0l0i_o(3) WHEN clken = '1'  ELSE n1OiO;
	wire_n00lO_dataout <= wire_n0l0i_o(4) WHEN clken = '1'  ELSE n1Oil;
	wire_n00Oi_dataout <= wire_n0l0i_o(5) WHEN clken = '1'  ELSE n1Oii;
	wire_n00Ol_dataout <= wire_n0l0i_o(6) WHEN clken = '1'  ELSE n1O0O;
	wire_n00OO_dataout <= wire_n0l0i_o(7) WHEN clken = '1'  ELSE n1O0l;
	wire_n010i_dataout <= wire_n00OO_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n010l_dataout <= wire_n0i1i_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n010O_dataout <= wire_n0i1l_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n011i_dataout <= wire_n00lO_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n011l_dataout <= wire_n00Oi_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n011O_dataout <= wire_n00Ol_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n01i_dataout <= n00i OR (wire_w_lg_clken74w(0) AND (nlO01l6 XOR nlO01l5));
	wire_n01ii_dataout <= wire_n0i1O_dataout OR wire_w_lg_reset_n78w(0);
	wire_n01il_dataout <= wire_n0i0i_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n01iO_dataout <= wire_n0i0l_dataout OR wire_w_lg_reset_n78w(0);
	wire_n01li_dataout <= wire_n0i0O_dataout OR wire_w_lg_reset_n78w(0);
	wire_n01ll_dataout <= wire_n0iii_dataout OR wire_w_lg_reset_n78w(0);
	wire_n01lO_dataout <= wire_n0iil_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n01Oi_dataout <= wire_n0iiO_dataout OR wire_w_lg_reset_n78w(0);
	wire_n01Ol_dataout <= wire_n0ili_dataout OR wire_w_lg_reset_n78w(0);
	wire_n01OO_dataout <= wire_n0ill_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n0i0i_dataout <= n1O1l WHEN clken = '1'  ELSE n1O1i;
	wire_n0i0l_dataout <= n1O1i WHEN clken = '1'  ELSE n1lOO;
	wire_n0i0O_dataout <= n1lOO WHEN clken = '1'  ELSE n1lOl;
	wire_n0i1i_dataout <= wire_n0l0i_o(8) WHEN clken = '1'  ELSE n1O0i;
	wire_n0i1l_dataout <= wire_n0l0i_o(9) WHEN clken = '1'  ELSE n1O1O;
	wire_n0i1O_dataout <= (((n1l1O XOR n1l1l) XOR (n1lOl XOR n1l0l)) XOR (NOT (nlO10O18 XOR nlO10O17))) WHEN clken = '1'  ELSE n1O1l;
	wire_n0iii_dataout <= n1lOl WHEN clken = '1'  ELSE n1lOi;
	wire_n0iil_dataout <= n1lOi WHEN clken = '1'  ELSE n1llO;
	wire_n0iiO_dataout <= n1llO WHEN clken = '1'  ELSE n1lll;
	wire_n0ili_dataout <= n1lll WHEN clken = '1'  ELSE n1lli;
	wire_n0ill_dataout <= n1lli WHEN clken = '1'  ELSE n1liO;
	wire_n0ilO_dataout <= n1liO WHEN clken = '1'  ELSE n1lil;
	wire_n0iOi_dataout <= n1lil WHEN clken = '1'  ELSE n1lii;
	wire_n0iOl_dataout <= n1lii WHEN clken = '1'  ELSE n1l0O;
	wire_n0iOO_dataout <= n1l0O WHEN clken = '1'  ELSE n1l0l;
	wire_n0l1i_dataout <= n1l0l WHEN clken = '1'  ELSE n1l0i;
	wire_n0l1l_dataout <= n1l0i WHEN clken = '1'  ELSE n1l1O;
	wire_n0l1O_dataout <= n1l1O WHEN clken = '1'  ELSE n1l1l;
	wire_n0OiO_dataout <= wire_ni1il_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n0Oli_dataout <= wire_ni1iO_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n0Oll_dataout <= wire_ni1li_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n0OlO_dataout <= wire_ni1ll_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n0OOi_dataout <= wire_ni1lO_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n0OOl_dataout <= wire_ni1Oi_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n0OOO_dataout <= wire_ni1Ol_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n100i_dataout <= phi_inc_i(5) WHEN clken = '1'  ELSE nlOlii;
	wire_n100l_dataout <= phi_inc_i(6) WHEN clken = '1'  ELSE nlOl0O;
	wire_n100O_dataout <= phi_inc_i(7) WHEN clken = '1'  ELSE nlOl0l;
	wire_n101i_dataout <= phi_inc_i(2) WHEN clken = '1'  ELSE nlOlli;
	wire_n101l_dataout <= phi_inc_i(3) WHEN clken = '1'  ELSE nlOliO;
	wire_n101O_dataout <= phi_inc_i(4) WHEN clken = '1'  ELSE nlOlil;
	wire_n10i_dataout <= wire_nl1Ol_result(14) WHEN clken = '1'  ELSE nllOi;
	wire_n10ii_dataout <= phi_inc_i(8) WHEN clken = '1'  ELSE nlOl0i;
	wire_n10il_dataout <= phi_inc_i(9) WHEN clken = '1'  ELSE nlOl1O;
	wire_n10iO_dataout <= phi_inc_i(10) WHEN clken = '1'  ELSE nlOl1l;
	wire_n10l_dataout <= wire_nl1Ol_result(15) WHEN clken = '1'  ELSE nlllO;
	wire_n10li_dataout <= phi_inc_i(11) WHEN clken = '1'  ELSE nlOl1i;
	wire_n10ll_dataout <= phi_inc_i(12) WHEN clken = '1'  ELSE nlOiOO;
	wire_n10lO_dataout <= phi_inc_i(13) WHEN clken = '1'  ELSE nlOiOl;
	wire_n10O_dataout <= wire_nl1Ol_result(16) WHEN clken = '1'  ELSE nllll;
	wire_n10Oi_dataout <= phi_inc_i(14) WHEN clken = '1'  ELSE nlOiOi;
	wire_n10Ol_dataout <= phi_inc_i(15) WHEN clken = '1'  ELSE nlOilO;
	wire_n10OO_dataout <= phi_inc_i(16) WHEN clken = '1'  ELSE nlOill;
	wire_n110i_dataout <= wire_n1i0O_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n110l_dataout <= wire_n1iii_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n110O_dataout <= wire_n1iil_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n111i_dataout <= wire_n1i1O_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n111l_dataout <= wire_n1i0i_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n111O_dataout <= wire_n1i0l_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n11i_dataout <= wire_nl1Ol_result(11) WHEN clken = '1'  ELSE nlO1i;
	wire_n11ii_dataout <= wire_n1iiO_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n11il_dataout <= wire_n1ili_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n11iO_dataout <= wire_n1ill_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n11l_dataout <= wire_nl1Ol_result(12) WHEN clken = '1'  ELSE nllOO;
	wire_n11li_dataout <= wire_n1ilO_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n11ll_dataout <= wire_n1iOi_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n11lO_dataout <= wire_n1iOl_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n11O_dataout <= wire_nl1Ol_result(13) WHEN clken = '1'  ELSE nllOl;
	wire_n11Oi_dataout <= wire_n1iOO_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n11Ol_dataout <= phi_inc_i(0) WHEN clken = '1'  ELSE n1l1i;
	wire_n11OO_dataout <= phi_inc_i(1) WHEN clken = '1'  ELSE nlOlll;
	wire_n1i0i_dataout <= phi_inc_i(20) WHEN clken = '1'  ELSE nlOiii;
	wire_n1i0l_dataout <= phi_inc_i(21) WHEN clken = '1'  ELSE nlOi0O;
	wire_n1i0O_dataout <= phi_inc_i(22) WHEN clken = '1'  ELSE nlOi0l;
	wire_n1i1i_dataout <= phi_inc_i(17) WHEN clken = '1'  ELSE nlOili;
	wire_n1i1l_dataout <= phi_inc_i(18) WHEN clken = '1'  ELSE nlOiiO;
	wire_n1i1O_dataout <= phi_inc_i(19) WHEN clken = '1'  ELSE nlOiil;
	wire_n1ii_dataout <= wire_nl1Ol_result(17) WHEN clken = '1'  ELSE nllli;
	wire_n1iii_dataout <= phi_inc_i(23) WHEN clken = '1'  ELSE nlOi0i;
	wire_n1iil_dataout <= phi_inc_i(24) WHEN clken = '1'  ELSE nlOi1O;
	wire_n1iiO_dataout <= phi_inc_i(25) WHEN clken = '1'  ELSE nlOi1l;
	wire_n1il_dataout <= wire_nl1Ol_result(18) WHEN clken = '1'  ELSE nlliO;
	wire_n1ili_dataout <= phi_inc_i(26) WHEN clken = '1'  ELSE nlOi1i;
	wire_n1ill_dataout <= phi_inc_i(27) WHEN clken = '1'  ELSE nlO0OO;
	wire_n1ilO_dataout <= phi_inc_i(28) WHEN clken = '1'  ELSE nlO0Ol;
	wire_n1iOi_dataout <= phi_inc_i(29) WHEN clken = '1'  ELSE nlO0Oi;
	wire_n1iOl_dataout <= phi_inc_i(30) WHEN clken = '1'  ELSE nlO0lO;
	wire_n1iOO_dataout <= phi_inc_i(31) WHEN clken = '1'  ELSE nlO0ll;
	wire_n1li_dataout <= wire_n1ll_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n1ll_dataout <= wire_w_lg_nlO01i79w(0) WHEN clken = '1'  ELSE nlO1O;
	wire_n1OlO_dataout <= wire_n00il_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n1OO_dataout <= wire_n01i_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n1OOi_dataout <= wire_n00iO_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n1OOl_dataout <= wire_n00li_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n1OOO_dataout <= wire_n00ll_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_ni00i_dataout <= wire_n0liO_result(16) WHEN clken = '1'  ELSE n0llO;
	wire_ni00l_dataout <= wire_n0liO_result(17) WHEN clken = '1'  ELSE n0lll;
	wire_ni00O_dataout <= wire_n0liO_result(18) WHEN clken = '1'  ELSE n0lli;
	wire_ni01i_dataout <= wire_n0liO_result(13) WHEN clken = '1'  ELSE n0lOO;
	wire_ni01l_dataout <= wire_n0liO_result(14) WHEN clken = '1'  ELSE n0lOl;
	wire_ni01O_dataout <= wire_n0liO_result(15) WHEN clken = '1'  ELSE n0lOi;
	wire_ni10i_dataout <= wire_ni01O_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_ni10l_dataout <= wire_ni00i_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_ni10O_dataout <= wire_ni00l_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_ni11i_dataout <= wire_ni1OO_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_ni11l_dataout <= wire_ni01i_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_ni11O_dataout <= wire_ni01l_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_ni1ii_dataout <= wire_ni00O_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_ni1il_dataout <= wire_n0liO_result(5) WHEN clken = '1'  ELSE n0Oil;
	wire_ni1iO_dataout <= wire_n0liO_result(6) WHEN clken = '1'  ELSE n0Oii;
	wire_ni1li_dataout <= wire_n0liO_result(7) WHEN clken = '1'  ELSE n0O0O;
	wire_ni1ll_dataout <= wire_n0liO_result(8) WHEN clken = '1'  ELSE n0O0l;
	wire_ni1lO_dataout <= wire_n0liO_result(9) WHEN clken = '1'  ELSE n0O0i;
	wire_ni1Oi_dataout <= wire_n0liO_result(10) WHEN clken = '1'  ELSE n0O1O;
	wire_ni1Ol_dataout <= wire_n0liO_result(11) WHEN clken = '1'  ELSE n0O1l;
	wire_ni1OO_dataout <= wire_n0liO_result(12) WHEN clken = '1'  ELSE n0O1i;
	wire_niilO_dataout <= wire_niO0i_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_niiOi_dataout <= wire_niO0l_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_niiOl_dataout <= wire_niO0O_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_niiOO_dataout <= wire_niOii_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nil0i_dataout <= wire_niOll_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nil0l_dataout <= wire_niOlO_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nil0O_dataout <= wire_niOOi_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nil1i_dataout <= wire_niOil_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nil1l_dataout <= wire_niOiO_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nil1O_dataout <= wire_niOli_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nilii_dataout <= wire_niOOl_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nilil_dataout <= wire_niOOO_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_niliO_dataout <= wire_nl11i_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nilli_dataout <= wire_nl11l_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nillO_dataout <= wire_nl11O_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nilOi_dataout <= wire_nl10i_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nilOl_dataout <= wire_nl10l_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nilOO_dataout <= wire_nl10O_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_niO0i_dataout <= n0Oil WHEN clken = '1'  ELSE nilll;
	wire_niO0l_dataout <= n0Oii WHEN clken = '1'  ELSE niill;
	wire_niO0O_dataout <= n0O0O WHEN clken = '1'  ELSE niili;
	wire_niO1i_dataout <= wire_nl1ii_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_niO1l_dataout <= wire_nl1il_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_niO1O_dataout <= wire_nl1iO_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_niOii_dataout <= n0O0l WHEN clken = '1'  ELSE niiiO;
	wire_niOil_dataout <= n0O0i WHEN clken = '1'  ELSE niiil;
	wire_niOiO_dataout <= n0O1O WHEN clken = '1'  ELSE niiii;
	wire_niOli_dataout <= n0O1l WHEN clken = '1'  ELSE nii0O;
	wire_niOll_dataout <= wire_nl1li_o(0) WHEN clken = '1'  ELSE nii0l;
	wire_niOlO_dataout <= wire_nl1li_o(1) WHEN clken = '1'  ELSE nii0i;
	wire_niOOi_dataout <= wire_nl1li_o(2) WHEN clken = '1'  ELSE nii1O;
	wire_niOOl_dataout <= wire_nl1li_o(3) WHEN clken = '1'  ELSE nii1l;
	wire_niOOO_dataout <= wire_nl1li_o(4) WHEN clken = '1'  ELSE nii1i;
	wire_nl0Oi_dataout <= wire_nliil_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nl0Ol_dataout <= wire_nliiO_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nl0OO_dataout <= wire_nlili_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nl10i_dataout <= n0lOO WHEN clken = '1'  ELSE ni0lO;
	wire_nl10l_dataout <= n0lOl WHEN clken = '1'  ELSE ni0ll;
	wire_nl10O_dataout <= n0lOi WHEN clken = '1'  ELSE ni0li;
	wire_nl11i_dataout <= wire_nl1li_o(5) WHEN clken = '1'  ELSE ni0OO;
	wire_nl11l_dataout <= wire_nl1li_o(6) WHEN clken = '1'  ELSE ni0Ol;
	wire_nl11O_dataout <= n0O1i WHEN clken = '1'  ELSE ni0Oi;
	wire_nl1ii_dataout <= n0llO WHEN clken = '1'  ELSE ni0iO;
	wire_nl1il_dataout <= n0lll WHEN clken = '1'  ELSE ni0il;
	wire_nl1iO_dataout <= n0lli WHEN clken = '1'  ELSE ni0ii;
	wire_nli0i_dataout <= wire_nliOl_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nli0l_dataout <= wire_nliOO_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nli0O_dataout <= wire_nll1i_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nli1i_dataout <= wire_nlill_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nli1l_dataout <= wire_nlilO_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nli1O_dataout <= wire_nliOi_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nliii_dataout <= wire_nll1l_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nliil_dataout <= wire_nl1OO_result(9) WHEN clken = '1'  ELSE nll0O;
	wire_nliiO_dataout <= wire_nl1OO_result(10) WHEN clken = '1'  ELSE nl0ll;
	wire_nlili_dataout <= wire_nl1OO_result(11) WHEN clken = '1'  ELSE nl0li;
	wire_nlill_dataout <= wire_nl1OO_result(12) WHEN clken = '1'  ELSE nl0iO;
	wire_nlilO_dataout <= wire_nl1OO_result(13) WHEN clken = '1'  ELSE nl0il;
	wire_nliOi_dataout <= wire_nl1OO_result(14) WHEN clken = '1'  ELSE nl0ii;
	wire_nliOl_dataout <= wire_nl1OO_result(15) WHEN clken = '1'  ELSE nl00O;
	wire_nliOO_dataout <= wire_nl1OO_result(16) WHEN clken = '1'  ELSE nl00l;
	wire_nll0i_dataout <= wire_nll0l_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nll0l_dataout <= wire_w_lg_nlO1Oi149w(0) WHEN clken = '1'  ELSE nl0lO;
	wire_nll1i_dataout <= wire_nl1OO_result(17) WHEN clken = '1'  ELSE nl00i;
	wire_nll1l_dataout <= wire_nl1OO_result(18) WHEN clken = '1'  ELSE nl01O;
	wire_nlO0i_dataout <= wire_nlOOl_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nlO0l_dataout <= wire_nlOOO_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nlO0O_dataout <= wire_n11i_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nlOii_dataout <= wire_n11l_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nlOil_dataout <= wire_n11O_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nlOiO_dataout <= wire_n10i_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nlOli_dataout <= wire_n10l_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nlOll_dataout <= wire_n10O_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nlOllO_dataout <= wire_n11Ol_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nlOlO_dataout <= wire_n1ii_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nlOlOi_dataout <= wire_n11OO_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nlOlOl_dataout <= wire_n101i_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nlOlOO_dataout <= wire_n101l_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nlOO0i_dataout <= wire_n100O_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nlOO0l_dataout <= wire_n10ii_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nlOO0O_dataout <= wire_n10il_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nlOO1i_dataout <= wire_n101O_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nlOO1l_dataout <= wire_n100i_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nlOO1O_dataout <= wire_n100l_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nlOOi_dataout <= wire_n1il_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nlOOii_dataout <= wire_n10iO_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nlOOil_dataout <= wire_n10li_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nlOOiO_dataout <= wire_n10ll_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nlOOl_dataout <= wire_nl1Ol_result(9) WHEN clken = '1'  ELSE n1lO;
	wire_nlOOli_dataout <= wire_n10lO_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nlOOll_dataout <= wire_n10Oi_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nlOOlO_dataout <= wire_n10Ol_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nlOOO_dataout <= wire_nl1Ol_result(10) WHEN clken = '1'  ELSE nlO1l;
	wire_nlOOOi_dataout <= wire_n10OO_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nlOOOl_dataout <= wire_n1i1i_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_nlOOOO_dataout <= wire_n1i1l_dataout AND NOT(wire_w_lg_reset_n78w(0));
	wire_n0l0i_a <= ( n1l1l & wire_nlO1il16_w_lg_w_lg_q627w628w & n1l0i & n1l0l & n1l0O & n1lii & n1lil & n1liO & wire_nlO1iO14_w_lg_w_lg_q618w619w & n1lll);
	wire_n0l0i_b <= ( "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & n1l1l);
	n0l0i :  oper_add
	  GENERIC MAP (
		sgate_representation => 0,
		width_a => 10,
		width_b => 10,
		width_o => 10
	  )
	  PORT MAP ( 
		a => wire_n0l0i_a,
		b => wire_n0l0i_b,
		cin => wire_gnd,
		o => wire_n0l0i_o
	  );
	wire_nl1li_a <= ( "0" & wire_nlO1li12_w_lg_w_lg_q496w497w & n0lll & n0llO & n0lOi & n0lOl & n0lOO & n0O1i);
	wire_nl1li_b <= ( "0" & "0" & "1" & "0" & "0" & "0" & "0" & "0");
	nl1li :  oper_add
	  GENERIC MAP (
		sgate_representation => 0,
		width_a => 8,
		width_b => 8,
		width_o => 8
	  )
	  PORT MAP ( 
		a => wire_nl1li_a,
		b => wire_nl1li_b,
		cin => wire_gnd,
		o => wire_nl1li_o
	  );

 END RTL; --nco
--synopsys translate_on
--VALID FILE
