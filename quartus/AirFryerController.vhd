library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity AirFryerController is
	port(
		CLOCK_50 : in  std_logic;
		SW			: in  std_logic_vector(9 downto 0);
		KEY		: in  std_logic_vector(3 downto 0);
		LEDG		: out std_logic_vector(3 downto 0);
		LEDR		: out std_logic_vector(2 downto 0);
		HEX0		: out std_logic_vector(6 downto 0);
		HEX1		: out std_logic_vector(6 downto 0);
		HEX2		: out std_logic_vector(6 downto 0);
		HEX4		: out std_logic_vector(6 downto 0);
		HEX5		: out std_logic_vector(6 downto 0);
		HEX6		: out std_logic_vector(6 downto 0)
	);
end AirFryerController;

architecture Shell of AirFryerController is
	
	-- Sinais para mapear os switches e os keys
	signal s_greset 	 : std_logic; -- Reset global
	signal s_on_off 	 : std_logic;
	signal s_run 	 	 : std_logic;
	signal s_open_oven : std_logic;
	signal s_programs  : std_logic_vector(2 downto 0);
	signal s_confirm	 : std_logic;
	signal s_timerUp	 : std_logic;
	signal s_timerDown : std_logic;
	signal s_tempUp	 : std_logic;
	signal s_tempDown  : std_logic;
	
	-- Sinais para mapear as saídas do TimerAuxFSM	
	signal s_timeExp : std_logic;
	signal s_cntOut  : std_logic_vector(7 downto 0);
	
	-- Sinais para mapear as saídas do TempAuxFSM	
	signal s_cooled   : std_logic;
	signal s_tempOut  : std_logic_vector(7 downto 0);
	
	-- Sinais para mapear as saídas do AirFryerFSM
	signal s_idle			: std_logic;
	signal s_enTimer		: std_logic;
	signal s_initTimer   : std_logic; 
	signal s_timeVal		: std_logic_vector(7 downto 0);
	signal s_initTemp    : std_logic;
	signal s_tempVal		: std_logic_vector(7 downto 0);
	signal s_cool		   : std_logic;
	signal s_foodIn	   : std_logic;
	signal s_status	   : std_logic_vector(2 downto 0);
	signal s_regTime     : std_logic;
	signal s_regTemp		: std_logic;
	signal s_regProg		: std_logic;
	signal s_userMode		: std_logic;
	signal s_blink		   : std_logic;
	
	-- Outros sinais
	signal s_programSelected 											 : std_logic_vector(2 downto 0);
	signal s_clk2hz   		 										  	 : std_logic;
	signal s_pulseCnt 		 											 : std_logic;
	signal s_enDisplayTime, s_enDisplayTemp, s_enDisplayProg	 : std_logic; -- Enables dos displays 7 seg
	
	-- Saídas do decoder bin2bcd
	signal s_timerBcd0, s_timerBcd1				: std_logic_vector(3 downto 0);
	signal s_tempBcd0, s_tempBcd1, s_tempBcd2 : std_logic_vector(3 downto 0);
	
	

begin

	-- Sincronizar inputs do switches: 0,1,2,4,5,6,9
	-- O switches SW(3) e SW(8) não serão usados neste projeto.
	sync_sw : entity work.SyncSWReg(Behavioral)
						port map(
							clk 		 => CLOCK_50,
							swIn 		 => SW(9) & SW(6 downto 4) & SW(2 downto 0),
							on_off 	 => s_on_off,
							run	 	 => s_run,
							open_oven => s_open_oven,
							programs  => s_programs,
							greset	 => s_greset
						);
	
	-- O SW(7) será usado como confirmação (CONFIRM) para escolher
	-- o programa e no "user mode" selecionar a temperatura de
	-- cocção.
	
	debouncer_sw7 : entity work.DebounceUnit(Behavioral)
								port map (
									refClk    => CLOCK_50,
									dirtyIn   => SW(7),
									pulsedOut => s_confirm
								);
								
	-- Debounce dos 4 keys
								
	debouncer_key0 : entity work.DebounceUnit(Behavioral)
								generic map(inPolarity => '0')
								port map (
									refClk    => CLOCK_50,
									dirtyIn   => KEY(0),
									pulsedOut => s_timerUp
								);
	
	debouncer_key1 : entity work.DebounceUnit(Behavioral)
								generic map(inPolarity => '0')
								port map (
									refClk    => CLOCK_50,
									dirtyIn   => KEY(1),
									pulsedOut => s_timerDown
								);
								
	debouncer_key2 : entity work.DebounceUnit(Behavioral)
								generic map(inPolarity => '0')
								port map (
									refClk    => CLOCK_50,
									dirtyIn   => KEY(2),
									pulsedOut => s_tempUp
								);
	
	debouncer_key3 : entity work.DebounceUnit(Behavioral)
								generic map(inPolarity => '0')
								port map (
									refClk    => CLOCK_50,
									dirtyIn   => KEY(3),
									pulsedOut => s_tempDown
								);
								
	-- Registo para selecionar programa
	reg_program : entity work.ProgramReg(Behavioral)
							port map(
								clk		  		 => CLOCK_50,
								en			  		 => s_idle,
								programIn 		 => s_programs,
								programSelected => s_programSelected
							);
	
								
	air_fryer_fsm : entity work.AirFryerFSM(Behavioral)
								port map(
									clk 		 => CLOCK_50, --inputs
									reset		 => s_greset,
									on_off	 => s_on_off,
									run		 => s_run,
									confirm	 => s_confirm,
									open_oven => s_open_oven,
									program	 => s_programSelected,
									timeExp	 => s_timeExp,
									cooled    => s_cooled,
									idle		 => s_idle,		-- outputs
									enTimer	 => s_enTimer,
									initTimer => s_initTimer,
									timeVal	 => s_timeVal,
									initTemp  => s_initTemp,
									tempVal	 => s_tempVal,
									cool		 => s_cool,
									foodIn	 => LEDG(0),
									cooked	 => LEDG(1),
									status	 => s_status,
									regTime   => s_regTime,
									regTemp	 => s_regTemp,
									regProg	 => s_regProg,
									userMode	 => s_userMode,
									blink		 => s_blink
								);
								
	-- Enable para os contadores do TimerAuxFSM e TempAuxFSM
	pulse_gen_1sec : entity work.PulseGenerator(Behavioral)
									port map(
										reset => s_greset,
										clk   => not CLOCK_50,
										pulse => s_pulseCnt
									);
		
	-- Divisor de frequência para blink
	freq_divider_blink : entity work.FreqDividerK(Behavioral)
									generic map(K => 25_000_000)
									port map(
										reset  => s_greset,
										clkIn  => CLOCK_50,
										clkOut => s_clk2hz
									);
								
	timer_aux_fsm : entity work.TimerAuxFSM(Behavioral)
								port map(
									clk       => not CLOCK_50,
									reset		 => s_greset,
									enCnt		 => s_pulseCnt,
									init		 => s_initTimer,
									enTimer   => s_enTimer,
									userMode	 => s_userMode,
									upCnt		 => s_timerUp,
									downCnt   => s_timerDown,
									timeVal	 => s_timeVal,
									timeExp   => s_timeExp,
									cntOut	 => s_cntOut	
								);
								
	temp_aux_fsm : entity work.TempAuxFSM(Behavioral)
								port map(
									clk       => not CLOCK_50,
									reset		 => s_greset,
									init  	 => s_initTemp,
									userMode  => s_userMode,
									enCool	 => s_cool,
									enCnt		 => s_pulseCnt,
									tempVal   => s_tempVal,
									upTemp	 => s_tempUp,
									downTemp  => s_tempDown,
									cooled	 => s_cooled,
									tempOut	 => s_tempOut
								);
								
	-- Converter para BDC o tempo
	
	bin_bcd_8_8 : entity work.Bin2BCD8_8(Behavioral)
								port map(
									bin  => s_cntOut,
									bcd0 => s_timerBcd0,
									bcd1 => s_timerBcd1
								);
	
	-- Converter para BCD a temperatura
	bin_bcd_8_12 : entity work.Bin2BCD8_12(Behavioral)
								port map(
									bin  => s_tempOut,
									bcd0 => s_tempBcd0,
									bcd1 => s_tempBcd1,
									bcd2 => s_tempBcd2
								);
								
	s_enDisplayTime <= '0' when (s_regTime = '0') else 
							 '1' when (s_blink = '0') else 
							 s_clk2hz;
							 
	s_enDisplayTemp <= '0' when (s_regTemp = '0') else 
							 '1' when (s_blink = '0') else 
							 s_clk2hz;
							 
	s_enDisplayProg <= '0' when (s_regProg = '0') else 
							 '1';
	
	-- Displays de temperatura
								
	bin_7seg_dec0 : entity work.Bin7SegDecoderEn(Behavioral)
								port map(
									en 		=> s_enDisplayTemp,
									binIn 	=> s_tempBcd0,
									decOut   => HEX0(6 downto 0)
								);
	
	bin_7seg_dec1 : entity work.Bin7SegDecoderEn(Behavioral)
								port map(
									en 		=> s_enDisplayTemp,
									binIn		=> s_tempBcd1,
									decOut   => HEX1(6 downto 0)
								);
	
	bin_7seg_dec2 : entity work.Bin7SegDecoderEn(Behavioral)
								port map(
									en 		=> s_enDisplayTemp,
									binIn		=> s_tempBcd2,
									decOut   => HEX2(6 downto 0)
								);
								
	-- Displays de tempo
								
	bin_7seg_dec4 : entity work.Bin7SegDecoderEn(Behavioral)
								port map(
									en 		=> s_enDisplayTime,
									binIn		=> s_timerBcd0,
									decOut   => HEX4(6 downto 0)
								);
	
	bin_7seg_dec5 : entity work.Bin7SegDecoderEn(Behavioral)
								port map(
									en 		=> s_enDisplayTime,
									binIn		=> s_timerBcd1,
									decOut   => HEX5(6 downto 0)
								);
								
	-- Display de programa selecionado
								
	bin_7seg_dec6 : entity work.Bin7SegDecoderEn(Behavioral)
								port map(
									en 		=> s_enDisplayProg,
									binIn		=> '0' & s_programSelected,
									decOut   => HEX6(6 downto 0)
								);
								
	timer_des_cooled : entity work.TimerNDes(Behavioral)
								generic map(N => 100_000_000)
								port map(
									clk    	=> CLOCK_50,
									enable 	=> '1',
									reset  	=> s_greset,
									start  	=> s_cooled,
									timerOut => LEDG(2)
								);
							
	LEDR <= s_status when (s_blink = '0') else 
			  s_status when (s_clk2hz = '1') else
			  "000";

	LEDG(3) <= s_open_oven;

end Shell;