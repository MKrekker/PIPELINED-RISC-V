library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pipe_risc_v is
    port(
        clk : in std_logic;
        reset : in std_logic;
        instruction : out std_logic_vector(31 downto 0)
    );
end pipe_risc_v;

architecture rtl of pipe_risc_v is

    --signals
    signal regwrite_d       : std_logic;
    signal resultsrc_d      : std_logic_vector(1 downto 0);
    signal memwrite_d       : std_logic;
    signal jump_d           : std_logic;
    signal branch_d         : std_logic;
    signal alucontrol_d     : std_logic_vector(2 downto 0);
    signal alusrc_d         : std_logic;
    signal immsrc_d         : std_logic_vector(1 downto 0);
    signal zero             : std_logic;

    begin
        --instantiation datapath
        inst_datapath : entity work.datapath(rtl)
            port map(
                clk             => clk,
                reset           => rest,
                regwrite_d      => regwrite_d,
                resultsrc_d     => resultsrc_d,
                memwrite_d      => memwrite_d,
                jump_d          => jump_d,
                branch_d        => branch_d,
                alucontrol_d    => alucontrol_d,
                alusrc_d        => alusrc_d,
                immsrc_d        => immsrc_d,
                zero            => zero
            );
        --instantiation control unit
        inst_control_unit : entity work.control_unit(rtl)
            port map(
                op              => instruction(6 downto 0),
                funct3          => instruction(14 downto 12),
                funct7_5        => instruction(30),
                regwrite_d      => regwrite_d,
                resultsrc_d     => resultsrc_d,
                memwrite_d      => memwrite_d,
                jump_d          => jump_d,
                branch_d        => branch_d,
                alucontrol_d    => alucontrol_d,
                alusrc_d        => alusrc_d,
                immsrc_d        => immsrc_d
            );
    end rtl;