

`ifndef THF_FPGA_DSP_TEST_PKG_SV
	`define THF_FPGA_DSP_TEST_PKG_SV

	`include "uvm_macros.svh"
	`include "thf_fpga_dsp_pkg.sv"

	package thf_fpga_dsp_test_pkg;
		import uvm_pkg::*;
		import thf_fpga_dsp_pkg::*;
		import thf_apb_pkg::*;
		import thf_axis_pkg::*;
		`include "thf_fpga_dsp_test_base.sv"
		`include "thf_fpga_dsp_test_reg_access.sv"
		`include "thf_fpga_dsp_test_random.sv"

		
	endpackage

`endif
