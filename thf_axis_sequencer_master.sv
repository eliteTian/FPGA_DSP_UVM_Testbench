`ifndef THF_AXIS_SEQUENCER_MASTER_SV
  `define THF_AXIS_SEQUENCER_MASTER_SV

class thf_axis_sequencer_master#(int unsigned DATA_WIDTH = 8) extends thf_axis_sequencer_base_master;

    `uvm_component_param_utils(thf_axis_sequencer_master#(DATA_WIDTH))

    function new(string name = "", uvm_component parent);
      super.new(name, parent);
    endfunction

    virtual function int unsigned get_data_width();
      return DATA_WIDTH;
    endfunction
    
  endclass

`endif