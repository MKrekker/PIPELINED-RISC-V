library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control_unit_tb is
end control_unit_tb;

architecture test of control_unit_tb is
    
   signal op               : std_logic_vector(6 downto 0);
   signal funct3           : std_logic_vector(14 downto 12);
   signal funct7_5         : std_logic;
    --outputs   
   signal regwrite_d       : std_logic;
   signal resultsrc_d      : std_logic_vector(1 downto 0);
   signal memwrite_d       : std_logic;
   signal jump_d           : std_logic;
   signal branch_d         : std_logic;
   signal alucontrol_d     : std_logic_vector(2 downto 0);
   signal alusrc_d         : std_logic;
   signal immsrc_d         : std_logic_vector(1 downto 0);

    begin

        inst_control_unit : entity work.control_unit(rtl)
            port map(
                op              => op,
                funct3          => funct3,
                funct7_5        => funct7_5,
                regwrite_d      => regwrite_d,
                resultsrc_d     => resultsrc_d,
                memwrite_d      => memwrite_d,
                jump_d          => jump_d,
                branch_d        => branch_d,
                alucontrol_d    => alucontrol_d,
                alusrc_d        => alusrc_d,
                immsrc_d        => immsrc_d
           );
        process begin
            op <= b"0000_011"; --ALUOp <="00"
            funct3 <= "---";
            funct7_5 <= '-'; 
            wait for 5 ns;
            op <= b"0100_011"; --ALUOp <="00"
            funct3 <= "---";
            funct7_5 <= '-';
            wait for 5 ns;
            op <= b"0110_011"; -- ALUOp <= "10"
            funct3 <= "000";
            funct7_5 <= '0';
            wait for 5 ns;
            op <= b"1100_011"; -- ALUOp <= "01"
            funct3 <= "---";
            funct7_5 <= '-';
            wait for 5 ns;
            wait;
        end process;

    end test;