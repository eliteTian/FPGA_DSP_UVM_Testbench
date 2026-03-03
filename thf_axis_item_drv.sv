`ifndef THF_AXIS_ITEM_DRV_SV
  `define THF_AXIS_ITEM_DRV_SV

  class thf_axis_item_drv extends thf_axis_item_base;

    `uvm_object_utils(thf_axis_item_drv)

    function new(string name = "");
      super.new(name);
    endfunction

  endclass

`endif