library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity datapath_tb is
end datapath_tb;

architecture test of datapath_tb is
    signal clk                 :  std_logic;
    signal en_pc               :  std_logic;
    signal en_fd               :  std_logic;
    signal clr_fd              :  std_logic;
    signal clr_de              :  std_logic;
    signal pcsrc_e             :  std_logic;
    signal reset               :  std_logic;
    signal immsrc_d            :  std_logic_vector(1 downto 0);
    signal regwrite_d          :  std_logic;
    signal resultsrc_d         :  std_logic_vector(1 downto 0);
    signal memwrite_d          :  std_logic;
    signal jump_d              :  std_logic;
    signal branch_d            :  std_logic;
    signal alucontrol_d        :  std_logic_vector(2 downto 0);
    signal alusrc_d            :  std_logic;
    signal forward_ae          :  std_logic_vector(1 downto 0);
    signal forward_be          :  std_logic_vector(1 downto 0);

    --buffers
    signal rd_w                :  std_logic_vector(4 downto 0);
    signal regwrite_w          :  std_logic;
    signal rd_e                :  std_logic_vector(4 downto 0);
    signal regwrite_m          :  std_logic;
    signal rd_m                :  std_logic_vector(4 downto 0);
    signal instr_d             :  std_logic_vector(31 downto 0);
    --outputs
    signal jump_e              :  std_logic;
    signal branch_e            :  std_logic;
    signal zero_e              :  std_logic;
    signal rs1_e               :  std_logic_vector(4 downto 0);
    signal rs2_e               :  std_logic_vector(4 downto 0);
    signal resultsrc_e0        :  std_logic;
    begin
        
        inst_datapath : entity work.datapath(rtl)
            port map (
                clk             => clk,
                en_pc           => en_pc,
                en_fd           => en_fd,
                clr_fd          => clr_fd,
                clr_de          => clr_de,
                pcsrc_e         => pcsrc_e,
                reset           => reset,
                immsrc_d        => immsrc_d,
                regwrite_d      => regwrite_d,
                resultsrc_d     => resultsrc_d,
                memwrite_d      => memwrite_d,
                jump_d          => jump_d,
                branch_d        => branch_d,
                alucontrol_d    => alucontrol_d,
                alusrc_d        => alusrc_d,
                forward_ae      => forward_ae,
                forward_be      => forward_be,
                rd_w            => rd_w,
                regwrite_w      => regwrite_w,
                rd_e            => rd_e,
                regwrite_m      => regwrite_m,
                rd_m            => rd_m,
                instr_d         => instr_d,
                jump_e          => jump_e,
                branch_e        => branch_e,
                zero_e          => zero_e,
                rs1_e           => rs1_e,
                rs2_e           => rs2_e,
                resultsrc_e0    => resultsrc_e0
            );



            process begin
                -- reset
                clk   <= '0';
                reset <= '1';
                wait for 10 ns;
                clk   <= '1';
                reset <= '0';
                wait for 10 ns;
        
                -- do cycles
                for i in 1 to 26 loop
                clk <= '0';
                wait for 10 ns;
                clk <= '1';
                wait for 10 ns;
                end loop;
                wait;
            end process;
            process begin
                regwrite_d      <= '1';
                immsrc_d        <= "00";
                alusrc_d        <= '1';
                memwrite_d      <= '0';
                resultsrc_d     <= "00";
                branch_d        <= '0';
                jump_d          <= '0';
                alucontrol_d    <= "000";
                pcsrc_e         <= '0';
                en_pc           <= '0';
                en_fd           <= '0';
                clr_fd          <= '0';
                clr_de          <= '0';
                wait;
             end process;

    end test;