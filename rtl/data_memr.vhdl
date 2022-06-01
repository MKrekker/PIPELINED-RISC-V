library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity data_memr is
    generic
    (
        DATA_WIDTH : natural := 32;
        ADDR_WIDTH : natural := 32
    );
    port
    (
        clk             : in std_logic;
        memwrite_m      : in std_logic;
        rw_addr         : in std_logic_vector(ADDR_WIDTH-1 downto 0);
        w_data          : in std_logic_vector(DATA_WIDTH-1 downto 0);
        read_data_m     : out std_logic_vector(DATA_WIDTH-1 downto 0)
    );
end data_memr;

architecture rtl of data_memr is
    type ram_type is array((2*ADDR_WIDTH) - 1 downto 0) of std_logic_vector(DATA_WIDTH-1 downto 0);
    signal ram : ram_type := (others => (others => '0'));
begin

    process(clk)begin
        if rising_edge(clk) then
            if memwrite_m = '1' then
                ram(to_integer(unsigned(rw_addr(7 downto 2)))) <= w_data;
            end if;
        end if;
        --read_data_m <= ram(to_integer(unsigned(rw_addr(ADDR_WIDTH - 1 downto 0))));
    end process;

    process(clk,rw_addr) begin
        --if to_integer(unsigned(rw_addr(ADDR_WIDTH - 1 downto 2))) < (2*ADDR_WIDTH) then
            read_data_m <= ram(to_integer(unsigned(rw_addr(7 downto 2))));
       -- else
           -- read_data_m <=(others => '0');
        --end if;
    end process;

end rtl;