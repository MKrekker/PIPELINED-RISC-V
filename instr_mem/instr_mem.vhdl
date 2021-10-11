library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instr_mem is
    port(
        addr_instr : in std_logic_vector(31 downto 0);
        rd_instr : buffer std_logic_vector(31 downto 0)
    );
end instr_mem;

architecture rtl of instr_mem is

    type romtype is array (63 downto 0) of std_logic_vector(31 downto 0);
    signal mem: romtype;

    begin
    --  mem(0) <= x"00000513";
    --  mem(1) <= x"00000593";
    --  mem(2) <= x"02000613";
    --  mem(3) <= x"000106b7";
    --  mem(4) <= x"fff68693";
    --  mem(5) <= x"00b6d2b3";
    --  mem(6) <= x"0012f293";
    --  mem(7) <= x"00550533";
    --  mem(8) <= x"00158593";
    --  mem(9) <= x"fec598e3";
      --mem(0) <= x"00000513";
    --  mem(1) <= x"05200593";
    --  mem(2) <= x"00100e93";
    --  mem(3) <= x"00200f13";
    --  mem(4) <= x"400002b7";
  --    mem(5) <= x"00000333";
    --  mem(6) <= x"005363b3";
  --    mem(7) <= x"01d35333";
    --  mem(8) <= x"0075be33";
  --    mem(9) <= x"000e1663";
    --  mem(10) <= x"407585b3";
    --  mem(11) <= x"00536333";
    --  mem(12) <= x"01e2d2b3";
  --    mem(13) <= x"fe0292e3";
  --    mem(14) <= x"00600533";
  --    mem(15) <= x"00000063";

  mem(0) <= x"00000513"; --addi x2, x0, 2
  mem(1) <= x"00000593"; --addi x3, x0, 5
  mem(2) <= x"02000613";
  mem(3) <= x"00f00693";
  mem(4) <= x"00b6d2b3";
  mem(5) <= x"0012f293";
  mem(6) <= x"00550533";
  mem(7) <= x"00158593";
  mem(8) <= x"feb618e3";
  mem(9) <= x"00a00733";
--  mem(9) <= x"00150513";
--  mem(10) <= x"00150513";
--  mem(11) <= x"00150513";
--  mem(12) <= x"00150513";
--  mem(13) <= x"00150513";
--  mem(14) <= x"00150513";
--  mem(15) <= x"00150513";
--  mem(16) <= x"0ffff6b7";

      --mem(0) <= x"00000533"; --addi x2, x0, 2
      --mem(1) <= x"00150513"; --addi x3, x0, 5
      --mem(2) <= x"fea50ee3"; --add x4, x3, x2
        --mem(3) <= x"006282b3"; --sub x4, x4, x2
        --mem(4) <= x"00500533"; --sw x4, 38(x3)
        --mem(5) <= x"00628333"; --lw x2, 43(x0)
        --mem(6) <= x"00600533"; --and x5, x2, x4
        --mem(7) <= x"fe0008e3"; --or x6, x5, x2
        --mem(8) <= x"0075be33"; --slt x6, x6, x5
        --mem(9) <= x"000e1663"; --sw x6, 48(x5)
        --mem(10) <= x"407585b3";
        --mem(11) <= x"00536333";
        --mem(12) <= x"01e2d2b3";
        --mem(13) <= x"fe0292e3";
        --mem(14) <= x"00600533";
        --mem(15) <= x"00000063";












        process(addr_instr)begin
            rd_instr <= mem(to_integer(unsigned(addr_instr(31 downto 2))));
        end process;
    end rtl;
