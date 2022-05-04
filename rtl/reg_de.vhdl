library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg_de is
    port(

        --inputs
        clr_de          : in std_logic;
        clk             : in std_logic;
        regwrite_d      : in std_logic;
        resultsrc_d     : in std_logic_vector(1 downto 0);
        memwrite_d      : in std_logic;
        jump_d          : in std_logic;
        branch_d        : in std_logic;
        alucontrol_d    : in std_logic_vector(2 downto 0);
        alusrc_d        : in std_logic_vector(1 downto 0);
        rs1_d           : in std_logic_vector(19 downto 15);
        rs2_d           : in std_logic_vector(24 downto 20);
        rd1             : in std_logic_vector(31 downto 0);
        rd2             : in std_logic_vector(31 downto 0);
        pc_d            : in std_logic_vector(31 downto 0);
        rd_d            : in std_logic_vector(11 downto 7);
        immext_d        : in std_logic_vector(31 downto 0);
        pcplus4_d       : in std_logic_vector(31 downto 0);
        instr31_12_d    : in std_logic_vector(31 downto 12);

        --outputs
        regwrite_e      : out std_logic;
        resultsrc_e     : out std_logic_vector(1 downto 0);
        memwrite_e      : out std_logic;
        jump_e          : out std_logic;
        branch_e        : out std_logic;
        alucontrol_e    : out std_logic_vector(2 downto 0);
        alusrc_e        : out std_logic_vector(1 downto 0);
        rd1_e           : out std_logic_vector(31 downto 0);
        rd2_e           : out std_logic_vector(31 downto 0);
        rs1_e           : out std_logic_vector(4 downto 0);
        rs2_e           : out std_logic_vector(4 downto 0);
        pc_e            : out std_logic_vector(31 downto 0);
        rd_e            : buffer std_logic_vector(11 downto 7);
        immext_e        : buffer std_logic_vector(31 downto 0);
        instr31_12_e    : out std_logic_vector(31 downto 12);
        pcplus4_e       : out std_logic_vector(31 downto 0)
    );
end reg_de;

architecture rtl of reg_de is

    --type ram_type_32 is array(4 downto 0) of std_logic_vector(31 downto 0);
    --type ram_type_20 is array(0 downto 0) of std_logic_vector(31 downto 12);
    --type ram_type_5 is array(2 downto 0) of std_logic_vector(4 downto 0);
    --type ram_type_3 is array(0 downto 0) of std_logic_vector(2 downto 0);
    --type ram_type_2 is array(1 downto 0) of std_logic_vector(1 downto 0);
    --type ram_type_1 is array(3 downto 0) of std_logic;

    signal memory_32_0    : std_logic_vector(31 downto 0);
    signal memory_32_1    : std_logic_vector(31 downto 0);
    signal memory_32_2    : std_logic_vector(31 downto 0);
    signal memory_32_3    : std_logic_vector(31 downto 0);
    signal memory_32_4    : std_logic_vector(31 downto 0);
    signal memory_20      : std_logic_vector(19 downto 0);
    signal memory_5_0     : std_logic_vector(4 downto 0);
    signal memory_5_1     : std_logic_vector(4 downto 0);
    signal memory_5_2     : std_logic_vector(4 downto 0);
    signal memory_3       : std_logic_vector(2 downto 0);
    signal memory_2_0     : std_logic_vector(1 downto 0);
    signal memory_2_1     : std_logic_vector(1 downto 0);
    signal memory_1_0     : std_logic;
    signal memory_1_1     : std_logic;
    signal memory_1_2     : std_logic;
    signal memory_1_3     : std_logic;
    begin
        process(clk) begin
          if rising_edge(clk)then
            if(clr_de = '1')then
                memory_32_0   <= (others => '0');
            else
              memory_32_0    <= rd1;
            end if;
          end if;
        end process;
       
        process(clk) begin
          if rising_edge(clk)then
            if(clr_de = '1')then
                memory_32_1   <= (others => '0');
            else
              memory_32_1    <= rd2;
            end if;
          end if;
        end process;
        
        process(clk) begin
          if rising_edge(clk)then
            if(clr_de = '1')then
                memory_32_2   <= (others => '0');
            else
              memory_32_2    <= pc_d;
            end if;
          end if;
        end process;
        
        process(clk) begin
          if rising_edge(clk)then
            if(clr_de = '1')then
                memory_32_3   <= (others => '0');
            else
              memory_32_3    <= immext_d;
            end if;
          end if;
        end process;
        
        process(clk) begin
          if rising_edge(clk)then
            if(clr_de = '1')then
                memory_32_4   <= (others => '0');
            else
              memory_32_4    <= pcplus4_d;
            end if;
          end if;
        end process;
        
        process(clk) begin
          if rising_edge(clk)then
            if(clr_de = '1')then
                memory_20   <= (others => '0');
            else
              memory_20    <= instr31_12_d;
            end if;
          end if;
        end process;
        
        process(clk) begin
          if rising_edge(clk)then
            if(clr_de = '1')then
                memory_5_0    <= (others => '0');
            else
              memory_5_0     <= rs1_d;
            end if;
          end if;
        end process;
        
        process(clk) begin
          if rising_edge(clk)then
            if(clr_de = '1')then
                memory_5_1    <= (others => '0');
            else
              memory_5_1     <= rs2_d;
            end if;
          end if;
        end process;
        
        process(clk) begin
          if rising_edge(clk)then
            if(clr_de = '1')then
                memory_5_2    <= (others => '0');
            else
              memory_5_2     <= rd_d;
            end if;
          end if;
        end process;
        
        process(clk) begin
          if rising_edge(clk)then
            if(clr_de = '1')then
                memory_3    <= (others => '0');
            else
                memory_3     <= alucontrol_d;
            end if;
          end if;
        end process;
        
        process(clk) begin
          if rising_edge(clk)then
            if(clr_de = '1')then
                memory_2_0    <= (others => '0');
            else
              memory_2_0     <= resultsrc_d;
            end if;
          end if;
        end process;
        
        process(clk) begin                                 
          if rising_edge(clk)then                          
            if(clr_de = '1')then                           
                memory_2_1    <= (others => '0');
            else           
              memory_2_1     <= alusrc_d;                 
            end if;                                        
          end if;                                          
        end process;                                       
        
        process(clk) begin
          if rising_edge(clk)then
            if(clr_de = '1')then
                memory_1_0    <= '0';
            else
              memory_1_0     <= regwrite_d;
            end if;
          end if;
        end process;
        
        process(clk) begin
          if rising_edge(clk)then
            if(clr_de = '1')then
                memory_1_1    <= '0';
            else
              memory_1_1     <= memwrite_d;
            end if;
          end if;
        end process;
        
        process(clk) begin
          if rising_edge(clk)then
            if(clr_de = '1')then
              memory_1_2     <= '0';
            else
              memory_1_2     <= jump_d;
            end if;
          end if;
        end process;
        
        process(clk) begin
          if rising_edge(clk)then
            if(clr_de = '1')then
              memory_1_3    <= '0';
            else
              memory_1_3    <= branch_d;
            end if;
          end if;
        end process;
        
        
        rd1_e           <= memory_32_0;
        rd2_e           <= memory_32_1;
        pc_e            <= memory_32_2;
        immext_e        <= memory_32_3;
        pcplus4_e       <= memory_32_4;

        instr31_12_e    <= memory_20;

        rs1_e           <= memory_5_0;
        rs2_e           <= memory_5_1;
        rd_e            <= memory_5_2;

        alucontrol_e    <= memory_3;

        resultsrc_e     <= memory_2_0;
        alusrc_e        <= memory_2_1;

        regwrite_e      <= memory_1_0;
        memwrite_e      <= memory_1_1;
        jump_e          <= memory_1_2;
        branch_e        <= memory_1_3;
    end rtl;
