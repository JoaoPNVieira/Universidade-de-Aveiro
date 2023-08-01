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

-- DATE "12/09/2021 09:55:47"

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

ENTITY 	AddSubDemo IS
    PORT (
	Sum1 : OUT std_logic;
	Sub : IN std_logic;
	Input0 : IN std_logic;
	Input1 : IN std_logic;
	Input2 : IN std_logic;
	Input3 : IN std_logic;
	Input4 : IN std_logic;
	Input5 : IN std_logic;
	Input6 : IN std_logic;
	Input7 : IN std_logic;
	Sum2 : OUT std_logic;
	Sum3 : OUT std_logic;
	Sum4 : OUT std_logic;
	Overflow : OUT std_logic
	);
END AddSubDemo;

ARCHITECTURE structure OF AddSubDemo IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Sum1 : std_logic;
SIGNAL ww_Sub : std_logic;
SIGNAL ww_Input0 : std_logic;
SIGNAL ww_Input1 : std_logic;
SIGNAL ww_Input2 : std_logic;
SIGNAL ww_Input3 : std_logic;
SIGNAL ww_Input4 : std_logic;
SIGNAL ww_Input5 : std_logic;
SIGNAL ww_Input6 : std_logic;
SIGNAL ww_Input7 : std_logic;
SIGNAL ww_Sum2 : std_logic;
SIGNAL ww_Sum3 : std_logic;
SIGNAL ww_Sum4 : std_logic;
SIGNAL ww_Overflow : std_logic;
SIGNAL \Sum1~output_o\ : std_logic;
SIGNAL \Sum2~output_o\ : std_logic;
SIGNAL \Sum3~output_o\ : std_logic;
SIGNAL \Sum4~output_o\ : std_logic;
SIGNAL \Overflow~output_o\ : std_logic;
SIGNAL \Input0~input_o\ : std_logic;
SIGNAL \Input1~input_o\ : std_logic;
SIGNAL \inst|inst4|inst1~0_combout\ : std_logic;
SIGNAL \Sub~input_o\ : std_logic;
SIGNAL \inst|inst4|inst6~0_combout\ : std_logic;
SIGNAL \Input2~input_o\ : std_logic;
SIGNAL \Input3~input_o\ : std_logic;
SIGNAL \inst|inst5|inst1~combout\ : std_logic;
SIGNAL \Input4~input_o\ : std_logic;
SIGNAL \Input5~input_o\ : std_logic;
SIGNAL \inst|inst5|inst6~0_combout\ : std_logic;
SIGNAL \inst|inst6|inst1~0_combout\ : std_logic;
SIGNAL \Input6~input_o\ : std_logic;
SIGNAL \Input7~input_o\ : std_logic;
SIGNAL \inst|inst6|inst6~0_combout\ : std_logic;
SIGNAL \inst|inst7|inst1~0_combout\ : std_logic;
SIGNAL \inst|inst8~0_combout\ : std_logic;

BEGIN

Sum1 <= ww_Sum1;
ww_Sub <= Sub;
ww_Input0 <= Input0;
ww_Input1 <= Input1;
ww_Input2 <= Input2;
ww_Input3 <= Input3;
ww_Input4 <= Input4;
ww_Input5 <= Input5;
ww_Input6 <= Input6;
ww_Input7 <= Input7;
Sum2 <= ww_Sum2;
Sum3 <= ww_Sum3;
Sum4 <= ww_Sum4;
Overflow <= ww_Overflow;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Sum1~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst4|inst1~0_combout\,
	devoe => ww_devoe,
	o => \Sum1~output_o\);

\Sum2~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst5|inst1~combout\,
	devoe => ww_devoe,
	o => \Sum2~output_o\);

\Sum3~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst6|inst1~0_combout\,
	devoe => ww_devoe,
	o => \Sum3~output_o\);

\Sum4~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst7|inst1~0_combout\,
	devoe => ww_devoe,
	o => \Sum4~output_o\);

\Overflow~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst8~0_combout\,
	devoe => ww_devoe,
	o => \Overflow~output_o\);

\Input0~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Input0,
	o => \Input0~input_o\);

\Input1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Input1,
	o => \Input1~input_o\);

\inst|inst4|inst1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst4|inst1~0_combout\ = \Input0~input_o\ $ (\Input1~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Input0~input_o\,
	datad => \Input1~input_o\,
	combout => \inst|inst4|inst1~0_combout\);

\Sub~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Sub,
	o => \Sub~input_o\);

\inst|inst4|inst6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst4|inst6~0_combout\ = (\Input1~input_o\ & (\Input0~input_o\)) # (!\Input1~input_o\ & ((\Sub~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input0~input_o\,
	datab => \Sub~input_o\,
	datad => \Input1~input_o\,
	combout => \inst|inst4|inst6~0_combout\);

\Input2~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Input2,
	o => \Input2~input_o\);

\Input3~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Input3,
	o => \Input3~input_o\);

\inst|inst5|inst1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst5|inst1~combout\ = \Sub~input_o\ $ (\inst|inst4|inst6~0_combout\ $ (\Input2~input_o\ $ (\Input3~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sub~input_o\,
	datab => \inst|inst4|inst6~0_combout\,
	datac => \Input2~input_o\,
	datad => \Input3~input_o\,
	combout => \inst|inst5|inst1~combout\);

\Input4~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Input4,
	o => \Input4~input_o\);

\Input5~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Input5,
	o => \Input5~input_o\);

\inst|inst5|inst6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst5|inst6~0_combout\ = (\inst|inst4|inst6~0_combout\ & ((\Input2~input_o\) # (\Input3~input_o\ $ (\Sub~input_o\)))) # (!\inst|inst4|inst6~0_combout\ & (\Input2~input_o\ & (\Input3~input_o\ $ (\Sub~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input3~input_o\,
	datab => \Sub~input_o\,
	datac => \inst|inst4|inst6~0_combout\,
	datad => \Input2~input_o\,
	combout => \inst|inst5|inst6~0_combout\);

\inst|inst6|inst1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst6|inst1~0_combout\ = \Sub~input_o\ $ (\Input4~input_o\ $ (\Input5~input_o\ $ (\inst|inst5|inst6~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sub~input_o\,
	datab => \Input4~input_o\,
	datac => \Input5~input_o\,
	datad => \inst|inst5|inst6~0_combout\,
	combout => \inst|inst6|inst1~0_combout\);

\Input6~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Input6,
	o => \Input6~input_o\);

\Input7~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Input7,
	o => \Input7~input_o\);

\inst|inst6|inst6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst6|inst6~0_combout\ = (\inst|inst5|inst6~0_combout\ & ((\Input4~input_o\) # (\Input5~input_o\ $ (\Sub~input_o\)))) # (!\inst|inst5|inst6~0_combout\ & (\Input4~input_o\ & (\Input5~input_o\ $ (\Sub~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input5~input_o\,
	datab => \Sub~input_o\,
	datac => \inst|inst5|inst6~0_combout\,
	datad => \Input4~input_o\,
	combout => \inst|inst6|inst6~0_combout\);

\inst|inst7|inst1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst7|inst1~0_combout\ = \Sub~input_o\ $ (\Input6~input_o\ $ (\Input7~input_o\ $ (\inst|inst6|inst6~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sub~input_o\,
	datab => \Input6~input_o\,
	datac => \Input7~input_o\,
	datad => \inst|inst6|inst6~0_combout\,
	combout => \inst|inst7|inst1~0_combout\);

\inst|inst8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst8~0_combout\ = (\inst|inst6|inst6~0_combout\ & (!\Input6~input_o\ & (\Input7~input_o\ $ (!\Sub~input_o\)))) # (!\inst|inst6|inst6~0_combout\ & (\Input6~input_o\ & (\Input7~input_o\ $ (\Sub~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011010010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Input7~input_o\,
	datab => \Sub~input_o\,
	datac => \inst|inst6|inst6~0_combout\,
	datad => \Input6~input_o\,
	combout => \inst|inst8~0_combout\);

ww_Sum1 <= \Sum1~output_o\;

ww_Sum2 <= \Sum2~output_o\;

ww_Sum3 <= \Sum3~output_o\;

ww_Sum4 <= \Sum4~output_o\;

ww_Overflow <= \Overflow~output_o\;
END structure;


