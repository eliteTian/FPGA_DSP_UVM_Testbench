`ifndef THF_FPGA_DSP_PKG_SV
	`define THF_FPGA_DSP_PKG_SV
	`include "uvm_macros.svh"
	`include "thf_apb_pkg.sv"
	package thf_fpga_dsp_pkg;
		import uvm_pkg::*;
		import thf_apb_pkg::*;
		`include "thf_fpga_dsp_env.sv"
	endpackage
`endif