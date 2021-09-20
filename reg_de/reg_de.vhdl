library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_de is
    port(

        --inputs
        clr_de          : in std_logic;
        clk             : in std_logic;
        regwrite_d      : in std_logic;
        resultsrc_d     : in std_logic_vector(1 downto 0);
        memwrite_d      : in std_logic;
        jump_d          : in std_logic;
        branch_d        : in std_logic;
        alucontrol_d    : in std_logic_vector(2 downto 0);
        alusrc_d        : in std_logic;
        rs1_d           : in std_logic_vector(19 downto 15);
        rs2_d           : in std_logic_vector(24 downto 20);
        rd1             : in std_logic_vector(31 downto 0);
        rd2             : in std_logic_vector(31 downto 0);
        pc_d            : in std_logic_vector(31 downto 0);
        rd_d            : in std_logic_vector(11 downto 7);
        immext_d        : in std_logic_vector(31 downto 0);
        pcplus4_d       : in std_logic_vector(31 downto 0);

        --outputs
        regwrite_e      : out std_logic;
        resultsrc_e     : out std_logic_vector(1 downto 0);
        memwrite_e      : out std_logic;
        jump_e          : out std_logic;
        branch_e        : out std_logic;
        alucontrol_e    : out std_logic_vector(2 downto 0);
        alusrc_e        : out std_logic;
        rd1_e           : out std_logic_vector(31 downto 0);
        rd2_e           : out std_logic_vector(31 downto 0);
        rs1_e           : out std_logic_vector(4 downto 0);
        rs2_e           : out std_logic_vector(4 downto 0);
        pc_e            : out std_logic_vector(31 downto 0);
        rd_e            : buffer std_logic_vector(11 downto 7);
        immext_e        : buffer std_logic_vector(31 downto 0);
        pcplus4_e       : out std_logic_vector(31 downto 0)
    );
end reg_de;

architecture rtl of reg_de is

    type ram_type_32 is array(4 downto 0) of std_logic_vector(31 downto 0);
    type ram_type_5 is array(2 downto 0) of std_logic_vector(4 downto 0);
    type ram_type_3 is array(0 downto 0) of std_logic_vector(2 downto 0);
    type ram_type_2 is array(0 downto 0) of std_logic_vector(1 downto 0);
    type ram_type_1 is array(4 downto 0) of std_logic;

    signal memory_32    : ram_type_32;
    signal memory_5     : ram_type_5;
    signal memory_3     : ram_type_3;
    signal memory_2     : ram_type_2;
    signal memory_1     : ram_type_1;

    begin
        process(clk, clr_de) begin
          if rising_edge(clk)then
            if(clr_de = '1')then
                memory_32   <= (others => (others => '0'));
                memory_5    <= (others => (others => '0'));
                memory_3    <= (others => (others => '0'));
                memory_2    <= (others => (others => '0'));
                memory_1    <= (others => '0');
            else 
              memory_32(0)    <= rd1;
              memory_32(1)    <= rd2;
              memory_32(2)    <= pc_d;
              memory_32(3)    <= immext_d;
              memory_32(4)    <= pcplus4_d;

              memory_5(0)     <= rs1_d;
              memory_5(1)     <= rs2_d;
              memory_5(2)     <= rd_d;

              memory_3(0)     <= alucontrol_d;

              memory_2(0)     <= resultsrc_d;

              memory_1(0)     <= regwrite_d;
              memory_1(1)     <= memwrite_d;
              memory_1(2)     <= jump_d;
              memory_1(3)     <= branch_d;
              memory_1(4)     <= alusrc_d;
            end if;
          end if;
        end process;
        rd1_e           <= memory_32(0);
        rd2_e           <= memory_32(1);
        pc_e            <= memory_32(2);
        immext_e        <= memory_32(3);
        pcplus4_e       <= memory_32(4);

        rs1_e           <= memory_5(0);
        rs2_e           <= memory_5(1);
        rd_e            <= memory_5(2);

        alucontrol_e    <= memory_3(0);

        resultsrc_e     <= memory_2(0);

        regwrite_e      <= memory_1(0);
        memwrite_e      <= memory_1(1);
        jump_e          <= memory_1(2);
        branch_e        <= memory_1(3);
        alusrc_e        <= memory_1(4);



    end rtl;
