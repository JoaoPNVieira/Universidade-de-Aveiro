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
-- Generated on "12/15/2021 20:29:42"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          DecoderDemo2
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY DecoderDemo2_vhd_vec_tst IS
END DecoderDemo2_vhd_vec_tst;
ARCHITECTURE DecoderDemo2_arch OF DecoderDemo2_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL E1 : STD_LOGIC;
SIGNAL EN_L : STD_LOGIC;
SIGNAL InPort_0 : STD_LOGIC;
SIGNAL InPort_1 : STD_LOGIC;
SIGNAL InPort_2 : STD_LOGIC;
SIGNAL InPort_3 : STD_LOGIC;
SIGNAL OutPort_0 : STD_LOGIC;
SIGNAL OutPort_1 : STD_LOGIC;
SIGNAL OutPort_2 : STD_LOGIC;
SIGNAL OutPort_3 : STD_LOGIC;
SIGNAL OutPort_4 : STD_LOGIC;
SIGNAL OutPort_5 : STD_LOGIC;
SIGNAL OutPort_6 : STD_LOGIC;
SIGNAL OutPort_7 : STD_LOGIC;
SIGNAL OutPort_8 : STD_LOGIC;
SIGNAL OutPort_9 : STD_LOGIC;
SIGNAL OutPort_10 : STD_LOGIC;
SIGNAL OutPort_11 : STD_LOGIC;
SIGNAL OutPort_12 : STD_LOGIC;
SIGNAL OutPort_13 : STD_LOGIC;
SIGNAL OutPort_14 : STD_LOGIC;
SIGNAL OutPort_15 : STD_LOGIC;
COMPONENT DecoderDemo2
	PORT (
	E1 : IN STD_LOGIC;
	EN_L : IN STD_LOGIC;
	InPort_0 : IN STD_LOGIC;
	InPort_1 : IN STD_LOGIC;
	InPort_2 : IN STD_LOGIC;
	InPort_3 : IN STD_LOGIC;
	OutPort_0 : OUT STD_LOGIC;
	OutPort_1 : OUT STD_LOGIC;
	OutPort_2 : OUT STD_LOGIC;
	OutPort_3 : OUT STD_LOGIC;
	OutPort_4 : OUT STD_LOGIC;
	OutPort_5 : OUT STD_LOGIC;
	OutPort_6 : OUT STD_LOGIC;
	OutPort_7 : OUT STD_LOGIC;
	OutPort_8 : OUT STD_LOGIC;
	OutPort_9 : OUT STD_LOGIC;
	OutPort_10 : OUT STD_LOGIC;
	OutPort_11 : OUT STD_LOGIC;
	OutPort_12 : OUT STD_LOGIC;
	OutPort_13 : OUT STD_LOGIC;
	OutPort_14 : OUT STD_LOGIC;
	OutPort_15 : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : DecoderDemo2
	PORT MAP (
-- list connections between master ports and signals
	E1 => E1,
	EN_L => EN_L,
	InPort_0 => InPort_0,
	InPort_1 => InPort_1,
	InPort_2 => InPort_2,
	InPort_3 => InPort_3,
	OutPort_0 => OutPort_0,
	OutPort_1 => OutPort_1,
	OutPort_2 => OutPort_2,
	OutPort_3 => OutPort_3,
	OutPort_4 => OutPort_4,
	OutPort_5 => OutPort_5,
	OutPort_6 => OutPort_6,
	OutPort_7 => OutPort_7,
	OutPort_8 => OutPort_8,
	OutPort_9 => OutPort_9,
	OutPort_10 => OutPort_10,
	OutPort_11 => OutPort_11,
	OutPort_12 => OutPort_12,
	OutPort_13 => OutPort_13,
	OutPort_14 => OutPort_14,
	OutPort_15 => OutPort_15
	);

-- E1
t_prcs_E1: PROCESS
BEGIN
	E1 <= '1';
	WAIT FOR 640000 ps;
	E1 <= '0';
	WAIT FOR 40000 ps;
	E1 <= '1';
	WAIT FOR 40000 ps;
	E1 <= '0';
	WAIT FOR 40000 ps;
	E1 <= '1';
WAIT;
END PROCESS t_prcs_E1;

-- EN_L
t_prcs_EN_L: PROCESS
BEGIN
	EN_L <= '0';
	WAIT FOR 720000 ps;
	EN_L <= '1';
	WAIT FOR 230000 ps;
	EN_L <= '0';
WAIT;
END PROCESS t_prcs_EN_L;

-- InPort_0
t_prcs_InPort_0: PROCESS
BEGIN
	InPort_0 <= '0';
	WAIT FOR 40000 ps;
	InPort_0 <= '1';
	WAIT FOR 40000 ps;
	InPort_0 <= '0';
	WAIT FOR 40000 ps;
	InPort_0 <= '1';
	WAIT FOR 40000 ps;
	InPort_0 <= '0';
	WAIT FOR 40000 ps;
	InPort_0 <= '1';
	WAIT FOR 40000 ps;
	InPort_0 <= '0';
	WAIT FOR 40000 ps;
	InPort_0 <= '1';
	WAIT FOR 40000 ps;
	InPort_0 <= '0';
	WAIT FOR 40000 ps;
	InPort_0 <= '1';
	WAIT FOR 40000 ps;
	InPort_0 <= '0';
	WAIT FOR 40000 ps;
	InPort_0 <= '1';
	WAIT FOR 40000 ps;
	InPort_0 <= '0';
	WAIT FOR 40000 ps;
	InPort_0 <= '1';
	WAIT FOR 40000 ps;
	InPort_0 <= '0';
	WAIT FOR 40000 ps;
	InPort_0 <= '1';
	WAIT FOR 40000 ps;
	InPort_0 <= '0';
WAIT;
END PROCESS t_prcs_InPort_0;

-- InPort_1
t_prcs_InPort_1: PROCESS
BEGIN
	InPort_1 <= '0';
	WAIT FOR 80000 ps;
	InPort_1 <= '1';
	WAIT FOR 80000 ps;
	InPort_1 <= '0';
	WAIT FOR 80000 ps;
	InPort_1 <= '1';
	WAIT FOR 80000 ps;
	InPort_1 <= '0';
	WAIT FOR 80000 ps;
	InPort_1 <= '1';
	WAIT FOR 80000 ps;
	InPort_1 <= '0';
	WAIT FOR 80000 ps;
	InPort_1 <= '1';
	WAIT FOR 80000 ps;
	InPort_1 <= '0';
WAIT;
END PROCESS t_prcs_InPort_1;

-- InPort_2
t_prcs_InPort_2: PROCESS
BEGIN
	InPort_2 <= '0';
	WAIT FOR 160000 ps;
	InPort_2 <= '1';
	WAIT FOR 160000 ps;
	InPort_2 <= '0';
	WAIT FOR 160000 ps;
	InPort_2 <= '1';
	WAIT FOR 160000 ps;
	InPort_2 <= '0';
WAIT;
END PROCESS t_prcs_InPort_2;

-- InPort_3
t_prcs_InPort_3: PROCESS
BEGIN
	InPort_3 <= '0';
	WAIT FOR 320000 ps;
	InPort_3 <= '1';
	WAIT FOR 320000 ps;
	InPort_3 <= '0';
WAIT;
END PROCESS t_prcs_InPort_3;
END DecoderDemo2_arch;
