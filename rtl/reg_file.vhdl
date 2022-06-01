library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_file is
    port(
        --inputs
        read_port_addr1     : in std_logic_vector(4 downto 0);
        read_port_addr2     : in std_logic_vector(4 downto 0);
        write_port_addr     : in std_logic_vector(4 downto 0);
        write_data          : in std_logic_vector(31 downto 0);
        write_en            : in std_logic;
        clk                 : in std_logic;
        --outputs
        read_data1          : out std_logic_vector(31 downto 0);
        read_data2          : buffer std_logic_vector(31 downto 0)
    );
end reg_file;

architecture rtl of reg_file is

    type registers is array (31 downto 0) of std_logic_vector(31 downto 0);
    
    --Note x0 is hardwired to 0
    signal  reg_bank1 : registers :=((2) => (others => '0'), (11) => (others => '0'), others =>(others => '-'));
    -- signal  reg_bank2 : registers := ((2) => (others => '0'), (11) => (others => '0'), others =>(others => '-'));
    begin
        
        -- Write_Data_Proc : process(clk)begin
        --     if rising_edge(clk) then
        --         if write_en = '1' then
        --             reg_bank1(to_integer(unsigned(write_port_addr))) <= write_data;
        --             reg_bank2(to_integer(unsigned(write_port_addr))) <= write_data;
        --         end if;
        --     end if;
        -- end process;

        -- Read_Data_Proc: process(read_port_addr1, read_port_addr2)begin
        --     if (to_integer(unsigned(read_port_addr1)) = 0) then
        --         read_data1 <= (others => '0');
        --     else
        --         read_data1 <= reg_bank1(to_integer(unsigned(read_port_addr1)));
        --     end if;

        --     if (to_integer(unsigned(read_port_addr2)) = 0) then
        --         read_data2 <= (others => '0');
        --     else
        --         read_data2 <= reg_bank1(to_integer(unsigned(read_port_addr2)));
        --     end if;
        -- end process;

        process(clk)begin
            if rising_edge(clk)then
                if write_en = '1'then
                    reg_bank1(to_integer(unsigned(write_port_addr))) <= write_data;
                end if;
            end if;
        end process;

        read_data1 <= x"0000_0000"when to_integer(unsigned(read_port_addr1)) = 0 else reg_bank1(to_integer(unsigned(read_port_addr1)));
        read_data2 <= x"0000_0000"when to_integer(unsigned(read_port_addr2)) = 0 else reg_bank1(to_integer(unsigned(read_port_addr2)));
      
        
        end rtl;