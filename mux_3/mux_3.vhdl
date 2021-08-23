library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux_3 is
    generic(number : integer := 8);
    port(
        --inputs
        port_in1 :  in std_logic_vector(number-1 downto 0); 
        port_in2 :  in std_logic_vector(number-1 downto 0);
        port_in3 :  in std_logic_vector(number-1 downto 0);
        sel      :  in std_logic_vector(1 downto 0);
        --output
        port_out :  buffer std_logic_vector(number-1 downto 0)
    );
end mux_3;

architecture rtl of mux_3 is
    begin
        with sel select
            port_out <= port_in1 when "00",
                        port_in2 when "01",
                        port_in3 when "10",
                        (others => 'U') when others;
    end rtl;