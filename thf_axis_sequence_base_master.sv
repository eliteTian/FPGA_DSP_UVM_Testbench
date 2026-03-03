`ifndef THF_AXIS_SEQUENCE_BASE_MASTER_SV
  `define THF_AXIS_SEQUENCE_BASE_MASTER_SV

  class thf_axis_sequence_base_master extends thf_axis_sequence_base#(.ITEM_DRV(thf_axis_item_drv_master));
    
    `uvm_declare_p_sequencer(thf_axis_sequencer_base_master)
    
    `uvm_object_utils(thf_axis_sequence_base_master)
    
    function new(string name = "");
      super.new(name);
    endfunction

  endclass

`endif