`ifndef THF_APB_SEQUENCE_BASE_SV
  `define THF_APB_SEQUENCE_BASE_SV

class thf_apb_sequence_base extends uvm_sequence#(.REQ(thf_apb_item_drv));
  `uvm_declare_p_sequencer(thf_apb_sequencer)
  `uvm_object_utils(thf_apb_sequence_base)
  function new(string name ="");
    super.new(name);
  endfunction
  
endclass

`endif