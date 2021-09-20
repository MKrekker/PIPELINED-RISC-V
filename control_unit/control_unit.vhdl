library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control_unit is
    port(
        --inputs
         op             : in std_logic_vector(6 downto 0);
         funct3         : in std_logic_vector(14 downto 12);
         funct7_5       : in std_logic;
        --outputs
        regwrite_d      : out std_logic;
        resultsrc_d     : out std_logic_vector(1 downto 0);
        memwrite_d      : out std_logic;
        jump_d          : out std_logic;
        branch_d        : out std_logic;
        alucontrol_d    : out std_logic_vector(2 downto 0);
        alusrc_d        : out std_logic;
        immsrc_d        : out std_logic_vector(1 downto 0)
    );
end control_unit;

architecture rtl of control_unit is

  
    signal ALUOp    : std_logic_vector(1 downto 0);

    begin
        inst_maindecoder : entity work.main_decoder(rtl)
            port map(
                op          => op,
                branch      => branch_d,
                jump        => jump_d,
                MemWrite    => memwrite_d,
                ALUSrc      => alusrc_d,
                ImmSrc      => immsrc_d,
                RegWrite    => regwrite_d,
                ALUOp       => ALUOp,
                ResultSrc   => resultsrc_d
            );

        inst_aludecoder : entity work.ALU_Decoder(rtl)
            port map(
                op5         => op(5),
                funct3      => funct3,
                funct7_5    => funct7_5,
                ALUOp       => ALUOp,
                ALUControl  => alucontrol_d
            );

    end rtl;
