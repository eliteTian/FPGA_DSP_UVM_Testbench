`ifndef THF_AXIS_AGENT_MASTER_SV
  `define THF_AXIS_AGENT_MASTER_SV

class thf_axis_agent_master#(int unsigned DATA_WIDTH = 8) extends thf_axis_agent#(DATA_WIDTH, thf_axis_item_drv_master);
    
    `uvm_component_param_utils(thf_axis_agent_master#(DATA_WIDTH))

    function new(string name = "", uvm_component parent);
      super.new(name, parent);
      
      thf_axis_agent_config#(DATA_WIDTH)::type_id::set_inst_override(thf_axis_agent_config_master#(DATA_WIDTH)::get_type(), "agent_config", this);
      thf_axis_driver#(DATA_WIDTH, thf_axis_item_drv_master)::type_id::set_inst_override(thf_axis_driver_master#(DATA_WIDTH)::get_type(), "driver", this);
      thf_axis_sequencer_base#(thf_axis_item_drv_master)::type_id::set_inst_override(thf_axis_sequencer_master#(DATA_WIDTH)::get_type(), "sequencer", this);
    endfunction

  endclass

`endif