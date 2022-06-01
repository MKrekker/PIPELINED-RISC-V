library ieee;
use ieee.std_logic_1164.all;

entity mux_2 is
    generic(number : integer := 32);
    port(
        --inputs
        a :  in std_logic_vector(number-1 downto 0);
        b :  in std_logic_vector(number-1 downto 0);
        sel      :  in std_logic;
        --output
        y :  out std_logic_vector(number-1 downto 0)
    );
end mux_2;

architecture rtl of mux_2 is
    begin
        process(sel, a, b)begin
            case sel is
                when '1'    => y <= b;
                when others => y <= a;
           end case;
        end process;
end rtl;
