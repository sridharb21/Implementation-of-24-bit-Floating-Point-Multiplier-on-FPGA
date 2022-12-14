create_clock -period 10.000 -name clk -waveform {0.000 5.000} [get_ports clk]
set_input_delay -clock [get_clocks clk] -min -add_delay 0.000 [get_ports {a[*]}]
set_input_delay -clock [get_clocks clk] -max -add_delay 0.000 [get_ports {a[*]}]
set_output_delay -clock [get_clocks clk] -min -add_delay 0.000 [get_ports {exponent[*]}]
set_output_delay -clock [get_clocks clk] -max -add_delay 0.000 [get_ports {exponent[*]}]
