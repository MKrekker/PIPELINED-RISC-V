library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is
    port(
        SrcA : in std_logic_vector(31 downto 0);
        SrcB : in std_logic_vector(31 downto 0);
        ALUControl : in std_logic_vector(2 downto 0);
        Zero : out std_logic;
        ALUResult : buffer std_logic_vector(31 downto 0)
    );
end ALU;

architecture rtl of ALU is

    signal alu_res : std_logic_vector(31 downto 0);

    begin
        process(SrcA, SrcB, ALUControl)begin
            case ALUControl is
                --add
                when "000" => ALUResult <= std_logic_vector(unsigned(SrcA) + unsigned(SrcB));
                --sub
                when "001" => ALUResult <= std_logic_vector(unsigned(SrcA) - unsigned(SrcB));
                --and
                when "010" => ALUResult <= SrcA and SrcB;
                --or
                when "011" => ALUResult <=  SrcA or SrcB;
                --srl
                when "100" => ALUResult <= std_logic_vector(unsigned(SrcA) srl to_integer(unsigned(SrcB)));
                --xor
                when "110" => ALUResult <= SrcA xor SrcB;
                --sll
                when "111" => ALUResult <= std_logic_vector(unsigned(SrcA) sll to_integer(unsigned(SrcB)));
                --slt
                when "101" =>
                    if(SrcA < SrcB)then
                        ALUResult <= x"00000001";
                    else
                    ALUResult <= x"00000000";
                    end if;
                when others => ALUResult <= (others => 'U');
                end case;
            end process;

            Zero <= '1' when ALUResult = x"00000000" else '0';

            --ALUResult <= alu_res;
    end rtl;
