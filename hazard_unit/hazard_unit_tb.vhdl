library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hazard_unit_tb is
end hazard_unit_tb;

architecture test of hazard_unit_tb is
    --signals
    signal pcsrc_e         : std_logic;
    signal rs1_d           : std_logic_vector(19 downto 15);
    signal rs2_d           : std_logic_vector(24 downto 20);
    signal rd_e            : std_logic_vector(11 downto 7);
    signal resultsrc_e0    : std_logic;
    signal rs1_e           : std_logic_vector(19 downto 15);
    signal rs2_e           : std_logic_vector(24 downto 20);
    signal rd_m            : std_logic_vector(11 downto 7);
    signal rd_w            : std_logic_vector(11 downto 7);
    signal regwrite_w      : std_logic;
    signal regwrite_m      : std_logic;
    signal forward_ae      : std_logic_vector(1 downto 0);
    signal forward_be      : std_logic_vector(1 downto 0);
    signal stall_f         : std_logic;
    signal stall_d         : std_logic;
    signal flush_e         : std_logic;
    signal flush_d         : std_logic;

    begin
        --instantiation hazard unit
        inst_hazard_unit : entity work.hazard_unit(rtl)
            port map(
                 pcsrc_e        => pcsrc_e,
                 rs1_d          => rs1_d,
                 rs2_d          => rs2_d,
                 rd_e           => rd_e,
                 resultsrc_e0   => resultsrc_e0,
                 rs1_e          => rs1_e,
                 rs2_e          => rs2_e,
                 rd_m           => rd_m,
                 rd_w           => rd_w,
                 regwrite_w     => regwrite_w,
                 regwrite_m     => regwrite_m,
                 forward_ae     => forward_ae,
                 forward_be     => forward_be,
                 stall_f        => stall_f,
                 stall_d        => stall_d,
                 flush_e        => flush_e,
                 flush_d        => flush_d
            );
        process begin
            pcsrc_e         <= '0';
            rs1_d           <= "00000";
            rs2_d           <= "00000";
            rd_e            <= "00000";
            resultsrc_e0    <= '0';
            rs1_e           <= "00000";
            rs2_e           <= "00000";
            rd_m            <= "00000";
            rd_w            <= "00000";
            regwrite_w      <= '0';
            regwrite_m      <= '0';
            wait for 5 ns;
            pcsrc_e         <= '1';
            rs1_d           <= "00001";
            rs2_d           <= "01000";
            rd_e            <= "00100";
            resultsrc_e0    <= '1';
            rs1_e           <= "00100";
            rs2_e           <= "00001";
            rd_m            <= "00001";
            rd_w            <= "00100";
            regwrite_w      <= '1';
            regwrite_m      <= '1';
            wait for 5 ns;
            pcsrc_e         <= '0';
            rs1_d           <= "10000";
            rs2_d           <= "00001";
            rd_e            <= "00100";
            resultsrc_e0    <= '0';
            rs1_e           <= "00010";
            rs2_e           <= "01000";
            rd_m            <= "00001";
            rd_w            <= "10000";
            regwrite_w      <= '1';
            regwrite_m      <= '1';
            wait for 5 ns;
            pcsrc_e         <= '1';
            rs1_d           <= "00010";
            rs2_d           <= "00100";
            rd_e            <= "01000";
            resultsrc_e0    <= '1';
            rs1_e           <= "00000";
            rs2_e           <= "00010";
            rd_m            <= "01000";
            rd_w            <= "00001";
            regwrite_w      <= '0';
            regwrite_m      <= '0';
            wait;
        end process;
        
    end test;