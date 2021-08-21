library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity datapath is
    port(
        --inputs 
        pcsrc_e         : in std_logic;
        clk             : in std_logic;
        reset           : in std_logic;
        regwrite_d      : in std_logic;
        resultsrc_d     : in std_logic_vector(1 downto 0);
        memwrite_d      : in std_logic;
        jump_d          : in std_logic;
        branch_d        : in std_logic;
        alucontrol_d    : in std_logic_vector(2 downto 0);
        alusrc_d        : in std_logic;
        immsrc_d        : in std_logic_vector(1 downto 0);
        --output
        zero_e            : out std_logic

    );
end datapath;

architecture rtl of datapath is

    --internal signals
    signal pcplus4_f        : std_logic_vector(31 downto 0);
    signal pcplus4_d        : std_logic_vector(31 downto 0);
    signal pctarget_e       : std_logic_vector(31 downto 0);
    signal pcf_in           : std_logic_vector(31 downto 0);
    signal pcf_buf          : std_logic_vector(31 downto 0);
    signal rd_instr         : std_logic_vector(31 downto 0);
    signal instr_d          : std_logic_vector(31 downto 0);
    signal pc_d             : std_logic_vector(31 downto 0);
    signal rd_d             : std_logic_vector(4 downto 0);
    signal rd_w             : std_logic_vector(4 downto 0);
    signal result_w         : std_logic_vector(31 downto 0);
    signal regwrite_w       : std_logic;
    signal rd1              : std_logic_vector(31 downto 0);
    signal rd2              : std_logic_vector(31 downto 0);
    signal immext_d         : std_logic_vector(31 downto 0);
    signal regwrite_e       : std_logic;
    signal resultsrc_e      : std_logic_vector(1 downto 0);
    signal memwrite_e       : std_logic;
    signal jump_e           : std_logic;
    signal branch_e         : std_logic;
    signal alucontrol_e     : std_logic_vector(2 downto 0);
    signal alusrc_e         : std_logic;
    signal rd2_e            : std_logic_vector(31 downto 0);
    signal rd1_e            : std_logic_vector(31 downto 0);
    signal pc_e             : std_logic_vector(31 downto 0);
    signal rd_e             : std_logic_vector(4 downto 0);
    signal immext_e         : std_logic_vector(31 downto 0);
    signal pcplus4_e        : std_logic_vector(31 downto 0);
    signal srcb_e           : std_logic_vector(31 downto 0);
    signal aluresult        : std_logic_vector(31 downto 0);
    signal writedata_e      : std_logic_vector(31 downto 0);
    signal regwrite_m       : std_logic;      
    signal resultsrc_m      : std_logic_vector(1 downto 0);
    signal memwrite_m       : std_logic;
    signal aluresult_m      : std_logic_vector(31 downto 0);
    signal writedata_m      : std_logic_vector(31 downto 0);
    signal rd_m             : std_logic_vector(4 downto 0);
    signal pcplus4_m        : std_logic_vector(31 downto 0);
    signal rd_memr          : std_logic_vector(31 downto 0);     
    signal resultsrc_w      : std_logic_vector(1 downto 0);
    signal aluresult_w      : std_logic_vector(31 downto 0);
    signal readdata_w       : std_logic_vector(31 downto 0);
    signal pcplus4_w        : std_logic_vector(31 downto 0);
    
    begin
        --instantiation multiplexer 2 to 1
        inst_mux : entity work.mux_2(rtl)
            port map(
                port_in1    => pcplus4_f,
                port_in2    => pctarget_e,
                sel         => pcsrc_e,
                port_out    =>pcf_in
            );

        --instantiation program counter
        inst_pc : entity work.pc(rtl)
            port map(
                clk     => clk,
                reset   => reset,
                PCNext  => pcf_in,
                PC_cur   => pcf_buf 
            );

        --instantiation instruction memory
        inst_instr_mem : entity work.instr_mem(rtl)
            port map(
                addr_instr => pcf_buf,
                rd_instr => rd_instr
            );

        --instantiation adder +4
        inst_pcplus4 : entity work.PCPlus4(rtl)
            port map(
                a_in    => pcf_buf,
                b_in    => x"00000004",
                c_out   => pcplus4_f
            );

        --instantiation Register between fetch and decode
        inst_reg_fd : entity work.reg_fd(rtl)
            port map(
                clk         => clk,
                rd          => rd_instr,
                pc_f        => pcf_buf,
                pcplus4_f   => pcplus4_f,
                instr_d     => instr_d,
                pc_d        => pcf_buf,
                pcplus4_d   => pcplus4_d
            );

        --instantiation register file
        inst_reg_file : entity work.reg_file(rtl)
            port map(
                read_port_addr1     => instr_d(19 downto 15),
                read_port_addr2     => instr_d(24 downto 20),
                write_port_addr     => rd_w,
                write_data          => result_w,
                write_en            => regwrite_w,
                clk                 => clk,
                read_data1          => rd1,
                read_data2          => rd2
            );

        --instantiation extend
        inst_extend : entity work.extend(rtl)
            port map(
                ImmSrc => immsrc_d,
                instruction => instr_d(31 downto 7),
                ImmExt => immext_d
            );

        --instantiation Register between decode and execute
        inst_reg_de : entity work.reg_de(rtl)
            port map(
                clk             => clk,
                regwrite_d      => regwrite_d,
                resultsrc_d     => resultsrc_d,
                memwrite_d      => memwrite_d,
                jump_d          => jump_d,
                branch_d        => branch_d,
                alucontrol_d    => alucontrol_d,
                alusrc_d        => alusrc_d,
                rd1             => rd1,
                rd2             => rd2,
                pc_d            => pc_d,
                rd_d            => rd_d,
                immext_d        => immext_d,
                pcplus4_d       => pcplus4_d,
                regwrite_e      => regwrite_e,
                resultsrc_e     => resultsrc_e,
                memwrite_e      => memwrite_e,
                jump_e          => jump_e,
                branch_e        => branch_e,
                alucontrol_e    => alucontrol_e,
                alusrc_e        => alusrc_e,
                rd1_e           => rd1_e,
                rd2_e           => rd2_e,
                pc_e            => pc_e,
                rd_e            => rd_e,
                immext_e        => immext_e,
                pcplus4_e       => pcplus4_e
            );

            --instantiation multiplexer 2 to 1
            inst_mux_2 : entity work.mux_2(rtl)
                port map(
                    port_in1    => rd2_e,
                    port_in2    => immext_e,
                    sel         => alusrc_e,
                    port_out    => srcb_e
                );
            
            --instantiation adder
            inst_adder : entity work.adder(rtl)
                port map(
                    a_in    => pc_e,
                    b_in    => immext_e,
                    c_out   => pctarget_e
                );

            --instantiation ALU
            inst_alu : entity work.ALU(rtl)
                port map(
                    SrcA            => rd1_e,
                    SrcB            => srcb_e,
                    ALUControl      => alucontrol_e,
                    Zero            => zero_e,
                    ALUResult       => aluresult
                );
        
            --instantiation Register between execute and memory
            writedata_e <= rd2_e;
            inst_reg_em : entity work.reg_em(rtl)
                port map(
                    clk             => clk,
                    regwrite_e      => regwrite_e,
                    resultsrc_e     => resultsrc_e,
                    memwrite_e      => memwrite_e,
                    aluresult       => aluresult,
                    writedata_e     => writedata_e,
                    rd_e            => rd_e,
                    pcplus4_e       => pcplus4_e,
                    regwrite_m      => regwrite_m,      
                    resultsrc_m     => resultsrc_m,
                    memwrite_m      => memwrite_m,
                    aluresult_m     => aluresult_m,
                    writedata_m     => writedata_m,
                    rd_m            => rd_m,
                    pcplus4_m       => pcplus4_m
                );

            --instantiation data memory
            inst_data_memr : entity work.data_memr(rtl)
                port map(
                    addr_port       => aluresult_m,
                    write_data      => writedata_m,
                    clk             => clk,
                    write_en        => memwrite_m,
                    read_data       => rd_memr
                );

            --instantiation Register between memory and writeback
            inst_reg_mw : entity work.reg_mw(rtl)
                port map(
                    clk             => clk,
                    regwrite_m      => regwrite_m,
                    resultsrc_m     => resultsrc_m,
                    aluresult_m     => aluresult_m,
                    rd              => rd_memr,
                    rd_m            => rd_m,
                    pcplus4_m       => pcplus4_m,
                    regwrite_w      => regwrite_w,    
                    resultsrc_w     => resultsrc_w,
                    aluresult_w     => aluresult_w,
                    readdata_w      => readdata_w,
                    rd_w            => rd_w,
                    pcplus4_w       => pcplus4_w
                );

            --instantiation multiplexer 3 to 1
            inst_mux_3 : entity work.mux_3(rtl)
                port map(
                    port_in1    => aluresult_w, 
                    port_in2    => readdata_w,
                    port_in3    => pcplus4_w,
                    sel         => resultsrc_w,
                    port_out    => result_w
                );
    end rtl;