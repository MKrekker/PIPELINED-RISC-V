library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_de_tb is
end reg_de_tb;

architecture test of reg_de_tb is
    --inputs
    signal clk              : std_logic;
    signal regwrite_d       : std_logic;
    signal resultsrc_d      : std_logic_vector(1 downto 0);
    signal memwrite_d       : std_logic;
    signal jump_d           : std_logic;
    signal branch_d         : std_logic;
    signal alucontrol_d     : std_logic_vector(2 downto 0);
    signal alusrc_d         : std_logic;
    signal rd1              : std_logic_vector(31 downto 0);
    signal rd2              : std_logic_vector(31 downto 0);
    signal pc_d             : std_logic_vector(31 downto 0);
    signal rd_d             : std_logic_vector(11 downto 7);
    signal immext_d         : std_logic_vector(31 downto 0);
    signal pcplus4_d        : std_logic_vector(31 downto 0);
    signal clr_de           : std_logic;
    signal rs1_d            : std_logic_vector(4 downto 0);
    signal rs2_d            : std_logic_vector(4 downto 0);
    
    --outputs
    signal regwrite_e       : std_logic;
    signal resultsrc_e      : std_logic_vector(1 downto 0);
    signal memwrite_e       : std_logic;
    signal jump_e           : std_logic;
    signal branch_e         : std_logic;
    signal alucontrol_e     : std_logic_vector(2 downto 0);
    signal alusrc_e         : std_logic;
    signal rd1_e            : std_logic_vector(31 downto 0);
    signal rd2_e            : std_logic_vector(31 downto 0);
    signal pc_e             : std_logic_vector(31 downto 0);
    signal rd_e             : std_logic_vector(11 downto 7);
    signal immext_e         : std_logic_vector(31 downto 0);
    signal pcplus4_e        : std_logic_vector(31 downto 0);
    signal rs1_e            : std_logic_vector(4 downto 0);
    signal rs2_e            : std_logic_vector(4 downto 0);

    begin

        inst_reg_de : entity work.reg_de(rtl)
            port map(
                 clk            => clk,
                 regwrite_d     => regwrite_d,
                 resultsrc_d    => resultsrc_d,
                 memwrite_d     => memwrite_d,
                 jump_d         => jump_d,
                 branch_d       => branch_d,
                 alucontrol_d   => alucontrol_d,
                 alusrc_d       => alusrc_d,
                 rd1            => rd1,
                 rd2            => rd2,
                 pc_d           => pc_d,
                 rd_d           =>rd_d,
                 immext_d       => immext_d,
                 pcplus4_d      => pcplus4_d,
                 clr_de         => clr_de, 
                 rs1_d          => rs1_d,
                 rs2_d          => rs2_d,                
                --outputs
                 regwrite_e     => regwrite_e,
                 resultsrc_e    => resultsrc_e,
                 memwrite_e     => memwrite_e,
                 jump_e         => jump_e,
                 branch_e       => branch_e,
                 alucontrol_e   => alucontrol_e,
                 alusrc_e       => alusrc_e,
                 rd1_e          => rd1_e,
                 rd2_e          => rd2_e,
                 pc_e           => pc_e,
                 rd_e           => rd_e,
                 immext_e       => immext_e,
                 pcplus4_e      => pcplus4_e, 
                 rs1_e          => rs1_e,
                 rs2_e          => rs2_e
            );

            process begin
                clr_de  <= '1';
                clk     <= '1';
                wait for 5 ns;
                clk     <= '0';
                wait for 5 ns;
                clk     <= '1';
                clr_de  <= '0';
                wait for 5 ns;
                clk     <= '0';
                wait for 5 ns;
                clk     <= '1';
                wait for 5 ns;
                clk     <= '0';
                wait for 5 ns;
                clk     <= '1';
                wait for 5 ns;
                clk     <= '0';
                wait for 5 ns;
                clk     <= '1';
                wait for 5 ns;
                clk     <= '0';
                wait for 5 ns;
                clk     <= '1';
                wait for 5 ns;
                clk     <= '0';
                wait;
            end process;

            process begin 
                regwrite_d <= '0'; 
                resultsrc_d <= "00";
                memwrite_d <= '0';
                jump_d <= '0';
                branch_d <= '0';
                alucontrol_d <= "000";
                alusrc_d <= '0';
                rd1 <= x"FFFF_FFFF";
                rd2 <= x"0000_0000";
                pc_d <= x"0101_1010";
                rd_d <= b"01001";
                immext_d <= x"1010_0101";
                pcplus4_d <= x"0110_1001";
                rs1_d <= b"11110";
                rs2_d <= b"00011";
                rd_d  <= b"01010";
                wait for 12 ns;
                regwrite_d <= '1'; 
                resultsrc_d <= "01";
                memwrite_d <= '1';
                jump_d <= '1';
                branch_d <= '1';
                alucontrol_d <= "001";
                alusrc_d <= '1';
                rd1 <= x"FFFF_1FFF";
                rd2 <= x"0000_0100";
                pc_d <= x"0111_1010";
                rd_d <= b"01101";
                immext_d <= x"1110_0101";
                pcplus4_d <= x"1110_1001";
                wait for 25 ns;
                regwrite_d <= '0'; 
                resultsrc_d <= "10";
                memwrite_d <= '0';
                jump_d <= '0';
                branch_d <= '0';
                alucontrol_d <= "010";
                alusrc_d <= '0';
                rd1 <= x"FFFF_FF1F";
                rd2 <= x"1000_0000";
                pc_d <= x"0101_1011";
                rd_d <= b"11001";
                immext_d <= x"1110_0101";
                pcplus4_d <= x"0110_1011";
                wait;
            end process;

        end test;