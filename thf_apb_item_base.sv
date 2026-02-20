`ifndef THF_APB_ITEM_BASE_SV
	`define THF_APB_ITEM_BASE_SV

class thf_apb_item_base extends uvm_sequence_item;
  rand thf_apb_dir dir;
  rand thf_apb_addr addr;
  rand thf_apb_data data;
  `uvm_object_utils(thf_apb_item_base)
  function new(string name = "");
    super.new(name);
  endfunction
  
  virtual function string convert2string();
    string result = $sformatf("dir: %0s, addr: %0x", dir.name(), addr);

    return result;
  endfunction
  
endclass

`endif