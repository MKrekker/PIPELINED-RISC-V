library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity data_memr is
    generic
    (
        DATA_WIDTH : natural := 32;
        ADDR_WIDTH : natural := 10
    );
    port
    (
        clk     : in std_logic;
        addr_a  : in std_logic_vector(ADDR_WIDTH-1 downto 0);
        addr_b  : in std_logic_vector(ADDR_WIDTH-1 downto 0);
        data_a  : in std_logic_vector(DATA_WIDTH-1 downto 0);
        data_b  : in std_logic_vector(DATA_WIDTH-1 downto 0);
        en_a    : in std_logic;
        we_a    : in std_logic;
        en_b    : in std_logic;
        we_b    : in std_logic;
        q_a     : out std_logic_vector(DATA_WIDTH-1 downto 0);
        q_b     : out std_logic_vector(DATA_WIDTH-1 downto 0)
    );
end data_memr;

architecture rtl of data_memr is
    type ram_type is array((2**ADDR_WIDTH)-1 downto 0) of std_logic_vector(DATA_WIDTH-1 downto 0);
    shared variable ram : ram_type;
    signal ram_data_a : std_logic_vector(DATA_WIDTH-1 downto 0) ;
    signal ram_data_b : std_logic_vector(DATA_WIDTH-1 downto 0) ;
begin

    process(clk)begin
        if clk'event and clk='1' then
            if en_a = '1' then
                ram_data_a <= ram(to_integer(unsigned(addr_a)));
                if we_a = '1' then
                    ram(to_integer(unsigned(addr_a))) := data_a;
                end if;
            end if;
        end if;
    end process;

    process(clk)begin
        if clk'event and clk='1' then
            if en_b = '1' then
                ram_data_b <= ram(to_integer(unsigned(addr_b)));
                if we_b = '1' then
                    ram(to_integer(unsigned(addr_b))) := data_b;
                end if;
            end if;
        end if;
    end process;

    q_a <= ram_data_a;
    q_b <= ram_data_b;

end rtl;