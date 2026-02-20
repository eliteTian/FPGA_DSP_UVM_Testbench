`ifndef THF_APB_SEQUENCE_RW_SV
  `define THF_APB_SEQUENCE_RW_SV


class thf_apb_sequence_rw extends thf_apb_sequence_base;
  rand thf_apb_addr addr;
  rand thf_apb_data wr_data;
  `uvm_object_utils(thf_apb_sequence_rw)
  
  function new(string name ="");
    super.new(name);
  endfunction
  
  virtual task body();
//     thf_apb_item_drv item = thf_apb_item_drv::type_id::create("item");
//     void'(item.randomize() with {
//      dir == CFS_APB_READ;
//      addr == local::addr;
//     });
//     start_item(item);
//     finish_item(item);
    thf_apb_item_drv item;
    `uvm_do_with(item,{
      dir == THF_APB_WRITE;
      addr == local::addr; 
      //addr == 'h0; 
    })
     `uvm_do_with(item,{
      dir == THF_APB_READ;
      addr == local::addr; 
      //addr == 'h0; 
    })   
      
  endtask
  
endclass

`endif