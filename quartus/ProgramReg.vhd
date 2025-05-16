library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ProgramReg is
	port(
		clk		  		 : in  std_logic;
		en			  		 : in  std_logic;
		programIn 		 : in  std_logic_vector(2 downto 0);
		programSelected : out std_logic_vector(2 downto 0)
	);
end ProgramReg;

architecture Behavioral of ProgramReg is
begin
	process(clk)
	begin
		if (rising_edge(clk)) then
			if (en = '1') then
				programSelected <= programIn;
			end if;
		end if;
	end process;
end Behavioral;