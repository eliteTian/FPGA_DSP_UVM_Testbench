`ifndef THF_FPGA_DSP_ENV_SV
	`define THF_FPGA_DSP_ENV_SV

	class thf_fpga_dsp_env#(int unsigned DATA_WIDTH = 8) extends uvm_env;
      //agent instantiated in env and created in build_phase
      thf_apb_agent apb_agent; 
      //AXIS RX agent handler
      thf_axis_agent_master#(DATA_WIDTH) axis_rx_agent;      
      
      `uvm_component_utils(thf_fpga_dsp_env)
      function new(string name = "", uvm_component parent);
        super.new(name,parent);
      endfunction  
      
      virtual function void build_phase(uvm_phase phase);
          super.build_phase(phase);
          apb_agent = thf_apb_agent::type_id::create("apb_agent",this);
          axis_rx_agent = thf_axis_agent_master#(DATA_WIDTH)::type_id::create("axis_rx_agent",this);
      endfunction
      
	endclass


`endif