

dcp_obj1=./A1/top_A1_W1_X1_recombined.dcp
dcp_obj2=./A2/top_A2_Y1_Z1_recombined.dcp


all: $(dcp_obj1) $(dcp_obj2)


$(dcp_obj1):../script/implement_A1_level2.tcl 
	./run.sh $<

$(dcp_obj2):../script/implement_A2_level2.tcl
	./run.sh $<


clean:
	rm -rf  *.log *.rpt *.jou ./.Xil ./A2 ./A1 ./hd_visual
