`ifndef THF_AXIS_ITEM_BASE_SV
	`define THF_AXIS_ITEM_BASE_SV

class thf_axis_item_base extends uvm_sequence_item;

  `uvm_object_utils(thf_axis_item_base)
  function new(string name = "");
    super.new(name);
  endfunction
 
endclass

`endif