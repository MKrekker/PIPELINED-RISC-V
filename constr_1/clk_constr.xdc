#create_clock -period 10.000 -name clk_100MHz [get_ports clk]
#create_clock -period 6.66666 -name clk_150MHz [get_ports clk]
#create_clock -period 5.000 -name clk_200MHz [get_ports clk]
#create_clock -period 4.000 -name clk_250MHz [get_ports clk]
create_clock -period 3.33333 -name clk_300MHz [get_ports clk]#Timing constraints are not met