

xsa_obj=./prj/floorplan_static.vitis/flooplan_static_wrapper.xsa


all: $(xsa_obj)


$(xsa_obj):../script/xsa_gen.tcl
	./run.sh $^



clean:
	rm -rf  *.log *.rpt *.jou ./.Xil ./prj
