library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity AirFryerFSM is
	port(
		clk	 	 : in  std_logic;
		reset		 : in  std_logic;
		on_off 	 : in  std_logic;
		run	 	 : in  std_logic;
		confirm	 : in  std_logic;
		open_oven : in  std_logic;
		program	 : in  std_logic_vector(2 downto 0);
		timeExp	 : in  std_logic;
		cooled    : in  std_logic;
		idle		 : out std_logic;
		enTimer	 : out std_logic;
		initTimer : out std_logic; 
		timeVal	 : out std_logic_vector(7 downto 0);
		initTemp  : out std_logic;
		tempVal	 : out std_logic_vector(7 downto 0);
		cool		 : out std_logic;
		foodIn	 : out std_logic;
		cooked	 : out std_logic;
		status	 : out std_logic_vector(2 downto 0);
		regTime   : out std_logic;
		regTemp	 : out std_logic;
		regProg   : out std_logic;
		userMode	 : out std_logic;
		blink		 : out std_logic		
	);
end AirFryerFSM;

architecture Behavioral of AirFryerFSM is
	type TState is (TOff, TIdle, TPreheat, TStopped, Topened, TUserCookTime, TCook, TCool);
	
	constant DEFAULT_TEMP 			  : std_logic_vector(7 downto 0) := x"C8"; -- 200 ºC
	constant DEFAULT_TIME_PREHEAT   : std_logic_vector(7 downto 0) := x"03"; -- 3 min.
	constant DEFAULT_TIME_COOK 	  : std_logic_vector(7 downto 0) := x"12"; -- 18 min.
	constant RISSOIS_TEMP 			  : std_logic_vector(7 downto 0) := x"B4"; -- 180 ºC
	constant RISSOIS_TIME_PREHEAT   : std_logic_vector(7 downto 0) := x"03"; -- 3 min.
	constant RISSOIS_TIME_COOK      : std_logic_vector(7 downto 0) := x"0F"; -- 15 min.
	constant BATATAS_TEMP 			  : std_logic_vector(7 downto 0) := x"C8"; -- 200 ºC.
	constant BATATAS_TIME_PREHEAT   : std_logic_vector(7 downto 0) := x"05"; -- 5 min.
	constant BATATAS_TIME_COOK 	  : std_logic_vector(7 downto 0) := x"14"; -- 20 min.
	constant FILPEIXE_TEMP			  : std_logic_vector(7 downto 0) := x"AA"; -- 170 ºC.
	constant FILPEIXE_TIME_PREHEAT  : std_logic_vector(7 downto 0) := x"03"; -- 3 min.
	constant FILPEIXE_TIME_COOK 	  : std_logic_vector(7 downto 0) := x"14"; -- 20 min.
	constant HAMBURGER_TEMP			  : std_logic_vector(7 downto 0) := x"AA"; -- 170 ºC.
	constant HAMBURGER_TIME_PREHEAT : std_logic_vector(7 downto 0) := x"05"; -- 5 min.
	constant HAMBURGER_TIME_COOK 	  : std_logic_vector(7 downto 0) := x"14"; -- 20 min.
	constant BOLO_CENOURA_TEMP		  : std_logic_vector(7 downto 0) := x"A0"; -- 160 ºC
	constant BOLO_CENOURA_PREHEAT	  : std_logic_vector(7 downto 0) := x"04"; -- 4 min.
	constant BOLO_CENOURA_COOK		  : std_logic_vector(7 downto 0) := x"12"; -- 18 min.
	
	signal s_currentState, s_nextState, s_previousState : TState := Toff;
begin
	
	sync_proc : process(clk)
	begin
		if (rising_edge(clk)) then
			if (reset = '1') then
				s_currentState  <= TOff;
			else
				if (s_currentState /= s_nextState) then
					s_previousState <= s_currentState;
				end if;				
				s_currentState	 <= s_nextState;
			end if;
		end if;
	end process;
	
	comb_proc : process(s_currentState, s_previousState, 
							  on_off, run, open_oven, program, confirm,
							  timeExp, cooled)
	begin
		idle 		 <= '0';
		initTimer <= '0';
		initTemp  <= '0';
		cool		 <= '0'; 
		foodIn    <= '0';
		regTime	 <= '1';
		regTemp   <= '1';
		regProg   <= '1';
		blink		 <= '0';
		enTimer   <= '0';
		cooked	 <= '0';
		timeVal   <= DEFAULT_TIME_PREHEAT;
		tempVal   <= DEFAULT_TEMP;
		
		if (program = "010") then
			userMode <= '1';
		else
			userMode <= '0';
		end if;
		
		case (s_currentState) is
			
			when TOff =>
				status   <= "000";
				regTime  <= '0';
				regProg  <= '0';
				initTemp <= '1';
				tempVal  <= x"14";
				userMode <= '0';
				
				if (on_off = '1') then
					s_nextState <= TIdle;
				else
					s_nextState <= s_currentState;
				end if;
				
			when TIdle =>
				idle 		 <= '1';
				status 	 <= "001";
				initTimer <= '1';
				initTemp  <= '1';
				if (program = "000") then
					regProg <= '0';
					timeVal <= x"01";
					tempVal <= x"14";
				elsif (program = "001") then
					timeVal   <= DEFAULT_TIME_PREHEAT;
					tempVal   <= DEFAULT_TEMP;
				elsif (program = "011") then
					timeVal   <= RISSOIS_TIME_PREHEAT;
					tempVal   <= RISSOIS_TEMP;
				elsif (program = "100") then
					timeVal   <= BATATAS_TIME_PREHEAT;
					tempVal   <= BATATAS_TEMP;
				elsif (program = "101") then
					timeVal   <= FILPEIXE_TIME_PREHEAT;
					tempVal   <= FILPEIXE_TEMP;
				elsif (program = "110") then
					timeVal   <= HAMBURGER_TIME_PREHEAT;
					tempVal   <= HAMBURGER_TEMP;
				elsif (program = "111") then
					timeVal 	 <= BOLO_CENOURA_PREHEAT;
					tempVal 	 <= BOLO_CENOURA_TEMP;
				else
					blink <= '1';					
				end if;
				
				if ((confirm = '1') and (program /= "000") and (run = '1') and (open_oven = '0')) then
					s_nextState <= TPreheat;
				elsif (on_off = '0') then
					s_nextState <= Toff;
				else
					s_nextState <= s_currentState;
				end if;
				
			when TPreheat =>
				status 	 <= "010";
				enTimer	 <= '1';
				foodIn	 <= timeExp;
				
				if (on_off = '0') then
					s_nextState <= TCool;
				elsif (run = '0') then
					s_nextState <= TStopped;
				elsif (open_oven = '1') then
					if (timeExp = '1') then
						s_nextState <= TOpened;
					else
						s_nextState <= TStopped;
					end if;
				else
					s_nextState <= s_currentState;
				end if;
				
			when TOpened =>
				status  	 <= "011";
				initTimer <= '1';				
				
				if (program = "011") then
					timeVal   <= RISSOIS_TIME_COOK;
				elsif (program = "100") then
					timeVal   <= BATATAS_TIME_COOK;
				elsif (program = "101") then
					timeVal   <= FILPEIXE_TIME_COOK;
				elsif (program = "110") then
					timeVal   <= HAMBURGER_TIME_COOK;
				elsif (program = "111") then
					timeVal 	 <= BOLO_CENOURA_COOK;
				else
					timeVal   <= DEFAULT_TIME_COOK;
				end if;

				if (on_off = '0') then
					s_nextState <= TCool;
				elsif (run = '0') then
					s_nextState <= TStopped;
				elsif (confirm = '1') then
					if (open_oven = '0' and program = "010") then
						s_nextState <= TUserCookTime;
					elsif (open_oven = '0') then
						s_nextState <= TCook;
					else
						s_nextState <= s_currentState;
					end if;
				else
					s_nextState <= s_currentState;
				end if;
				
			when TCook =>
				status  <= "100";
				enTimer <= '1';
				blink   <= timeExp;
				cooked  <= timeExp;
				
				if (on_off = '0') then
					s_nextState <= TCool;
				elsif (run = '0') then
					s_nextState <= TStopped;
				elsif (open_oven = '1') then
					if (timeExp = '1') then
						s_nextState <= TCool;
					else
						s_nextState <= TStopped;
					end if;
				else
					s_nextState <= s_currentState;
				end if;
				
			when TCool =>
				status  <= "101";
				blink   <= '1';
				cool	  <= '1';
				regTime <= '0';
				regProg <= '0';
				
				if (cooled = '1') then
					if (on_off = '0') then
						s_nextState <= TOff;
					else
						s_nextState <= TIdle;
					end if;
				else
					s_nextState <= s_currentState;
				end if;
				
				
			when TUserCookTime =>
				status 	 <= "110";
				blink  	 <= '1';
				initTimer <= '1';
				
				if (on_off = '0') then
					s_nextState <= TCool;
				elsif (run = '0') then
					s_nextState <= TStopped;
				elsif ((confirm = '1') and (run = '1') and (open_oven = '0')) then
					s_nextState <= TCook;
				else
					s_nextState <= s_currentState;
				end if;
	
			when TStopped =>
				status <= "111";
				blink  <= '1';
				
				if (on_off = '0') then
					s_nextState <= TCool;
				elsif ((s_previousState = TPreheat) or (s_previousState = TCook) or (s_previousState = TUserCookTime)) then
					if ((run = '1') and (open_oven = '0')) then
						s_nextState <= s_previousState;
					else
						s_nextState <= s_currentState;
					end if;
				elsif (s_previousState = TOpened) then
					if (run = '1') then
						s_nextState <= s_previousState;
					else
						s_nextState <= s_currentState;
					end if;
				else
					s_nextState <= s_currentState;
				end if;
			
			when others =>
				status 		<= "000";
				s_nextState <= TOff;				
				
		end case;
	end process;
	
end Behavioral;