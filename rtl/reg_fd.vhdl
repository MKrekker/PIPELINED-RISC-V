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

    --type ramtype is array (2 downto 0) of std_logic_vector(31 downto 0);
    signal memory_0 : std_logic_vector(31 downto 0);
    signal memory_1 : std_logic_vector(31 downto 0);
    signal memory_2 : std_logic_vector(31 downto 0);

    begin
        process(clk)begin
            if rising_edge(clk)then
                if clr = '1' then
                    memory_0 <= (others => '0');
                elsif en = '1' then
                    memory_0 <= rd;
                end if;
            end if;
        end process;
        
        process(clk)begin
            if rising_edge(clk)then
                if clr = '1' then
                    memory_1 <= (others => '0');
                elsif en = '1' then
                    memory_1 <= pc_f;
                end if;
            end if;
        end process;
        
        process(clk)begin
            if rising_edge(clk)then
                if clr = '1' then
                    memory_2 <= (others => '0');
                elsif en = '1' then
                    memory_2 <= pcplus4_f;
                end if;
            end if;
        end process;

        instr_d     <=  memory_0;
        pc_d        <=  memory_1;
        pcplus4_d   <=  memory_2;

    end rtl;
