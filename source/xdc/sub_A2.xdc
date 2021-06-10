
create_pblock pblock_sub_1
add_cells_to_pblock [get_pblocks pblock_sub_1] [get_cells -quiet [list flooplan_static_i/reconfig_inst_0/inst/inst_count_upper]]
resize_pblock [get_pblocks pblock_sub_1] -add {SLICE_X37Y305:SLICE_X48Y414}
resize_pblock [get_pblocks pblock_sub_1] -add {DSP48E2_X7Y122:DSP48E2_X8Y165}
resize_pblock [get_pblocks pblock_sub_1] -add {RAMB18_X5Y122:RAMB18_X6Y165}
resize_pblock [get_pblocks pblock_sub_1] -add {RAMB36_X5Y61:RAMB36_X6Y82}
set_property SNAPPING_MODE ON [get_pblocks pblock_sub_1]
set_property IS_SOFT FALSE [get_pblocks pblock_sub_1]


create_pblock pblock_sub_2
add_cells_to_pblock [get_pblocks pblock_sub_2] [get_cells -quiet [list flooplan_static_i/reconfig_inst_0/inst/inst_count_lower]]
resize_pblock [get_pblocks pblock_sub_2] -add {SLICE_X56Y305:SLICE_X67Y414}
resize_pblock [get_pblocks pblock_sub_2] -add {DSP48E2_X12Y122:DSP48E2_X13Y165}
resize_pblock [get_pblocks pblock_sub_2] -add {RAMB18_X7Y122:RAMB18_X8Y165}
resize_pblock [get_pblocks pblock_sub_2] -add {RAMB36_X7Y61:RAMB36_X8Y82}
set_property SNAPPING_MODE ON [get_pblocks pblock_sub_2]
set_property IS_SOFT FALSE [get_pblocks pblock_sub_2]
