library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pipe_risc_v is
    port(
        clk : in std_logic;
        reset : in std_logic
    );
end pipe_risc_v;

architecture rtl of pipe_risc_v is

    --signals
    signal regwrite_d       : std_logic := '0';
    signal resultsrc_d      : std_logic_vector(1 downto 0) := "00";
    signal memwrite_d       : std_logic := '0';
    signal jump_d           : std_logic := '0';
    signal branch_d         : std_logic := '0';
    signal alucontrol_d     : std_logic_vector(2 downto 0) := "000";
    signal alusrc_d         : std_logic := '0';
    signal immsrc_d         : std_logic_vector(1 downto 0) := "00";
    signal zero             : std_logic := '0';
    signal jump_e           : std_logic := '0';
    signal branch_e         : std_logic := '0';
    signal pcsrc_e          : std_logic := '0';
    signal forward_ae       : std_logic_vector(1 downto 0) := "00";
    signal forward_be       : std_logic_vector(1 downto 0) := "00";
    signal en_pc            : std_logic := '0';
    signal en_fd            : std_logic := '0';
    signal clr_fd           : std_logic := '0';
    signal clr_de           : std_logic := '0';
    signal rd_e             : std_logic_vector(4 downto 0) := "00000";
    signal resultsrc_e0     : std_logic := '0';
    signal rs1_e            : std_logic_vector(4 downto 0) := "00000";
    signal rs2_e            : std_logic_vector(4 downto 0) := "00000";
    signal regwrite_m       : std_logic := '0';
    signal regwrite_w       : std_logic := '0';
    signal rd_m             : std_logic_vector(4 downto 0) := "00000";
    signal rd_w             : std_logic_vector(4 downto 0) := "00000";
    signal instr_d_o        : std_logic_vector(31 downto 0) := (others => '0');



    begin
        --instantiation datapath
        inst_datapath : entity work.datapath(rtl)
            port map(
                forward_ae          => forward_ae,
                forward_be          => forward_be,
                en_pc               => en_pc,
                en_fd               => en_fd,
                clr_fd              => clr_fd,
                clr_de              => clr_de,
                clk                 => clk,
                reset               => reset,
                pcsrc_e             => pcsrc_e,
                regwrite_d          => regwrite_d,
                resultsrc_d         => resultsrc_d,
                memwrite_d          => memwrite_d,
                jump_d              => jump_d,
                branch_d            => branch_d,
                alucontrol_d        => alucontrol_d,
                alusrc_d            => alusrc_d,
                immsrc_d            => immsrc_d,
                resultsrc_e0         => resultsrc_e0,
                regwrite_m          => regwrite_m,
                rd_m                => rd_m,
                rd_w                => rd_w,
                instr_d             => instr_d_o,
                zero_e              => zero,
                jump_e              => jump_e,
                branch_e            => branch_e,
                rs1_e               => rs1_e,
                rs2_e               => rs2_e,
                regwrite_w          => regwrite_w,
                rd_e                => rd_e
            );

        pcsrc_e <= (branch_e and zero) or jump_e ;

        --instantiation control unit
        inst_control_unit : entity work.control_unit(rtl)
            port map(
                op              => instr_d_o(6 downto 0),
                funct3          => instr_d_o(14 downto 12),
                funct7_5        => instr_d_o(30),
                regwrite_d      => regwrite_d,
                resultsrc_d     => resultsrc_d,
                memwrite_d      => memwrite_d,
                jump_d          => jump_d,
                branch_d        => branch_d,
                alucontrol_d    => alucontrol_d,
                alusrc_d        => alusrc_d,
                immsrc_d        => immsrc_d
            );

          --instantiation control unit
          inst_hazard_unit : entity work.hazard_unit(rtl)
            port map(
                pcsrc_e             => pcsrc_e,
                rs1_d               => instr_d_o(19 downto 15),
                rs2_d               => instr_d_o(24 downto 20),
                rd_e                => rd_e,
                resultsrc_e0        => resultsrc_e0,
                rs1_e               => rs1_e,
                rs2_e               => rs2_e,
                rd_m                => rd_m,
                rd_w                => rd_w,
                regwrite_w          => regwrite_w,
                regwrite_m          => regwrite_m,
                forward_ae          => forward_ae,
                forward_be          => forward_be,
                stall_f             => en_pc,
                stall_d             => en_fd,
                flush_e             => clr_fd,
                flush_d             => clr_de
            );
    end rtl;
