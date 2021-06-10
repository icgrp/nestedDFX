set loc "./A1"
set part xczu9eg-ffvb1156-2-e



file delete -force $loc
file mkdir $loc
file mkdir $loc/reports
open_checkpoint ../level1_impl/top_static/top_A0_locked.dcp
puts "#HD: Subdividing inst_RP into second-order shifter RPs"
pr_subdivide -cell flooplan_static_i/reconfig_inst_0/inst -subcells {flooplan_static_i/reconfig_inst_0/inst/inst_shift_upper flooplan_static_i/reconfig_inst_0/inst/inst_shift_lower} ../synthesis/reconfig_shifters.dcp
write_checkpoint -force $loc/top_A1_W_X_divided.dcp
puts "	#HD: Completed"
close_project



puts "#HD: Running implementation shift_right_shift_right"
create_project -in_memory -part $part > $loc/create_project.log
add_file $loc/top_A1_W_X_divided.dcp
add_file ../synthesis/shift_right.dcp
set_property SCOPED_TO_CELLS {flooplan_static_i/reconfig_inst_0/inst/inst_shift_upper flooplan_static_i/reconfig_inst_0/inst/inst_shift_lower} [get_files ../synthesis/shift_right.dcp]
add_files ../source/xdc/sub_A1.xdc
set_property USED_IN {implementation} [get_files ../source/xdc/sub_A1.xdc]
set_property PROCESSING_ORDER LATE [get_files ../source/xdc/sub_A1.xdc]
link_design -mode default -reconfig_partitions {flooplan_static_i/reconfig_inst_0/inst/inst_shift_upper flooplan_static_i/reconfig_inst_0/inst/inst_shift_lower} -part $part -top flooplan_static_wrapper
write_checkpoint -force $loc/top_A1_W1_X1_link.dcp > $loc/write_checkpoint.log
opt_design > $loc/top_A1_W1_X1_opt.log
puts "	#HD: Completed: opt_design"
write_checkpoint -force $loc/top_A1_W1_X1_opt.dcp > $loc/write_checkpoint.log
place_design > $loc/top_A1_W1_X1_place.log
puts "	#HD: Completed: place_design"
write_checkpoint -force $loc/top_A1_W1_X1_place.dcp > $loc/write_checkpoint.log
phys_opt_design > $loc/top_A1_W1_X1_phys_opt.log
puts "	#HD: Completed: phys_opt_design"
write_checkpoint -force $loc/top_A1_W1_X1_phys_opt.dcp > $loc/write_checkpoint.log
route_design > $loc/top_A1_W1_X1_routed.log
puts "	#HD: Completed: route_design" 
write_checkpoint -force $loc/top_A1_W1_X1_route.dcp > $loc/write_checkpoint.log
write_checkpoint -force -cell flooplan_static_i/reconfig_inst_0/inst/inst_shift_upper $loc/A1_W1_X1_upper_RM.dcp
write_checkpoint -force -cell flooplan_static_i/reconfig_inst_0/inst/inst_shift_lower $loc/A1_W1_X1_lower_RM.dcp
report_utilization -file $loc/reports/top_A1_W1_X1_utilization_route.rpt > $loc/temp.log
report_route_status -file $loc/reports/top_A1_W1_X1_route_status.rpt > $loc/temp.log
report_timing_summary -delay_type min_max -report_unconstrained -check_timing_verbose -max_paths 10 -input_pins -file $loc/reports/top_A1_W1_X1_timing_summary.rpt > $loc/temp.log
debug::report_design_status > $loc/reports/top_A1_W1_X1_tstatus.rpt
report_drc -ruledeck bitstream_checks -name top -file $loc/reports/top_A1_W1_X1_drc_bitstream_checks.rpt > $loc/reports/temp.log

update_design -black_box -cell flooplan_static_i/reconfig_inst_0/inst/inst_shift_upper
update_design -black_box -cell flooplan_static_i/reconfig_inst_0/inst/inst_shift_lower
lock_design -level routing
write_checkpoint -force $loc/top_A1_W1_X1_locked.dcp
close_project


puts "#HD: Running implementation shift_left_shift_left"
create_project -in_memory -part $part > $loc/create_project.log
add_file $loc/top_A1_W1_X1_locked.dcp
add_file ../synthesis/shift_left.dcp
set_property SCOPED_TO_CELLS {flooplan_static_i/reconfig_inst_0/inst/inst_shift_upper flooplan_static_i/reconfig_inst_0/inst/inst_shift_lower} [get_files ../synthesis/shift_left.dcp]
link_design -mode default -reconfig_partitions {flooplan_static_i/reconfig_inst_0/inst/inst_shift_upper flooplan_static_i/reconfig_inst_0/inst/inst_shift_lower} -part $part -top flooplan_static_wrapper
write_checkpoint -force $loc/top_A1_W2_X2_link.dcp > $loc/write_checkpoint.log
opt_design > $loc/top_A1_W2_X2_opt.log
puts "	#HD: Completed: opt_design"
write_checkpoint -force $loc/top_A1_W2_X2__opt.dcp > $loc/write_checkpoint.log
place_design > $loc/top_A1_W2_X2_place.log
puts "	#HD: Completed: place_design"
write_checkpoint -force $loc/top_A1_W2_X2__place.dcp > $loc/write_checkpoint.log
phys_opt_design > $loc/top_A1_W2_X2_phys_opt.log
puts "	#HD: Completed: phys_opt_design"
write_checkpoint -force $loc/top_A1_W2_X2_phys_opt.dcp > $loc/write_checkpoint.log
route_design > $loc/top_A1_W2_X2_route.log
puts "	#HD: Completed: route_design" 
write_checkpoint -force $loc/top_A1_W2_X2_route.dcp > $loc/write_checkpoint.log
write_checkpoint -force -cell flooplan_static_i/reconfig_inst_0/inst/inst_shift_upper $loc/A1_W2_X2_upper_RM.dcp
write_checkpoint -force -cell flooplan_static_i/reconfig_inst_0/inst/inst_shift_lower $loc/A1_W2_X2_lower_RM.dcp
report_utilization -file $loc/reports/top_A1_W2_X2_utilization_route.rpt > $loc/temp.log
report_route_status -file $loc/reports/top_A1_W2_X2_route_status.rpt > $loc/temp.log
report_timing_summary -delay_type min_max -report_unconstrained -check_timing_verbose -max_paths 10 -input_pins -file $loc/reports/top_A1_W2_X2_timing_summary.rpt > $loc/temp.log
debug::report_design_status > $loc/reports/top_A1_W2_X2_design_status.rpt
report_drc -ruledeck bitstream_checks -name top -file $loc/reports/top_A1_W2_X2_drc_bitstream_checks.rpt > $loc/reports/temp.log
close_project

puts "#HD: Recombining inst_RP/shifters"
open_checkpoint $loc/top_A1_W1_X1_route.dcp
pr_recombine -cell flooplan_static_i/reconfig_inst_0/inst
write_checkpoint -force $loc/top_A1_W1_X1_recombined.dcp
puts "	#HD: Completed"
close_project
