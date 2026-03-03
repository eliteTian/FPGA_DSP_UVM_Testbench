

`ifndef THF_FPGA_DSP_TEST_BASE_SV
	`define THF_FPGA_DSP_TEST_BASE_SV

	class thf_fpga_dsp_test_base extends uvm_test;
      thf_fpga_dsp_env env;
      `uvm_component_utils(thf_fpga_dsp_test_base)
      function new(string name = "", uvm_component parent);
        super.new(name,parent);
      endfunction


	virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      env = thf_fpga_dsp_env#(`THF_AXIS_MAX_DATA_WIDTH)::type_id::create("env",this);
    endfunction
	endclass
`endif