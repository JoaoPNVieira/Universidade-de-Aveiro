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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "12/09/2021 10:57:15"

-- 
-- Device: Altera EP4CE6E22C6 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	MuxDemo IS
    PORT (
	OutPort : OUT std_logic;
	InPort_1 : IN std_logic;
	SPort : IN std_logic;
	InPort_0 : IN std_logic
	);
END MuxDemo;

ARCHITECTURE structure OF MuxDemo IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_OutPort : std_logic;
SIGNAL ww_InPort_1 : std_logic;
SIGNAL ww_SPort : std_logic;
SIGNAL ww_InPort_0 : std_logic;
SIGNAL \OutPort~output_o\ : std_logic;
SIGNAL \InPort_1~input_o\ : std_logic;
SIGNAL \InPort_0~input_o\ : std_logic;
SIGNAL \SPort~input_o\ : std_logic;
SIGNAL \inst|inst3~0_combout\ : std_logic;

BEGIN

OutPort <= ww_OutPort;
ww_InPort_1 <= InPort_1;
ww_SPort <= SPort;
ww_InPort_0 <= InPort_0;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\OutPort~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst3~0_combout\,
	devoe => ww_devoe,
	o => \OutPort~output_o\);

\InPort_1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_InPort_1,
	o => \InPort_1~input_o\);

\InPort_0~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_InPort_0,
	o => \InPort_0~input_o\);

\SPort~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SPort,
	o => \SPort~input_o\);

\inst|inst3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst3~0_combout\ = (\SPort~input_o\ & (\InPort_1~input_o\)) # (!\SPort~input_o\ & ((\InPort_0~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \InPort_1~input_o\,
	datab => \InPort_0~input_o\,
	datad => \SPort~input_o\,
	combout => \inst|inst3~0_combout\);

ww_OutPort <= \OutPort~output_o\;
END structure;


