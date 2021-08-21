library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_em_tb is
end reg_em_tb;

architecture test of reg_em_tb is
    --inputs
    signal clk : std_logic;
    signal regwrite_e : std_logic;
    signal resultsrc_e : std_logic_vector(1 downto 0);
    signal memwrite_e : std_logic;
    signal aluresult : std_logic_vector(31 downto 0);
    signal writedata_e : std_logic_vector(31 downto 0);
    signal rd_e : std_logic_vector(11 downto 7);
    signal pcplus4_e : std_logic_vector(31 downto 0);

    --outputs
    signal regwrite_m : std_logic;
    signal resultsrc_m : std_logic_vector(1 downto 0);
    signal memwrite_m : std_logic;
    signal aluresult_m : std_logic_vector(31 downto 0);
    signal writedata_m : std_logic_vector(31 downto 0);
    signal rd_m : std_logic_vector(11 downto 7);
    signal pcplus4_m : std_logic_vector(31 downto 0);

    begin
        inst_reg_em : entity work.reg_em(rtl)
            port map(
                clk => clk,
                regwrite_e => regwrite_e,
                resultsrc_e => resultsrc_e,
                memwrite_e => memwrite_e,
                aluresult => aluresult,
                writedata_e => writedata_e,
                rd_e => rd_e,
                pcplus4_e => pcplus4_e,
                regwrite_m => regwrite_m,
                resultsrc_m => resultsrc_m,
                memwrite_m => memwrite_m,
                aluresult_m => aluresult_m,
                writedata_m => writedata_m,
                rd_m => rd_m,
                pcplus4_m => pcplus4_m
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
            regwrite_e <= '0';
            resultsrc_e <= "00";
            memwrite_e <= '0';
            aluresult <= x"FFFF0000";
            writedata_e <= x"0000FFFF";
            rd_e <= b"00011";
            pcplus4_e <= x"F0F0F0F0";
            wait for 12 ns;
            regwrite_e <= '1';
            resultsrc_e <= "01";
            memwrite_e <= '1';
            aluresult <= x"FFFF0001";
            writedata_e <= x"1000FFFF";
            rd_e <= b"10001";
            pcplus4_e <= x"F1F0F0F0";
            wait for 25 ns;
            regwrite_e <= '0';
            resultsrc_e <= "10";
            memwrite_e <= '0';
            aluresult <= x"FFFF0100";
            writedata_e <= x"0100FFFF";
            rd_e <= b"01001";
            pcplus4_e <= x"F0F0F1F0";
            wait;
        end process;

    end test;