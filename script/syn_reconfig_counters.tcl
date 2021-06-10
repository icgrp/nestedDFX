set file_name reconfig_counters
set top reconfig_inst

add_files -norecurse ../source/hdl/$file_name.v
set_param general.maxThreads  8
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY XPM_FIFO} [current_project]
set logFileId [open ./runLog_$file_name.log "w"]
set start_time [clock seconds]
set_param general.maxThreads  8 
synth_design -top $top -part xczu9eg-ffvb1156-2-e -mode out_of_context
write_checkpoint -force ${file_name}.dcp
set end_time [clock seconds]
set total_seconds [expr $end_time - $start_time]
puts $logFileId "syn: $total_seconds seconds"
report_utilization -hierarchical > ${top}_utilization.rpt

