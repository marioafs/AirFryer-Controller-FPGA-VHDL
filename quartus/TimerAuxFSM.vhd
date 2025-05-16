library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity TimerAuxFSM is
	port(
		clk       : in  std_logic;
		reset		 : in  std_logic;
		enCnt		 : in  std_logic;
		init		 : in  std_logic;
		enTimer   : in  std_logic;
		userMode	 : in  std_logic;
		upCnt		 : in  std_logic;
		downCnt   : in  std_logic;
		timeVal	 : in  std_logic_vector(7 downto 0);
		timeExp   : out std_logic;
		cntOut	 : out std_logic_vector(7 downto 0)	
	);
end TimerAuxFSM;

architecture Behavioral of TimerAuxFSM is
	constant maxTime	  : positive := 30;
	constant minTime	  : positive := 1;
	
	signal s_cnt     	  : unsigned(7 downto 0);
	signal s_setCntUser : unsigned(7 downto 0) := x"05";
	signal s_cntZero	  : std_logic := '0';
begin
	
	count : process(clk)
	begin
		if (rising_edge(clk)) then
			if (reset = '1') then
				s_cntZero <= '0';
				s_cnt 	 <= unsigned(timeVal);
			elsif (init = '1') then
					s_cntZero <= '0';
				if (userMode = '1') then
					s_cnt <= s_setCntUser;
				else
					s_cnt <= unsigned(timeVal);
				end if;
			else
				if (s_cnt = 0) then
						s_cntZero <= '1';
				elsif ((enCnt = '1') and (enTimer = '1')) then					
					s_cnt <= s_cnt - 1;
					s_cntZero <= '0';
				end if;
			end if;
		end if;
	end process;
	
	set_user_mode : process(clk)
	begin
		if (rising_edge(clk)) then
			if (init = '1') then
				if (userMode = '1') then
					if (upCnt = '1') then
						if (s_setCntUser < maxTime) then
							s_setCntUser <= s_setCntUser + 1;
						end if;
					elsif (downCnt = '1') then
						if (s_setCntUser > minTime) then
							s_setCntUser <= s_setCntUser - 1;
						end if;
					end if;
				end if;
			end if;
		end if;
	end process;	
					 
	timeExp <= s_cntZero;
	
	cntOut  <= std_logic_vector(s_cnt);
	
end Behavioral;