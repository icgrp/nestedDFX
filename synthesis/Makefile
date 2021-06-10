

dcp_obj=shift_left.dcp shift_right.dcp reconfig_shifters.dcp reconfig_counters.dcp count_up.dcp count_down.dcp


all: $(dcp_obj)


$(dcp_obj):%.dcp:../script/syn_%.tcl
	./run.sh $<



clean:
	rm -rf ./$(dcp_obj) *.log *.rpt *.jou ./.Xil
