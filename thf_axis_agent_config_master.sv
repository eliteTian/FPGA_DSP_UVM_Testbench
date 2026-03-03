`ifndef THF_AXIS_AGENT_CONFIG_MASTER_SV
  `define THF_AXIS_AGENT_CONFIG_MASTER_SV

  class thf_axis_agent_config_master#(int unsigned DATA_WIDTH = 32) extends thf_axis_agent_config#(DATA_WIDTH);
    
    `uvm_component_param_utils(thf_axis_agent_config_master#(DATA_WIDTH))

    function new(string name = "", uvm_component parent);
      super.new(name, parent);
    endfunction

  endclass

`endif