
create_pblock pblock_sub_1
add_cells_to_pblock [get_pblocks pblock_sub_1] [get_cells -quiet [list flooplan_static_i/reconfig_inst_0/inst/inst_shift_upper]]
resize_pblock [get_pblocks pblock_sub_1] -add {SLICE_X43Y365:SLICE_X52Y414}
resize_pblock [get_pblocks pblock_sub_1] -add {DSP48E2_X8Y146:DSP48E2_X10Y165}
resize_pblock [get_pblocks pblock_sub_1] -add {RAMB18_X6Y146:RAMB18_X6Y165}
resize_pblock [get_pblocks pblock_sub_1] -add {RAMB36_X6Y73:RAMB36_X6Y82}
set_property SNAPPING_MODE ON [get_pblocks pblock_sub_1]
set_property IS_SOFT FALSE [get_pblocks pblock_sub_1]


create_pblock pblock_sub_2
add_cells_to_pblock [get_pblocks pblock_sub_2] [get_cells -quiet [list flooplan_static_i/reconfig_inst_0/inst/inst_shift_lower]]
resize_pblock [get_pblocks pblock_sub_2] -add {SLICE_X43Y305:SLICE_X52Y354}
resize_pblock [get_pblocks pblock_sub_2] -add {DSP48E2_X8Y122:DSP48E2_X10Y141}
resize_pblock [get_pblocks pblock_sub_2] -add {RAMB18_X6Y122:RAMB18_X6Y141}
resize_pblock [get_pblocks pblock_sub_2] -add {RAMB36_X6Y61:RAMB36_X6Y70}
set_property SNAPPING_MODE ON [get_pblocks pblock_sub_2]
set_property IS_SOFT FALSE [get_pblocks pblock_sub_2]
