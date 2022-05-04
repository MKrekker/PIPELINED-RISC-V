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
        regwrite_m      : buffer std_logic;
        resultsrc_m     : out std_logic_vector(1 downto 0);
        memwrite_m      : out std_logic;
        aluresult_m     : buffer std_logic_vector(31 downto 0);
        writedata_m     : out std_logic_vector(31 downto 0);
        rd_m            : buffer std_logic_vector(11 downto 7);
        pcplus4_m       : out std_logic_vector(31 downto 0)
    );
end reg_em;

architecture rtl of reg_em is

    type ram_type_32 is array(2 downto 0) of std_logic_vector(31 downto 0);
    type ram_type_5 is array(0 downto 0 ) of std_logic_vector(4 downto 0);
    type ram_type_2 is array(0 downto 0) of std_logic_vector(1 downto 0);

    signal memory_32_0    : std_logic_vector(31 downto 0);
    signal memory_32_1    : std_logic_vector(31 downto 0);
    signal memory_32_2    : std_logic_vector(31 downto 0);
    signal memory_5     : std_logic_vector(4 downto 0);
    signal memory_2     : std_logic_vector(1 downto 0);
    signal memory_1_1   : std_logic;
    signal memory_1_2   : std_logic;


    begin
        process(clk)begin
            if rising_edge(clk)then
                memory_32_0    <= aluresult;
            end if;
        end process;
        
        process(clk)begin
            if rising_edge(clk)then
                memory_32_1    <= writedata_e;
            end if;
        end process;
        
        process(clk)begin
            if rising_edge(clk)then
                memory_32_2    <= pcplus4_e;
            end if;
        end process;
        
        process(clk)begin
            if rising_edge(clk)then
                memory_5     <= rd_e;
            end if;
        end process;
        
        process(clk)begin
            if rising_edge(clk)then
                memory_2     <= resultsrc_e;
            end if;
        end process;
        
        process(clk)begin
            if rising_edge(clk)then
                memory_1_1     <= regwrite_e;
            end if;
        end process;
        process(clk)begin
            if rising_edge(clk)then
                memory_1_2     <= memwrite_e;
            end if;
        end process;

        aluresult_m     <= memory_32_0;
        writedata_m     <= memory_32_1;
        pcplus4_m       <= memory_32_2; 
        
        rd_m            <= memory_5;

        resultsrc_m     <= memory_2;

        regwrite_m      <= memory_1_1;
        memwrite_m      <= memory_1_2;

    end rtl;