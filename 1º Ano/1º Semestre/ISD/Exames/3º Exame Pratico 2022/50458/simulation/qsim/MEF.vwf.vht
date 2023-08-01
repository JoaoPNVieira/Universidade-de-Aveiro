-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "02/17/2022 17:14:15"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          ISDSim2
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY ISDSim2_vhd_vec_tst IS
END ISDSim2_vhd_vec_tst;
ARCHITECTURE ISDSim2_arch OF ISDSim2_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL Clock : STD_LOGIC;
SIGNAL outQ0 : STD_LOGIC;
SIGNAL outQ1 : STD_LOGIC;
SIGNAL Reset_L : STD_LOGIC;
SIGNAL X : STD_LOGIC;
COMPONENT ISDSim2
	PORT (
	Clock : IN STD_LOGIC;
	outQ0 : OUT STD_LOGIC;
	outQ1 : OUT STD_LOGIC;
	Reset_L : IN STD_LOGIC;
	X : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : ISDSim2
	PORT MAP (
-- list connections between master ports and signals
	Clock => Clock,
	outQ0 => outQ0,
	outQ1 => outQ1,
	Reset_L => Reset_L,
	X => X
	);
END ISDSim2_arch;
