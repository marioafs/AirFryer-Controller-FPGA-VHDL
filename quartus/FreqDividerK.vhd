library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity FreqDividerK is
	generic(K : positive := 5E7);
	
	port(
		reset     : in std_logic;
		clkIn     : in std_logic;
		clkOut    : out std_logic	
	);

end FreqDividerK;


architecture Behavioral of FreqDividerK is

	signal s_counter : natural;

begin
	process(clkIn)
	begin
		if (rising_edge(clkIn)) then
			if (reset = '1') or (s_counter = k-1) then
				clkOut <= '0';
				s_counter <= 0;
			else
				if (s_counter = k/2 -1) then
					clkOut <= '1';
				end if;				
				s_counter <= s_counter + 1;			
			end if;			
		end if;	
	end process;
end Behavioral;