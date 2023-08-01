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

-- DATE "12/15/2021 23:10:28"

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

ENTITY 	DecoderDemo3 IS
    PORT (
	OutPort_F : OUT std_logic;
	InPort_3 : IN std_logic;
	InPort_2 : IN std_logic;
	InPort_1 : IN std_logic;
	InPort_0 : IN std_logic;
	E1 : IN std_logic;
	EN_L : IN std_logic
	);
END DecoderDemo3;

ARCHITECTURE structure OF DecoderDemo3 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_OutPort_F : std_logic;
SIGNAL ww_InPort_3 : std_logic;
SIGNAL ww_InPort_2 : std_logic;
SIGNAL ww_InPort_1 : std_logic;
SIGNAL ww_InPort_0 : std_logic;
SIGNAL ww_E1 : std_logic;
SIGNAL ww_EN_L : std_logic;
SIGNAL \OutPort_F~output_o\ : std_logic;
SIGNAL \InPort_3~input_o\ : std_logic;
SIGNAL \InPort_1~input_o\ : std_logic;
SIGNAL \InPort_2~input_o\ : std_logic;
SIGNAL \InPort_0~input_o\ : std_logic;
SIGNAL \inst5~0_combout\ : std_logic;
SIGNAL \EN_L~input_o\ : std_logic;
SIGNAL \E1~input_o\ : std_logic;
SIGNAL \inst5~1_combout\ : std_logic;

BEGIN

OutPort_F <= ww_OutPort_F;
ww_InPort_3 <= InPort_3;
ww_InPort_2 <= InPort_2;
ww_InPort_1 <= InPort_1;
ww_InPort_0 <= InPort_0;
ww_E1 <= E1;
ww_EN_L <= EN_L;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\OutPort_F~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst5~1_combout\,
	devoe => ww_devoe,
	o => \OutPort_F~output_o\);

\InPort_3~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_InPort_3,
	o => \InPort_3~input_o\);

\InPort_1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_InPort_1,
	o => \InPort_1~input_o\);

\InPort_2~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_InPort_2,
	o => \InPort_2~input_o\);

\InPort_0~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_InPort_0,
	o => \InPort_0~input_o\);

\inst5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5~0_combout\ = (\InPort_3~input_o\ & ((\InPort_1~input_o\) # ((\InPort_0~input_o\)))) # (!\InPort_3~input_o\ & (\InPort_1~input_o\ & (\InPort_2~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \InPort_3~input_o\,
	datab => \InPort_1~input_o\,
	datac => \InPort_2~input_o\,
	datad => \InPort_0~input_o\,
	combout => \inst5~0_combout\);

\EN_L~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_EN_L,
	o => \EN_L~input_o\);

\E1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_E1,
	o => \E1~input_o\);

\inst5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst5~1_combout\ = (\inst5~0_combout\) # ((\EN_L~input_o\) # (!\E1~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst5~0_combout\,
	datab => \EN_L~input_o\,
	datad => \E1~input_o\,
	combout => \inst5~1_combout\);

ww_OutPort_F <= \OutPort_F~output_o\;
END structure;


