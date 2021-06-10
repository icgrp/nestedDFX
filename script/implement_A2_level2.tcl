set loc "./A2"
set part xczu9eg-ffvb1156-2-e



file delete -force $loc
file mkdir $loc
file mkdir $loc/reports
open_checkpoint ../level1_impl/top_static/top_A0_locked.dcp
puts "#HD: Subdividing inst_RP into second-order counter RPs"
pr_subdivide -cell flooplan_static_i/reconfig_inst_0/inst -subcells {flooplan_static_i/reconfig_inst_0/inst/inst_count_upper flooplan_static_i/reconfig_inst_0/inst/inst_count_lower} ../synthesis/reconfig_counters.dcp
write_checkpoint -force $loc/top_A2_Y_Z_divided.dcp
puts "	#HD: Completed"
close_project



puts "#HD: Running implementation count_up_count_up"
create_project -in_memory -part $part > $loc/create_project.log
add_file $loc/top_A2_Y_Z_divided.dcp
add_file ../synthesis/count_up.dcp
set_property SCOPED_TO_CELLS {flooplan_static_i/reconfig_inst_0/inst/inst_count_upper flooplan_static_i/reconfig_inst_0/inst/inst_count_lower} [get_files ../synthesis/count_up.dcp]
add_files ../source/xdc/sub_A2.xdc
set_property USED_IN {implementation} [get_files ../source/xdc/sub_A2.xdc]
set_property PROCESSING_ORDER LATE [get_files ../source/xdc/sub_A2.xdc]
link_design -mode default -reconfig_partitions {flooplan_static_i/reconfig_inst_0/inst/inst_count_upper flooplan_static_i/reconfig_inst_0/inst/inst_count_lower} -part $part -top flooplan_static_wrapper
write_checkpoint -force $loc/top_A2_Y1_Z1_link.dcp > $loc/write_checkpoint.log
opt_design > $loc/top_A2_Y1_Z1_opt.log
puts "	#HD: Completed: opt_design"
write_checkpoint -force $loc/top_A2_Y1_Z1_opt.dcp > $loc/write_checkpoint.log
place_design > $loc/top_A2_Y1_Z1_place.log
puts "	#HD: Completed: place_design"
write_checkpoint -force $loc/top_A2_Y1_Z1_place.dcp > $loc/write_checkpoint.log
phys_opt_design > $loc/top_A2_Y1_Z1_phys_opt.log
puts "	#HD: Completed: phys_opt_design"
write_checkpoint -force $loc/top_A2_Y1_Z1_phys_opt.dcp > $loc/write_checkpoint.log
route_design > $loc/top_A2_Y1_Z1_routed.log
puts "	#HD: Completed: route_design" 
write_checkpoint -force $loc/top_A2_Y1_Z1_route.dcp > $loc/write_checkpoint.log
write_checkpoint -force -cell flooplan_static_i/reconfig_inst_0/inst/inst_count_upper $loc/A2_Y1_Z1_upper_RM.dcp
write_checkpoint -force -cell flooplan_static_i/reconfig_inst_0/inst/inst_count_lower $loc/A2_Y1_Z1_lower_RM.dcp
report_utilization -file $loc/reports/top_A2_Y1_Z1_utilization_route.rpt > $loc/temp.log
report_route_status -file $loc/reports/top_A2_Y1_Z1_route_status.rpt > $loc/temp.log
report_timing_summary -delay_type min_max -report_unconstrained -check_timing_verbose -max_paths 10 -input_pins -file $loc/reports/top_A2_Y1_Z1_timing_summary.rpt > $loc/temp.log
debug::report_design_status > $loc/reports/top_A2_Y1_Z1_tstatus.rpt
report_drc -ruledeck bitstream_checks -name top -file $loc/reports/top_A2_Y1_Z1_drc_bitstream_checks.rpt > $loc/reports/temp.log

update_design -black_box -cell flooplan_static_i/reconfig_inst_0/inst/inst_count_upper
update_design -black_box -cell flooplan_static_i/reconfig_inst_0/inst/inst_count_lower
lock_design -level routing
write_checkpoint -force $loc/top_A2_Y1_Z1_locked.dcp
close_project


puts "#HD: Running implementation count_down_count_down"
create_project -in_memory -part $part > $loc/create_project.log
add_file $loc/top_A2_Y1_Z1_locked.dcp
add_file ../synthesis/count_down.dcp
set_property SCOPED_TO_CELLS {flooplan_static_i/reconfig_inst_0/inst/inst_count_upper flooplan_static_i/reconfig_inst_0/inst/inst_count_lower} [get_files ../synthesis/count_down.dcp]
link_design -mode default -reconfig_partitions {flooplan_static_i/reconfig_inst_0/inst/inst_count_upper flooplan_static_i/reconfig_inst_0/inst/inst_count_lower} -part $part -top flooplan_static_wrapper
write_checkpoint -force $loc/top_A2_Y2_Z2_link.dcp > $loc/write_checkpoint.log
opt_design > $loc/top_A2_Y2_Z2_opt.log
puts "	#HD: Completed: opt_design"
write_checkpoint -force $loc/top_A2_Y2_Z2__opt.dcp > $loc/write_checkpoint.log
place_design > $loc/top_A2_Y2_Z2_place.log
puts "	#HD: Completed: place_design"
write_checkpoint -force $loc/top_A2_Y2_Z2__place.dcp > $loc/write_checkpoint.log
phys_opt_design > $loc/top_A2_Y2_Z2_phys_opt.log
puts "	#HD: Completed: phys_opt_design"
write_checkpoint -force $loc/top_A2_Y2_Z2_phys_opt.dcp > $loc/write_checkpoint.log
route_design > $loc/top_A2_Y2_Z2_route.log
puts "	#HD: Completed: route_design" 
write_checkpoint -force $loc/top_A2_Y2_Z2_route.dcp > $loc/write_checkpoint.log
write_checkpoint -force -cell flooplan_static_i/reconfig_inst_0/inst/inst_count_upper $loc/A2_Y2_Z2_upper_RM.dcp
write_checkpoint -force -cell flooplan_static_i/reconfig_inst_0/inst/inst_count_lower $loc/A2_Y2_Z2_lower_RM.dcp
report_utilization -file $loc/reports/top_A2_Y2_Z2_utilization_route.rpt > $loc/temp.log
report_route_status -file $loc/reports/top_A2_Y2_Z2_route_status.rpt > $loc/temp.log
report_timing_summary -delay_type min_max -report_unconstrained -check_timing_verbose -max_paths 10 -input_pins -file $loc/reports/top_A2_Y2_Z2_timing_summary.rpt > $loc/temp.log
debug::report_design_status > $loc/reports/top_A2_Y2_Z2_design_status.rpt
report_drc -ruledeck bitstream_checks -name top -file $loc/reports/top_A2_Y2_Z2_drc_bitstream_checks.rpt > $loc/reports/temp.log
close_project

puts "#HD: Recombining inst_RP/counters"
open_checkpoint $loc/top_A2_Y1_Z1_route.dcp
pr_recombine -cell flooplan_static_i/reconfig_inst_0/inst
write_checkpoint -force $loc/top_A2_Y1_Z1_recombined.dcp
puts "	#HD: Completed"
close_project
