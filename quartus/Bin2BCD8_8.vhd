library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Bin2BCD8_8 is

	port(
		bin 		  : in  std_logic_vector(7 downto 0);
		bcd0, bcd1 : out std_logic_vector(3 downto 0)
	);

end Bin2BCD8_8;

architecture Behavioral of Bin2BCD8_8 is
	signal s_bin : unsigned(7 downto 0);
begin

	s_bin <= unsigned(bin);
	
	bcd1 <= std_logic_vector(resize(s_bin / 10, 4));
	bcd0 <= std_logic_vector(resize(s_bin rem 10, 4));
	
end Behavioral;