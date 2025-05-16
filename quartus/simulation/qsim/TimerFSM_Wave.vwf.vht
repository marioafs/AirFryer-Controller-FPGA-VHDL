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
-- Generated on "05/28/2024 15:07:05"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          TempAuxFSM
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY TempAuxFSM_vhd_vec_tst IS
END TempAuxFSM_vhd_vec_tst;
ARCHITECTURE TempAuxFSM_arch OF TempAuxFSM_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL cooled : STD_LOGIC;
SIGNAL downTemp : STD_LOGIC;
SIGNAL enCnt : STD_LOGIC;
SIGNAL enCool : STD_LOGIC;
SIGNAL init : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL tempOut : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL tempVal : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL upTemp : STD_LOGIC;
SIGNAL userMode : STD_LOGIC;
COMPONENT TempAuxFSM
	PORT (
	clk : IN STD_LOGIC;
	cooled : BUFFER STD_LOGIC;
	downTemp : IN STD_LOGIC;
	enCnt : IN STD_LOGIC;
	enCool : IN STD_LOGIC;
	init : IN STD_LOGIC;
	reset : IN STD_LOGIC;
	tempOut : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	tempVal : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	upTemp : IN STD_LOGIC;
	userMode : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : TempAuxFSM
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	cooled => cooled,
	downTemp => downTemp,
	enCnt => enCnt,
	enCool => enCool,
	init => init,
	reset => reset,
	tempOut => tempOut,
	tempVal => tempVal,
	upTemp => upTemp,
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

-- init
t_prcs_init: PROCESS
BEGIN
	init <= '0';
	WAIT FOR 20000 ps;
	init <= '1';
	WAIT FOR 180000 ps;
	init <= '0';
WAIT;
END PROCESS t_prcs_init;

-- userMode
t_prcs_userMode: PROCESS
BEGIN
	userMode <= '1';
WAIT;
END PROCESS t_prcs_userMode;

-- enCnt
t_prcs_enCnt: PROCESS
BEGIN
LOOP
	enCnt <= '0';
	WAIT FOR 20000 ps;
	enCnt <= '1';
	WAIT FOR 20000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_enCnt;
END TempAuxFSM_arch;
