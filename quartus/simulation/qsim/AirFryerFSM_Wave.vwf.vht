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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "05/28/2024 15:08:08"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          AirFryerFSM
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY AirFryerFSM_vhd_vec_tst IS
END AirFryerFSM_vhd_vec_tst;
ARCHITECTURE AirFryerFSM_arch OF AirFryerFSM_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL blink : STD_LOGIC;
SIGNAL clk : STD_LOGIC;
SIGNAL confirm : STD_LOGIC;
SIGNAL cooked : STD_LOGIC;
SIGNAL cool : STD_LOGIC;
SIGNAL cooled : STD_LOGIC;
SIGNAL enTimer : STD_LOGIC;
SIGNAL foodIn : STD_LOGIC;
SIGNAL idle : STD_LOGIC;
SIGNAL initTemp : STD_LOGIC;
SIGNAL initTimer : STD_LOGIC;
SIGNAL on_off : STD_LOGIC;
SIGNAL open_oven : STD_LOGIC;
SIGNAL program : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL regProg : STD_LOGIC;
SIGNAL regTemp : STD_LOGIC;
SIGNAL regTime : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL run : STD_LOGIC;
SIGNAL status : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL tempVal : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL timeExp : STD_LOGIC;
SIGNAL timeVal : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL userMode : STD_LOGIC;
COMPONENT AirFryerFSM
	PORT (
	blink : BUFFER STD_LOGIC;
	clk : IN STD_LOGIC;
	confirm : IN STD_LOGIC;
	cooked : BUFFER STD_LOGIC;
	cool : BUFFER STD_LOGIC;
	cooled : IN STD_LOGIC;
	enTimer : BUFFER STD_LOGIC;
	foodIn : BUFFER STD_LOGIC;
	idle : BUFFER STD_LOGIC;
	initTemp : BUFFER STD_LOGIC;
	initTimer : BUFFER STD_LOGIC;
	on_off : IN STD_LOGIC;
	open_oven : IN STD_LOGIC;
	program : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	regProg : BUFFER STD_LOGIC;
	regTemp : BUFFER STD_LOGIC;
	regTime : BUFFER STD_LOGIC;
	reset : IN STD_LOGIC;
	run : IN STD_LOGIC;
	status : BUFFER STD_LOGIC_VECTOR(2 DOWNTO 0);
	tempVal : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	timeExp : IN STD_LOGIC;
	timeVal : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	userMode : BUFFER STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : AirFryerFSM
	PORT MAP (
-- list connections between master ports and signals
	blink => blink,
	clk => clk,
	confirm => confirm,
	cooked => cooked,
	cool => cool,
	cooled => cooled,
	enTimer => enTimer,
	foodIn => foodIn,
	idle => idle,
	initTemp => initTemp,
	initTimer => initTimer,
	on_off => on_off,
	open_oven => open_oven,
	program => program,
	regProg => regProg,
	regTemp => regTemp,
	regTime => regTime,
	reset => reset,
	run => run,
	status => status,
	tempVal => tempVal,
	timeExp => timeExp,
	timeVal => timeVal,
	userMode => userMode
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '1';
	WAIT FOR 20000 ps;
	reset <= '0';
WAIT;
END PROCESS t_prcs_reset;

-- on_off
t_prcs_on_off: PROCESS
BEGIN
	on_off <= '0';
	WAIT FOR 20000 ps;
	on_off <= '1';
	WAIT FOR 420000 ps;
	on_off <= '0';
	WAIT FOR 30000 ps;
	on_off <= '1';
	WAIT FOR 520000 ps;
	on_off <= '0';
WAIT;
END PROCESS t_prcs_on_off;

-- run
t_prcs_run: PROCESS
BEGIN
	run <= '0';
	WAIT FOR 20000 ps;
	run <= '1';
	WAIT FOR 520000 ps;
	run <= '0';
	WAIT FOR 40000 ps;
	run <= '1';
	WAIT FOR 410000 ps;
	run <= '0';
WAIT;
END PROCESS t_prcs_run;

-- open_oven
t_prcs_open_oven: PROCESS
BEGIN
	open_oven <= '0';
	WAIT FOR 140000 ps;
	open_oven <= '1';
	WAIT FOR 40000 ps;
	open_oven <= '0';
	WAIT FOR 100000 ps;
	open_oven <= '1';
	WAIT FOR 80000 ps;
	open_oven <= '0';
	WAIT FOR 260000 ps;
	open_oven <= '1';
	WAIT FOR 60000 ps;
	open_oven <= '0';
	WAIT FOR 160000 ps;
	open_oven <= '1';
	WAIT FOR 150000 ps;
	open_oven <= '0';
WAIT;
END PROCESS t_prcs_open_oven;
-- program[2]
t_prcs_program_2: PROCESS
BEGIN
	program(2) <= '0';
WAIT;
END PROCESS t_prcs_program_2;
-- program[1]
t_prcs_program_1: PROCESS
BEGIN
	program(1) <= '0';
	WAIT FOR 470000 ps;
	program(1) <= '1';
WAIT;
END PROCESS t_prcs_program_1;
-- program[0]
t_prcs_program_0: PROCESS
BEGIN
	program(0) <= '1';
	WAIT FOR 470000 ps;
	program(0) <= '0';
WAIT;
END PROCESS t_prcs_program_0;

-- confirm
t_prcs_confirm: PROCESS
BEGIN
	confirm <= '0';
	WAIT FOR 40000 ps;
	confirm <= '1';
	WAIT FOR 20000 ps;
	confirm <= '0';
	WAIT FOR 160000 ps;
	confirm <= '1';
	WAIT FOR 20000 ps;
	confirm <= '0';
	WAIT FOR 260000 ps;
	confirm <= '1';
	WAIT FOR 30000 ps;
	confirm <= '0';
	WAIT FOR 210000 ps;
	confirm <= '1';
	WAIT FOR 30000 ps;
	confirm <= '0';
WAIT;
END PROCESS t_prcs_confirm;

-- timeExp
t_prcs_timeExp: PROCESS
BEGIN
	timeExp <= '0';
	WAIT FOR 120000 ps;
	timeExp <= '1';
	WAIT FOR 60000 ps;
	timeExp <= '0';
	WAIT FOR 80000 ps;
	timeExp <= '1';
	WAIT FOR 40000 ps;
	timeExp <= '0';
	WAIT FOR 40000 ps;
	timeExp <= '1';
	WAIT FOR 30000 ps;
	timeExp <= '0';
	WAIT FOR 250000 ps;
	timeExp <= '1';
	WAIT FOR 20000 ps;
	timeExp <= '0';
	WAIT FOR 180000 ps;
	timeExp <= '1';
	WAIT FOR 60000 ps;
	timeExp <= '0';
WAIT;
END PROCESS t_prcs_timeExp;

-- cooled
t_prcs_cooled: PROCESS
BEGIN
	cooled <= '0';
	WAIT FOR 400000 ps;
	cooled <= '1';
	WAIT FOR 20000 ps;
	cooled <= '0';
	WAIT FOR 500000 ps;
	cooled <= '1';
	WAIT FOR 50000 ps;
	cooled <= '0';
WAIT;
END PROCESS t_prcs_cooled;
END AirFryerFSM_arch;
