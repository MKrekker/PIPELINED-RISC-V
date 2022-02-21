library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux_3 is
  generic(N : integer := 32);
  port (
    a   : in std_logic_vector(N-1 downto 0);
    b   : in std_logic_vector(N-1 downto 0);
    c   : in std_logic_vector(N-1 downto 0);
    sel   : in std_logic_vector(1 downto 0);
    y   : out std_logic_vector(N-1 downto 0)
  );
end mux_3;

architecture rtl of mux_3 is
  begin
    process(sel,a,b,c)
      begin
        if(sel = "00")then
          y <= a;
        elsif(sel = "01")then
          y <= b;
        elsif (sel = "10") then
          y <= c;
        end if;
      end process;
end rtl;
