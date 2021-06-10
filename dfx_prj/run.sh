#!/bin/bash -e

tcl_name=$1

#source /opt/Xilinx/Vivado/2020.2/settings64.sh
vivado -mode batch -source  ${tcl_name}
