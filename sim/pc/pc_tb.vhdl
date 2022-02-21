library ieee;
use ieee.std_logic_1164.all;

entity pc_tb is
end pc_tb;
architecture test of pc_tb is
  signal clk : std_logic;
  signal reset : std_logic;
  signal PC_cur : std_logic_vector(31 downto 0);
  signal PCNext : std_logic_vector(31 downto 0);
  signal en : std_logic;
  component pc is
    port (
      --inputs
      PCNext : in std_logic_vector(31 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      en : in std_logic;
      --output
      PC_cur : buffer std_logic_vector(31 downto 0)
    );
  end component;
begin
  inst_pc : pc
  port map(
    PC_cur => PC_cur,
    PCNext => PCNext,
    clk => clk,
    reset => reset,
    en => en
  );

  process begin
    reset <= '1';
    en <= '0';
    clk <= '1';
    wait for 5 ns;
    en <= '1';
    reset <= '0';
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
    clk <= '0';
    wait;
  end process;
  process begin
    PCNext <= "00001111010110101111000000111100";
    wait for 5 ns;
    PCNext <= "00001111010110101111000000111000";
    wait for 5 ns;
    PCNext <= "00001111010110101111000000111100";
    wait for 5 ns;
    PCNext <= "00001111010110101111000000111001";
    wait;
  end process;
end test;