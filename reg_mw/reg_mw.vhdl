library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_mw is
    port(
        --inputs
        clk             : in std_logic;
        regwrite_m      : in std_logic;
        resultsrc_m     : in std_logic_vector(1 downto 0);
        aluresult_m     : in std_logic_vector(31 downto 0);
        rd              : in std_logic_vector(31 downto 0);
        rd_m            : in std_logic_vector(11 downto 7);
        pcplus4_m       : in std_logic_vector(31 downto 0);
        --outputs
        regwrite_w      : out std_logic;
        resultsrc_w     : out std_logic_vector(1 downto 0);
        aluresult_w     : out std_logic_vector(31 downto 0);
        readdata_w      : out std_logic_vector(31 downto 0);
        rd_w            : out std_logic_vector(11 downto 7);
        pcplus4_w       : out std_logic_vector(31 downto 0)
    );
end reg_mw;

architecture rtl of reg_mw is
    begin
        process(clk)begin
            if rising_edge(clk)then
                regwrite_w      <= regwrite_m;
                resultsrc_w     <= resultsrc_m;
                aluresult_w     <= aluresult_m;
                readdata_w      <= rd;
                rd_w            <= rd_m;
                pcplus4_w       <= pcplus4_m;
            end if;
        end process;
    end rtl;
