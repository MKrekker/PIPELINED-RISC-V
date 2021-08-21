library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_em is
    port(
        --inputs
        clk             : in std_logic;
        regwrite_e      : in std_logic;
        resultsrc_e     : in std_logic_vector(1 downto 0);
        memwrite_e      : in std_logic;
        aluresult       : in std_logic_vector(31 downto 0);
        writedata_e     : in std_logic_vector(31 downto 0);
        rd_e            : in std_logic_vector(11 downto 7);
        pcplus4_e       : in std_logic_vector(31 downto 0);

        --outputs
        regwrite_m      : out std_logic;
        resultsrc_m     : out std_logic_vector(1 downto 0);
        memwrite_m      : out std_logic;
        aluresult_m     : buffer std_logic_vector(31 downto 0);
        writedata_m     : out std_logic_vector(31 downto 0);
        rd_m            : out std_logic_vector(11 downto 7);
        pcplus4_m       : out std_logic_vector(31 downto 0)
    );
end reg_em;

architecture rtl of reg_em is
    begin
        process(clk)begin
            if rising_edge(clk)then
                regwrite_m      <= regwrite_e;
                resultsrc_m     <= resultsrc_e;
                memwrite_m      <= memwrite_e;
                aluresult_m     <= aluresult;
                writedata_m     <= writedata_e;
                rd_m            <= rd_e;
                pcplus4_m       <= pcplus4_e;
            end if;
        end process;
    end rtl;