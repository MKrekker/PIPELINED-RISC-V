library ieee;
use ieee.std_logic_1164.all;

entity pc is
    port(
        --inputs
        PCNext : in std_logic_vector(31 downto 0);
        clk    : in std_logic;
        reset  : in std_logic;
        en     : in std_logic;
        --output
        PC_cur : buffer std_logic_vector(31 downto 0)
    );
end pc;

architecture rtl of pc is
    begin
        process(clk, reset, en)
            begin
                if reset = '1' then
                    PC_cur <= (others => '0');
                else if rising_edge(clk) and en = '1' then
                        PC_cur <= PCNext;
                    end if;
                end if;
            end process;
    end rtl;
