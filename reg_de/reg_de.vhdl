library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_de is
    port(
        
        --inputs
        clk             : in std_logic;
        regwrite_d      : in std_logic;
        resultsrc_d     : in std_logic_vector(1 downto 0);
        memwrite_d      : in std_logic;
        jump_d          : in std_logic;
        branch_d        : in std_logic;
        alucontrol_d    : in std_logic_vector(2 downto 0);
        alusrc_d        : in std_logic;
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
        rd2_e           : buffer std_logic_vector(31 downto 0);
        pc_e            : out std_logic_vector(31 downto 0);
        rd_e            : out std_logic_vector(11 downto 7);
        immext_e        : buffer std_logic_vector(31 downto 0);
        pcplus4_e       : out std_logic_vector(31 downto 0)
    );
end reg_de;

architecture rtl of reg_de is
    begin 
        process(clk) begin
            if rising_edge(clk)then
                regwrite_e      <= regwrite_d;
                resultsrc_e     <= resultsrc_d;
                memwrite_e      <= memwrite_d;
                jump_e          <= jump_d;
                branch_e        <= branch_d;
                alucontrol_e    <= alucontrol_d;
                alusrc_e        <= alusrc_d;
                rd1_e           <= rd1;
                rd2_e           <= rd2;
                pc_e            <= pc_d;
                rd_e            <= rd_d;
                immext_e        <= immext_d;
                pcplus4_e       <= pcplus4_d;
            end if;
        end process;
    end rtl;

