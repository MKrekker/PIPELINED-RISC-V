library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instr_tb is
end instr_tb;

architecture test of instr_tb is
    signal addr_instr   : std_logic_vector(31 downto 0);
    signal rd_instr     : std_logic_vector(31 downto 0);
begin
    inst_instr_mem : entity work.instr_mem(rtl)
        port map(
            addr_instr  => addr_instr,
            rd_instr    => rd_instr
        );

    process begin
        --wait for 5 ns;
        addr_instr <= x"0000_0000";
        wait for 5 ns;
        for i in 1 to 135 loop
            addr_instr <= std_logic_vector(unsigned(addr_instr) + 4);
            wait for 5 ns;
        end loop;
        wait;
    end process;
end test;