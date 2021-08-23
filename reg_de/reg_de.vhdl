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
    begin 
        process(clk) begin
            if(clr_de = '1')then
                regwrite_e      <= '0';
                resultsrc_e     <= (others => '0');
                memwrite_e      <= '0';
                jump_e          <= '0';
                branch_e        <= '0';
                alucontrol_e    <= (others => '0');
                alusrc_e        <= '0';
                rd1_e           <= (others => '0');
                rd2_e           <= (others => '0');
                pc_e            <= (others => '0');
                rd_e            <= (others => '0');
                immext_e        <= (others => '0');
                pcplus4_e       <= (others => '0');
                rs1_e           <= (others => '0');
                rs2_e           <= (others => '0');
            elsif rising_edge(clk)then
                regwrite_e      <= regwrite_d;
                resultsrc_e     <= resultsrc_d;
                memwrite_e      <= memwrite_d;
                jump_e          <= jump_d;
                branch_e        <= branch_d;
                alucontrol_e    <= alucontrol_d;
                alusrc_e        <= alusrc_d;
                rd1_e           <= rd1;
                rd2_e           <= rd2;
                rs1_e           <= rs1_d;
                rs2_e           <= rs2_d;
                pc_e            <= pc_d;
                rd_e            <= rd_d;
                immext_e        <= immext_d;
                pcplus4_e       <= pcplus4_d;
            end if;
        end process;
    end rtl;

