set_property PACKAGE_PIN C4 [get_ports led_1]
set_property IOSTANDARD LVCMOS33 [get_ports led_1]
set_property PACKAGE_PIN L5 [get_ports led_2]
set_property IOSTANDARD LVCMOS33 [get_ports led_2]
set_property PACKAGE_PIN H11 [get_ports sys_clk]
set_property IOSTANDARD LVCMOS33 [get_ports sys_clk]
set_property PACKAGE_PIN B6 [get_ports sys_rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports sys_rst_n]

set_property PACKAGE_PIN C5 [get_ports sw_1]
set_property IOSTANDARD LVCMOS33 [get_ports sw_1]

#set_property PACKAGE_PIN C5 [get_ports key_1]
#set_property IOSTANDARD LVCMOS33 [get_ports key_1]


set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]

create_clock -period 100.000 -name sys_clk -waveform {0.000 50.000} [get_ports sys_clk]
set_input_delay -clock [get_clocks sys_clk] -min -add_delay 4.000 [get_ports sys_rst_n]
set_input_delay -clock [get_clocks sys_clk] -max -add_delay 4.000 [get_ports sys_rst_n]
#set_input_delay -clock [get_clocks sys_clk] -min -add_delay 4.000 [get_ports sw_1]
#set_input_delay -clock [get_clocks sys_clk] -max -add_delay 4.000 [get_ports sw_1]

set_output_delay -clock [get_clocks sys_clk] -min -add_delay 0.000 [get_ports led_1]
set_output_delay -clock [get_clocks sys_clk] -max -add_delay 4.000 [get_ports led_1]
