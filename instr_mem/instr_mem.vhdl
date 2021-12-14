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











     mem(0) <= x"ff810113";
     mem(1) <= x"00812423";
     mem(2) <= x"00810413";
     mem(3) <= x"00400913";
     mem(4) <= x"ff242c23";
     mem(5) <= x"00600913";
     mem(6) <= x"ff242e23";
     mem(7) <= x"ffc42503";
     mem(8) <= x"ff842583";
     mem(9) <= x"00810113";
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

  --mem(0) <= x"12345537"; --addi x2, x0, 2
  --mem(1) <= x"67850513"; --addi x3, x0, 5
  --mem(3) <= x"00f00693";
  --mem(4) <= x"00b6d2b3";
  --mem(5) <= x"0012f293";
  --mem(6) <= x"00550533";
--  mem(7) <= x"00158593";
  --mem(8) <= x"feb618e3";
  --mem(9) <= x"00a00733";
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
--processing element
      --  mem(0) <= x"ff010113";
      --  mem(1) <= x"00812823";
      --  mem(2) <= x"01010413";
    --    mem(3) <= x"00400913";
      --  mem(4) <= x"ff242823";
      --  mem(5) <= x"00600913";
      --  mem(6) <= x"ff242a23";
      --  mem(7) <= x"00b00913";
      --  mem(8) <= x"ff242c23";
      --  mem(9) <= x"01100913";
      --  mem(10) <= x"ff242e23";
    --    mem(11) <= x"00000f13";
      --  mem(12) <= x"ffc42503";
      --  mem(13) <= x"ff842583";
    --    mem(14) <= x"02000613";
      --  mem(15) <= x"00000293";
    --    mem(16) <= x"00000313";
      --  mem(17) <= x"02300693";
      --  mem(18) <= x"fff5c593";
    --    mem(19) <= x"00b54533";
      --  mem(20) <= x"00c30c63";
    --    mem(21) <= x"00655e33";
      --  mem(22) <= x"001e7393";
      --  mem(23) <= x"007282b3";
      --  mem(24) <= x"00130313";
      --  mem(25) <= x"fedff0ef";
      --  mem(26) <= x"00500533";
      --  mem(27) <= x"00151513";
      --  mem(28) <= x"fe050293";
      --  mem(29) <= x"005f0f33";
      --  mem(30) <= x"00df4663";
      --  mem(31) <= x"00100e93";
      --  mem(32) <= x"010000ef";
      --  mem(33) <= x"00000e93";
      --  mem(34) <= x"ff840413";
      --  mem(35) <= x"fa5ff0ef";
      --  mem(36) <= x"01010113";










        process(addr_instr)begin
            rd_instr <= mem(to_integer(unsigned(addr_instr(31 downto 2))));
        end process;
    end rtl;
