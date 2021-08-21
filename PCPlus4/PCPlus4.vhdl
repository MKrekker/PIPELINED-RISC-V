library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PCPlus4 is

    port(
        --inputs
        a_in : in std_logic_vector(31 downto 0);
        b_in : in std_logic_vector(31 downto 0);
        --output
        c_out: buffer std_logic_vector(31 downto 0)
    );
end PCPlus4;

architecture rtl of PCPlus4 is
    begin
    
        c_out <= std_logic_vector(unsigned(a_in) + unsigned(b_in));
    
    end rtl;