library ieee;
use ieee.std_logic_1164.all;

entity mux_2 is
    generic(number : integer := 32);
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
        process(sel, port_in1, port_in2)
      begin
        if(sel = '0')then
            port_out <= port_in1;
        else
            port_out <= port_in2;
        end if;
      end process;
    end rtl;
