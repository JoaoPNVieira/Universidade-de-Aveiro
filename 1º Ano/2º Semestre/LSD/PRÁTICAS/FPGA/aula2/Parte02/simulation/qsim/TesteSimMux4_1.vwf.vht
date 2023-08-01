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
-- Generated on "05/11/2022 00:51:15"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Mux4_1
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Mux4_1_vhd_vec_tst IS
END Mux4_1_vhd_vec_tst;
ARCHITECTURE Mux4_1_arch OF Mux4_1_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL inputs : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL outputs : STD_LOGIC;
SIGNAL sel : STD_LOGIC_VECTOR(1 DOWNTO 0);
COMPONENT Mux4_1
	PORT (
	inputs : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	outputs : BUFFER STD_LOGIC;
	sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Mux4_1
	PORT MAP (
-- list connections between master ports and signals
	inputs => inputs,
	outputs => outputs,
	sel => sel
	);
-- sel[1]
t_prcs_sel_1: PROCESS
BEGIN
	sel(1) <= '0';
	WAIT FOR 40000 ps;
	sel(1) <= '1';
	WAIT FOR 120000 ps;
	sel(1) <= '0';
	WAIT FOR 40000 ps;
	sel(1) <= '1';
	WAIT FOR 40000 ps;
	sel(1) <= '0';
	WAIT FOR 80000 ps;
	sel(1) <= '1';
	WAIT FOR 200000 ps;
	sel(1) <= '0';
	WAIT FOR 40000 ps;
	sel(1) <= '1';
	WAIT FOR 40000 ps;
	sel(1) <= '0';
	WAIT FOR 120000 ps;
	sel(1) <= '1';
	WAIT FOR 40000 ps;
	sel(1) <= '0';
	WAIT FOR 80000 ps;
	sel(1) <= '1';
	WAIT FOR 40000 ps;
	sel(1) <= '0';
	WAIT FOR 40000 ps;
	sel(1) <= '1';
	WAIT FOR 40000 ps;
	sel(1) <= '0';
WAIT;
END PROCESS t_prcs_sel_1;
-- sel[0]
t_prcs_sel_0: PROCESS
BEGIN
	sel(0) <= '1';
	WAIT FOR 160000 ps;
	sel(0) <= '0';
	WAIT FOR 80000 ps;
	sel(0) <= '1';
	WAIT FOR 80000 ps;
	sel(0) <= '0';
	WAIT FOR 80000 ps;
	sel(0) <= '1';
	WAIT FOR 40000 ps;
	sel(0) <= '0';
	WAIT FOR 40000 ps;
	sel(0) <= '1';
	WAIT FOR 160000 ps;
	sel(0) <= '0';
	WAIT FOR 40000 ps;
	sel(0) <= '1';
	WAIT FOR 80000 ps;
	sel(0) <= '0';
	WAIT FOR 40000 ps;
	sel(0) <= '1';
	WAIT FOR 80000 ps;
	sel(0) <= '0';
	WAIT FOR 80000 ps;
	sel(0) <= '1';
WAIT;
END PROCESS t_prcs_sel_0;
-- inputs[3]
t_prcs_inputs_3: PROCESS
BEGIN
	inputs(3) <= '1';
	WAIT FOR 40000 ps;
	inputs(3) <= '0';
	WAIT FOR 40000 ps;
	inputs(3) <= '1';
	WAIT FOR 40000 ps;
	inputs(3) <= '0';
	WAIT FOR 120000 ps;
	inputs(3) <= '1';
	WAIT FOR 40000 ps;
	inputs(3) <= '0';
	WAIT FOR 40000 ps;
	inputs(3) <= '1';
	WAIT FOR 40000 ps;
	inputs(3) <= '0';
	WAIT FOR 80000 ps;
	inputs(3) <= '1';
	WAIT FOR 160000 ps;
	inputs(3) <= '0';
	WAIT FOR 40000 ps;
	inputs(3) <= '1';
	WAIT FOR 80000 ps;
	inputs(3) <= '0';
	WAIT FOR 120000 ps;
	inputs(3) <= '1';
	WAIT FOR 80000 ps;
	inputs(3) <= '0';
	WAIT FOR 40000 ps;
	inputs(3) <= '1';
WAIT;
END PROCESS t_prcs_inputs_3;
-- inputs[2]
t_prcs_inputs_2: PROCESS
BEGIN
	inputs(2) <= '0';
	WAIT FOR 40000 ps;
	inputs(2) <= '1';
	WAIT FOR 40000 ps;
	inputs(2) <= '0';
	WAIT FOR 40000 ps;
	inputs(2) <= '1';
	WAIT FOR 40000 ps;
	inputs(2) <= '0';
	WAIT FOR 40000 ps;
	inputs(2) <= '1';
	WAIT FOR 40000 ps;
	inputs(2) <= '0';
	WAIT FOR 40000 ps;
	inputs(2) <= '1';
	WAIT FOR 120000 ps;
	inputs(2) <= '0';
	WAIT FOR 40000 ps;
	inputs(2) <= '1';
	WAIT FOR 80000 ps;
	inputs(2) <= '0';
	WAIT FOR 80000 ps;
	inputs(2) <= '1';
	WAIT FOR 160000 ps;
	inputs(2) <= '0';
	WAIT FOR 40000 ps;
	inputs(2) <= '1';
WAIT;
END PROCESS t_prcs_inputs_2;
-- inputs[1]
t_prcs_inputs_1: PROCESS
BEGIN
	inputs(1) <= '0';
	WAIT FOR 40000 ps;
	inputs(1) <= '1';
	WAIT FOR 80000 ps;
	inputs(1) <= '0';
	WAIT FOR 160000 ps;
	inputs(1) <= '1';
	WAIT FOR 40000 ps;
	inputs(1) <= '0';
	WAIT FOR 40000 ps;
	inputs(1) <= '1';
	WAIT FOR 40000 ps;
	inputs(1) <= '0';
	WAIT FOR 160000 ps;
	inputs(1) <= '1';
	WAIT FOR 80000 ps;
	inputs(1) <= '0';
	WAIT FOR 40000 ps;
	inputs(1) <= '1';
	WAIT FOR 80000 ps;
	inputs(1) <= '0';
	WAIT FOR 160000 ps;
	inputs(1) <= '1';
	WAIT FOR 40000 ps;
	inputs(1) <= '0';
WAIT;
END PROCESS t_prcs_inputs_1;
-- inputs[0]
t_prcs_inputs_0: PROCESS
BEGIN
	inputs(0) <= '0';
	WAIT FOR 40000 ps;
	inputs(0) <= '1';
	WAIT FOR 400000 ps;
	inputs(0) <= '0';
	WAIT FOR 120000 ps;
	inputs(0) <= '1';
	WAIT FOR 120000 ps;
	inputs(0) <= '0';
	WAIT FOR 40000 ps;
	inputs(0) <= '1';
	WAIT FOR 120000 ps;
	inputs(0) <= '0';
	WAIT FOR 80000 ps;
	inputs(0) <= '1';
WAIT;
END PROCESS t_prcs_inputs_0;
END Mux4_1_arch;
