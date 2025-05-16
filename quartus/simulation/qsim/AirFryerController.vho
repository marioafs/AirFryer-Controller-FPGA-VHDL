-- Copyright (C) 2023  Intel Corporation. All rights reserved.
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
-- VERSION "Version 22.1std.2 Build 922 07/20/2023 SC Lite Edition"

-- DATE "05/28/2024 15:22:28"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	TempAuxFSM IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	init : IN std_logic;
	userMode : IN std_logic;
	enCool : IN std_logic;
	enCnt : IN std_logic;
	tempVal : IN std_logic_vector(7 DOWNTO 0);
	upTemp : IN std_logic;
	downTemp : IN std_logic;
	cooled : BUFFER std_logic;
	tempOut : BUFFER std_logic_vector(7 DOWNTO 0)
	);
END TempAuxFSM;

ARCHITECTURE structure OF TempAuxFSM IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_init : std_logic;
SIGNAL ww_userMode : std_logic;
SIGNAL ww_enCool : std_logic;
SIGNAL ww_enCnt : std_logic;
SIGNAL ww_tempVal : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_upTemp : std_logic;
SIGNAL ww_downTemp : std_logic;
SIGNAL ww_cooled : std_logic;
SIGNAL ww_tempOut : std_logic_vector(7 DOWNTO 0);
SIGNAL \cooled~output_o\ : std_logic;
SIGNAL \tempOut[0]~output_o\ : std_logic;
SIGNAL \tempOut[1]~output_o\ : std_logic;
SIGNAL \tempOut[2]~output_o\ : std_logic;
SIGNAL \tempOut[3]~output_o\ : std_logic;
SIGNAL \tempOut[4]~output_o\ : std_logic;
SIGNAL \tempOut[5]~output_o\ : std_logic;
SIGNAL \tempOut[6]~output_o\ : std_logic;
SIGNAL \tempOut[7]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \init~input_o\ : std_logic;
SIGNAL \s_temp~5_combout\ : std_logic;
SIGNAL \enCool~input_o\ : std_logic;
SIGNAL \enCnt~input_o\ : std_logic;
SIGNAL \s_cooled~0_combout\ : std_logic;
SIGNAL \tempVal[0]~input_o\ : std_logic;
SIGNAL \userMode~input_o\ : std_logic;
SIGNAL \s_temp~6_combout\ : std_logic;
SIGNAL \s_temp~7_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \downTemp~input_o\ : std_logic;
SIGNAL \upTemp~input_o\ : std_logic;
SIGNAL \Add1~1\ : std_logic;
SIGNAL \Add1~2_combout\ : std_logic;
SIGNAL \s_setTempUser[2]~6_combout\ : std_logic;
SIGNAL \Add1~3\ : std_logic;
SIGNAL \Add1~4_combout\ : std_logic;
SIGNAL \Add1~5\ : std_logic;
SIGNAL \Add1~6_combout\ : std_logic;
SIGNAL \Add1~7\ : std_logic;
SIGNAL \Add1~8_combout\ : std_logic;
SIGNAL \s_setTempUser[5]~7_combout\ : std_logic;
SIGNAL \Add1~9\ : std_logic;
SIGNAL \Add1~10_combout\ : std_logic;
SIGNAL \s_setTempUser[6]~8_combout\ : std_logic;
SIGNAL \s_setTempUser[1]~2_combout\ : std_logic;
SIGNAL \Add1~11\ : std_logic;
SIGNAL \Add1~12_combout\ : std_logic;
SIGNAL \s_setTempUser[1]~3_combout\ : std_logic;
SIGNAL \s_setTempUser[1]~0_combout\ : std_logic;
SIGNAL \s_setTempUser[1]~1_combout\ : std_logic;
SIGNAL \s_setTempUser[1]~4_combout\ : std_logic;
SIGNAL \s_setTempUser[1]~5_combout\ : std_logic;
SIGNAL \s_temp[1]~0_combout\ : std_logic;
SIGNAL \tempVal[1]~input_o\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \Add0~5_combout\ : std_logic;
SIGNAL \tempVal[2]~input_o\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~7_combout\ : std_logic;
SIGNAL \s_temp[3]~1_combout\ : std_logic;
SIGNAL \tempVal[3]~input_o\ : std_logic;
SIGNAL \Add0~8\ : std_logic;
SIGNAL \Add0~9_combout\ : std_logic;
SIGNAL \Add0~11_combout\ : std_logic;
SIGNAL \tempVal[4]~input_o\ : std_logic;
SIGNAL \Add0~12_combout\ : std_logic;
SIGNAL \Add0~10\ : std_logic;
SIGNAL \Add0~13_combout\ : std_logic;
SIGNAL \s_temp[5]~2_combout\ : std_logic;
SIGNAL \tempVal[5]~input_o\ : std_logic;
SIGNAL \Add0~14\ : std_logic;
SIGNAL \Add0~15_combout\ : std_logic;
SIGNAL \s_temp[6]~3_combout\ : std_logic;
SIGNAL \tempVal[6]~input_o\ : std_logic;
SIGNAL \Add0~16\ : std_logic;
SIGNAL \Add0~17_combout\ : std_logic;
SIGNAL \s_temp[7]~4_combout\ : std_logic;
SIGNAL \tempVal[7]~input_o\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \s_temp[1]~8_combout\ : std_logic;
SIGNAL \s_temp[1]~9_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \s_cooled~1_combout\ : std_logic;
SIGNAL \s_cooled~q\ : std_logic;
SIGNAL s_temp : std_logic_vector(7 DOWNTO 0);
SIGNAL s_setTempUser : std_logic_vector(7 DOWNTO 0);
SIGNAL ALT_INV_s_temp : std_logic_vector(4 DOWNTO 2);

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_init <= init;
ww_userMode <= userMode;
ww_enCool <= enCool;
ww_enCnt <= enCnt;
ww_tempVal <= tempVal;
ww_upTemp <= upTemp;
ww_downTemp <= downTemp;
cooled <= ww_cooled;
tempOut <= ww_tempOut;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
ALT_INV_s_temp(4) <= NOT s_temp(4);
ALT_INV_s_temp(2) <= NOT s_temp(2);

\cooled~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \s_cooled~q\,
	devoe => ww_devoe,
	o => \cooled~output_o\);

\tempOut[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => s_temp(0),
	devoe => ww_devoe,
	o => \tempOut[0]~output_o\);

\tempOut[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => s_temp(1),
	devoe => ww_devoe,
	o => \tempOut[1]~output_o\);

\tempOut[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_s_temp(2),
	devoe => ww_devoe,
	o => \tempOut[2]~output_o\);

\tempOut[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => s_temp(3),
	devoe => ww_devoe,
	o => \tempOut[3]~output_o\);

\tempOut[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_s_temp(4),
	devoe => ww_devoe,
	o => \tempOut[4]~output_o\);

\tempOut[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => s_temp(5),
	devoe => ww_devoe,
	o => \tempOut[5]~output_o\);

\tempOut[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => s_temp(6),
	devoe => ww_devoe,
	o => \tempOut[6]~output_o\);

\tempOut[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => s_temp(7),
	devoe => ww_devoe,
	o => \tempOut[7]~output_o\);

\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

\init~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_init,
	o => \init~input_o\);

\s_temp~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_temp~5_combout\ = (!\reset~input_o\ & !\init~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~input_o\,
	datad => \init~input_o\,
	combout => \s_temp~5_combout\);

\enCool~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_enCool,
	o => \enCool~input_o\);

\enCnt~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_enCnt,
	o => \enCnt~input_o\);

\s_cooled~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_cooled~0_combout\ = (\s_cooled~q\ & ((!\enCnt~input_o\) # (!\enCool~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_cooled~q\,
	datac => \enCool~input_o\,
	datad => \enCnt~input_o\,
	combout => \s_cooled~0_combout\);

\tempVal[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_tempVal(0),
	o => \tempVal[0]~input_o\);

\userMode~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_userMode,
	o => \userMode~input_o\);

\s_temp~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_temp~6_combout\ = (\reset~input_o\) # ((\init~input_o\ & !\userMode~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \init~input_o\,
	datad => \userMode~input_o\,
	combout => \s_temp~6_combout\);

\s_temp~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_temp~7_combout\ = (s_temp(0) & ((\s_temp~5_combout\) # ((\tempVal[0]~input_o\ & \s_temp~6_combout\)))) # (!s_temp(0) & (\tempVal[0]~input_o\ & (\s_temp~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_temp(0),
	datab => \tempVal[0]~input_o\,
	datac => \s_temp~6_combout\,
	datad => \s_temp~5_combout\,
	combout => \s_temp~7_combout\);

\s_temp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_temp~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_temp(0));

\Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = s_temp(1) $ (VCC)
-- \Add0~1\ = CARRY(s_temp(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_temp(1),
	datad => VCC,
	combout => \Add0~0_combout\,
	cout => \Add0~1\);

\Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = s_setTempUser(1) $ (VCC)
-- \Add1~1\ = CARRY(s_setTempUser(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_setTempUser(1),
	datad => VCC,
	combout => \Add1~0_combout\,
	cout => \Add1~1\);

\downTemp~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_downTemp,
	o => \downTemp~input_o\);

\upTemp~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_upTemp,
	o => \upTemp~input_o\);

\Add1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~2_combout\ = (\upTemp~input_o\ & ((s_setTempUser(2) & ((\Add1~1\) # (GND))) # (!s_setTempUser(2) & (!\Add1~1\)))) # (!\upTemp~input_o\ & ((s_setTempUser(2) & (!\Add1~1\)) # (!s_setTempUser(2) & (\Add1~1\ & VCC))))
-- \Add1~3\ = CARRY((\upTemp~input_o\ & ((s_setTempUser(2)) # (!\Add1~1\))) # (!\upTemp~input_o\ & (s_setTempUser(2) & !\Add1~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \upTemp~input_o\,
	datab => s_setTempUser(2),
	datad => VCC,
	cin => \Add1~1\,
	combout => \Add1~2_combout\,
	cout => \Add1~3\);

\s_setTempUser[2]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_setTempUser[2]~6_combout\ = !\Add1~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~2_combout\,
	combout => \s_setTempUser[2]~6_combout\);

\s_setTempUser[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_setTempUser[2]~6_combout\,
	ena => \s_setTempUser[1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_setTempUser(2));

\Add1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~4_combout\ = ((\upTemp~input_o\ $ (s_setTempUser(3) $ (!\Add1~3\)))) # (GND)
-- \Add1~5\ = CARRY((\upTemp~input_o\ & ((s_setTempUser(3)) # (!\Add1~3\))) # (!\upTemp~input_o\ & (s_setTempUser(3) & !\Add1~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \upTemp~input_o\,
	datab => s_setTempUser(3),
	datad => VCC,
	cin => \Add1~3\,
	combout => \Add1~4_combout\,
	cout => \Add1~5\);

\s_setTempUser[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add1~4_combout\,
	ena => \s_setTempUser[1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_setTempUser(3));

\Add1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~6_combout\ = (\upTemp~input_o\ & ((s_setTempUser(4) & (!\Add1~5\)) # (!s_setTempUser(4) & ((\Add1~5\) # (GND))))) # (!\upTemp~input_o\ & ((s_setTempUser(4) & (\Add1~5\ & VCC)) # (!s_setTempUser(4) & (!\Add1~5\))))
-- \Add1~7\ = CARRY((\upTemp~input_o\ & ((!\Add1~5\) # (!s_setTempUser(4)))) # (!\upTemp~input_o\ & (!s_setTempUser(4) & !\Add1~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \upTemp~input_o\,
	datab => s_setTempUser(4),
	datad => VCC,
	cin => \Add1~5\,
	combout => \Add1~6_combout\,
	cout => \Add1~7\);

\s_setTempUser[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add1~6_combout\,
	ena => \s_setTempUser[1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_setTempUser(4));

\Add1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~8_combout\ = ((\upTemp~input_o\ $ (s_setTempUser(5) $ (!\Add1~7\)))) # (GND)
-- \Add1~9\ = CARRY((\upTemp~input_o\ & (!s_setTempUser(5) & !\Add1~7\)) # (!\upTemp~input_o\ & ((!\Add1~7\) # (!s_setTempUser(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \upTemp~input_o\,
	datab => s_setTempUser(5),
	datad => VCC,
	cin => \Add1~7\,
	combout => \Add1~8_combout\,
	cout => \Add1~9\);

\s_setTempUser[5]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_setTempUser[5]~7_combout\ = !\Add1~8_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~8_combout\,
	combout => \s_setTempUser[5]~7_combout\);

\s_setTempUser[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_setTempUser[5]~7_combout\,
	ena => \s_setTempUser[1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_setTempUser(5));

\Add1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~10_combout\ = (\upTemp~input_o\ & ((s_setTempUser(6) & ((\Add1~9\) # (GND))) # (!s_setTempUser(6) & (!\Add1~9\)))) # (!\upTemp~input_o\ & ((s_setTempUser(6) & (!\Add1~9\)) # (!s_setTempUser(6) & (\Add1~9\ & VCC))))
-- \Add1~11\ = CARRY((\upTemp~input_o\ & ((s_setTempUser(6)) # (!\Add1~9\))) # (!\upTemp~input_o\ & (s_setTempUser(6) & !\Add1~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \upTemp~input_o\,
	datab => s_setTempUser(6),
	datad => VCC,
	cin => \Add1~9\,
	combout => \Add1~10_combout\,
	cout => \Add1~11\);

\s_setTempUser[6]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_setTempUser[6]~8_combout\ = !\Add1~10_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~10_combout\,
	combout => \s_setTempUser[6]~8_combout\);

\s_setTempUser[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_setTempUser[6]~8_combout\,
	ena => \s_setTempUser[1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_setTempUser(6));

\s_setTempUser[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_setTempUser[1]~2_combout\ = (s_setTempUser(5) & ((s_setTempUser(2)) # ((!s_setTempUser(4)) # (!s_setTempUser(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_setTempUser(5),
	datab => s_setTempUser(2),
	datac => s_setTempUser(3),
	datad => s_setTempUser(4),
	combout => \s_setTempUser[1]~2_combout\);

\Add1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~12_combout\ = \upTemp~input_o\ $ (s_setTempUser(7) $ (\Add1~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \upTemp~input_o\,
	datab => s_setTempUser(7),
	cin => \Add1~11\,
	combout => \Add1~12_combout\);

\s_setTempUser[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add1~12_combout\,
	ena => \s_setTempUser[1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_setTempUser(7));

\s_setTempUser[1]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_setTempUser[1]~3_combout\ = (s_setTempUser(6)) # ((\s_setTempUser[1]~2_combout\) # (!s_setTempUser(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_setTempUser(6),
	datab => \s_setTempUser[1]~2_combout\,
	datad => s_setTempUser(7),
	combout => \s_setTempUser[1]~3_combout\);

\s_setTempUser[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_setTempUser[1]~0_combout\ = (s_setTempUser(4) & ((s_setTempUser(1)) # ((s_setTempUser(3)) # (!s_setTempUser(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_setTempUser(4),
	datab => s_setTempUser(1),
	datac => s_setTempUser(3),
	datad => s_setTempUser(2),
	combout => \s_setTempUser[1]~0_combout\);

\s_setTempUser[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_setTempUser[1]~1_combout\ = (s_setTempUser(7)) # ((!s_setTempUser(6) & ((\s_setTempUser[1]~0_combout\) # (!s_setTempUser(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_setTempUser(7),
	datab => \s_setTempUser[1]~0_combout\,
	datac => s_setTempUser(5),
	datad => s_setTempUser(6),
	combout => \s_setTempUser[1]~1_combout\);

\s_setTempUser[1]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_setTempUser[1]~4_combout\ = (\upTemp~input_o\ & (((\s_setTempUser[1]~3_combout\)))) # (!\upTemp~input_o\ & (\downTemp~input_o\ & ((\s_setTempUser[1]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \downTemp~input_o\,
	datab => \upTemp~input_o\,
	datac => \s_setTempUser[1]~3_combout\,
	datad => \s_setTempUser[1]~1_combout\,
	combout => \s_setTempUser[1]~4_combout\);

\s_setTempUser[1]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_setTempUser[1]~5_combout\ = (\s_setTempUser[1]~4_combout\ & (\userMode~input_o\ & \init~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \s_setTempUser[1]~4_combout\,
	datac => \userMode~input_o\,
	datad => \init~input_o\,
	combout => \s_setTempUser[1]~5_combout\);

\s_setTempUser[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add1~0_combout\,
	ena => \s_setTempUser[1]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_setTempUser(1));

\s_temp[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_temp[1]~0_combout\ = (\init~input_o\ & ((s_setTempUser(1)))) # (!\init~input_o\ & (\Add0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~0_combout\,
	datab => s_setTempUser(1),
	datad => \init~input_o\,
	combout => \s_temp[1]~0_combout\);

\tempVal[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_tempVal(1),
	o => \tempVal[1]~input_o\);

\Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (s_temp(2) & (!\Add0~1\)) # (!s_temp(2) & (\Add0~1\ & VCC))
-- \Add0~3\ = CARRY((s_temp(2) & !\Add0~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_temp(2),
	datad => VCC,
	cin => \Add0~1\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

\Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = (\init~input_o\ & (\userMode~input_o\ & !\reset~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \init~input_o\,
	datab => \userMode~input_o\,
	datad => \reset~input_o\,
	combout => \Add0~4_combout\);

\Add0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~5_combout\ = (\s_temp~5_combout\ & ((\Add0~2_combout\) # ((\Add0~4_combout\ & !s_setTempUser(2))))) # (!\s_temp~5_combout\ & (((\Add0~4_combout\ & !s_setTempUser(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_temp~5_combout\,
	datab => \Add0~2_combout\,
	datac => \Add0~4_combout\,
	datad => s_setTempUser(2),
	combout => \Add0~5_combout\);

\tempVal[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_tempVal(2),
	o => \tempVal[2]~input_o\);

\Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (!\Add0~5_combout\ & ((!\tempVal[2]~input_o\) # (!\s_temp~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~5_combout\,
	datab => \s_temp~6_combout\,
	datac => \tempVal[2]~input_o\,
	combout => \Add0~6_combout\);

\s_temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add0~6_combout\,
	ena => \s_temp[1]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_temp(2));

\Add0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~7_combout\ = (s_temp(3) & (\Add0~3\ $ (GND))) # (!s_temp(3) & (!\Add0~3\ & VCC))
-- \Add0~8\ = CARRY((s_temp(3) & !\Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_temp(3),
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~7_combout\,
	cout => \Add0~8\);

\s_temp[3]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_temp[3]~1_combout\ = (\init~input_o\ & ((s_setTempUser(3)))) # (!\init~input_o\ & (\Add0~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~7_combout\,
	datab => s_setTempUser(3),
	datad => \init~input_o\,
	combout => \s_temp[3]~1_combout\);

\tempVal[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_tempVal(3),
	o => \tempVal[3]~input_o\);

\s_temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_temp[3]~1_combout\,
	asdata => \tempVal[3]~input_o\,
	sload => \s_temp~6_combout\,
	ena => \s_temp[1]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_temp(3));

\Add0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~9_combout\ = (s_temp(4) & (!\Add0~8\)) # (!s_temp(4) & (\Add0~8\ & VCC))
-- \Add0~10\ = CARRY((s_temp(4) & !\Add0~8\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_temp(4),
	datad => VCC,
	cin => \Add0~8\,
	combout => \Add0~9_combout\,
	cout => \Add0~10\);

\Add0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~11_combout\ = (\s_temp~5_combout\ & ((\Add0~9_combout\) # ((\Add0~4_combout\ & s_setTempUser(4))))) # (!\s_temp~5_combout\ & (\Add0~4_combout\ & (s_setTempUser(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_temp~5_combout\,
	datab => \Add0~4_combout\,
	datac => s_setTempUser(4),
	datad => \Add0~9_combout\,
	combout => \Add0~11_combout\);

\tempVal[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_tempVal(4),
	o => \tempVal[4]~input_o\);

\Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~12_combout\ = (!\Add0~11_combout\ & ((!\tempVal[4]~input_o\) # (!\s_temp~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~11_combout\,
	datab => \s_temp~6_combout\,
	datac => \tempVal[4]~input_o\,
	combout => \Add0~12_combout\);

\s_temp[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add0~12_combout\,
	ena => \s_temp[1]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_temp(4));

\Add0~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~13_combout\ = (s_temp(5) & ((GND) # (!\Add0~10\))) # (!s_temp(5) & (\Add0~10\ $ (GND)))
-- \Add0~14\ = CARRY((s_temp(5)) # (!\Add0~10\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_temp(5),
	datad => VCC,
	cin => \Add0~10\,
	combout => \Add0~13_combout\,
	cout => \Add0~14\);

\s_temp[5]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_temp[5]~2_combout\ = (\init~input_o\ & ((!s_setTempUser(5)))) # (!\init~input_o\ & (\Add0~13_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~13_combout\,
	datab => s_setTempUser(5),
	datad => \init~input_o\,
	combout => \s_temp[5]~2_combout\);

\tempVal[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_tempVal(5),
	o => \tempVal[5]~input_o\);

\s_temp[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_temp[5]~2_combout\,
	asdata => \tempVal[5]~input_o\,
	sload => \s_temp~6_combout\,
	ena => \s_temp[1]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_temp(5));

\Add0~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~15_combout\ = (s_temp(6) & (\Add0~14\ & VCC)) # (!s_temp(6) & (!\Add0~14\))
-- \Add0~16\ = CARRY((!s_temp(6) & !\Add0~14\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_temp(6),
	datad => VCC,
	cin => \Add0~14\,
	combout => \Add0~15_combout\,
	cout => \Add0~16\);

\s_temp[6]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_temp[6]~3_combout\ = (\init~input_o\ & ((!s_setTempUser(6)))) # (!\init~input_o\ & (\Add0~15_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~15_combout\,
	datab => s_setTempUser(6),
	datad => \init~input_o\,
	combout => \s_temp[6]~3_combout\);

\tempVal[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_tempVal(6),
	o => \tempVal[6]~input_o\);

\s_temp[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_temp[6]~3_combout\,
	asdata => \tempVal[6]~input_o\,
	sload => \s_temp~6_combout\,
	ena => \s_temp[1]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_temp(6));

\Add0~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~17_combout\ = s_temp(7) $ (\Add0~16\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_temp(7),
	cin => \Add0~16\,
	combout => \Add0~17_combout\);

\s_temp[7]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_temp[7]~4_combout\ = (\init~input_o\ & ((s_setTempUser(7)))) # (!\init~input_o\ & (\Add0~17_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~17_combout\,
	datab => s_setTempUser(7),
	datad => \init~input_o\,
	combout => \s_temp[7]~4_combout\);

\tempVal[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_tempVal(7),
	o => \tempVal[7]~input_o\);

\s_temp[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_temp[7]~4_combout\,
	asdata => \tempVal[7]~input_o\,
	sload => \s_temp~6_combout\,
	ena => \s_temp[1]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_temp(7));

\Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (!s_temp(3) & (!s_temp(5) & (!s_temp(6) & !s_temp(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_temp(3),
	datab => s_temp(5),
	datac => s_temp(6),
	datad => s_temp(7),
	combout => \Equal0~1_combout\);

\s_temp[1]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_temp[1]~8_combout\ = (\enCool~input_o\ & \enCnt~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \enCool~input_o\,
	datab => \enCnt~input_o\,
	combout => \s_temp[1]~8_combout\);

\s_temp[1]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_temp[1]~9_combout\ = ((\s_temp[1]~8_combout\ & ((!\Equal0~1_combout\) # (!\Equal0~0_combout\)))) # (!\s_temp~5_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_temp~5_combout\,
	datab => \Equal0~0_combout\,
	datac => \Equal0~1_combout\,
	datad => \s_temp[1]~8_combout\,
	combout => \s_temp[1]~9_combout\);

\s_temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_temp[1]~0_combout\,
	asdata => \tempVal[1]~input_o\,
	sload => \s_temp~6_combout\,
	ena => \s_temp[1]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_temp(1));

\Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (!s_temp(0) & (!s_temp(1) & (!s_temp(2) & !s_temp(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_temp(0),
	datab => s_temp(1),
	datac => s_temp(2),
	datad => s_temp(4),
	combout => \Equal0~0_combout\);

\s_cooled~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_cooled~1_combout\ = (\s_temp~5_combout\ & ((\s_cooled~0_combout\) # ((\Equal0~0_combout\ & \Equal0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_temp~5_combout\,
	datab => \s_cooled~0_combout\,
	datac => \Equal0~0_combout\,
	datad => \Equal0~1_combout\,
	combout => \s_cooled~1_combout\);

s_cooled : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_cooled~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s_cooled~q\);

ww_cooled <= \cooled~output_o\;

ww_tempOut(0) <= \tempOut[0]~output_o\;

ww_tempOut(1) <= \tempOut[1]~output_o\;

ww_tempOut(2) <= \tempOut[2]~output_o\;

ww_tempOut(3) <= \tempOut[3]~output_o\;

ww_tempOut(4) <= \tempOut[4]~output_o\;

ww_tempOut(5) <= \tempOut[5]~output_o\;

ww_tempOut(6) <= \tempOut[6]~output_o\;

ww_tempOut(7) <= \tempOut[7]~output_o\;
END structure;


