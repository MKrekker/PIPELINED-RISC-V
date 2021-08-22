library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity hazard_unit is
    port(
        --inputs
        pcsrc_e         : in std_logic;
        rs1_d           : in std_logic_vector(19 downto 15);
        rs2_d           : in std_logic_vector(24 downto 20);
        rd_e            : in std_logic_vector(11 downto 7);
        resultsrc_e0    : in std_logic;
        rs1_e           : in std_logic_vector(19 downto 15);
        rs2_e           : in std_logic_vector(24 downto 20);
        rd_m            : in std_logic_vector(11 downto 7);
        rd_w            : in std_logic_vector(11 downto 7);
        regwrite_w      : in std_logic;
        regwrite_m      : in std_logic;
        --outputs
        forward_ae      : out std_logic_vector(1 downto 0);
        forward_be      : out std_logic_vector(1 downto 0);
        stall_f         : out std_logic;
        stall_d         : out std_logic;
        flush_e         : out std_logic;
        flush_d         : out std_logic
    );
end hazard_unit;

architecture rtl of hazard_unit is
    
    signal lwStall : std_logic;

    begin
        --Forward to solve data hazards when possible
        process(rs1_e, rd_m, rd_w, regwrite_m, regwrite_w)begin

            --forwarding logic for SrcAE (forward_ae)
            if(((rs1_e = rd_m) and regwrite_m = '1') and (rs1_e /= b"00000")) then        --forward from memory stage
                forward_ae <= "10";
            elsif(((rs1_e = rd_w) and regwrite_w = '1') and (rs1_e /= b"00000")) then     -- forward from writeback stage
                forward_ae <= "01";
            else
                forward_ae <= "00";                                                 --no forwarding (use rf output)
            end if;
        end process;

        --forwarding logic for SrcBE (forward_be)
        process(rs2_e, rd_m, rd_w, regwrite_m, regwrite_w)begin

            --forwarding logic for SrcBE (forward_be)
            if(((rs2_e = rd_m) and regwrite_m = '1') and (rs2_e /= b"00000")) then        --forward from memory stage
                forward_be <= "10";
            elsif(((rs2_e = rd_w) and regwrite_w = '1') and (rs2_e /= b"00000")) then     -- forward from writeback stage
                forward_be <= "01";
            else
                forward_be <= "00";                                                 --no forwarding (use rf output)
            end if;
        end process;
        
        --Stall when a load hazard occurs
        process(rs1_d, rs2_d, rd_e, resultsrc_e0)begin
            
            if((rs1_d = rd_e) or (rs2_d = rd_e))then
                lwStall <= resultsrc_e0;
            else
                lwStall <= '0';
            end if;

            stall_f <= lwStall;
            stall_d <= lwStall;
            
        end process;

        --Flush when a branch is taken or a load introduces a bubble
        process(pcsrc_e, lwStall)begin
            flush_d <= pcsrc_e;
            flush_e <= lwStall or pcsrc_e;
        end process;
end rtl;