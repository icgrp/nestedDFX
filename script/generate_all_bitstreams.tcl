#Define first and second order Reconfigurable Partitions
set firstRP1 "A0_level1"
set secondRP1 "A1_level2"
set secondRP2 "A2_level2"

#Create folders for storing full, first-order and second-order bitstreams
file mkdir ./$firstRP1
file mkdir ./$secondRP1
file mkdir ./$secondRP2

#Generate a full bitstream for power-on configuration, and frist order partial bistreams for shifters
puts "#HD: Generating full and partial bitstreams for shift_right functions"
open_checkpoint ../level1_impl/top_static/top_A0_route.dcp
write_bitstream -force -no_partial_bitfile ./$firstRP1/top_A0.bit
write_bitstream -force -cell flooplan_static_i/reconfig_inst_0/inst ./$firstRP1/A0_partial.bit
puts "	#HD: Completed"
close_project

#Generate a full bitstream for power-on configuration, and second order partial bistreams for shifters
puts "#HD: Generating full and partial bitstreams for shift_right functions"
open_checkpoint ../level2_impl/A1/top_A1_W1_X1_route.dcp
write_bitstream -force -no_partial_bitfile ./$secondRP1/top_A1_W1_X1.bit
write_bitstream -force -cell flooplan_static_i/reconfig_inst_0/inst/inst_shift_upper ./$secondRP1/W1_partial.bit
write_bitstream -force -cell flooplan_static_i/reconfig_inst_0/inst/inst_shift_lower ./$secondRP1/X1_partial.bit
puts "	#HD: Completed"
close_project

#Generate more second-order partial bitstreams for shifters
puts "#HD: Generating partial bitstreams for shift_left functions"
open_checkpoint ../level2_impl/A1/top_A1_W2_X2_route.dcp
write_bitstream -force -cell flooplan_static_i/reconfig_inst_0/inst/inst_shift_upper ./$secondRP1/W2_partial.bit
write_bitstream -force -cell flooplan_static_i/reconfig_inst_0/inst/inst_shift_lower ./$secondRP1/X2_partial.bit
puts "	#HD: Completed"
close_project

#Generate first-order partial bitstreams for shift functions
puts "#HD: Generating partial bitstreams for inst_RP/shift level"
open_checkpoint ../level2_impl/A1/top_A1_W1_X1_recombined.dcp
write_bitstream -force -cell flooplan_static_i/reconfig_inst_0/inst ./$firstRP1/top_A1_W1_X1_recombined_partial.bit
puts "	#HD: Completed"
close_project


#Generate second-order partial bitstreams for counters
puts "#HD: Generating partial bitstreams for count_up functions"
open_checkpoint ../level2_impl/A2/top_A2_Y1_Z1_route.dcp
write_bitstream -force -cell flooplan_static_i/reconfig_inst_0/inst/inst_count_upper ./$secondRP2/Y1_partial.bit
write_bitstream -force -cell flooplan_static_i/reconfig_inst_0/inst/inst_count_lower ./$secondRP2/Z1_partial.bit
puts "	#HD: Completed"
close_project

#Generate more second-order partial bitstreams for counters
puts "#HD: Generating partial bitstreams for count_down functions"
open_checkpoint ../level2_impl/A2/top_A2_Y2_Z2_route.dcp
write_bitstream -force -cell flooplan_static_i/reconfig_inst_0/inst/inst_count_upper ./$secondRP2/Y2_partial.bit
write_bitstream -force -cell flooplan_static_i/reconfig_inst_0/inst/inst_count_lower ./$secondRP2/Z2_partial.bit
puts "	#HD: Completed"
close_project

#Generate first-order partial bitstreams for count functions
puts "#HD: Generating partial bitstreams for inst_RP/count level"
open_checkpoint ../level2_impl/A2/top_A2_Y1_Z1_recombined.dcp
write_bitstream -force -cell flooplan_static_i/reconfig_inst_0/inst ./$firstRP1/top_A2_Y1_Z1_recombined_partial.bit
puts "	#HD: Completed"
close_project

