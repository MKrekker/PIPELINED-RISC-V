library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_fd is
    port(
        --inputs
        clk         : in std_logic;
        en          : in std_logic;
        clr         : in std_logic;
        rd          : in std_logic_vector(31 downto 0);
        pc_f        : in std_logic_vector(31 downto 0);
        pcplus4_f   : in std_logic_vector(31 downto 0);
        --outputs
        instr_d     : buffer std_logic_vector(31 downto 0);
        pc_d        : out std_logic_vector(31 downto 0);
        pcplus4_d   : out std_logic_vector(31 downto 0)
    );
end reg_fd;

architecture rtl of reg_fd is

    begin
        process(clk)begin
            if rising_edge(clk) and en = '1'then
                if clr = '1'then
                    instr_d <= (others => '0');
                    pc_d    <= (others => '0');
                    pcplus4_d <= (others => '0');
                else
                    instr_d <= rd;
                    pc_d    <= pc_f;
                    pcplus4_d <= pcplus4_f;
                end if;
            end if;
        end process;


    end rtl;
