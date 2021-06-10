

bit_obj=./A0_level1/top_A2_Y1_Z1_recombined_partial.bit


all: $(bit_obj)


$(bit_obj):../script/generate_all_bitstreams.tcl
	./run.sh $<



clean:
	rm -rf ./A* *.log *.rpt *.jou ./.Xil  ./A1 ./hd_visual 
