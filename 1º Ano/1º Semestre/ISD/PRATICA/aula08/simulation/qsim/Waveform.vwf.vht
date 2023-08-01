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
-- Generated on "12/09/2021 09:55:46"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          AddSubDemo
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY AddSubDemo_vhd_vec_tst IS
END AddSubDemo_vhd_vec_tst;
ARCHITECTURE AddSubDemo_arch OF AddSubDemo_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL Input0 : STD_LOGIC;
SIGNAL Input1 : STD_LOGIC;
SIGNAL Input2 : STD_LOGIC;
SIGNAL Input3 : STD_LOGIC;
SIGNAL Input4 : STD_LOGIC;
SIGNAL Input5 : STD_LOGIC;
SIGNAL Input6 : STD_LOGIC;
SIGNAL Input7 : STD_LOGIC;
SIGNAL Overflow : STD_LOGIC;
SIGNAL Sub : STD_LOGIC;
SIGNAL Sum1 : STD_LOGIC;
SIGNAL Sum2 : STD_LOGIC;
SIGNAL Sum3 : STD_LOGIC;
SIGNAL Sum4 : STD_LOGIC;
COMPONENT AddSubDemo
	PORT (
	Input0 : IN STD_LOGIC;
	Input1 : IN STD_LOGIC;
	Input2 : IN STD_LOGIC;
	Input3 : IN STD_LOGIC;
	Input4 : IN STD_LOGIC;
	Input5 : IN STD_LOGIC;
	Input6 : IN STD_LOGIC;
	Input7 : IN STD_LOGIC;
	Overflow : OUT STD_LOGIC;
	Sub : IN STD_LOGIC;
	Sum1 : OUT STD_LOGIC;
	Sum2 : OUT STD_LOGIC;
	Sum3 : OUT STD_LOGIC;
	Sum4 : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : AddSubDemo
	PORT MAP (
-- list connections between master ports and signals
	Input0 => Input0,
	Input1 => Input1,
	Input2 => Input2,
	Input3 => Input3,
	Input4 => Input4,
	Input5 => Input5,
	Input6 => Input6,
	Input7 => Input7,
	Overflow => Overflow,
	Sub => Sub,
	Sum1 => Sum1,
	Sum2 => Sum2,
	Sum3 => Sum3,
	Sum4 => Sum4
	);

-- Sub
t_prcs_Sub: PROCESS
BEGIN
	Sub <= '0';
	WAIT FOR 490000 ps;
	Sub <= '1';
WAIT;
END PROCESS t_prcs_Sub;

-- Input0
t_prcs_Input0: PROCESS
BEGIN
	Input0 <= '0';
	WAIT FOR 20000 ps;
	Input0 <= '1';
	WAIT FOR 160000 ps;
	Input0 <= '0';
	WAIT FOR 130000 ps;
	Input0 <= '1';
	WAIT FOR 40000 ps;
	Input0 <= '0';
	WAIT FOR 160000 ps;
	Input0 <= '1';
	WAIT FOR 160000 ps;
	Input0 <= '0';
	WAIT FOR 140000 ps;
	Input0 <= '1';
	WAIT FOR 40000 ps;
	Input0 <= '0';
WAIT;
END PROCESS t_prcs_Input0;

-- Input1
t_prcs_Input1: PROCESS
BEGIN
	Input1 <= '0';
	WAIT FOR 40000 ps;
	Input1 <= '1';
	WAIT FOR 140000 ps;
	Input1 <= '0';
	WAIT FOR 110000 ps;
	Input1 <= '1';
	WAIT FOR 40000 ps;
	Input1 <= '0';
	WAIT FOR 20000 ps;
	Input1 <= '1';
	WAIT FOR 20000 ps;
	Input1 <= '0';
	WAIT FOR 160000 ps;
	Input1 <= '1';
	WAIT FOR 140000 ps;
	Input1 <= '0';
	WAIT FOR 120000 ps;
	Input1 <= '1';
	WAIT FOR 40000 ps;
	Input1 <= '0';
	WAIT FOR 20000 ps;
	Input1 <= '1';
	WAIT FOR 20000 ps;
	Input1 <= '0';
WAIT;
END PROCESS t_prcs_Input1;

-- Input2
t_prcs_Input2: PROCESS
BEGIN
	Input2 <= '0';
	WAIT FOR 60000 ps;
	Input2 <= '1';
	WAIT FOR 120000 ps;
	Input2 <= '0';
	WAIT FOR 90000 ps;
	Input2 <= '1';
	WAIT FOR 60000 ps;
	Input2 <= '0';
	WAIT FOR 40000 ps;
	Input2 <= '1';
	WAIT FOR 20000 ps;
	Input2 <= '0';
	WAIT FOR 160000 ps;
	Input2 <= '1';
	WAIT FOR 120000 ps;
	Input2 <= '0';
	WAIT FOR 100000 ps;
	Input2 <= '1';
	WAIT FOR 60000 ps;
	Input2 <= '0';
	WAIT FOR 40000 ps;
	Input2 <= '1';
	WAIT FOR 20000 ps;
	Input2 <= '0';
WAIT;
END PROCESS t_prcs_Input2;

-- Input3
t_prcs_Input3: PROCESS
BEGIN
	Input3 <= '0';
	WAIT FOR 80000 ps;
	Input3 <= '1';
	WAIT FOR 100000 ps;
	Input3 <= '0';
	WAIT FOR 70000 ps;
	Input3 <= '1';
	WAIT FOR 80000 ps;
	Input3 <= '0';
	WAIT FOR 60000 ps;
	Input3 <= '1';
	WAIT FOR 20000 ps;
	Input3 <= '0';
	WAIT FOR 160000 ps;
	Input3 <= '1';
	WAIT FOR 100000 ps;
	Input3 <= '0';
	WAIT FOR 80000 ps;
	Input3 <= '1';
	WAIT FOR 80000 ps;
	Input3 <= '0';
	WAIT FOR 60000 ps;
	Input3 <= '1';
	WAIT FOR 20000 ps;
	Input3 <= '0';
WAIT;
END PROCESS t_prcs_Input3;

-- Input4
t_prcs_Input4: PROCESS
BEGIN
	Input4 <= '0';
	WAIT FOR 100000 ps;
	Input4 <= '1';
	WAIT FOR 80000 ps;
	Input4 <= '0';
	WAIT FOR 50000 ps;
	Input4 <= '1';
	WAIT FOR 100000 ps;
	Input4 <= '0';
	WAIT FOR 80000 ps;
	Input4 <= '1';
	WAIT FOR 20000 ps;
	Input4 <= '0';
	WAIT FOR 160000 ps;
	Input4 <= '1';
	WAIT FOR 80000 ps;
	Input4 <= '0';
	WAIT FOR 60000 ps;
	Input4 <= '1';
	WAIT FOR 100000 ps;
	Input4 <= '0';
	WAIT FOR 80000 ps;
	Input4 <= '1';
	WAIT FOR 20000 ps;
	Input4 <= '0';
WAIT;
END PROCESS t_prcs_Input4;

-- Input5
t_prcs_Input5: PROCESS
BEGIN
	Input5 <= '0';
	WAIT FOR 120000 ps;
	Input5 <= '1';
	WAIT FOR 60000 ps;
	Input5 <= '0';
	WAIT FOR 30000 ps;
	Input5 <= '1';
	WAIT FOR 120000 ps;
	Input5 <= '0';
	WAIT FOR 100000 ps;
	Input5 <= '1';
	WAIT FOR 20000 ps;
	Input5 <= '0';
	WAIT FOR 160000 ps;
	Input5 <= '1';
	WAIT FOR 60000 ps;
	Input5 <= '0';
	WAIT FOR 40000 ps;
	Input5 <= '1';
	WAIT FOR 120000 ps;
	Input5 <= '0';
	WAIT FOR 100000 ps;
	Input5 <= '1';
	WAIT FOR 20000 ps;
	Input5 <= '0';
WAIT;
END PROCESS t_prcs_Input5;

-- Input6
t_prcs_Input6: PROCESS
BEGIN
	Input6 <= '0';
	WAIT FOR 140000 ps;
	Input6 <= '1';
	WAIT FOR 40000 ps;
	Input6 <= '0';
	WAIT FOR 20000 ps;
	Input6 <= '1';
	WAIT FOR 130000 ps;
	Input6 <= '0';
	WAIT FOR 120000 ps;
	Input6 <= '1';
	WAIT FOR 20000 ps;
	Input6 <= '0';
	WAIT FOR 160000 ps;
	Input6 <= '1';
	WAIT FOR 40000 ps;
	Input6 <= '0';
	WAIT FOR 20000 ps;
	Input6 <= '1';
	WAIT FOR 140000 ps;
	Input6 <= '0';
	WAIT FOR 120000 ps;
	Input6 <= '1';
	WAIT FOR 20000 ps;
	Input6 <= '0';
WAIT;
END PROCESS t_prcs_Input6;

-- Input7
t_prcs_Input7: PROCESS
BEGIN
	Input7 <= '0';
	WAIT FOR 160000 ps;
	Input7 <= '1';
	WAIT FOR 170000 ps;
	Input7 <= '0';
	WAIT FOR 140000 ps;
	Input7 <= '1';
	WAIT FOR 20000 ps;
	Input7 <= '0';
	WAIT FOR 160000 ps;
	Input7 <= '1';
	WAIT FOR 180000 ps;
	Input7 <= '0';
	WAIT FOR 140000 ps;
	Input7 <= '1';
	WAIT FOR 20000 ps;
	Input7 <= '0';
WAIT;
END PROCESS t_prcs_Input7;
END AddSubDemo_arch;
