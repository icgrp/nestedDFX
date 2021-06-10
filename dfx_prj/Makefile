

dcp_obj=top_A0_synthesized.dcp


all: $(dcp_obj)


$(dcp_obj):../script/project_gen.tcl
	./run.sh $^



clean:
	rm -rf ./$(dcp_obj) *.log *.rpt *.jou ./.Xil ./prj
