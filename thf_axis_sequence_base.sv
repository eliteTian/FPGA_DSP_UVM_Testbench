`ifndef THF_AXIS_SEQUENCE_BASE_SV
  `define THF_AXIS_SEQUENCE_BASE_SV

class thf_axis_sequence_base#(type ITEM_DRV = thf_axis_item_drv) extends uvm_sequence#(.REQ(ITEM_DRV));
    
  `uvm_object_param_utils(thf_axis_sequence_base#(ITEM_DRV))
    
    function new(string name = "");
      super.new(name);
    endfunction

  endclass

`endif