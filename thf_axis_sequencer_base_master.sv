`ifndef THF_AXIS_SEQUENCER_BASE_MASTER_SV
  `define THF_AXIS_SEQUENCER_BASE_MASTER_SV

  class thf_axis_sequencer_base_master extends thf_axis_sequencer_base#(.ITEM_DRV(thf_axis_item_drv_master));

    `uvm_component_utils(thf_axis_sequencer_base_master)

    function new(string name = "", uvm_component parent);
      super.new(name, parent);
    endfunction
  endclass

`endif