library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux_3_tb is
end mux_3_tb;

architecture test of mux_3_tb is

    signal port_in1 :  std_logic_vector(7 downto 0); 
    signal port_in2 :  std_logic_vector(7 downto 0);
    signal port_in3 :  std_logic_vector(7 downto 0);
    signal sel      :  std_logic_vector(1 downto 0);
    signal port_out :  std_logic_vector(7 downto 0);

    begin
        inst_mux3 : entity work.mux_3(rtl)
            port map(
                port_in1 => port_in1,
                port_in2 => port_in2,
                port_in3 => port_in3,
                port_out => port_out,
                sel => sel
            );
        process begin
            sel <= "00";
            
            wait for 5 ns;
            sel <= "01";
            
            wait for 5 ns;
            sel <= "10";
            
            wait for 5 ns;
            sel <= "11";
            wait;
        end process;
        port_in1 <= x"12";
        port_in2 <= x"56";
        port_in3 <= x"AB";
        end test;
