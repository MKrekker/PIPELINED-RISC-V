library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_mw_tb is
end reg_mw_tb;

architecture test of reg_mw_tb is

    --inputs
    signal clk : std_logic;
    signal regwrite_m : std_logic;
    signal resultsrc_m : std_logic_vector(1 downto 0);
    signal aluresult_m : std_logic_vector(31 downto 0);
    signal rd : std_logic_vector(31 downto 0);
    signal rd_m : std_logic_vector(11 downto 7);
    signal pcplus4_m : std_logic_vector(31 downto 0);
    --outputs
    signal regwrite_w : std_logic;
    signal resultsrc_w : std_logic_vector(1 downto 0);
    signal aluresult_w : std_logic_vector(31 downto 0);
    signal readdata_w : std_logic_vector(31 downto 0);
    signal rd_w : std_logic_vector(11 downto 7);
    signal pcplus4_w : std_logic_vector(31 downto 0);

    begin
        inst_reg_mw : entity work.reg_mw(rtl)
            port map(
                clk => clk,
                regwrite_m => regwrite_m,
                resultsrc_m => resultsrc_m,
                aluresult_m => aluresult_m,
                rd => rd,
                rd_m => rd_m,
                pcplus4_m => pcplus4_m,
                regwrite_w => regwrite_w,
                resultsrc_w => resultsrc_w,
                aluresult_w => aluresult_w,
                readdata_w => readdata_w,
                rd_w => rd_w,
                pcplus4_w => pcplus4_w
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
            regwrite_m <= '0';
            resultsrc_m <= "00";
            aluresult_m <= x"12345678";
            rd <= x"87654321";
            rd_m <= b"00110";
            pcplus4_m <= x"FFF0F0FF";
            wait for 12 ns;
            regwrite_m <= '1';
            resultsrc_m <= "01";
            aluresult_m <= x"12305678";
            rd <= x"87654320";
            rd_m <= b"01110";
            pcplus4_m <= x"FFF1F0FF";
            wait for 25 ns;
            regwrite_m <= '0';
            resultsrc_m <= "10";
            aluresult_m <= x"12315678";
            rd <= x"87653321";
            rd_m <= b"00111";
            pcplus4_m <= x"FF90F0FF";
            wait;
        end process;
    end test;