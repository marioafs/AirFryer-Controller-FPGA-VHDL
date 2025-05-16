library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity TempAuxFSM is
	port(
		clk  		 : in  std_logic;
		reset		 : in  std_logic;
		init  	 : in  std_logic;
		userMode  : in  std_logic;
		enCool	 : in  std_logic;
		enCnt		 : in  std_logic;
		tempVal   : in  std_logic_vector(7 downto 0);
		upTemp	 : in  std_logic;
		downTemp  : in  std_logic;
		cooled	 : out std_logic;
		tempOut	 : out std_logic_vector(7 downto 0)
	);
end TempAuxFSM;

architecture Behavioral of TempAuxFSM is
	constant maxTemp	  : positive := 220;
	constant minTemp	  : positive := 80;
	
	signal s_cooled  		: std_logic;
	signal s_temp	  		: unsigned(7 downto 0) := x"14";
	signal s_setTempUser : unsigned(7 downto 0) := x"64"; -- 100 graus Celsius por omissão
begin

	temp : process(clk)
	begin
		if (rising_edge(clk)) then
			if (reset = '1') then
				s_cooled <= '0';
				s_temp 	 <= unsigned(tempVal);
			elsif (init = '1') then
					s_cooled <= '0';
				if (userMode = '1') then
					s_temp <= s_setTempUser;
				else
					s_temp <= unsigned(tempVal);
				end if;
			else
				if (s_temp = 20) then
					s_cooled <= '1';
				elsif ((enCnt = '1') and (enCool = '1')) then
					s_temp <= s_temp - 10;
					s_cooled <= '0';
				end if;
			end if;
		end if;
	end process;
	
	set_user_mode : process(clk)
	begin
		if (rising_edge(clk)) then
			if (init = '1') then
				if (userMode = '1') then
					if (upTemp = '1') then
						if (s_setTempUser < maxTemp) then
							s_setTempUser <= s_setTempUser + 10;
						end if;
					elsif (downTemp = '1') then
						if (s_setTempUser > minTemp) then
							s_setTempUser <= s_setTempUser - 10;
						end if;
					end if;
				end if;
			end if;
		end if;
	end process;	
					 
	cooled <= s_cooled;
	
	tempOut  <= std_logic_vector(s_temp);
end Behavioral;