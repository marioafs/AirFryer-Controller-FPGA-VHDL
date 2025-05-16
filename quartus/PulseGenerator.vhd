library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity PulseGenerator is
	generic(k : positive := 50_000_000);
	port(
		reset : in std_logic;
		clk   : in  std_logic;
		pulse : out std_logic
	);

end PulseGenerator;

architecture Behavioral of PulseGenerator is
	signal s_count : natural := 0;
begin
	process(clk)
	begin
		if rising_edge(clk) then
			if (reset = '1') then
				pulse   <= '0';
				s_count <=  0;
			else
				if (s_count = k-1) then
					pulse   <= '1';
					s_count <=  0;
				else
					pulse <= '0';
					s_count <= s_count + 1;
				end if;
			end if;
		end if;
	end process;
end Behavioral;