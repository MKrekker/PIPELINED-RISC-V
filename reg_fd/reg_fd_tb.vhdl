library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_fd_tb is
end reg_fd_tb;

architecture test of reg_fd_tb is
    signal clk : std_logic;
    signal rd : std_logic_vector(31 downto 0);
    signal pc_f : std_logic_vector(31 downto 0);
    signal pcplus4_f : std_logic_vector(31 downto 0);
    signal instr_d : std_logic_vector(31 downto 0);
    signal pc_d : std_logic_vector(31 downto 0);
    signal pcplus4_d : std_logic_vector(31 downto 0);
    begin
        inst_reg_fd : entity work.reg_fd(rtl)
            port map(
                clk => clk,
                rd => rd,
                pc_f => pc_f,
                pcplus4_f => pcplus4_f,
                instr_d => instr_d,
                pc_d => pc_d,
                pcplus4_d => pcplus4_d
            );

        process begin
            clk <= '1';
            wait for 5 ns;
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
            clk <= '0';
            wait;
        end process;

        process begin
            rd <= x"FFFFFFFF";
            pc_f <= x"00000000";
            pcplus4_f <= x"88888888";
            wait for 12 ns;
            rd <= x"FFFFFFF1";
            pc_f <= x"FFFFFFF5";
            pcplus4_f <= x"FFFFFFFA";
            wait for 15 ns;
            rd <= x"00000004";
            pc_f <= x"00001004";
            pcplus4_f <= x"00A00004";
            wait for 25 ns;
            wait;
        end process;

    end test;