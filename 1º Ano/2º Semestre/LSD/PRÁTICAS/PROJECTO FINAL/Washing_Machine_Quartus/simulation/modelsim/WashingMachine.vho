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
-- VERSION "Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"

-- DATE "06/17/2022 09:31:30"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_P28,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	WashingMachine IS
    PORT (
	CLOCK_50 : IN std_logic;
	SW : IN std_logic_vector(5 DOWNTO 0);
	LEDG : BUFFER std_logic_vector(7 DOWNTO 7);
	LEDR : BUFFER std_logic_vector(17 DOWNTO 0);
	HEX4 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX5 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX6 : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX7 : BUFFER std_logic_vector(6 DOWNTO 0)
	);
END WashingMachine;

-- Design Ports Information
-- LEDG[7]	=>  Location: PIN_G21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[0]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[1]	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[2]	=>  Location: PIN_E19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[3]	=>  Location: PIN_F21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[4]	=>  Location: PIN_F18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[5]	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[6]	=>  Location: PIN_J19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[7]	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[8]	=>  Location: PIN_J17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[9]	=>  Location: PIN_G17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[10]	=>  Location: PIN_J15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[11]	=>  Location: PIN_H16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[12]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[13]	=>  Location: PIN_H17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[14]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[15]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[16]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[17]	=>  Location: PIN_H15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[0]	=>  Location: PIN_AB19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[1]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[2]	=>  Location: PIN_AG21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[3]	=>  Location: PIN_AH21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[4]	=>  Location: PIN_AE19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[5]	=>  Location: PIN_AF19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[6]	=>  Location: PIN_AE18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[0]	=>  Location: PIN_AD18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[1]	=>  Location: PIN_AC18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[2]	=>  Location: PIN_AB18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[3]	=>  Location: PIN_AH19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[4]	=>  Location: PIN_AG19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[5]	=>  Location: PIN_AF18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[6]	=>  Location: PIN_AH18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[0]	=>  Location: PIN_AA17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[1]	=>  Location: PIN_AB16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[2]	=>  Location: PIN_AA16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[3]	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[4]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[5]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[6]	=>  Location: PIN_AC17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX7[0]	=>  Location: PIN_AD17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX7[1]	=>  Location: PIN_AE17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX7[2]	=>  Location: PIN_AG17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX7[3]	=>  Location: PIN_AH17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX7[4]	=>  Location: PIN_AF17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX7[5]	=>  Location: PIN_AG18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX7[6]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_AD27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[5]	=>  Location: PIN_AC26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[4]	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF WashingMachine IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_SW : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_LEDG : std_logic_vector(7 DOWNTO 7);
SIGNAL ww_LEDR : std_logic_vector(17 DOWNTO 0);
SIGNAL ww_HEX4 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX5 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX6 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX7 : std_logic_vector(6 DOWNTO 0);
SIGNAL \CLOCK_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \pulse|pulse~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \LEDG[7]~output_o\ : std_logic;
SIGNAL \LEDR[0]~output_o\ : std_logic;
SIGNAL \LEDR[1]~output_o\ : std_logic;
SIGNAL \LEDR[2]~output_o\ : std_logic;
SIGNAL \LEDR[3]~output_o\ : std_logic;
SIGNAL \LEDR[4]~output_o\ : std_logic;
SIGNAL \LEDR[5]~output_o\ : std_logic;
SIGNAL \LEDR[6]~output_o\ : std_logic;
SIGNAL \LEDR[7]~output_o\ : std_logic;
SIGNAL \LEDR[8]~output_o\ : std_logic;
SIGNAL \LEDR[9]~output_o\ : std_logic;
SIGNAL \LEDR[10]~output_o\ : std_logic;
SIGNAL \LEDR[11]~output_o\ : std_logic;
SIGNAL \LEDR[12]~output_o\ : std_logic;
SIGNAL \LEDR[13]~output_o\ : std_logic;
SIGNAL \LEDR[14]~output_o\ : std_logic;
SIGNAL \LEDR[15]~output_o\ : std_logic;
SIGNAL \LEDR[16]~output_o\ : std_logic;
SIGNAL \LEDR[17]~output_o\ : std_logic;
SIGNAL \HEX4[0]~output_o\ : std_logic;
SIGNAL \HEX4[1]~output_o\ : std_logic;
SIGNAL \HEX4[2]~output_o\ : std_logic;
SIGNAL \HEX4[3]~output_o\ : std_logic;
SIGNAL \HEX4[4]~output_o\ : std_logic;
SIGNAL \HEX4[5]~output_o\ : std_logic;
SIGNAL \HEX4[6]~output_o\ : std_logic;
SIGNAL \HEX5[0]~output_o\ : std_logic;
SIGNAL \HEX5[1]~output_o\ : std_logic;
SIGNAL \HEX5[2]~output_o\ : std_logic;
SIGNAL \HEX5[3]~output_o\ : std_logic;
SIGNAL \HEX5[4]~output_o\ : std_logic;
SIGNAL \HEX5[5]~output_o\ : std_logic;
SIGNAL \HEX5[6]~output_o\ : std_logic;
SIGNAL \HEX6[0]~output_o\ : std_logic;
SIGNAL \HEX6[1]~output_o\ : std_logic;
SIGNAL \HEX6[2]~output_o\ : std_logic;
SIGNAL \HEX6[3]~output_o\ : std_logic;
SIGNAL \HEX6[4]~output_o\ : std_logic;
SIGNAL \HEX6[5]~output_o\ : std_logic;
SIGNAL \HEX6[6]~output_o\ : std_logic;
SIGNAL \HEX7[0]~output_o\ : std_logic;
SIGNAL \HEX7[1]~output_o\ : std_logic;
SIGNAL \HEX7[2]~output_o\ : std_logic;
SIGNAL \HEX7[3]~output_o\ : std_logic;
SIGNAL \HEX7[4]~output_o\ : std_logic;
SIGNAL \HEX7[5]~output_o\ : std_logic;
SIGNAL \HEX7[6]~output_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \control|outReset~q\ : std_logic;
SIGNAL \pulse|s_count[0]~26_combout\ : std_logic;
SIGNAL \pulse|s_count[17]~28_combout\ : std_logic;
SIGNAL \pulse|s_count[0]~27\ : std_logic;
SIGNAL \pulse|s_count[1]~29_combout\ : std_logic;
SIGNAL \pulse|s_count[1]~30\ : std_logic;
SIGNAL \pulse|s_count[2]~31_combout\ : std_logic;
SIGNAL \pulse|s_count[2]~32\ : std_logic;
SIGNAL \pulse|s_count[3]~33_combout\ : std_logic;
SIGNAL \pulse|s_count[3]~34\ : std_logic;
SIGNAL \pulse|s_count[4]~35_combout\ : std_logic;
SIGNAL \pulse|s_count[4]~36\ : std_logic;
SIGNAL \pulse|s_count[5]~37_combout\ : std_logic;
SIGNAL \pulse|s_count[5]~38\ : std_logic;
SIGNAL \pulse|s_count[6]~39_combout\ : std_logic;
SIGNAL \pulse|s_count[6]~40\ : std_logic;
SIGNAL \pulse|s_count[7]~41_combout\ : std_logic;
SIGNAL \pulse|s_count[7]~42\ : std_logic;
SIGNAL \pulse|s_count[8]~43_combout\ : std_logic;
SIGNAL \pulse|s_count[8]~44\ : std_logic;
SIGNAL \pulse|s_count[9]~45_combout\ : std_logic;
SIGNAL \pulse|s_count[9]~46\ : std_logic;
SIGNAL \pulse|s_count[10]~47_combout\ : std_logic;
SIGNAL \pulse|s_count[10]~48\ : std_logic;
SIGNAL \pulse|s_count[11]~49_combout\ : std_logic;
SIGNAL \pulse|s_count[11]~50\ : std_logic;
SIGNAL \pulse|s_count[12]~51_combout\ : std_logic;
SIGNAL \pulse|s_count[12]~52\ : std_logic;
SIGNAL \pulse|s_count[13]~53_combout\ : std_logic;
SIGNAL \pulse|s_count[13]~54\ : std_logic;
SIGNAL \pulse|s_count[14]~55_combout\ : std_logic;
SIGNAL \pulse|s_count[14]~56\ : std_logic;
SIGNAL \pulse|s_count[15]~57_combout\ : std_logic;
SIGNAL \pulse|s_count[15]~58\ : std_logic;
SIGNAL \pulse|s_count[16]~59_combout\ : std_logic;
SIGNAL \pulse|s_count[16]~60\ : std_logic;
SIGNAL \pulse|s_count[17]~61_combout\ : std_logic;
SIGNAL \pulse|s_count[17]~62\ : std_logic;
SIGNAL \pulse|s_count[18]~63_combout\ : std_logic;
SIGNAL \pulse|s_count[18]~64\ : std_logic;
SIGNAL \pulse|s_count[19]~65_combout\ : std_logic;
SIGNAL \pulse|s_count[19]~66\ : std_logic;
SIGNAL \pulse|s_count[20]~67_combout\ : std_logic;
SIGNAL \pulse|s_count[20]~68\ : std_logic;
SIGNAL \pulse|s_count[21]~69_combout\ : std_logic;
SIGNAL \pulse|s_count[21]~70\ : std_logic;
SIGNAL \pulse|s_count[22]~71_combout\ : std_logic;
SIGNAL \pulse|s_count[22]~72\ : std_logic;
SIGNAL \pulse|s_count[23]~73_combout\ : std_logic;
SIGNAL \pulse|s_count[23]~74\ : std_logic;
SIGNAL \pulse|s_count[24]~75_combout\ : std_logic;
SIGNAL \pulse|s_count[24]~76\ : std_logic;
SIGNAL \pulse|s_count[25]~77_combout\ : std_logic;
SIGNAL \pulse|Equal0~7_combout\ : std_logic;
SIGNAL \pulse|Equal0~6_combout\ : std_logic;
SIGNAL \pulse|Equal0~5_combout\ : std_logic;
SIGNAL \pulse|Equal0~0_combout\ : std_logic;
SIGNAL \pulse|Equal0~1_combout\ : std_logic;
SIGNAL \pulse|Equal0~2_combout\ : std_logic;
SIGNAL \pulse|Equal0~3_combout\ : std_logic;
SIGNAL \pulse|Equal0~4_combout\ : std_logic;
SIGNAL \pulse|Equal0~8_combout\ : std_logic;
SIGNAL \pulse|pulse~0_combout\ : std_logic;
SIGNAL \pulse|pulse~q\ : std_logic;
SIGNAL \pulse|pulse~clkctrl_outclk\ : std_logic;
SIGNAL \timer|s_countUnit~4_combout\ : std_logic;
SIGNAL \timer|s_countUnit[1]~feeder_combout\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \control|outStart~q\ : std_logic;
SIGNAL \fsm|pState~9_combout\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \control|program~0_combout\ : std_logic;
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \control|program~2_combout\ : std_logic;
SIGNAL \SW[5]~input_o\ : std_logic;
SIGNAL \control|program~1_combout\ : std_logic;
SIGNAL \fsm|pState~23_combout\ : std_logic;
SIGNAL \fsm|repeat[1]~1_combout\ : std_logic;
SIGNAL \fsm|pState~12_combout\ : std_logic;
SIGNAL \fsm|repeat[0]~0_combout\ : std_logic;
SIGNAL \fsm|nState~6_combout\ : std_logic;
SIGNAL \fsm|pState~22_combout\ : std_logic;
SIGNAL \fsm|pState~24_combout\ : std_logic;
SIGNAL \fsm|pState.S1~q\ : std_logic;
SIGNAL \fsm|pState~20_combout\ : std_logic;
SIGNAL \fsm|pState~21_combout\ : std_logic;
SIGNAL \fsm|pState.S2~q\ : std_logic;
SIGNAL \fsm|pState~26_combout\ : std_logic;
SIGNAL \fsm|Selector0~0_combout\ : std_logic;
SIGNAL \fsm|pState~25_combout\ : std_logic;
SIGNAL \fsm|pState~27_combout\ : std_logic;
SIGNAL \fsm|pState.S0~q\ : std_logic;
SIGNAL \fsm|pState~14_combout\ : std_logic;
SIGNAL \fsm|pState~13_combout\ : std_logic;
SIGNAL \fsm|pState~15_combout\ : std_logic;
SIGNAL \fsm|pState~16_combout\ : std_logic;
SIGNAL \fsm|pState.S4~q\ : std_logic;
SIGNAL \fsm|pState~18_combout\ : std_logic;
SIGNAL \fsm|pState~17_combout\ : std_logic;
SIGNAL \fsm|pState~19_combout\ : std_logic;
SIGNAL \fsm|pState.S3~q\ : std_logic;
SIGNAL \fsm|Selector7~0_combout\ : std_logic;
SIGNAL \fsm|Selector6~0_combout\ : std_logic;
SIGNAL \timer|s_countUnit[1]~5_combout\ : std_logic;
SIGNAL \timereg|unitOut[1]~feeder_combout\ : std_logic;
SIGNAL \fsm|Selector6~1_combout\ : std_logic;
SIGNAL \fsm|Selector8~0_combout\ : std_logic;
SIGNAL \fsm|Selector9~0_combout\ : std_logic;
SIGNAL \timer|Equal2~0_combout\ : std_logic;
SIGNAL \timer|Add0~0_combout\ : std_logic;
SIGNAL \timer|s_countUnit~7_combout\ : std_logic;
SIGNAL \timer|s_countUnit[3]~feeder_combout\ : std_logic;
SIGNAL \timer|Equal2~2_combout\ : std_logic;
SIGNAL \timer|Equal2~1_combout\ : std_logic;
SIGNAL \timer|Equal2~3_combout\ : std_logic;
SIGNAL \display_time|Equal0~1_combout\ : std_logic;
SIGNAL \display_time|Equal0~0_combout\ : std_logic;
SIGNAL \timer|s_countDoz~6_combout\ : std_logic;
SIGNAL \timer|s_countDoz[0]~5_combout\ : std_logic;
SIGNAL \timer|s_countDoz~8_combout\ : std_logic;
SIGNAL \timer|s_countDoz~7_combout\ : std_logic;
SIGNAL \timer|s_countDoz~4_combout\ : std_logic;
SIGNAL \display_time|Equal17~0_combout\ : std_logic;
SIGNAL \timer|s_change~5_combout\ : std_logic;
SIGNAL \timer|s_reset~q\ : std_logic;
SIGNAL \timereg|resetOut~q\ : std_logic;
SIGNAL \RMan|reset~0_combout\ : std_logic;
SIGNAL \RMan|reset~q\ : std_logic;
SIGNAL \timer|s_countUnit[1]~2_combout\ : std_logic;
SIGNAL \timer|s_countUnit[1]~3_combout\ : std_logic;
SIGNAL \timer|s_countUnit~6_combout\ : std_logic;
SIGNAL \timer|s_countUnit[0]~feeder_combout\ : std_logic;
SIGNAL \timer|s_countUnit~8_combout\ : std_logic;
SIGNAL \timer|s_countUnit[2]~feeder_combout\ : std_logic;
SIGNAL \timer|s_change~6_combout\ : std_logic;
SIGNAL \timer|s_change~4_combout\ : std_logic;
SIGNAL \timer|s_change~q\ : std_logic;
SIGNAL \fsm|pState~8_combout\ : std_logic;
SIGNAL \fsm|pState~10_combout\ : std_logic;
SIGNAL \fsm|pState~11_combout\ : std_logic;
SIGNAL \fsm|pState.S5~q\ : std_logic;
SIGNAL \fsm|finish~0_combout\ : std_logic;
SIGNAL \control|outOn~feeder_combout\ : std_logic;
SIGNAL \control|outOn~q\ : std_logic;
SIGNAL \control|outRes~0_combout\ : std_logic;
SIGNAL \control|outRes~q\ : std_logic;
SIGNAL \control|outDoor~q\ : std_logic;
SIGNAL \control|outStr~feeder_combout\ : std_logic;
SIGNAL \control|outStr~q\ : std_logic;
SIGNAL \fsm|spin~0_combout\ : std_logic;
SIGNAL \fsm|rinse~0_combout\ : std_logic;
SIGNAL \fsm|water_pump~0_combout\ : std_logic;
SIGNAL \fsm|water_valve~0_combout\ : std_logic;
SIGNAL \display_time|decUnit[0]~1_combout\ : std_logic;
SIGNAL \display_time|decUnit[6]~0_combout\ : std_logic;
SIGNAL \display_time|comb~0_combout\ : std_logic;
SIGNAL \display_time|comb~1_combout\ : std_logic;
SIGNAL \display_time|decUnit[1]~2_combout\ : std_logic;
SIGNAL \display_time|comb~2_combout\ : std_logic;
SIGNAL \display_time|comb~3_combout\ : std_logic;
SIGNAL \display_time|Equal0~2_combout\ : std_logic;
SIGNAL \display_time|comb~4_combout\ : std_logic;
SIGNAL \display_time|comb~5_combout\ : std_logic;
SIGNAL \display_time|decUnit[3]~4_combout\ : std_logic;
SIGNAL \display_time|decUnit[5]~3_combout\ : std_logic;
SIGNAL \display_time|decUnit[3]~5_combout\ : std_logic;
SIGNAL \display_time|decUnit[3]~6_combout\ : std_logic;
SIGNAL \display_time|decUnit[3]~7_combout\ : std_logic;
SIGNAL \display_time|decUnit[3]~8_combout\ : std_logic;
SIGNAL \display_time|comb~6_combout\ : std_logic;
SIGNAL \display_time|comb~7_combout\ : std_logic;
SIGNAL \display_time|decUnit[4]~9_combout\ : std_logic;
SIGNAL \display_time|decUnit[4]~10_combout\ : std_logic;
SIGNAL \display_time|comb~9_combout\ : std_logic;
SIGNAL \display_time|comb~8_combout\ : std_logic;
SIGNAL \display_time|decUnit[5]~11_combout\ : std_logic;
SIGNAL \display_time|decUnit[5]~12_combout\ : std_logic;
SIGNAL \display_time|comb~10_combout\ : std_logic;
SIGNAL \display_time|comb~11_combout\ : std_logic;
SIGNAL \display_time|decUnit[6]~13_combout\ : std_logic;
SIGNAL \display_time|comb~12_combout\ : std_logic;
SIGNAL \display_time|comb~13_combout\ : std_logic;
SIGNAL \display_time|decDoz[0]~0_combout\ : std_logic;
SIGNAL \display_time|decDoz[1]~1_combout\ : std_logic;
SIGNAL \display_time|decDoz[2]~2_combout\ : std_logic;
SIGNAL \display_time|decDoz[3]~3_combout\ : std_logic;
SIGNAL \display_time|decDoz[4]~4_combout\ : std_logic;
SIGNAL \display_time|decDoz[5]~5_combout\ : std_logic;
SIGNAL \display_time|decDoz[6]~6_combout\ : std_logic;
SIGNAL \display_prog|decOutSel[0]~0_combout\ : std_logic;
SIGNAL \display_prog|decOutSel[1]~1_combout\ : std_logic;
SIGNAL \display_prog|decOutSel[2]~2_combout\ : std_logic;
SIGNAL \display_prog|decOutSel[4]~3_combout\ : std_logic;
SIGNAL \pulse|s_count\ : std_logic_vector(25 DOWNTO 0);
SIGNAL \display_time|decUnit\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \statejumps|jumpOut\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \control|program\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \timer|s_countDoz\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \timer|s_countUnit\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \timereg|unitOut\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \display_prog|ALT_INV_decOutSel[1]~1_combout\ : std_logic;
SIGNAL \display_prog|ALT_INV_decOutSel[0]~0_combout\ : std_logic;
SIGNAL \control|ALT_INV_outStart~q\ : std_logic;
SIGNAL \fsm|ALT_INV_Selector6~1_combout\ : std_logic;
SIGNAL \fsm|ALT_INV_water_valve~0_combout\ : std_logic;
SIGNAL \fsm|ALT_INV_water_pump~0_combout\ : std_logic;
SIGNAL \fsm|ALT_INV_rinse~0_combout\ : std_logic;
SIGNAL \fsm|ALT_INV_spin~0_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_SW <= SW;
LEDG <= ww_LEDG;
LEDR <= ww_LEDR;
HEX4 <= ww_HEX4;
HEX5 <= ww_HEX5;
HEX6 <= ww_HEX6;
HEX7 <= ww_HEX7;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);

\pulse|pulse~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \pulse|pulse~q\);
\display_prog|ALT_INV_decOutSel[1]~1_combout\ <= NOT \display_prog|decOutSel[1]~1_combout\;
\display_prog|ALT_INV_decOutSel[0]~0_combout\ <= NOT \display_prog|decOutSel[0]~0_combout\;
\control|ALT_INV_outStart~q\ <= NOT \control|outStart~q\;
\fsm|ALT_INV_Selector6~1_combout\ <= NOT \fsm|Selector6~1_combout\;
\fsm|ALT_INV_water_valve~0_combout\ <= NOT \fsm|water_valve~0_combout\;
\fsm|ALT_INV_water_pump~0_combout\ <= NOT \fsm|water_pump~0_combout\;
\fsm|ALT_INV_rinse~0_combout\ <= NOT \fsm|rinse~0_combout\;
\fsm|ALT_INV_spin~0_combout\ <= NOT \fsm|spin~0_combout\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X74_Y73_N23
\LEDG[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \fsm|finish~0_combout\,
	devoe => ww_devoe,
	o => \LEDG[7]~output_o\);

-- Location: IOOBUF_X69_Y73_N16
\LEDR[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \control|outOn~q\,
	devoe => ww_devoe,
	o => \LEDR[0]~output_o\);

-- Location: IOOBUF_X94_Y73_N2
\LEDR[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \control|outRes~q\,
	devoe => ww_devoe,
	o => \LEDR[1]~output_o\);

-- Location: IOOBUF_X94_Y73_N9
\LEDR[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \control|outDoor~q\,
	devoe => ww_devoe,
	o => \LEDR[2]~output_o\);

-- Location: IOOBUF_X107_Y73_N16
\LEDR[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \control|outStr~q\,
	devoe => ww_devoe,
	o => \LEDR[3]~output_o\);

-- Location: IOOBUF_X87_Y73_N16
\LEDR[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[4]~output_o\);

-- Location: IOOBUF_X87_Y73_N9
\LEDR[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[5]~output_o\);

-- Location: IOOBUF_X72_Y73_N9
\LEDR[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[6]~output_o\);

-- Location: IOOBUF_X72_Y73_N2
\LEDR[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[7]~output_o\);

-- Location: IOOBUF_X69_Y73_N2
\LEDR[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[8]~output_o\);

-- Location: IOOBUF_X83_Y73_N23
\LEDR[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[9]~output_o\);

-- Location: IOOBUF_X60_Y73_N23
\LEDR[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[10]~output_o\);

-- Location: IOOBUF_X65_Y73_N23
\LEDR[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[11]~output_o\);

-- Location: IOOBUF_X65_Y73_N16
\LEDR[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[12]~output_o\);

-- Location: IOOBUF_X67_Y73_N9
\LEDR[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[13]~output_o\);

-- Location: IOOBUF_X58_Y73_N2
\LEDR[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \fsm|ALT_INV_spin~0_combout\,
	devoe => ww_devoe,
	o => \LEDR[14]~output_o\);

-- Location: IOOBUF_X65_Y73_N9
\LEDR[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \fsm|ALT_INV_rinse~0_combout\,
	devoe => ww_devoe,
	o => \LEDR[15]~output_o\);

-- Location: IOOBUF_X67_Y73_N2
\LEDR[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \fsm|ALT_INV_water_pump~0_combout\,
	devoe => ww_devoe,
	o => \LEDR[16]~output_o\);

-- Location: IOOBUF_X60_Y73_N16
\LEDR[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \fsm|ALT_INV_water_valve~0_combout\,
	devoe => ww_devoe,
	o => \LEDR[17]~output_o\);

-- Location: IOOBUF_X98_Y0_N23
\HEX4[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display_time|decUnit\(0),
	devoe => ww_devoe,
	o => \HEX4[0]~output_o\);

-- Location: IOOBUF_X107_Y0_N9
\HEX4[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display_time|decUnit\(1),
	devoe => ww_devoe,
	o => \HEX4[1]~output_o\);

-- Location: IOOBUF_X74_Y0_N9
\HEX4[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display_time|decUnit\(2),
	devoe => ww_devoe,
	o => \HEX4[2]~output_o\);

-- Location: IOOBUF_X74_Y0_N2
\HEX4[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display_time|decUnit\(3),
	devoe => ww_devoe,
	o => \HEX4[3]~output_o\);

-- Location: IOOBUF_X83_Y0_N23
\HEX4[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display_time|decUnit\(4),
	devoe => ww_devoe,
	o => \HEX4[4]~output_o\);

-- Location: IOOBUF_X83_Y0_N16
\HEX4[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display_time|decUnit\(5),
	devoe => ww_devoe,
	o => \HEX4[5]~output_o\);

-- Location: IOOBUF_X79_Y0_N23
\HEX4[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display_time|decUnit\(6),
	devoe => ww_devoe,
	o => \HEX4[6]~output_o\);

-- Location: IOOBUF_X85_Y0_N9
\HEX5[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display_time|decDoz[0]~0_combout\,
	devoe => ww_devoe,
	o => \HEX5[0]~output_o\);

-- Location: IOOBUF_X87_Y0_N16
\HEX5[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display_time|decDoz[1]~1_combout\,
	devoe => ww_devoe,
	o => \HEX5[1]~output_o\);

-- Location: IOOBUF_X98_Y0_N16
\HEX5[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display_time|decDoz[2]~2_combout\,
	devoe => ww_devoe,
	o => \HEX5[2]~output_o\);

-- Location: IOOBUF_X72_Y0_N2
\HEX5[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display_time|decDoz[3]~3_combout\,
	devoe => ww_devoe,
	o => \HEX5[3]~output_o\);

-- Location: IOOBUF_X72_Y0_N9
\HEX5[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display_time|decDoz[4]~4_combout\,
	devoe => ww_devoe,
	o => \HEX5[4]~output_o\);

-- Location: IOOBUF_X79_Y0_N16
\HEX5[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display_time|decDoz[5]~5_combout\,
	devoe => ww_devoe,
	o => \HEX5[5]~output_o\);

-- Location: IOOBUF_X69_Y0_N2
\HEX5[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display_time|decDoz[6]~6_combout\,
	devoe => ww_devoe,
	o => \HEX5[6]~output_o\);

-- Location: IOOBUF_X89_Y0_N23
\HEX6[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display_prog|ALT_INV_decOutSel[0]~0_combout\,
	devoe => ww_devoe,
	o => \HEX6[0]~output_o\);

-- Location: IOOBUF_X65_Y0_N2
\HEX6[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display_prog|ALT_INV_decOutSel[1]~1_combout\,
	devoe => ww_devoe,
	o => \HEX6[1]~output_o\);

-- Location: IOOBUF_X65_Y0_N9
\HEX6[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display_prog|decOutSel[2]~2_combout\,
	devoe => ww_devoe,
	o => \HEX6[2]~output_o\);

-- Location: IOOBUF_X89_Y0_N16
\HEX6[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display_prog|ALT_INV_decOutSel[0]~0_combout\,
	devoe => ww_devoe,
	o => \HEX6[3]~output_o\);

-- Location: IOOBUF_X67_Y0_N16
\HEX6[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display_prog|decOutSel[4]~3_combout\,
	devoe => ww_devoe,
	o => \HEX6[4]~output_o\);

-- Location: IOOBUF_X67_Y0_N23
\HEX6[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX6[5]~output_o\);

-- Location: IOOBUF_X74_Y0_N23
\HEX6[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \display_prog|ALT_INV_decOutSel[0]~0_combout\,
	devoe => ww_devoe,
	o => \HEX6[6]~output_o\);

-- Location: IOOBUF_X74_Y0_N16
\HEX7[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \control|ALT_INV_outStart~q\,
	devoe => ww_devoe,
	o => \HEX7[0]~output_o\);

-- Location: IOOBUF_X67_Y0_N9
\HEX7[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \control|ALT_INV_outStart~q\,
	devoe => ww_devoe,
	o => \HEX7[1]~output_o\);

-- Location: IOOBUF_X62_Y0_N23
\HEX7[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX7[2]~output_o\);

-- Location: IOOBUF_X62_Y0_N16
\HEX7[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX7[3]~output_o\);

-- Location: IOOBUF_X67_Y0_N2
\HEX7[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \control|ALT_INV_outStart~q\,
	devoe => ww_devoe,
	o => \HEX7[4]~output_o\);

-- Location: IOOBUF_X69_Y0_N9
\HEX7[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \control|ALT_INV_outStart~q\,
	devoe => ww_devoe,
	o => \HEX7[5]~output_o\);

-- Location: IOOBUF_X54_Y0_N23
\HEX7[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \control|ALT_INV_outStart~q\,
	devoe => ww_devoe,
	o => \HEX7[6]~output_o\);

-- Location: IOIBUF_X0_Y36_N15
\CLOCK_50~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: CLKCTRL_G4
\CLOCK_50~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK_50~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLOCK_50~inputclkctrl_outclk\);

-- Location: IOIBUF_X115_Y14_N1
\SW[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: FF_X81_Y2_N19
\control|outReset\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[1]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \control|outReset~q\);

-- Location: LCCOMB_X80_Y2_N6
\pulse|s_count[0]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_count[0]~26_combout\ = \pulse|s_count\(0) $ (VCC)
-- \pulse|s_count[0]~27\ = CARRY(\pulse|s_count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_count\(0),
	datad => VCC,
	combout => \pulse|s_count[0]~26_combout\,
	cout => \pulse|s_count[0]~27\);

-- Location: LCCOMB_X81_Y2_N22
\pulse|s_count[17]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_count[17]~28_combout\ = (\control|outReset~q\) # (!\pulse|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \control|outReset~q\,
	datad => \pulse|Equal0~8_combout\,
	combout => \pulse|s_count[17]~28_combout\);

-- Location: FF_X80_Y2_N7
\pulse|s_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_count[0]~26_combout\,
	sclr => \pulse|s_count[17]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_count\(0));

-- Location: LCCOMB_X80_Y2_N8
\pulse|s_count[1]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_count[1]~29_combout\ = (\pulse|s_count\(1) & (!\pulse|s_count[0]~27\)) # (!\pulse|s_count\(1) & ((\pulse|s_count[0]~27\) # (GND)))
-- \pulse|s_count[1]~30\ = CARRY((!\pulse|s_count[0]~27\) # (!\pulse|s_count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_count\(1),
	datad => VCC,
	cin => \pulse|s_count[0]~27\,
	combout => \pulse|s_count[1]~29_combout\,
	cout => \pulse|s_count[1]~30\);

-- Location: FF_X80_Y2_N9
\pulse|s_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_count[1]~29_combout\,
	sclr => \pulse|s_count[17]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_count\(1));

-- Location: LCCOMB_X80_Y2_N10
\pulse|s_count[2]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_count[2]~31_combout\ = (\pulse|s_count\(2) & (\pulse|s_count[1]~30\ $ (GND))) # (!\pulse|s_count\(2) & (!\pulse|s_count[1]~30\ & VCC))
-- \pulse|s_count[2]~32\ = CARRY((\pulse|s_count\(2) & !\pulse|s_count[1]~30\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_count\(2),
	datad => VCC,
	cin => \pulse|s_count[1]~30\,
	combout => \pulse|s_count[2]~31_combout\,
	cout => \pulse|s_count[2]~32\);

-- Location: FF_X80_Y2_N11
\pulse|s_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_count[2]~31_combout\,
	sclr => \pulse|s_count[17]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_count\(2));

-- Location: LCCOMB_X80_Y2_N12
\pulse|s_count[3]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_count[3]~33_combout\ = (\pulse|s_count\(3) & (!\pulse|s_count[2]~32\)) # (!\pulse|s_count\(3) & ((\pulse|s_count[2]~32\) # (GND)))
-- \pulse|s_count[3]~34\ = CARRY((!\pulse|s_count[2]~32\) # (!\pulse|s_count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_count\(3),
	datad => VCC,
	cin => \pulse|s_count[2]~32\,
	combout => \pulse|s_count[3]~33_combout\,
	cout => \pulse|s_count[3]~34\);

-- Location: FF_X80_Y2_N13
\pulse|s_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_count[3]~33_combout\,
	sclr => \pulse|s_count[17]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_count\(3));

-- Location: LCCOMB_X80_Y2_N14
\pulse|s_count[4]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_count[4]~35_combout\ = (\pulse|s_count\(4) & (\pulse|s_count[3]~34\ $ (GND))) # (!\pulse|s_count\(4) & (!\pulse|s_count[3]~34\ & VCC))
-- \pulse|s_count[4]~36\ = CARRY((\pulse|s_count\(4) & !\pulse|s_count[3]~34\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_count\(4),
	datad => VCC,
	cin => \pulse|s_count[3]~34\,
	combout => \pulse|s_count[4]~35_combout\,
	cout => \pulse|s_count[4]~36\);

-- Location: FF_X80_Y2_N15
\pulse|s_count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_count[4]~35_combout\,
	sclr => \pulse|s_count[17]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_count\(4));

-- Location: LCCOMB_X80_Y2_N16
\pulse|s_count[5]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_count[5]~37_combout\ = (\pulse|s_count\(5) & (!\pulse|s_count[4]~36\)) # (!\pulse|s_count\(5) & ((\pulse|s_count[4]~36\) # (GND)))
-- \pulse|s_count[5]~38\ = CARRY((!\pulse|s_count[4]~36\) # (!\pulse|s_count\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_count\(5),
	datad => VCC,
	cin => \pulse|s_count[4]~36\,
	combout => \pulse|s_count[5]~37_combout\,
	cout => \pulse|s_count[5]~38\);

-- Location: FF_X80_Y2_N17
\pulse|s_count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_count[5]~37_combout\,
	sclr => \pulse|s_count[17]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_count\(5));

-- Location: LCCOMB_X80_Y2_N18
\pulse|s_count[6]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_count[6]~39_combout\ = (\pulse|s_count\(6) & (\pulse|s_count[5]~38\ $ (GND))) # (!\pulse|s_count\(6) & (!\pulse|s_count[5]~38\ & VCC))
-- \pulse|s_count[6]~40\ = CARRY((\pulse|s_count\(6) & !\pulse|s_count[5]~38\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_count\(6),
	datad => VCC,
	cin => \pulse|s_count[5]~38\,
	combout => \pulse|s_count[6]~39_combout\,
	cout => \pulse|s_count[6]~40\);

-- Location: FF_X80_Y2_N19
\pulse|s_count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_count[6]~39_combout\,
	sclr => \pulse|s_count[17]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_count\(6));

-- Location: LCCOMB_X80_Y2_N20
\pulse|s_count[7]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_count[7]~41_combout\ = (\pulse|s_count\(7) & (!\pulse|s_count[6]~40\)) # (!\pulse|s_count\(7) & ((\pulse|s_count[6]~40\) # (GND)))
-- \pulse|s_count[7]~42\ = CARRY((!\pulse|s_count[6]~40\) # (!\pulse|s_count\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_count\(7),
	datad => VCC,
	cin => \pulse|s_count[6]~40\,
	combout => \pulse|s_count[7]~41_combout\,
	cout => \pulse|s_count[7]~42\);

-- Location: FF_X80_Y2_N21
\pulse|s_count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_count[7]~41_combout\,
	sclr => \pulse|s_count[17]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_count\(7));

-- Location: LCCOMB_X80_Y2_N22
\pulse|s_count[8]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_count[8]~43_combout\ = (\pulse|s_count\(8) & (\pulse|s_count[7]~42\ $ (GND))) # (!\pulse|s_count\(8) & (!\pulse|s_count[7]~42\ & VCC))
-- \pulse|s_count[8]~44\ = CARRY((\pulse|s_count\(8) & !\pulse|s_count[7]~42\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_count\(8),
	datad => VCC,
	cin => \pulse|s_count[7]~42\,
	combout => \pulse|s_count[8]~43_combout\,
	cout => \pulse|s_count[8]~44\);

-- Location: FF_X80_Y2_N23
\pulse|s_count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_count[8]~43_combout\,
	sclr => \pulse|s_count[17]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_count\(8));

-- Location: LCCOMB_X80_Y2_N24
\pulse|s_count[9]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_count[9]~45_combout\ = (\pulse|s_count\(9) & (!\pulse|s_count[8]~44\)) # (!\pulse|s_count\(9) & ((\pulse|s_count[8]~44\) # (GND)))
-- \pulse|s_count[9]~46\ = CARRY((!\pulse|s_count[8]~44\) # (!\pulse|s_count\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_count\(9),
	datad => VCC,
	cin => \pulse|s_count[8]~44\,
	combout => \pulse|s_count[9]~45_combout\,
	cout => \pulse|s_count[9]~46\);

-- Location: FF_X80_Y2_N25
\pulse|s_count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_count[9]~45_combout\,
	sclr => \pulse|s_count[17]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_count\(9));

-- Location: LCCOMB_X80_Y2_N26
\pulse|s_count[10]~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_count[10]~47_combout\ = (\pulse|s_count\(10) & (\pulse|s_count[9]~46\ $ (GND))) # (!\pulse|s_count\(10) & (!\pulse|s_count[9]~46\ & VCC))
-- \pulse|s_count[10]~48\ = CARRY((\pulse|s_count\(10) & !\pulse|s_count[9]~46\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_count\(10),
	datad => VCC,
	cin => \pulse|s_count[9]~46\,
	combout => \pulse|s_count[10]~47_combout\,
	cout => \pulse|s_count[10]~48\);

-- Location: FF_X80_Y2_N27
\pulse|s_count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_count[10]~47_combout\,
	sclr => \pulse|s_count[17]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_count\(10));

-- Location: LCCOMB_X80_Y2_N28
\pulse|s_count[11]~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_count[11]~49_combout\ = (\pulse|s_count\(11) & (!\pulse|s_count[10]~48\)) # (!\pulse|s_count\(11) & ((\pulse|s_count[10]~48\) # (GND)))
-- \pulse|s_count[11]~50\ = CARRY((!\pulse|s_count[10]~48\) # (!\pulse|s_count\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_count\(11),
	datad => VCC,
	cin => \pulse|s_count[10]~48\,
	combout => \pulse|s_count[11]~49_combout\,
	cout => \pulse|s_count[11]~50\);

-- Location: FF_X80_Y2_N29
\pulse|s_count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_count[11]~49_combout\,
	sclr => \pulse|s_count[17]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_count\(11));

-- Location: LCCOMB_X80_Y2_N30
\pulse|s_count[12]~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_count[12]~51_combout\ = (\pulse|s_count\(12) & (\pulse|s_count[11]~50\ $ (GND))) # (!\pulse|s_count\(12) & (!\pulse|s_count[11]~50\ & VCC))
-- \pulse|s_count[12]~52\ = CARRY((\pulse|s_count\(12) & !\pulse|s_count[11]~50\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_count\(12),
	datad => VCC,
	cin => \pulse|s_count[11]~50\,
	combout => \pulse|s_count[12]~51_combout\,
	cout => \pulse|s_count[12]~52\);

-- Location: FF_X80_Y2_N31
\pulse|s_count[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_count[12]~51_combout\,
	sclr => \pulse|s_count[17]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_count\(12));

-- Location: LCCOMB_X80_Y1_N0
\pulse|s_count[13]~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_count[13]~53_combout\ = (\pulse|s_count\(13) & (!\pulse|s_count[12]~52\)) # (!\pulse|s_count\(13) & ((\pulse|s_count[12]~52\) # (GND)))
-- \pulse|s_count[13]~54\ = CARRY((!\pulse|s_count[12]~52\) # (!\pulse|s_count\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_count\(13),
	datad => VCC,
	cin => \pulse|s_count[12]~52\,
	combout => \pulse|s_count[13]~53_combout\,
	cout => \pulse|s_count[13]~54\);

-- Location: FF_X80_Y1_N1
\pulse|s_count[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_count[13]~53_combout\,
	sclr => \pulse|s_count[17]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_count\(13));

-- Location: LCCOMB_X80_Y1_N2
\pulse|s_count[14]~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_count[14]~55_combout\ = (\pulse|s_count\(14) & (\pulse|s_count[13]~54\ $ (GND))) # (!\pulse|s_count\(14) & (!\pulse|s_count[13]~54\ & VCC))
-- \pulse|s_count[14]~56\ = CARRY((\pulse|s_count\(14) & !\pulse|s_count[13]~54\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_count\(14),
	datad => VCC,
	cin => \pulse|s_count[13]~54\,
	combout => \pulse|s_count[14]~55_combout\,
	cout => \pulse|s_count[14]~56\);

-- Location: FF_X80_Y1_N3
\pulse|s_count[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_count[14]~55_combout\,
	sclr => \pulse|s_count[17]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_count\(14));

-- Location: LCCOMB_X80_Y1_N4
\pulse|s_count[15]~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_count[15]~57_combout\ = (\pulse|s_count\(15) & (!\pulse|s_count[14]~56\)) # (!\pulse|s_count\(15) & ((\pulse|s_count[14]~56\) # (GND)))
-- \pulse|s_count[15]~58\ = CARRY((!\pulse|s_count[14]~56\) # (!\pulse|s_count\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_count\(15),
	datad => VCC,
	cin => \pulse|s_count[14]~56\,
	combout => \pulse|s_count[15]~57_combout\,
	cout => \pulse|s_count[15]~58\);

-- Location: FF_X80_Y1_N5
\pulse|s_count[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_count[15]~57_combout\,
	sclr => \pulse|s_count[17]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_count\(15));

-- Location: LCCOMB_X80_Y1_N6
\pulse|s_count[16]~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_count[16]~59_combout\ = (\pulse|s_count\(16) & (\pulse|s_count[15]~58\ $ (GND))) # (!\pulse|s_count\(16) & (!\pulse|s_count[15]~58\ & VCC))
-- \pulse|s_count[16]~60\ = CARRY((\pulse|s_count\(16) & !\pulse|s_count[15]~58\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_count\(16),
	datad => VCC,
	cin => \pulse|s_count[15]~58\,
	combout => \pulse|s_count[16]~59_combout\,
	cout => \pulse|s_count[16]~60\);

-- Location: FF_X80_Y1_N7
\pulse|s_count[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_count[16]~59_combout\,
	sclr => \pulse|s_count[17]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_count\(16));

-- Location: LCCOMB_X80_Y1_N8
\pulse|s_count[17]~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_count[17]~61_combout\ = (\pulse|s_count\(17) & (!\pulse|s_count[16]~60\)) # (!\pulse|s_count\(17) & ((\pulse|s_count[16]~60\) # (GND)))
-- \pulse|s_count[17]~62\ = CARRY((!\pulse|s_count[16]~60\) # (!\pulse|s_count\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_count\(17),
	datad => VCC,
	cin => \pulse|s_count[16]~60\,
	combout => \pulse|s_count[17]~61_combout\,
	cout => \pulse|s_count[17]~62\);

-- Location: FF_X80_Y1_N9
\pulse|s_count[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_count[17]~61_combout\,
	sclr => \pulse|s_count[17]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_count\(17));

-- Location: LCCOMB_X80_Y1_N10
\pulse|s_count[18]~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_count[18]~63_combout\ = (\pulse|s_count\(18) & (\pulse|s_count[17]~62\ $ (GND))) # (!\pulse|s_count\(18) & (!\pulse|s_count[17]~62\ & VCC))
-- \pulse|s_count[18]~64\ = CARRY((\pulse|s_count\(18) & !\pulse|s_count[17]~62\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_count\(18),
	datad => VCC,
	cin => \pulse|s_count[17]~62\,
	combout => \pulse|s_count[18]~63_combout\,
	cout => \pulse|s_count[18]~64\);

-- Location: FF_X80_Y1_N11
\pulse|s_count[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_count[18]~63_combout\,
	sclr => \pulse|s_count[17]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_count\(18));

-- Location: LCCOMB_X80_Y1_N12
\pulse|s_count[19]~65\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_count[19]~65_combout\ = (\pulse|s_count\(19) & (!\pulse|s_count[18]~64\)) # (!\pulse|s_count\(19) & ((\pulse|s_count[18]~64\) # (GND)))
-- \pulse|s_count[19]~66\ = CARRY((!\pulse|s_count[18]~64\) # (!\pulse|s_count\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_count\(19),
	datad => VCC,
	cin => \pulse|s_count[18]~64\,
	combout => \pulse|s_count[19]~65_combout\,
	cout => \pulse|s_count[19]~66\);

-- Location: FF_X80_Y1_N13
\pulse|s_count[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_count[19]~65_combout\,
	sclr => \pulse|s_count[17]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_count\(19));

-- Location: LCCOMB_X80_Y1_N14
\pulse|s_count[20]~67\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_count[20]~67_combout\ = (\pulse|s_count\(20) & (\pulse|s_count[19]~66\ $ (GND))) # (!\pulse|s_count\(20) & (!\pulse|s_count[19]~66\ & VCC))
-- \pulse|s_count[20]~68\ = CARRY((\pulse|s_count\(20) & !\pulse|s_count[19]~66\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_count\(20),
	datad => VCC,
	cin => \pulse|s_count[19]~66\,
	combout => \pulse|s_count[20]~67_combout\,
	cout => \pulse|s_count[20]~68\);

-- Location: FF_X80_Y1_N15
\pulse|s_count[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_count[20]~67_combout\,
	sclr => \pulse|s_count[17]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_count\(20));

-- Location: LCCOMB_X80_Y1_N16
\pulse|s_count[21]~69\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_count[21]~69_combout\ = (\pulse|s_count\(21) & (!\pulse|s_count[20]~68\)) # (!\pulse|s_count\(21) & ((\pulse|s_count[20]~68\) # (GND)))
-- \pulse|s_count[21]~70\ = CARRY((!\pulse|s_count[20]~68\) # (!\pulse|s_count\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_count\(21),
	datad => VCC,
	cin => \pulse|s_count[20]~68\,
	combout => \pulse|s_count[21]~69_combout\,
	cout => \pulse|s_count[21]~70\);

-- Location: FF_X80_Y1_N17
\pulse|s_count[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_count[21]~69_combout\,
	sclr => \pulse|s_count[17]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_count\(21));

-- Location: LCCOMB_X80_Y1_N18
\pulse|s_count[22]~71\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_count[22]~71_combout\ = (\pulse|s_count\(22) & (\pulse|s_count[21]~70\ $ (GND))) # (!\pulse|s_count\(22) & (!\pulse|s_count[21]~70\ & VCC))
-- \pulse|s_count[22]~72\ = CARRY((\pulse|s_count\(22) & !\pulse|s_count[21]~70\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_count\(22),
	datad => VCC,
	cin => \pulse|s_count[21]~70\,
	combout => \pulse|s_count[22]~71_combout\,
	cout => \pulse|s_count[22]~72\);

-- Location: FF_X80_Y1_N19
\pulse|s_count[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_count[22]~71_combout\,
	sclr => \pulse|s_count[17]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_count\(22));

-- Location: LCCOMB_X80_Y1_N20
\pulse|s_count[23]~73\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_count[23]~73_combout\ = (\pulse|s_count\(23) & (!\pulse|s_count[22]~72\)) # (!\pulse|s_count\(23) & ((\pulse|s_count[22]~72\) # (GND)))
-- \pulse|s_count[23]~74\ = CARRY((!\pulse|s_count[22]~72\) # (!\pulse|s_count\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_count\(23),
	datad => VCC,
	cin => \pulse|s_count[22]~72\,
	combout => \pulse|s_count[23]~73_combout\,
	cout => \pulse|s_count[23]~74\);

-- Location: FF_X80_Y1_N21
\pulse|s_count[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_count[23]~73_combout\,
	sclr => \pulse|s_count[17]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_count\(23));

-- Location: LCCOMB_X80_Y1_N22
\pulse|s_count[24]~75\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_count[24]~75_combout\ = (\pulse|s_count\(24) & (\pulse|s_count[23]~74\ $ (GND))) # (!\pulse|s_count\(24) & (!\pulse|s_count[23]~74\ & VCC))
-- \pulse|s_count[24]~76\ = CARRY((\pulse|s_count\(24) & !\pulse|s_count[23]~74\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_count\(24),
	datad => VCC,
	cin => \pulse|s_count[23]~74\,
	combout => \pulse|s_count[24]~75_combout\,
	cout => \pulse|s_count[24]~76\);

-- Location: FF_X80_Y1_N23
\pulse|s_count[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_count[24]~75_combout\,
	sclr => \pulse|s_count[17]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_count\(24));

-- Location: LCCOMB_X80_Y1_N24
\pulse|s_count[25]~77\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_count[25]~77_combout\ = \pulse|s_count[24]~76\ $ (\pulse|s_count\(25))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \pulse|s_count\(25),
	cin => \pulse|s_count[24]~76\,
	combout => \pulse|s_count[25]~77_combout\);

-- Location: FF_X80_Y1_N25
\pulse|s_count[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_count[25]~77_combout\,
	sclr => \pulse|s_count[17]~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_count\(25));

-- Location: LCCOMB_X80_Y1_N26
\pulse|Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Equal0~7_combout\ = (\pulse|s_count\(24)) # (!\pulse|s_count\(25))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \pulse|s_count\(24),
	datad => \pulse|s_count\(25),
	combout => \pulse|Equal0~7_combout\);

-- Location: LCCOMB_X80_Y1_N28
\pulse|Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Equal0~6_combout\ = (((!\pulse|s_count\(22)) # (!\pulse|s_count\(20))) # (!\pulse|s_count\(21))) # (!\pulse|s_count\(23))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_count\(23),
	datab => \pulse|s_count\(21),
	datac => \pulse|s_count\(20),
	datad => \pulse|s_count\(22),
	combout => \pulse|Equal0~6_combout\);

-- Location: LCCOMB_X80_Y1_N30
\pulse|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Equal0~5_combout\ = (\pulse|s_count\(16)) # (((\pulse|s_count\(18)) # (!\pulse|s_count\(19))) # (!\pulse|s_count\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_count\(16),
	datab => \pulse|s_count\(17),
	datac => \pulse|s_count\(18),
	datad => \pulse|s_count\(19),
	combout => \pulse|Equal0~5_combout\);

-- Location: LCCOMB_X80_Y2_N0
\pulse|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Equal0~0_combout\ = (((!\pulse|s_count\(3)) # (!\pulse|s_count\(0))) # (!\pulse|s_count\(1))) # (!\pulse|s_count\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_count\(2),
	datab => \pulse|s_count\(1),
	datac => \pulse|s_count\(0),
	datad => \pulse|s_count\(3),
	combout => \pulse|Equal0~0_combout\);

-- Location: LCCOMB_X80_Y2_N2
\pulse|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Equal0~1_combout\ = (\pulse|s_count\(7)) # (((!\pulse|s_count\(5)) # (!\pulse|s_count\(4))) # (!\pulse|s_count\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_count\(7),
	datab => \pulse|s_count\(6),
	datac => \pulse|s_count\(4),
	datad => \pulse|s_count\(5),
	combout => \pulse|Equal0~1_combout\);

-- Location: LCCOMB_X80_Y2_N4
\pulse|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Equal0~2_combout\ = (\pulse|s_count\(8)) # ((\pulse|s_count\(9)) # ((\pulse|s_count\(10)) # (\pulse|s_count\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_count\(8),
	datab => \pulse|s_count\(9),
	datac => \pulse|s_count\(10),
	datad => \pulse|s_count\(11),
	combout => \pulse|Equal0~2_combout\);

-- Location: LCCOMB_X81_Y2_N20
\pulse|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Equal0~3_combout\ = (((!\pulse|s_count\(15)) # (!\pulse|s_count\(14))) # (!\pulse|s_count\(13))) # (!\pulse|s_count\(12))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_count\(12),
	datab => \pulse|s_count\(13),
	datac => \pulse|s_count\(14),
	datad => \pulse|s_count\(15),
	combout => \pulse|Equal0~3_combout\);

-- Location: LCCOMB_X81_Y2_N16
\pulse|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Equal0~4_combout\ = (\pulse|Equal0~0_combout\) # ((\pulse|Equal0~1_combout\) # ((\pulse|Equal0~2_combout\) # (\pulse|Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|Equal0~0_combout\,
	datab => \pulse|Equal0~1_combout\,
	datac => \pulse|Equal0~2_combout\,
	datad => \pulse|Equal0~3_combout\,
	combout => \pulse|Equal0~4_combout\);

-- Location: LCCOMB_X81_Y2_N2
\pulse|Equal0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Equal0~8_combout\ = (\pulse|Equal0~7_combout\) # ((\pulse|Equal0~6_combout\) # ((\pulse|Equal0~5_combout\) # (\pulse|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|Equal0~7_combout\,
	datab => \pulse|Equal0~6_combout\,
	datac => \pulse|Equal0~5_combout\,
	datad => \pulse|Equal0~4_combout\,
	combout => \pulse|Equal0~8_combout\);

-- Location: LCCOMB_X81_Y2_N30
\pulse|pulse~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|pulse~0_combout\ = (!\control|outReset~q\ & !\pulse|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \control|outReset~q\,
	datad => \pulse|Equal0~8_combout\,
	combout => \pulse|pulse~0_combout\);

-- Location: FF_X81_Y2_N31
\pulse|pulse\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|pulse~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|pulse~q\);

-- Location: CLKCTRL_G16
\pulse|pulse~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \pulse|pulse~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \pulse|pulse~clkctrl_outclk\);

-- Location: LCCOMB_X79_Y3_N0
\timer|s_countUnit~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|s_countUnit~4_combout\ = (!\timer|s_countUnit[1]~3_combout\ & (\timer|s_countUnit\(1) $ (\timer|s_countUnit\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|s_countUnit\(1),
	datab => \timer|s_countUnit\(0),
	datad => \timer|s_countUnit[1]~3_combout\,
	combout => \timer|s_countUnit~4_combout\);

-- Location: LCCOMB_X79_Y3_N8
\timer|s_countUnit[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|s_countUnit[1]~feeder_combout\ = \timer|s_countUnit~4_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \timer|s_countUnit~4_combout\,
	combout => \timer|s_countUnit[1]~feeder_combout\);

-- Location: IOIBUF_X115_Y13_N8
\SW[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(3),
	o => \SW[3]~input_o\);

-- Location: FF_X81_Y2_N9
\control|outStart\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[3]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \control|outStart~q\);

-- Location: LCCOMB_X81_Y2_N0
\fsm|pState~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|pState~9_combout\ = (\control|outStart~q\ & !\control|outReset~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \control|outStart~q\,
	datad => \control|outReset~q\,
	combout => \fsm|pState~9_combout\);

-- Location: IOIBUF_X115_Y15_N8
\SW[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(2),
	o => \SW[2]~input_o\);

-- Location: IOIBUF_X115_Y17_N1
\SW[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: LCCOMB_X108_Y15_N28
\control|program~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \control|program~0_combout\ = (\SW[3]~input_o\ & (\SW[2]~input_o\ & (!\SW[1]~input_o\ & \SW[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[3]~input_o\,
	datab => \SW[2]~input_o\,
	datac => \SW[1]~input_o\,
	datad => \SW[0]~input_o\,
	combout => \control|program~0_combout\);

-- Location: IOIBUF_X115_Y18_N8
\SW[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(4),
	o => \SW[4]~input_o\);

-- Location: LCCOMB_X109_Y11_N22
\control|program~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \control|program~2_combout\ = (\control|program~0_combout\ & \SW[4]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \control|program~0_combout\,
	datad => \SW[4]~input_o\,
	combout => \control|program~2_combout\);

-- Location: FF_X81_Y3_N1
\control|program[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \control|program~2_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \control|program\(0));

-- Location: IOIBUF_X115_Y11_N8
\SW[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(5),
	o => \SW[5]~input_o\);

-- Location: LCCOMB_X109_Y11_N24
\control|program~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \control|program~1_combout\ = (\control|program~0_combout\ & \SW[5]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \control|program~0_combout\,
	datad => \SW[5]~input_o\,
	combout => \control|program~1_combout\);

-- Location: FF_X81_Y3_N23
\control|program[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \control|program~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \control|program\(1));

-- Location: LCCOMB_X81_Y3_N20
\fsm|pState~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|pState~23_combout\ = (!\control|program\(1) & (\fsm|pState.S3~q\ & (\timer|s_change~q\ & \control|program\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \control|program\(1),
	datab => \fsm|pState.S3~q\,
	datac => \timer|s_change~q\,
	datad => \control|program\(0),
	combout => \fsm|pState~23_combout\);

-- Location: LCCOMB_X81_Y2_N14
\fsm|repeat[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|repeat[1]~1_combout\ = (\statejumps|jumpOut\(0) & (!\statejumps|jumpOut\(1) & \fsm|pState~23_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \statejumps|jumpOut\(0),
	datac => \statejumps|jumpOut\(1),
	datad => \fsm|pState~23_combout\,
	combout => \fsm|repeat[1]~1_combout\);

-- Location: FF_X81_Y2_N15
\statejumps|jumpOut[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \fsm|repeat[1]~1_combout\,
	clrn => \control|outStart~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \statejumps|jumpOut\(1));

-- Location: LCCOMB_X81_Y3_N28
\fsm|pState~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|pState~12_combout\ = (\control|program\(0) & (\fsm|pState.S3~q\ & \timer|s_change~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \control|program\(0),
	datab => \fsm|pState.S3~q\,
	datac => \timer|s_change~q\,
	combout => \fsm|pState~12_combout\);

-- Location: LCCOMB_X81_Y2_N10
\fsm|repeat[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|repeat[0]~0_combout\ = (\fsm|pState~12_combout\ & ((\statejumps|jumpOut\(1) $ (!\control|program\(1))) # (!\statejumps|jumpOut\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \statejumps|jumpOut\(1),
	datab => \control|program\(1),
	datac => \statejumps|jumpOut\(0),
	datad => \fsm|pState~12_combout\,
	combout => \fsm|repeat[0]~0_combout\);

-- Location: FF_X81_Y2_N11
\statejumps|jumpOut[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \fsm|repeat[0]~0_combout\,
	clrn => \control|outStart~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \statejumps|jumpOut\(0));

-- Location: LCCOMB_X81_Y3_N0
\fsm|nState~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|nState~6_combout\ = (\control|program\(0) & ((\timer|s_change~q\))) # (!\control|program\(0) & (\control|program\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \control|program\(1),
	datac => \control|program\(0),
	datad => \timer|s_change~q\,
	combout => \fsm|nState~6_combout\);

-- Location: LCCOMB_X81_Y3_N2
\fsm|pState~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|pState~22_combout\ = (\fsm|pState.S0~q\ & (((!\fsm|nState~6_combout\ & \fsm|pState.S1~q\)))) # (!\fsm|pState.S0~q\ & ((\control|program\(0)) # ((!\fsm|nState~6_combout\ & \fsm|pState.S1~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm|pState.S0~q\,
	datab => \control|program\(0),
	datac => \fsm|nState~6_combout\,
	datad => \fsm|pState.S1~q\,
	combout => \fsm|pState~22_combout\);

-- Location: LCCOMB_X81_Y3_N4
\fsm|pState~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|pState~24_combout\ = (\fsm|pState~9_combout\ & ((\fsm|pState~22_combout\) # ((\fsm|pState~23_combout\ & !\statejumps|jumpOut\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm|pState~23_combout\,
	datab => \fsm|pState~9_combout\,
	datac => \statejumps|jumpOut\(0),
	datad => \fsm|pState~22_combout\,
	combout => \fsm|pState~24_combout\);

-- Location: FF_X81_Y3_N5
\fsm|pState.S1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \fsm|pState~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsm|pState.S1~q\);

-- Location: LCCOMB_X80_Y3_N0
\fsm|pState~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|pState~20_combout\ = (\fsm|pState.S1~q\ & (\control|program\(0) & \timer|s_change~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm|pState.S1~q\,
	datac => \control|program\(0),
	datad => \timer|s_change~q\,
	combout => \fsm|pState~20_combout\);

-- Location: LCCOMB_X80_Y3_N12
\fsm|pState~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|pState~21_combout\ = (\fsm|pState~9_combout\ & ((\fsm|pState~20_combout\) # ((\fsm|pState.S2~q\ & !\fsm|nState~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm|pState~9_combout\,
	datab => \fsm|pState~20_combout\,
	datac => \fsm|pState.S2~q\,
	datad => \fsm|nState~6_combout\,
	combout => \fsm|pState~21_combout\);

-- Location: FF_X80_Y3_N13
\fsm|pState.S2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \fsm|pState~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsm|pState.S2~q\);

-- Location: LCCOMB_X81_Y2_N26
\fsm|pState~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|pState~26_combout\ = (\control|program\(0) & (!\fsm|pState.S0~q\ & ((!\timer|s_change~q\)))) # (!\control|program\(0) & (((\control|program\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110001011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm|pState.S0~q\,
	datab => \control|program\(1),
	datac => \control|program\(0),
	datad => \timer|s_change~q\,
	combout => \fsm|pState~26_combout\);

-- Location: LCCOMB_X81_Y2_N4
\fsm|Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|Selector0~0_combout\ = (!\fsm|pState.S0~q\ & (!\control|program\(1) & !\control|program\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \fsm|pState.S0~q\,
	datac => \control|program\(1),
	datad => \control|program\(0),
	combout => \fsm|Selector0~0_combout\);

-- Location: LCCOMB_X81_Y2_N6
\fsm|pState~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|pState~25_combout\ = ((\fsm|Selector0~0_combout\) # ((\fsm|pState.S5~q\ & \timer|s_change~q\))) # (!\fsm|pState~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm|pState.S5~q\,
	datab => \fsm|pState~9_combout\,
	datac => \fsm|Selector0~0_combout\,
	datad => \timer|s_change~q\,
	combout => \fsm|pState~25_combout\);

-- Location: LCCOMB_X81_Y2_N24
\fsm|pState~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|pState~27_combout\ = (!\fsm|pState~25_combout\ & (((!\fsm|pState.S2~q\ & !\fsm|pState.S1~q\)) # (!\fsm|pState~26_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm|pState.S2~q\,
	datab => \fsm|pState.S1~q\,
	datac => \fsm|pState~26_combout\,
	datad => \fsm|pState~25_combout\,
	combout => \fsm|pState~27_combout\);

-- Location: FF_X81_Y2_N25
\fsm|pState.S0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \fsm|pState~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsm|pState.S0~q\);

-- Location: LCCOMB_X82_Y3_N20
\fsm|pState~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|pState~14_combout\ = (!\fsm|pState.S0~q\ & (\control|program\(1) & !\control|program\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm|pState.S0~q\,
	datab => \control|program\(1),
	datad => \control|program\(0),
	combout => \fsm|pState~14_combout\);

-- Location: LCCOMB_X81_Y3_N22
\fsm|pState~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|pState~13_combout\ = (\fsm|pState~12_combout\ & (\control|program\(1) $ (((!\statejumps|jumpOut\(1) & \statejumps|jumpOut\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \statejumps|jumpOut\(1),
	datab => \statejumps|jumpOut\(0),
	datac => \control|program\(1),
	datad => \fsm|pState~12_combout\,
	combout => \fsm|pState~13_combout\);

-- Location: LCCOMB_X82_Y3_N22
\fsm|pState~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|pState~15_combout\ = (\fsm|pState.S4~q\ & (((!\control|program\(0) & !\control|program\(1))) # (!\timer|s_change~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \control|program\(0),
	datab => \control|program\(1),
	datac => \fsm|pState.S4~q\,
	datad => \timer|s_change~q\,
	combout => \fsm|pState~15_combout\);

-- Location: LCCOMB_X81_Y3_N16
\fsm|pState~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|pState~16_combout\ = (\fsm|pState~9_combout\ & ((\fsm|pState~14_combout\) # ((\fsm|pState~13_combout\) # (\fsm|pState~15_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm|pState~14_combout\,
	datab => \fsm|pState~13_combout\,
	datac => \fsm|pState~9_combout\,
	datad => \fsm|pState~15_combout\,
	combout => \fsm|pState~16_combout\);

-- Location: FF_X81_Y3_N17
\fsm|pState.S4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \fsm|pState~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsm|pState.S4~q\);

-- Location: LCCOMB_X82_Y3_N14
\fsm|pState~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|pState~18_combout\ = (\control|program\(0) & ((\fsm|pState.S4~q\) # ((\fsm|pState.S2~q\)))) # (!\control|program\(0) & (\fsm|pState.S4~q\ & ((\control|program\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \control|program\(0),
	datab => \fsm|pState.S4~q\,
	datac => \fsm|pState.S2~q\,
	datad => \control|program\(1),
	combout => \fsm|pState~18_combout\);

-- Location: LCCOMB_X82_Y3_N4
\fsm|pState~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|pState~17_combout\ = (\fsm|pState.S3~q\ & (((!\control|program\(0) & !\control|program\(1))) # (!\timer|s_change~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \control|program\(0),
	datab => \control|program\(1),
	datac => \fsm|pState.S3~q\,
	datad => \timer|s_change~q\,
	combout => \fsm|pState~17_combout\);

-- Location: LCCOMB_X81_Y3_N26
\fsm|pState~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|pState~19_combout\ = (\fsm|pState~9_combout\ & ((\fsm|pState~17_combout\) # ((\timer|s_change~q\ & \fsm|pState~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|s_change~q\,
	datab => \fsm|pState~9_combout\,
	datac => \fsm|pState~18_combout\,
	datad => \fsm|pState~17_combout\,
	combout => \fsm|pState~19_combout\);

-- Location: FF_X81_Y3_N27
\fsm|pState.S3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \fsm|pState~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsm|pState.S3~q\);

-- Location: LCCOMB_X81_Y3_N18
\fsm|Selector7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|Selector7~0_combout\ = (\fsm|pState.S3~q\ & (((\control|program\(1)) # (\control|program\(0))))) # (!\fsm|pState.S3~q\ & (\fsm|pState.S4~q\ & ((\control|program\(1)) # (\control|program\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm|pState.S3~q\,
	datab => \fsm|pState.S4~q\,
	datac => \control|program\(1),
	datad => \control|program\(0),
	combout => \fsm|Selector7~0_combout\);

-- Location: LCCOMB_X81_Y3_N10
\fsm|Selector6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|Selector6~0_combout\ = (!\fsm|pState.S5~q\ & (((!\fsm|pState.S1~q\ & !\fsm|pState.S2~q\)) # (!\control|program\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm|pState.S5~q\,
	datab => \control|program\(0),
	datac => \fsm|pState.S1~q\,
	datad => \fsm|pState.S2~q\,
	combout => \fsm|Selector6~0_combout\);

-- Location: LCCOMB_X80_Y3_N20
\timer|s_countUnit[1]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|s_countUnit[1]~5_combout\ = (\RMan|reset~q\) # ((!\timer|s_change~q\ & ((\fsm|Selector7~0_combout\) # (!\fsm|Selector6~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RMan|reset~q\,
	datab => \timer|s_change~q\,
	datac => \fsm|Selector7~0_combout\,
	datad => \fsm|Selector6~0_combout\,
	combout => \timer|s_countUnit[1]~5_combout\);

-- Location: FF_X79_Y3_N9
\timer|s_countUnit[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \timer|s_countUnit[1]~feeder_combout\,
	ena => \timer|s_countUnit[1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer|s_countUnit\(1));

-- Location: LCCOMB_X79_Y3_N12
\timereg|unitOut[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \timereg|unitOut[1]~feeder_combout\ = \timer|s_countUnit\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \timer|s_countUnit\(1),
	combout => \timereg|unitOut[1]~feeder_combout\);

-- Location: LCCOMB_X81_Y3_N12
\fsm|Selector6~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|Selector6~1_combout\ = (\timer|s_change~q\) # ((!\fsm|Selector7~0_combout\ & \fsm|Selector6~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm|Selector7~0_combout\,
	datab => \timer|s_change~q\,
	datad => \fsm|Selector6~0_combout\,
	combout => \fsm|Selector6~1_combout\);

-- Location: FF_X79_Y3_N13
\timereg|unitOut[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \timereg|unitOut[1]~feeder_combout\,
	clrn => \fsm|ALT_INV_Selector6~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timereg|unitOut\(1));

-- Location: LCCOMB_X80_Y3_N18
\fsm|Selector8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|Selector8~0_combout\ = (\fsm|pState.S5~q\) # ((\control|program\(0) & ((\fsm|pState.S2~q\) # (\fsm|pState.S1~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm|pState.S2~q\,
	datab => \control|program\(0),
	datac => \fsm|pState.S5~q\,
	datad => \fsm|pState.S1~q\,
	combout => \fsm|Selector8~0_combout\);

-- Location: FF_X80_Y3_N9
\timereg|unitOut[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \timer|s_countUnit\(0),
	clrn => \fsm|ALT_INV_Selector6~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timereg|unitOut\(0));

-- Location: LCCOMB_X81_Y3_N24
\fsm|Selector9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|Selector9~0_combout\ = (\fsm|pState.S4~q\ & ((\control|program\(1)) # ((\control|program\(0))))) # (!\fsm|pState.S4~q\ & (((\fsm|pState.S1~q\ & \control|program\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \control|program\(1),
	datab => \fsm|pState.S4~q\,
	datac => \fsm|pState.S1~q\,
	datad => \control|program\(0),
	combout => \fsm|Selector9~0_combout\);

-- Location: LCCOMB_X80_Y3_N8
\timer|Equal2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|Equal2~0_combout\ = (\timereg|unitOut\(1) & (\fsm|Selector8~0_combout\ & (\timereg|unitOut\(0) $ (!\fsm|Selector9~0_combout\)))) # (!\timereg|unitOut\(1) & (!\fsm|Selector8~0_combout\ & (\timereg|unitOut\(0) $ (!\fsm|Selector9~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timereg|unitOut\(1),
	datab => \fsm|Selector8~0_combout\,
	datac => \timereg|unitOut\(0),
	datad => \fsm|Selector9~0_combout\,
	combout => \timer|Equal2~0_combout\);

-- Location: LCCOMB_X79_Y3_N14
\timer|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|Add0~0_combout\ = (\timer|s_countUnit\(1) & \timer|s_countUnit\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|s_countUnit\(1),
	datad => \timer|s_countUnit\(0),
	combout => \timer|Add0~0_combout\);

-- Location: LCCOMB_X79_Y3_N10
\timer|s_countUnit~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|s_countUnit~7_combout\ = (!\timer|s_countUnit[1]~3_combout\ & (\timer|s_countUnit\(3) $ (((\timer|s_countUnit\(2) & \timer|Add0~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|s_countUnit\(3),
	datab => \timer|s_countUnit\(2),
	datac => \timer|Add0~0_combout\,
	datad => \timer|s_countUnit[1]~3_combout\,
	combout => \timer|s_countUnit~7_combout\);

-- Location: LCCOMB_X79_Y3_N4
\timer|s_countUnit[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|s_countUnit[3]~feeder_combout\ = \timer|s_countUnit~7_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \timer|s_countUnit~7_combout\,
	combout => \timer|s_countUnit[3]~feeder_combout\);

-- Location: FF_X79_Y3_N5
\timer|s_countUnit[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \timer|s_countUnit[3]~feeder_combout\,
	ena => \timer|s_countUnit[1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer|s_countUnit\(3));

-- Location: FF_X80_Y3_N5
\timereg|unitOut[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \timer|s_countUnit\(3),
	clrn => \fsm|ALT_INV_Selector6~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timereg|unitOut\(3));

-- Location: LCCOMB_X80_Y3_N4
\timer|Equal2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|Equal2~2_combout\ = \timereg|unitOut\(3) $ (((\control|program\(0) & \fsm|pState.S2~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \control|program\(0),
	datac => \timereg|unitOut\(3),
	datad => \fsm|pState.S2~q\,
	combout => \timer|Equal2~2_combout\);

-- Location: FF_X81_Y3_N7
\timereg|unitOut[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \timer|s_countUnit\(2),
	clrn => \fsm|ALT_INV_Selector6~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timereg|unitOut\(2));

-- Location: LCCOMB_X81_Y3_N6
\timer|Equal2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|Equal2~1_combout\ = \timereg|unitOut\(2) $ (((\fsm|Selector7~0_combout\) # ((\control|program\(0) & \fsm|pState.S1~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111101111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \control|program\(0),
	datab => \fsm|pState.S1~q\,
	datac => \timereg|unitOut\(2),
	datad => \fsm|Selector7~0_combout\,
	combout => \timer|Equal2~1_combout\);

-- Location: LCCOMB_X80_Y3_N22
\timer|Equal2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|Equal2~3_combout\ = (\timer|Equal2~0_combout\ & (!\timer|Equal2~2_combout\ & !\timer|Equal2~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \timer|Equal2~0_combout\,
	datac => \timer|Equal2~2_combout\,
	datad => \timer|Equal2~1_combout\,
	combout => \timer|Equal2~3_combout\);

-- Location: LCCOMB_X79_Y3_N6
\display_time|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|Equal0~1_combout\ = (\timer|s_countUnit\(3) & \timer|s_countUnit\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \timer|s_countUnit\(3),
	datad => \timer|s_countUnit\(0),
	combout => \display_time|Equal0~1_combout\);

-- Location: LCCOMB_X79_Y3_N20
\display_time|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|Equal0~0_combout\ = (\timer|s_countUnit\(1) & !\timer|s_countUnit\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \timer|s_countUnit\(1),
	datad => \timer|s_countUnit\(2),
	combout => \display_time|Equal0~0_combout\);

-- Location: LCCOMB_X80_Y3_N26
\timer|s_countDoz~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|s_countDoz~6_combout\ = (\display_time|Equal0~1_combout\ & (!\RMan|reset~q\ & (!\timer|s_countDoz\(0) & \display_time|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display_time|Equal0~1_combout\,
	datab => \RMan|reset~q\,
	datac => \timer|s_countDoz\(0),
	datad => \display_time|Equal0~0_combout\,
	combout => \timer|s_countDoz~6_combout\);

-- Location: LCCOMB_X80_Y3_N2
\timer|s_countDoz[0]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|s_countDoz[0]~5_combout\ = (\timer|s_countUnit[1]~3_combout\ & ((\RMan|reset~q\) # (!\fsm|Selector6~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RMan|reset~q\,
	datac => \fsm|Selector6~1_combout\,
	datad => \timer|s_countUnit[1]~3_combout\,
	combout => \timer|s_countDoz[0]~5_combout\);

-- Location: FF_X80_Y3_N27
\timer|s_countDoz[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \timer|s_countDoz~6_combout\,
	ena => \timer|s_countDoz[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer|s_countDoz\(0));

-- Location: LCCOMB_X79_Y3_N16
\timer|s_countDoz~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|s_countDoz~8_combout\ = (!\RMan|reset~q\ & (\display_time|Equal0~1_combout\ & (\timer|s_countUnit\(1) & !\timer|s_countUnit\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RMan|reset~q\,
	datab => \display_time|Equal0~1_combout\,
	datac => \timer|s_countUnit\(1),
	datad => \timer|s_countUnit\(2),
	combout => \timer|s_countDoz~8_combout\);

-- Location: LCCOMB_X80_Y3_N28
\timer|s_countDoz~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|s_countDoz~7_combout\ = (\timer|s_countDoz~8_combout\ & (\timer|s_countDoz\(0) $ (\timer|s_countDoz\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|s_countDoz\(0),
	datac => \timer|s_countDoz\(1),
	datad => \timer|s_countDoz~8_combout\,
	combout => \timer|s_countDoz~7_combout\);

-- Location: FF_X80_Y3_N29
\timer|s_countDoz[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \timer|s_countDoz~7_combout\,
	ena => \timer|s_countDoz[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer|s_countDoz\(1));

-- Location: LCCOMB_X80_Y3_N24
\timer|s_countDoz~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|s_countDoz~4_combout\ = (\timer|s_countDoz~8_combout\ & (\timer|s_countDoz\(2) $ (((\timer|s_countDoz\(0) & \timer|s_countDoz\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|s_countDoz\(0),
	datab => \timer|s_countDoz\(1),
	datac => \timer|s_countDoz\(2),
	datad => \timer|s_countDoz~8_combout\,
	combout => \timer|s_countDoz~4_combout\);

-- Location: FF_X80_Y3_N25
\timer|s_countDoz[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \timer|s_countDoz~4_combout\,
	ena => \timer|s_countDoz[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer|s_countDoz\(2));

-- Location: LCCOMB_X80_Y3_N14
\display_time|Equal17~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|Equal17~0_combout\ = (\timer|s_countDoz\(2) & (\timer|s_countDoz\(0) & \timer|s_countDoz\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \timer|s_countDoz\(2),
	datac => \timer|s_countDoz\(0),
	datad => \timer|s_countDoz\(1),
	combout => \display_time|Equal17~0_combout\);

-- Location: LCCOMB_X81_Y3_N30
\timer|s_change~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|s_change~5_combout\ = (\timer|s_change~6_combout\ & (\timer|Equal2~3_combout\ & (!\fsm|Selector6~1_combout\ & !\display_time|Equal17~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|s_change~6_combout\,
	datab => \timer|Equal2~3_combout\,
	datac => \fsm|Selector6~1_combout\,
	datad => \display_time|Equal17~0_combout\,
	combout => \timer|s_change~5_combout\);

-- Location: FF_X81_Y3_N31
\timer|s_reset\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \timer|s_change~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer|s_reset~q\);

-- Location: FF_X81_Y3_N13
\timereg|resetOut\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \timer|s_reset~q\,
	clrn => \fsm|ALT_INV_Selector6~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timereg|resetOut~q\);

-- Location: LCCOMB_X82_Y3_N12
\RMan|reset~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RMan|reset~0_combout\ = (\control|outReset~q\) # (\timereg|resetOut~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \control|outReset~q\,
	datad => \timereg|resetOut~q\,
	combout => \RMan|reset~0_combout\);

-- Location: FF_X80_Y3_N7
\RMan|reset\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \RMan|reset~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RMan|reset~q\);

-- Location: LCCOMB_X80_Y3_N30
\timer|s_countUnit[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|s_countUnit[1]~2_combout\ = (\RMan|reset~q\) # ((\display_time|Equal17~0_combout\) # ((\display_time|Equal0~1_combout\ & \display_time|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RMan|reset~q\,
	datab => \display_time|Equal17~0_combout\,
	datac => \display_time|Equal0~1_combout\,
	datad => \display_time|Equal0~0_combout\,
	combout => \timer|s_countUnit[1]~2_combout\);

-- Location: LCCOMB_X80_Y3_N16
\timer|s_countUnit[1]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|s_countUnit[1]~3_combout\ = (\timer|s_countUnit[1]~2_combout\) # ((!\timer|Equal2~2_combout\ & (\timer|Equal2~0_combout\ & !\timer|Equal2~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|s_countUnit[1]~2_combout\,
	datab => \timer|Equal2~2_combout\,
	datac => \timer|Equal2~0_combout\,
	datad => \timer|Equal2~1_combout\,
	combout => \timer|s_countUnit[1]~3_combout\);

-- Location: LCCOMB_X79_Y3_N24
\timer|s_countUnit~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|s_countUnit~6_combout\ = (!\timer|s_countUnit\(0) & !\timer|s_countUnit[1]~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \timer|s_countUnit\(0),
	datad => \timer|s_countUnit[1]~3_combout\,
	combout => \timer|s_countUnit~6_combout\);

-- Location: LCCOMB_X79_Y3_N26
\timer|s_countUnit[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|s_countUnit[0]~feeder_combout\ = \timer|s_countUnit~6_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \timer|s_countUnit~6_combout\,
	combout => \timer|s_countUnit[0]~feeder_combout\);

-- Location: FF_X79_Y3_N27
\timer|s_countUnit[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \timer|s_countUnit[0]~feeder_combout\,
	ena => \timer|s_countUnit[1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer|s_countUnit\(0));

-- Location: LCCOMB_X79_Y3_N2
\timer|s_countUnit~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|s_countUnit~8_combout\ = (!\timer|s_countUnit[1]~3_combout\ & (\timer|s_countUnit\(2) $ (((\timer|s_countUnit\(0) & \timer|s_countUnit\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|s_countUnit\(0),
	datab => \timer|s_countUnit\(2),
	datac => \timer|s_countUnit\(1),
	datad => \timer|s_countUnit[1]~3_combout\,
	combout => \timer|s_countUnit~8_combout\);

-- Location: LCCOMB_X79_Y3_N18
\timer|s_countUnit[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|s_countUnit[2]~feeder_combout\ = \timer|s_countUnit~8_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \timer|s_countUnit~8_combout\,
	combout => \timer|s_countUnit[2]~feeder_combout\);

-- Location: FF_X79_Y3_N19
\timer|s_countUnit[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \timer|s_countUnit[2]~feeder_combout\,
	ena => \timer|s_countUnit[1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer|s_countUnit\(2));

-- Location: LCCOMB_X80_Y3_N10
\timer|s_change~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|s_change~6_combout\ = (!\RMan|reset~q\ & ((\timer|s_countUnit\(2)) # ((!\timer|s_countUnit\(1)) # (!\display_time|Equal0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|s_countUnit\(2),
	datab => \RMan|reset~q\,
	datac => \display_time|Equal0~1_combout\,
	datad => \timer|s_countUnit\(1),
	combout => \timer|s_change~6_combout\);

-- Location: LCCOMB_X81_Y3_N14
\timer|s_change~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \timer|s_change~4_combout\ = (\timer|s_change~6_combout\ & (!\fsm|Selector6~1_combout\ & ((\timer|Equal2~3_combout\) # (\display_time|Equal17~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|s_change~6_combout\,
	datab => \timer|Equal2~3_combout\,
	datac => \fsm|Selector6~1_combout\,
	datad => \display_time|Equal17~0_combout\,
	combout => \timer|s_change~4_combout\);

-- Location: FF_X81_Y3_N15
\timer|s_change\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \timer|s_change~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \timer|s_change~q\);

-- Location: LCCOMB_X82_Y3_N8
\fsm|pState~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|pState~8_combout\ = (\control|program\(0) & (\statejumps|jumpOut\(0) & (\control|program\(1) $ (\statejumps|jumpOut\(1))))) # (!\control|program\(0) & (\control|program\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110010011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \control|program\(0),
	datab => \control|program\(1),
	datac => \statejumps|jumpOut\(0),
	datad => \statejumps|jumpOut\(1),
	combout => \fsm|pState~8_combout\);

-- Location: LCCOMB_X82_Y3_N6
\fsm|pState~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|pState~10_combout\ = (\fsm|pState.S3~q\ & (\fsm|pState~9_combout\ & (\fsm|pState~8_combout\ & \timer|s_change~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm|pState.S3~q\,
	datab => \fsm|pState~9_combout\,
	datac => \fsm|pState~8_combout\,
	datad => \timer|s_change~q\,
	combout => \fsm|pState~10_combout\);

-- Location: LCCOMB_X81_Y3_N8
\fsm|pState~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|pState~11_combout\ = (\fsm|pState~10_combout\) # ((!\timer|s_change~q\ & (\fsm|pState~9_combout\ & \fsm|pState.S5~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|s_change~q\,
	datab => \fsm|pState~9_combout\,
	datac => \fsm|pState.S5~q\,
	datad => \fsm|pState~10_combout\,
	combout => \fsm|pState~11_combout\);

-- Location: FF_X81_Y3_N9
\fsm|pState.S5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \fsm|pState~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \fsm|pState.S5~q\);

-- Location: LCCOMB_X80_Y4_N0
\fsm|finish~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|finish~0_combout\ = (\fsm|pState.S5~q\ & \timer|s_change~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \fsm|pState.S5~q\,
	datad => \timer|s_change~q\,
	combout => \fsm|finish~0_combout\);

-- Location: LCCOMB_X108_Y15_N24
\control|outOn~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \control|outOn~feeder_combout\ = \SW[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SW[0]~input_o\,
	combout => \control|outOn~feeder_combout\);

-- Location: FF_X108_Y15_N25
\control|outOn\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \control|outOn~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \control|outOn~q\);

-- Location: LCCOMB_X108_Y15_N2
\control|outRes~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \control|outRes~0_combout\ = !\SW[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SW[1]~input_o\,
	combout => \control|outRes~0_combout\);

-- Location: FF_X108_Y15_N3
\control|outRes\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \control|outRes~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \control|outRes~q\);

-- Location: FF_X108_Y15_N13
\control|outDoor\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \SW[2]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \control|outDoor~q\);

-- Location: LCCOMB_X108_Y15_N18
\control|outStr~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \control|outStr~feeder_combout\ = \SW[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \SW[3]~input_o\,
	combout => \control|outStr~feeder_combout\);

-- Location: FF_X108_Y15_N19
\control|outStr\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \control|outStr~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \control|outStr~q\);

-- Location: LCCOMB_X82_Y3_N24
\fsm|spin~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|spin~0_combout\ = (\timer|s_change~q\) # (((!\control|program\(0) & !\control|program\(1))) # (!\fsm|pState.S4~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|s_change~q\,
	datab => \control|program\(0),
	datac => \fsm|pState.S4~q\,
	datad => \control|program\(1),
	combout => \fsm|spin~0_combout\);

-- Location: LCCOMB_X82_Y3_N18
\fsm|rinse~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|rinse~0_combout\ = (\timer|s_change~q\) # (((!\control|program\(0) & !\control|program\(1))) # (!\fsm|pState.S3~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|s_change~q\,
	datab => \control|program\(0),
	datac => \fsm|pState.S3~q\,
	datad => \control|program\(1),
	combout => \fsm|rinse~0_combout\);

-- Location: LCCOMB_X80_Y4_N2
\fsm|water_pump~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|water_pump~0_combout\ = ((\timer|s_change~q\) # (!\control|program\(0))) # (!\fsm|pState.S2~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \fsm|pState.S2~q\,
	datac => \control|program\(0),
	datad => \timer|s_change~q\,
	combout => \fsm|water_pump~0_combout\);

-- Location: LCCOMB_X80_Y3_N6
\fsm|water_valve~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fsm|water_valve~0_combout\ = (\timer|s_change~q\) # ((!\fsm|pState.S1~q\) # (!\control|program\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|s_change~q\,
	datab => \control|program\(0),
	datad => \fsm|pState.S1~q\,
	combout => \fsm|water_valve~0_combout\);

-- Location: LCCOMB_X77_Y3_N30
\display_time|decUnit[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|decUnit[0]~1_combout\ = (!\timer|s_countUnit\(1) & (!\timer|s_countUnit\(3) & (\timer|s_countUnit\(0) $ (\timer|s_countUnit\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|s_countUnit\(1),
	datab => \timer|s_countUnit\(0),
	datac => \timer|s_countUnit\(2),
	datad => \timer|s_countUnit\(3),
	combout => \display_time|decUnit[0]~1_combout\);

-- Location: LCCOMB_X77_Y3_N24
\display_time|decUnit[6]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|decUnit[6]~0_combout\ = (!\timer|s_countUnit\(2) & (((!\timer|s_countUnit\(1) & \timer|s_countUnit\(3))) # (!\timer|s_countUnit\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|s_countUnit\(1),
	datab => \timer|s_countUnit\(0),
	datac => \timer|s_countUnit\(2),
	datad => \timer|s_countUnit\(3),
	combout => \display_time|decUnit[6]~0_combout\);

-- Location: LCCOMB_X77_Y2_N12
\display_time|comb~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|comb~0_combout\ = (\fsm|Selector6~1_combout\) # ((!\display_time|decUnit[0]~1_combout\ & ((\display_time|decUnit[6]~0_combout\) # (!\timer|s_countUnit\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display_time|decUnit[0]~1_combout\,
	datab => \timer|s_countUnit\(3),
	datac => \fsm|Selector6~1_combout\,
	datad => \display_time|decUnit[6]~0_combout\,
	combout => \display_time|comb~0_combout\);

-- Location: LCCOMB_X77_Y2_N18
\display_time|comb~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|comb~1_combout\ = (\display_time|decUnit[0]~1_combout\ & (!\fsm|Selector6~1_combout\ & ((\display_time|decUnit[6]~0_combout\) # (!\timer|s_countUnit\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display_time|decUnit[0]~1_combout\,
	datab => \timer|s_countUnit\(3),
	datac => \fsm|Selector6~1_combout\,
	datad => \display_time|decUnit[6]~0_combout\,
	combout => \display_time|comb~1_combout\);

-- Location: LCCOMB_X77_Y2_N16
\display_time|decUnit[0]\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|decUnit\(0) = (!\display_time|comb~0_combout\ & ((\display_time|comb~1_combout\) # (\display_time|decUnit\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display_time|comb~0_combout\,
	datab => \display_time|comb~1_combout\,
	datad => \display_time|decUnit\(0),
	combout => \display_time|decUnit\(0));

-- Location: LCCOMB_X77_Y3_N28
\display_time|decUnit[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|decUnit[1]~2_combout\ = (\timer|s_countUnit\(2) & (!\timer|s_countUnit\(3) & (\timer|s_countUnit\(1) $ (\timer|s_countUnit\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|s_countUnit\(1),
	datab => \timer|s_countUnit\(0),
	datac => \timer|s_countUnit\(2),
	datad => \timer|s_countUnit\(3),
	combout => \display_time|decUnit[1]~2_combout\);

-- Location: LCCOMB_X77_Y2_N0
\display_time|comb~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|comb~2_combout\ = (!\display_time|decUnit[1]~2_combout\ & (!\fsm|Selector6~1_combout\ & ((\display_time|decUnit[6]~0_combout\) # (!\timer|s_countUnit\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display_time|decUnit[1]~2_combout\,
	datab => \timer|s_countUnit\(3),
	datac => \fsm|Selector6~1_combout\,
	datad => \display_time|decUnit[6]~0_combout\,
	combout => \display_time|comb~2_combout\);

-- Location: LCCOMB_X77_Y2_N22
\display_time|comb~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|comb~3_combout\ = (\fsm|Selector6~1_combout\) # ((\display_time|decUnit[1]~2_combout\ & ((\display_time|decUnit[6]~0_combout\) # (!\timer|s_countUnit\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display_time|decUnit[1]~2_combout\,
	datab => \timer|s_countUnit\(3),
	datac => \fsm|Selector6~1_combout\,
	datad => \display_time|decUnit[6]~0_combout\,
	combout => \display_time|comb~3_combout\);

-- Location: LCCOMB_X77_Y2_N2
\display_time|decUnit[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|decUnit\(1) = (!\display_time|comb~2_combout\ & ((\display_time|comb~3_combout\) # (\display_time|decUnit\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display_time|comb~2_combout\,
	datac => \display_time|comb~3_combout\,
	datad => \display_time|decUnit\(1),
	combout => \display_time|decUnit\(1));

-- Location: LCCOMB_X77_Y3_N26
\display_time|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|Equal0~2_combout\ = (\timer|s_countUnit\(1) & (!\timer|s_countUnit\(0) & (!\timer|s_countUnit\(2) & !\timer|s_countUnit\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|s_countUnit\(1),
	datab => \timer|s_countUnit\(0),
	datac => \timer|s_countUnit\(2),
	datad => \timer|s_countUnit\(3),
	combout => \display_time|Equal0~2_combout\);

-- Location: LCCOMB_X77_Y3_N20
\display_time|comb~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|comb~4_combout\ = (!\fsm|Selector6~1_combout\ & (!\display_time|Equal0~2_combout\ & ((\display_time|decUnit[6]~0_combout\) # (!\timer|s_countUnit\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|s_countUnit\(3),
	datab => \fsm|Selector6~1_combout\,
	datac => \display_time|Equal0~2_combout\,
	datad => \display_time|decUnit[6]~0_combout\,
	combout => \display_time|comb~4_combout\);

-- Location: LCCOMB_X77_Y3_N10
\display_time|comb~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|comb~5_combout\ = (\fsm|Selector6~1_combout\) # ((\display_time|Equal0~2_combout\ & ((\display_time|decUnit[6]~0_combout\) # (!\timer|s_countUnit\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|s_countUnit\(3),
	datab => \fsm|Selector6~1_combout\,
	datac => \display_time|Equal0~2_combout\,
	datad => \display_time|decUnit[6]~0_combout\,
	combout => \display_time|comb~5_combout\);

-- Location: LCCOMB_X76_Y3_N2
\display_time|decUnit[2]\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|decUnit\(2) = (!\display_time|comb~4_combout\ & ((\display_time|comb~5_combout\) # (\display_time|decUnit\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display_time|comb~4_combout\,
	datac => \display_time|comb~5_combout\,
	datad => \display_time|decUnit\(2),
	combout => \display_time|decUnit\(2));

-- Location: LCCOMB_X77_Y3_N14
\display_time|decUnit[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|decUnit[3]~4_combout\ = (\timer|s_countUnit\(0) & (!\timer|s_countUnit\(3) & (\timer|s_countUnit\(1) $ (!\timer|s_countUnit\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|s_countUnit\(1),
	datab => \timer|s_countUnit\(0),
	datac => \timer|s_countUnit\(2),
	datad => \timer|s_countUnit\(3),
	combout => \display_time|decUnit[3]~4_combout\);

-- Location: LCCOMB_X77_Y3_N12
\display_time|decUnit[5]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|decUnit[5]~3_combout\ = (!\timer|s_countUnit\(3) & ((\timer|s_countUnit\(1) & (\timer|s_countUnit\(0) & !\timer|s_countUnit\(2))) # (!\timer|s_countUnit\(1) & (!\timer|s_countUnit\(0) & \timer|s_countUnit\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|s_countUnit\(1),
	datab => \timer|s_countUnit\(0),
	datac => \timer|s_countUnit\(2),
	datad => \timer|s_countUnit\(3),
	combout => \display_time|decUnit[5]~3_combout\);

-- Location: LCCOMB_X77_Y3_N0
\display_time|decUnit[3]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|decUnit[3]~5_combout\ = (\display_time|Equal0~2_combout\) # ((\display_time|decUnit[3]~4_combout\) # ((\display_time|decUnit[5]~3_combout\) # (\fsm|Selector6~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display_time|Equal0~2_combout\,
	datab => \display_time|decUnit[3]~4_combout\,
	datac => \display_time|decUnit[5]~3_combout\,
	datad => \fsm|Selector6~1_combout\,
	combout => \display_time|decUnit[3]~5_combout\);

-- Location: LCCOMB_X77_Y3_N22
\display_time|decUnit[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|decUnit[3]~6_combout\ = (!\timer|s_countUnit\(2) & (!\timer|s_countUnit\(3) & (\timer|s_countUnit\(1) $ (\timer|s_countUnit\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|s_countUnit\(1),
	datab => \timer|s_countUnit\(0),
	datac => \timer|s_countUnit\(2),
	datad => \timer|s_countUnit\(3),
	combout => \display_time|decUnit[3]~6_combout\);

-- Location: LCCOMB_X77_Y3_N16
\display_time|decUnit[3]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|decUnit[3]~7_combout\ = (!\fsm|Selector6~1_combout\ & ((\display_time|decUnit[3]~6_combout\) # (\display_time|decUnit[5]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \fsm|Selector6~1_combout\,
	datac => \display_time|decUnit[3]~6_combout\,
	datad => \display_time|decUnit[5]~3_combout\,
	combout => \display_time|decUnit[3]~7_combout\);

-- Location: LCCOMB_X76_Y3_N28
\display_time|decUnit[3]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|decUnit[3]~8_combout\ = (\display_time|decUnit[3]~5_combout\ & (((\timer|s_countUnit\(3)) # (!\display_time|decUnit[3]~7_combout\)) # (!\display_time|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display_time|Equal0~0_combout\,
	datab => \timer|s_countUnit\(3),
	datac => \display_time|decUnit[3]~5_combout\,
	datad => \display_time|decUnit[3]~7_combout\,
	combout => \display_time|decUnit[3]~8_combout\);

-- Location: LCCOMB_X77_Y2_N24
\display_time|comb~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|comb~6_combout\ = (!\display_time|decUnit[3]~8_combout\ & (((\fsm|Selector6~1_combout\) # (\display_time|decUnit[6]~0_combout\)) # (!\timer|s_countUnit\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display_time|decUnit[3]~8_combout\,
	datab => \timer|s_countUnit\(3),
	datac => \fsm|Selector6~1_combout\,
	datad => \display_time|decUnit[6]~0_combout\,
	combout => \display_time|comb~6_combout\);

-- Location: LCCOMB_X77_Y2_N30
\display_time|comb~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|comb~7_combout\ = (\display_time|decUnit[3]~8_combout\ & (((\fsm|Selector6~1_combout\) # (\display_time|decUnit[6]~0_combout\)) # (!\timer|s_countUnit\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display_time|decUnit[3]~8_combout\,
	datab => \timer|s_countUnit\(3),
	datac => \fsm|Selector6~1_combout\,
	datad => \display_time|decUnit[6]~0_combout\,
	combout => \display_time|comb~7_combout\);

-- Location: LCCOMB_X76_Y2_N24
\display_time|decUnit[3]\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|decUnit\(3) = (!\display_time|comb~6_combout\ & ((\display_time|comb~7_combout\) # (\display_time|decUnit\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display_time|comb~6_combout\,
	datac => \display_time|comb~7_combout\,
	datad => \display_time|decUnit\(3),
	combout => \display_time|decUnit\(3));

-- Location: LCCOMB_X79_Y3_N30
\display_time|decUnit[4]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|decUnit[4]~9_combout\ = (\timer|s_countUnit\(1) & ((\timer|s_countUnit\(3)))) # (!\timer|s_countUnit\(1) & (\timer|s_countUnit\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|s_countUnit\(1),
	datab => \timer|s_countUnit\(2),
	datad => \timer|s_countUnit\(3),
	combout => \display_time|decUnit[4]~9_combout\);

-- Location: LCCOMB_X79_Y3_N28
\display_time|decUnit[4]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|decUnit[4]~10_combout\ = (\fsm|Selector6~1_combout\) # ((\display_time|decUnit[4]~9_combout\ & (!\timer|s_countUnit\(3))) # (!\display_time|decUnit[4]~9_combout\ & ((\timer|s_countUnit\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111111001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display_time|decUnit[4]~9_combout\,
	datab => \fsm|Selector6~1_combout\,
	datac => \timer|s_countUnit\(3),
	datad => \timer|s_countUnit\(0),
	combout => \display_time|decUnit[4]~10_combout\);

-- Location: LCCOMB_X77_Y2_N10
\display_time|comb~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|comb~9_combout\ = (\display_time|decUnit[4]~10_combout\ & ((\display_time|decUnit[6]~0_combout\) # ((\fsm|Selector6~1_combout\) # (!\timer|s_countUnit\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display_time|decUnit[6]~0_combout\,
	datab => \timer|s_countUnit\(3),
	datac => \fsm|Selector6~1_combout\,
	datad => \display_time|decUnit[4]~10_combout\,
	combout => \display_time|comb~9_combout\);

-- Location: LCCOMB_X77_Y2_N8
\display_time|comb~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|comb~8_combout\ = (!\display_time|decUnit[4]~10_combout\ & ((\display_time|decUnit[6]~0_combout\) # ((\fsm|Selector6~1_combout\) # (!\timer|s_countUnit\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display_time|decUnit[6]~0_combout\,
	datab => \timer|s_countUnit\(3),
	datac => \fsm|Selector6~1_combout\,
	datad => \display_time|decUnit[4]~10_combout\,
	combout => \display_time|comb~8_combout\);

-- Location: LCCOMB_X77_Y2_N20
\display_time|decUnit[4]\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|decUnit\(4) = (!\display_time|comb~8_combout\ & ((\display_time|comb~9_combout\) # (\display_time|decUnit\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display_time|comb~9_combout\,
	datac => \display_time|comb~8_combout\,
	datad => \display_time|decUnit\(4),
	combout => \display_time|decUnit\(4));

-- Location: LCCOMB_X77_Y3_N2
\display_time|decUnit[5]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|decUnit[5]~11_combout\ = (!\timer|s_countUnit\(2) & (!\timer|s_countUnit\(3) & ((\timer|s_countUnit\(1)) # (\timer|s_countUnit\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|s_countUnit\(1),
	datab => \timer|s_countUnit\(0),
	datac => \timer|s_countUnit\(2),
	datad => \timer|s_countUnit\(3),
	combout => \display_time|decUnit[5]~11_combout\);

-- Location: LCCOMB_X77_Y3_N4
\display_time|decUnit[5]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|decUnit[5]~12_combout\ = (\display_time|decUnit[3]~5_combout\ & ((\display_time|decUnit[5]~11_combout\) # (!\display_time|decUnit[3]~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display_time|decUnit[5]~11_combout\,
	datac => \display_time|decUnit[3]~5_combout\,
	datad => \display_time|decUnit[3]~7_combout\,
	combout => \display_time|decUnit[5]~12_combout\);

-- Location: LCCOMB_X77_Y3_N6
\display_time|comb~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|comb~10_combout\ = (!\display_time|decUnit[5]~12_combout\ & (((\fsm|Selector6~1_combout\) # (\display_time|decUnit[6]~0_combout\)) # (!\timer|s_countUnit\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|s_countUnit\(3),
	datab => \fsm|Selector6~1_combout\,
	datac => \display_time|decUnit[5]~12_combout\,
	datad => \display_time|decUnit[6]~0_combout\,
	combout => \display_time|comb~10_combout\);

-- Location: LCCOMB_X77_Y3_N8
\display_time|comb~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|comb~11_combout\ = (\display_time|decUnit[5]~12_combout\ & (((\fsm|Selector6~1_combout\) # (\display_time|decUnit[6]~0_combout\)) # (!\timer|s_countUnit\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|s_countUnit\(3),
	datab => \fsm|Selector6~1_combout\,
	datac => \display_time|decUnit[5]~12_combout\,
	datad => \display_time|decUnit[6]~0_combout\,
	combout => \display_time|comb~11_combout\);

-- Location: LCCOMB_X77_Y3_N18
\display_time|decUnit[5]\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|decUnit\(5) = (!\display_time|comb~10_combout\ & ((\display_time|comb~11_combout\) # (\display_time|decUnit\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \display_time|comb~10_combout\,
	datac => \display_time|comb~11_combout\,
	datad => \display_time|decUnit\(5),
	combout => \display_time|decUnit\(5));

-- Location: LCCOMB_X79_Y3_N22
\display_time|decUnit[6]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|decUnit[6]~13_combout\ = (\timer|s_countUnit\(1) & ((\timer|s_countUnit\(3)) # ((\timer|s_countUnit\(2) & \timer|s_countUnit\(0))))) # (!\timer|s_countUnit\(1) & (\timer|s_countUnit\(2) $ ((!\timer|s_countUnit\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100111100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \timer|s_countUnit\(1),
	datab => \timer|s_countUnit\(2),
	datac => \timer|s_countUnit\(3),
	datad => \timer|s_countUnit\(0),
	combout => \display_time|decUnit[6]~13_combout\);

-- Location: LCCOMB_X77_Y2_N28
\display_time|comb~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|comb~12_combout\ = (\fsm|Selector6~1_combout\) # ((!\display_time|decUnit[6]~13_combout\ & ((\display_time|decUnit[6]~0_combout\) # (!\timer|s_countUnit\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm|Selector6~1_combout\,
	datab => \display_time|decUnit[6]~13_combout\,
	datac => \timer|s_countUnit\(3),
	datad => \display_time|decUnit[6]~0_combout\,
	combout => \display_time|comb~12_combout\);

-- Location: LCCOMB_X77_Y2_N26
\display_time|comb~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|comb~13_combout\ = (!\fsm|Selector6~1_combout\ & (\display_time|decUnit[6]~13_combout\ & ((\display_time|decUnit[6]~0_combout\) # (!\timer|s_countUnit\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm|Selector6~1_combout\,
	datab => \display_time|decUnit[6]~13_combout\,
	datac => \timer|s_countUnit\(3),
	datad => \display_time|decUnit[6]~0_combout\,
	combout => \display_time|comb~13_combout\);

-- Location: LCCOMB_X77_Y2_N6
\display_time|decUnit[6]\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|decUnit\(6) = (!\display_time|comb~12_combout\ & ((\display_time|comb~13_combout\) # (\display_time|decUnit\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \display_time|comb~12_combout\,
	datac => \display_time|comb~13_combout\,
	datad => \display_time|decUnit\(6),
	combout => \display_time|decUnit\(6));

-- Location: LCCOMB_X79_Y1_N4
\display_time|decDoz[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|decDoz[0]~0_combout\ = (!\fsm|Selector6~1_combout\ & (!\timer|s_countDoz\(1) & (\timer|s_countDoz\(0) $ (\timer|s_countDoz\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm|Selector6~1_combout\,
	datab => \timer|s_countDoz\(1),
	datac => \timer|s_countDoz\(0),
	datad => \timer|s_countDoz\(2),
	combout => \display_time|decDoz[0]~0_combout\);

-- Location: LCCOMB_X79_Y1_N6
\display_time|decDoz[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|decDoz[1]~1_combout\ = (\fsm|Selector6~1_combout\) # ((\timer|s_countDoz\(2) & (\timer|s_countDoz\(1) $ (\timer|s_countDoz\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm|Selector6~1_combout\,
	datab => \timer|s_countDoz\(1),
	datac => \timer|s_countDoz\(0),
	datad => \timer|s_countDoz\(2),
	combout => \display_time|decDoz[1]~1_combout\);

-- Location: LCCOMB_X79_Y1_N12
\display_time|decDoz[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|decDoz[2]~2_combout\ = (\fsm|Selector6~1_combout\) # ((\timer|s_countDoz\(1) & (!\timer|s_countDoz\(0) & !\timer|s_countDoz\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm|Selector6~1_combout\,
	datab => \timer|s_countDoz\(1),
	datac => \timer|s_countDoz\(0),
	datad => \timer|s_countDoz\(2),
	combout => \display_time|decDoz[2]~2_combout\);

-- Location: LCCOMB_X79_Y1_N22
\display_time|decDoz[3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|decDoz[3]~3_combout\ = (\fsm|Selector6~1_combout\) # ((\timer|s_countDoz\(1) & (\timer|s_countDoz\(0) & \timer|s_countDoz\(2))) # (!\timer|s_countDoz\(1) & (\timer|s_countDoz\(0) $ (\timer|s_countDoz\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101110111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm|Selector6~1_combout\,
	datab => \timer|s_countDoz\(1),
	datac => \timer|s_countDoz\(0),
	datad => \timer|s_countDoz\(2),
	combout => \display_time|decDoz[3]~3_combout\);

-- Location: LCCOMB_X79_Y1_N8
\display_time|decDoz[4]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|decDoz[4]~4_combout\ = (\fsm|Selector6~1_combout\) # ((\timer|s_countDoz\(0)) # ((!\timer|s_countDoz\(1) & \timer|s_countDoz\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm|Selector6~1_combout\,
	datab => \timer|s_countDoz\(1),
	datac => \timer|s_countDoz\(0),
	datad => \timer|s_countDoz\(2),
	combout => \display_time|decDoz[4]~4_combout\);

-- Location: LCCOMB_X79_Y1_N26
\display_time|decDoz[5]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|decDoz[5]~5_combout\ = (\fsm|Selector6~1_combout\) # ((\timer|s_countDoz\(1) & ((\timer|s_countDoz\(0)) # (!\timer|s_countDoz\(2)))) # (!\timer|s_countDoz\(1) & (\timer|s_countDoz\(0) & !\timer|s_countDoz\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm|Selector6~1_combout\,
	datab => \timer|s_countDoz\(1),
	datac => \timer|s_countDoz\(0),
	datad => \timer|s_countDoz\(2),
	combout => \display_time|decDoz[5]~5_combout\);

-- Location: LCCOMB_X79_Y1_N20
\display_time|decDoz[6]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_time|decDoz[6]~6_combout\ = (!\fsm|Selector6~1_combout\ & ((\timer|s_countDoz\(1) & (\timer|s_countDoz\(0) & \timer|s_countDoz\(2))) # (!\timer|s_countDoz\(1) & ((!\timer|s_countDoz\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \fsm|Selector6~1_combout\,
	datab => \timer|s_countDoz\(1),
	datac => \timer|s_countDoz\(0),
	datad => \timer|s_countDoz\(2),
	combout => \display_time|decDoz[6]~6_combout\);

-- Location: LCCOMB_X81_Y2_N18
\display_prog|decOutSel[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_prog|decOutSel[0]~0_combout\ = (\control|outStart~q\ & \control|program\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \control|outStart~q\,
	datab => \control|program\(1),
	combout => \display_prog|decOutSel[0]~0_combout\);

-- Location: LCCOMB_X81_Y2_N8
\display_prog|decOutSel[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_prog|decOutSel[1]~1_combout\ = (\control|outStart~q\ & ((\control|program\(1)) # (\control|program\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \control|program\(1),
	datac => \control|outStart~q\,
	datad => \control|program\(0),
	combout => \display_prog|decOutSel[1]~1_combout\);

-- Location: LCCOMB_X81_Y2_N28
\display_prog|decOutSel[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_prog|decOutSel[2]~2_combout\ = (\control|program\(1) $ (!\control|program\(0))) # (!\control|outStart~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110101110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \control|outStart~q\,
	datab => \control|program\(1),
	datad => \control|program\(0),
	combout => \display_prog|decOutSel[2]~2_combout\);

-- Location: LCCOMB_X81_Y2_N12
\display_prog|decOutSel[4]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \display_prog|decOutSel[4]~3_combout\ = ((!\control|program\(0)) # (!\control|program\(1))) # (!\control|outStart~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \control|outStart~q\,
	datab => \control|program\(1),
	datad => \control|program\(0),
	combout => \display_prog|decOutSel[4]~3_combout\);

ww_LEDG(7) <= \LEDG[7]~output_o\;

ww_LEDR(0) <= \LEDR[0]~output_o\;

ww_LEDR(1) <= \LEDR[1]~output_o\;

ww_LEDR(2) <= \LEDR[2]~output_o\;

ww_LEDR(3) <= \LEDR[3]~output_o\;

ww_LEDR(4) <= \LEDR[4]~output_o\;

ww_LEDR(5) <= \LEDR[5]~output_o\;

ww_LEDR(6) <= \LEDR[6]~output_o\;

ww_LEDR(7) <= \LEDR[7]~output_o\;

ww_LEDR(8) <= \LEDR[8]~output_o\;

ww_LEDR(9) <= \LEDR[9]~output_o\;

ww_LEDR(10) <= \LEDR[10]~output_o\;

ww_LEDR(11) <= \LEDR[11]~output_o\;

ww_LEDR(12) <= \LEDR[12]~output_o\;

ww_LEDR(13) <= \LEDR[13]~output_o\;

ww_LEDR(14) <= \LEDR[14]~output_o\;

ww_LEDR(15) <= \LEDR[15]~output_o\;

ww_LEDR(16) <= \LEDR[16]~output_o\;

ww_LEDR(17) <= \LEDR[17]~output_o\;

ww_HEX4(0) <= \HEX4[0]~output_o\;

ww_HEX4(1) <= \HEX4[1]~output_o\;

ww_HEX4(2) <= \HEX4[2]~output_o\;

ww_HEX4(3) <= \HEX4[3]~output_o\;

ww_HEX4(4) <= \HEX4[4]~output_o\;

ww_HEX4(5) <= \HEX4[5]~output_o\;

ww_HEX4(6) <= \HEX4[6]~output_o\;

ww_HEX5(0) <= \HEX5[0]~output_o\;

ww_HEX5(1) <= \HEX5[1]~output_o\;

ww_HEX5(2) <= \HEX5[2]~output_o\;

ww_HEX5(3) <= \HEX5[3]~output_o\;

ww_HEX5(4) <= \HEX5[4]~output_o\;

ww_HEX5(5) <= \HEX5[5]~output_o\;

ww_HEX5(6) <= \HEX5[6]~output_o\;

ww_HEX6(0) <= \HEX6[0]~output_o\;

ww_HEX6(1) <= \HEX6[1]~output_o\;

ww_HEX6(2) <= \HEX6[2]~output_o\;

ww_HEX6(3) <= \HEX6[3]~output_o\;

ww_HEX6(4) <= \HEX6[4]~output_o\;

ww_HEX6(5) <= \HEX6[5]~output_o\;

ww_HEX6(6) <= \HEX6[6]~output_o\;

ww_HEX7(0) <= \HEX7[0]~output_o\;

ww_HEX7(1) <= \HEX7[1]~output_o\;

ww_HEX7(2) <= \HEX7[2]~output_o\;

ww_HEX7(3) <= \HEX7[3]~output_o\;

ww_HEX7(4) <= \HEX7[4]~output_o\;

ww_HEX7(5) <= \HEX7[5]~output_o\;

ww_HEX7(6) <= \HEX7[6]~output_o\;
END structure;


