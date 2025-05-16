library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity SyncSWReg is
	port(
		clk		 : in  std_logic;
		swIn   	 : in  std_logic_vector(6 downto 0);
		on_off 	 : out std_logic;
		run	 	 : out std_logic;
		open_oven : out std_logic;
		programs  : out std_logic_vector(2 downto 0);
		greset	 : out std_logic
	);
end SyncSWReg;

architecture Behavioral of SyncSWReg is
begin
	process(clk)
	begin
		if (rising_edge(clk)) then
			on_off 	 <= swIn(0);
			run	 	 <= swIn(1);
			open_oven <= swIn(2);
			programs  <= swIn(5 downto 3);
			greset	 <= swIn(6);
		end if;
	end process;

end Behavioral;