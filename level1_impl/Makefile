

xsa_obj=./top_static/top_A0_route.dcp


all: $(xsa_obj)


$(xsa_obj):../script/implement_A0_level1.tcl
	./run.sh $^



clean:
	rm -rf  *.log *.rpt *.jou ./.Xil ./prj ./top_static ./hd_visual
