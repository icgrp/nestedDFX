set part xczu9eg-ffvb1156-2-e
set loc "./top_static"

file delete -force $loc
file mkdir $loc
file mkdir $loc/reports
puts "#HD: Running implementation top_static"
create_project -in_memory -part $part > $loc/create_project.log
add_files ../dfx_prj/top_A0_synthesized.dcp
add_file ../synthesis/reconfig_shifters.dcp
set_property SCOPED_TO_CELLS {flooplan_static_i/reconfig_inst_0/inst} [get_files ../synthesis/reconfig_shifters.dcp]
add_file ../synthesis/shift_right.dcp
set_property SCOPED_TO_CELLS {flooplan_static_i/reconfig_inst_0/inst/inst_shift_upper flooplan_static_i/reconfig_inst_0/inst/inst_shift_lower} [get_files ../synthesis/shift_right.dcp]
link_design -mode default -reconfig_partitions {flooplan_static_i/reconfig_inst_0/inst} -part $part -top flooplan_static_wrapper > $loc/top_link_design.log
write_checkpoint -force $loc/top_link_design.dcp > $loc/write_checkpoint.log

opt_design > $loc/top_opt_design.log
puts "	#HD: Completed: opt_design"
write_checkpoint -force $loc/top_A0_opt.dcp > $loc/write_checkpoint.log
place_design > $loc/top_place_design.log
puts "	#HD: Completed: place_design"
write_checkpoint -force $loc/top_A0_place.dcp > $loc/write_checkpoint.log
phys_opt_design > $loc/top_phys_opt_design.log
puts "	#HD: Completed: phys_opt_design"
write_checkpoint -force $loc/top_A0_phys_opt.dcp > $loc/write_checkpoint.log
route_design > $loc/top_route_design.log
puts "	#HD: Completed: route_design"
write_checkpoint -force $loc/top_A0_route.dcp > $loc/write_checkpoint.log
report_utilization -file $loc/reports/top_utilization_route_design.rpt > $loc/temp.log
report_route_status -file $loc/reports/top_route_status.rpt > $loc/temp.log
report_timing_summary -delay_type min_max -report_unconstrained -check_timing_verbose -max_paths 10 -input_pins -file $loc/reports/top_timing_summary.rpt > $loc/temp.log
debug::report_design_status > $loc/reports/top_design_status.rpt
report_drc -ruledeck bitstream_checks -name top -file $loc/reports/top_drc_bitstream_checks.rpt > $loc/reports/temp.log
puts "	#HD: Completed: report"
update_design -black_box -cell flooplan_static_i/reconfig_inst_0/inst
lock_design -level routing
write_checkpoint -force $loc/top_A0_locked.dcp
close_project
puts "	#HD: Completed"


