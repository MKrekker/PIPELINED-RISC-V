library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pipe_risc_v_tb is
end pipe_risc_v_tb;

architecture test of pipe_risc_v_tb is
    signal clk          : std_logic;
    signal reset        : std_logic;

    begin
        --instantiation pipelined risc v
        inst_pipelined_risc_v : entity work.pipe_risc_v(rtl)
            port map (
                clk             => clk,
                reset           => reset
            );

            process begin
                -- reset
                clk   <= '1';
                reset <= '1';
                wait for 5 ns;
                clk   <= '0';
                reset <= '0';
                wait for 5 ns;

                for i in 1 to 200 loop
                    clk <= '1';
                    wait for 10 ns;
                    clk <= '0';
                    wait for 10 ns;
                    end loop;

                wait;
            end process;


    end test;
