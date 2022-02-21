library ieee;
use ieee.std_logic_1164.all;

entity mux_2 is
    generic(number : integer := 8);
    port(
        --inputs
        port_in1 :  in std_logic_vector(number-1 downto 0);
        port_in2 :  in std_logic_vector(number-1 downto 0);
        sel      :  in std_logic;
        --output
        port_out :  out std_logic_vector(number-1 downto 0)
    );
end mux_2;

architecture rtl of mux_2 is
    begin
        port_out <= port_in2 when sel = '1' else port_in1;
    end rtl;
