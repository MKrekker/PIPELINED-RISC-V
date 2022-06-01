library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
    port(
        SrcA : in std_logic_vector(31 downto 0);
        SrcB : in std_logic_vector(31 downto 0);
        ALUControl : in std_logic_vector(2 downto 0);
        Zero : out std_logic;
        aluresult : buffer std_logic_vector(31 downto 0)
    );
end alu;

architecture rtl of alu is

    begin
        process(SrcA, SrcB, ALUControl)begin
            case ALUControl is
                --add
                when "000" => aluresult <= std_logic_vector(unsigned(SrcA) + unsigned(SrcB));
                --branch
                when "001" => aluresult <= std_logic_vector(unsigned(SrcA) - unsigned(SrcB));
                --and
                when "010" => aluresult <= SrcA and SrcB;
                --or
                when "011" => aluresult <=  SrcA or SrcB;
                --srl
                when "100" => aluresult <= std_logic_vector(unsigned(SrcA) srl to_integer(unsigned(SrcB)));
                --xor
                when "110" => aluresult <= SrcA xor SrcB;
                --sll
                when "111" => aluresult <= std_logic_vector(unsigned(SrcA) sll to_integer(unsigned(SrcB)));
                --slt
                when "101" =>
                    if(SrcA < SrcB)then
                        aluresult <= x"00000001";
                    else
                    aluresult <= x"00000000";
                    end if;
                when others => aluresult <= (others => 'U');
                end case;
            end process;

            Zero <= '1' when ((aluresult = x"00000000") or (aluresult(31) = '1')) else '0';
    end rtl;
