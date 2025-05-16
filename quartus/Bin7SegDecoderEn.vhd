library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Bin7SegDecoderEn is
	port(
		en       : in std_logic;
		binIn    : in std_logic_vector(3 downto 0);
		decOut   : out std_logic_vector(6 downto 0)
		);
end Bin7SegDecoderEn;

architecture Behavioral of Bin7SegDecoderEn is
begin
	process(en, binIn)
	begin
		if (en = '1') then
			case binIn is
				when "0000" => decOut <= "1000000"; -- 0
				when "0001" => decOut <= "1111001"; -- 1
				when "0010" => decOut <= "0100100"; -- 2
				when "0011" => decOut <= "0110000"; -- 3
				when "0100" => decOut <= "0011001"; -- 4
				when "0101" => decOut <= "0010010"; -- 5
				when "0110" => decOut <= "0000010"; -- 6
				when "0111" => decOut <= "1111000"; -- 7
				when "1000" => decOut <= "0000000"; -- 8
				when "1001" => decOut <= "0010000"; -- 9
				when others => decOut <= "1111111"; -- Desligado
			end case;
		else
			decOut <= "1111111";
		end if;
	end process;
end Behavioral;