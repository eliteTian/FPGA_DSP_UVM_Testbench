`ifndef THF_APB_SEQUENCE_SIMPLE_SV
  `define THF_APB_SEQUENCE_SIMPLE_SV

class thf_apb_sequence_simple extends thf_apb_sequence_base;
  rand thf_apb_item_drv item;
  `uvm_object_utils(thf_apb_sequence_simple)
  
  function new(string name ="");
    super.new(name);
    item = thf_apb_item_drv::type_id::create("item");
  endfunction
  
  virtual task body();
    //start_item(item);
    //finish_item(item);
    
    //`uvm_do(item);
    `uvm_send(item);
  endtask
  
endclass
  
  `endif