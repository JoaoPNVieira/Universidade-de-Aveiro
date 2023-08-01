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

-- DATE "12/16/2021 00:18:54"

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

ENTITY 	EncoderDemo IS
    PORT (
	pin_name1 : OUT std_logic;
	EL : IN std_logic;
	InPort_0 : IN std_logic;
	InPort_1 : IN std_logic;
	InPort_2 : IN std_logic;
	InPort_3 : IN std_logic;
	InPort_4 : IN std_logic;
	InPort_5 : IN std_logic;
	InPort_6 : IN std_logic;
	InPort_7 : IN std_logic;
	OutPort_0 : OUT std_logic;
	OutPort_1 : OUT std_logic;
	OutPort_2 : OUT std_logic
	);
END EncoderDemo;

ARCHITECTURE structure OF EncoderDemo IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_pin_name1 : std_logic;
SIGNAL ww_EL : std_logic;
SIGNAL ww_InPort_0 : std_logic;
SIGNAL ww_InPort_1 : std_logic;
SIGNAL ww_InPort_2 : std_logic;
SIGNAL ww_InPort_3 : std_logic;
SIGNAL ww_InPort_4 : std_logic;
SIGNAL ww_InPort_5 : std_logic;
SIGNAL ww_InPort_6 : std_logic;
SIGNAL ww_InPort_7 : std_logic;
SIGNAL ww_OutPort_0 : std_logic;
SIGNAL ww_OutPort_1 : std_logic;
SIGNAL ww_OutPort_2 : std_logic;
SIGNAL \pin_name1~output_o\ : std_logic;
SIGNAL \OutPort_0~output_o\ : std_logic;
SIGNAL \OutPort_1~output_o\ : std_logic;
SIGNAL \OutPort_2~output_o\ : std_logic;
SIGNAL \InPort_1~input_o\ : std_logic;
SIGNAL \InPort_3~input_o\ : std_logic;
SIGNAL \InPort_5~input_o\ : std_logic;
SIGNAL \InPort_7~input_o\ : std_logic;
SIGNAL \inst|inst4~0_combout\ : std_logic;
SIGNAL \InPort_0~input_o\ : std_logic;
SIGNAL \InPort_2~input_o\ : std_logic;
SIGNAL \InPort_4~input_o\ : std_logic;
SIGNAL \InPort_6~input_o\ : std_logic;
SIGNAL \inst|inst5~0_combout\ : std_logic;
SIGNAL \EL~input_o\ : std_logic;
SIGNAL \inst|inst6~combout\ : std_logic;
SIGNAL \inst|inst~0_combout\ : std_logic;
SIGNAL \inst|inst3~0_combout\ : std_logic;
SIGNAL \inst|ALT_INV_inst6~combout\ : std_logic;
SIGNAL \inst|ALT_INV_inst5~0_combout\ : std_logic;

BEGIN

pin_name1 <= ww_pin_name1;
ww_EL <= EL;
ww_InPort_0 <= InPort_0;
ww_InPort_1 <= InPort_1;
ww_InPort_2 <= InPort_2;
ww_InPort_3 <= InPort_3;
ww_InPort_4 <= InPort_4;
ww_InPort_5 <= InPort_5;
ww_InPort_6 <= InPort_6;
ww_InPort_7 <= InPort_7;
OutPort_0 <= ww_OutPort_0;
OutPort_1 <= ww_OutPort_1;
OutPort_2 <= ww_OutPort_2;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\inst|ALT_INV_inst6~combout\ <= NOT \inst|inst6~combout\;
\inst|ALT_INV_inst5~0_combout\ <= NOT \inst|inst5~0_combout\;

\pin_name1~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|ALT_INV_inst6~combout\,
	devoe => ww_devoe,
	o => \pin_name1~output_o\);

\OutPort_0~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst~0_combout\,
	devoe => ww_devoe,
	o => \OutPort_0~output_o\);

\OutPort_1~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst3~0_combout\,
	devoe => ww_devoe,
	o => \OutPort_1~output_o\);

\OutPort_2~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|ALT_INV_inst5~0_combout\,
	devoe => ww_devoe,
	o => \OutPort_2~output_o\);

\InPort_1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_InPort_1,
	o => \InPort_1~input_o\);

\InPort_3~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_InPort_3,
	o => \InPort_3~input_o\);

\InPort_5~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_InPort_5,
	o => \InPort_5~input_o\);

\InPort_7~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_InPort_7,
	o => \InPort_7~input_o\);

\inst|inst4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst4~0_combout\ = (\InPort_1~input_o\) # ((\InPort_3~input_o\) # ((\InPort_5~input_o\) # (\InPort_7~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \InPort_1~input_o\,
	datab => \InPort_3~input_o\,
	datac => \InPort_5~input_o\,
	datad => \InPort_7~input_o\,
	combout => \inst|inst4~0_combout\);

\InPort_0~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_InPort_0,
	o => \InPort_0~input_o\);

\InPort_2~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_InPort_2,
	o => \InPort_2~input_o\);

\InPort_4~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_InPort_4,
	o => \InPort_4~input_o\);

\InPort_6~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_InPort_6,
	o => \InPort_6~input_o\);

\inst|inst5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst5~0_combout\ = (!\InPort_0~input_o\ & (!\InPort_2~input_o\ & (!\InPort_4~input_o\ & !\InPort_6~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \InPort_0~input_o\,
	datab => \InPort_2~input_o\,
	datac => \InPort_4~input_o\,
	datad => \InPort_6~input_o\,
	combout => \inst|inst5~0_combout\);

\EL~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_EL,
	o => \EL~input_o\);

\inst|inst6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst6~combout\ = (!\EL~input_o\ & ((\inst|inst4~0_combout\) # (!\inst|inst5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst4~0_combout\,
	datac => \inst|inst5~0_combout\,
	datad => \EL~input_o\,
	combout => \inst|inst6~combout\);

\inst|inst~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst~0_combout\ = (\InPort_0~input_o\) # ((\InPort_2~input_o\) # ((\InPort_1~input_o\) # (\InPort_3~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \InPort_0~input_o\,
	datab => \InPort_2~input_o\,
	datac => \InPort_1~input_o\,
	datad => \InPort_3~input_o\,
	combout => \inst|inst~0_combout\);

\inst|inst3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst3~0_combout\ = (\InPort_0~input_o\) # ((\InPort_4~input_o\) # ((\InPort_1~input_o\) # (\InPort_5~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \InPort_0~input_o\,
	datab => \InPort_4~input_o\,
	datac => \InPort_1~input_o\,
	datad => \InPort_5~input_o\,
	combout => \inst|inst3~0_combout\);

ww_pin_name1 <= \pin_name1~output_o\;

ww_OutPort_0 <= \OutPort_0~output_o\;

ww_OutPort_1 <= \OutPort_1~output_o\;

ww_OutPort_2 <= \OutPort_2~output_o\;
END structure;


