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
        regwrite_w      : buffer std_logic;
        resultsrc_w     : out std_logic_vector(1 downto 0);
        aluresult_w     : out std_logic_vector(31 downto 0);
        readdata_w      : out std_logic_vector(31 downto 0);
        rd_w            : buffer std_logic_vector(11 downto 7);
        pcplus4_w       : out std_logic_vector(31 downto 0)
    );
end reg_mw;

architecture rtl of reg_mw is

    --type ram_type_32 is array(2 downto 0) of std_logic_vector(31 downto 0);
    --type ram_type_5 is array(0 downto 0) of std_logic_vector(4 downto 0);
    --type ram_type_2 is array(0 downto 0) of std_logic_vector(1 downto 0);
    --type ram_type_1 is array(0 downto 0) of std_logic;

    signal memory_32_0    : std_logic_vector(31 downto 0);
    signal memory_32_1    : std_logic_vector(31 downto 0);
    signal memory_32_2    : std_logic_vector(31 downto 0);
    signal memory_5       : std_logic_vector(4 downto 0);
    signal memory_2       : std_logic_vector(1 downto 0);
    signal memory_1       : std_logic;

    begin
        process(clk)begin
            if rising_edge(clk)then
                memory_32_0    <= aluresult_m;
            end if;
        end process;
        
        process(clk)begin
            if rising_edge(clk)then
                memory_32_1    <= rd;
            end if;
        end process;
        
        process(clk)begin
            if rising_edge(clk)then
                memory_32_2    <= pcplus4_m;
            end if;
        end process;
        
        process(clk)begin
            if rising_edge(clk)then
                memory_5     <= rd_m;
            end if;
        end process;
        
        process(clk)begin
            if rising_edge(clk)then
                memory_2     <= resultsrc_m;
            end if;
        end process;
        
        process(clk)begin
            if rising_edge(clk)then
                memory_1     <= regwrite_m;
            end if;
        end process;

        regwrite_w      <= memory_1;
        resultsrc_w     <= memory_2;
        aluresult_w     <= memory_32_0;
        readdata_w      <= memory_32_1;
        rd_w            <= memory_5;
        pcplus4_w       <= memory_32_2;

    end rtl;
