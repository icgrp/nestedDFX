

all: generate_bit

generate_bit: level2_implementation
	$(MAKE) -C bitstreams all

level1_implementation: vivado_dfx_proj out_of_context_syn
	$(MAKE) -C level1_impl all

level2_implementation: level1_implementation 
	$(MAKE) -C level2_impl all -j8

out_of_context_syn:
	$(MAKE) -C synthesis all -j8

vivado_dfx_proj:
	$(MAKE) -C dfx_prj all

xsa4vitis:
	$(MAKE) -C xsa_prj all 


clean:
	$(MAKE) -C bitstreams clean
	$(MAKE) -C level1_impl clean
	$(MAKE) -C level2_impl clean
	$(MAKE) -C synthesis clean
	$(MAKE) -C dfx_prj clean
	$(MAKE) -C xsa_prj clean 


