library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity main_decoder is
    port(
         op         : in std_logic_vector(6 downto 0);
         branch     : out std_logic;
         jump       : out std_logic;
         MemWrite   : out std_logic;
         ALUSrc     : out std_logic_vector(1 downto 0);
         ImmSrc     : out std_logic_vector(1 downto 0);
         RegWrite   : out std_logic;
         ALUOp      : out std_logic_vector(1 downto 0);
         ResultSrc  : out std_logic_vector(1 downto 0)
    );
end main_decoder;

architecture rtl of main_decoder is
    signal controls : std_logic_vector(11 downto 0);
    begin
        process(op)begin
            case op is
                when "0000011" => controls <= "100010010000"; --lw
                when "0100011" => controls <= "001011--0000"; --sw
                when "0110011" => controls <= "1--000000100"; --R-type
                when "1100011" => controls <= "010000--1010"; --beq
                when "0010011" => controls <= "100010000100"; --I-type ALU
                when "1101111" => controls <= "111--0100--1"; --jal
                when "0110111" => controls <= "1--100000000"; --U-type
                when others    => controls <= "------------"; --undefined for other cases
            end case;
        end process;

        RegWrite    <= controls(11);
        ImmSrc      <= controls(10 downto 9);
        ALUSrc      <= controls(8 downto 7);
        MemWrite    <= controls(6);
        ResultSrc   <= controls(5 downto 4);
        branch      <= controls(3);
        ALUOp       <= controls(2 downto 1);
        jump        <= controls(0);

    end rtl;
