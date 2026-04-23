library ieee;
use ieee.std_logic_1164.all;

entity rom2b is
	port(	a:	in	std_logic_vector(1 downto 0);
			x:	out	std_logic_vector(4 downto 0)
	);
end rom2b;

architecture rom2bBehave of rom2b is
begin
x <=	--COOOO
		--opppp
		--deeee
		--Irrrr
		--naaaa
		--snnnn
		--t0000
		--r1122
		 "10110" when (a = "00") else
		 "10101" when (a = "01") else
		 "10001" when (a = "10") else
		 "10010" when (a = "11");
end rom2bBehave;