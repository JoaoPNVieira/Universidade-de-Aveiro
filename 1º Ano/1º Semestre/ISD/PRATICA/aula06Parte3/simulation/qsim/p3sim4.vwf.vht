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
-- Generated on "12/16/2021 00:18:53"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          EncoderDemo
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY EncoderDemo_vhd_vec_tst IS
END EncoderDemo_vhd_vec_tst;
ARCHITECTURE EncoderDemo_arch OF EncoderDemo_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL EL : STD_LOGIC;
SIGNAL InPort_0 : STD_LOGIC;
SIGNAL InPort_1 : STD_LOGIC;
SIGNAL InPort_2 : STD_LOGIC;
SIGNAL InPort_3 : STD_LOGIC;
SIGNAL InPort_4 : STD_LOGIC;
SIGNAL InPort_5 : STD_LOGIC;
SIGNAL InPort_6 : STD_LOGIC;
SIGNAL InPort_7 : STD_LOGIC;
SIGNAL OutPort_0 : STD_LOGIC;
SIGNAL OutPort_1 : STD_LOGIC;
SIGNAL OutPort_2 : STD_LOGIC;
SIGNAL pin_name1 : STD_LOGIC;
COMPONENT EncoderDemo
	PORT (
	EL : IN STD_LOGIC;
	InPort_0 : IN STD_LOGIC;
	InPort_1 : IN STD_LOGIC;
	InPort_2 : IN STD_LOGIC;
	InPort_3 : IN STD_LOGIC;
	InPort_4 : IN STD_LOGIC;
	InPort_5 : IN STD_LOGIC;
	InPort_6 : IN STD_LOGIC;
	InPort_7 : IN STD_LOGIC;
	OutPort_0 : OUT STD_LOGIC;
	OutPort_1 : OUT STD_LOGIC;
	OutPort_2 : OUT STD_LOGIC;
	pin_name1 : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : EncoderDemo
	PORT MAP (
-- list connections between master ports and signals
	EL => EL,
	InPort_0 => InPort_0,
	InPort_1 => InPort_1,
	InPort_2 => InPort_2,
	InPort_3 => InPort_3,
	InPort_4 => InPort_4,
	InPort_5 => InPort_5,
	InPort_6 => InPort_6,
	InPort_7 => InPort_7,
	OutPort_0 => OutPort_0,
	OutPort_1 => OutPort_1,
	OutPort_2 => OutPort_2,
	pin_name1 => pin_name1
	);

-- EL
t_prcs_EL: PROCESS
BEGIN
	EL <= '1';
	WAIT FOR 40000 ps;
	EL <= '0';
WAIT;
END PROCESS t_prcs_EL;

-- InPort_0
t_prcs_InPort_0: PROCESS
BEGIN
	InPort_0 <= '0';
	WAIT FOR 80000 ps;
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
	WAIT FOR 120000 ps;
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
	WAIT FOR 200000 ps;
	InPort_2 <= '1';
	WAIT FOR 160000 ps;
	InPort_2 <= '0';
	WAIT FOR 160000 ps;
	InPort_2 <= '1';
	WAIT FOR 40000 ps;
	InPort_2 <= '0';
	WAIT FOR 40000 ps;
	InPort_2 <= '1';
	WAIT FOR 80000 ps;
	InPort_2 <= '0';
WAIT;
END PROCESS t_prcs_InPort_2;

-- InPort_3
t_prcs_InPort_3: PROCESS
BEGIN
	InPort_3 <= '0';
	WAIT FOR 360000 ps;
	InPort_3 <= '1';
	WAIT FOR 320000 ps;
	InPort_3 <= '0';
WAIT;
END PROCESS t_prcs_InPort_3;

-- InPort_4
t_prcs_InPort_4: PROCESS
BEGIN
	InPort_4 <= '0';
WAIT;
END PROCESS t_prcs_InPort_4;

-- InPort_5
t_prcs_InPort_5: PROCESS
BEGIN
	InPort_5 <= '0';
WAIT;
END PROCESS t_prcs_InPort_5;

-- InPort_6
t_prcs_InPort_6: PROCESS
BEGIN
	InPort_6 <= '0';
WAIT;
END PROCESS t_prcs_InPort_6;

-- InPort_7
t_prcs_InPort_7: PROCESS
BEGIN
	InPort_7 <= '0';
WAIT;
END PROCESS t_prcs_InPort_7;
END EncoderDemo_arch;
