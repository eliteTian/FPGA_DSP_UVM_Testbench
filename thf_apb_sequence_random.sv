`ifndef THF_APB_SEQUENCE_RANDOM_SV 
`define THF_APB_SEQUENCE_RANDOM_SV 
class thf_apb_sequence_random extends thf_apb_sequence_base; 
  rand int unsigned num_item; 
  `uvm_object_utils(thf_apb_sequence_random) 
  constraint num_items_default 
  { soft num_item inside {[1:10]}; } 
  function new(string name =""); 
    super.new(name); 
  endfunction 
  virtual task body(); 
    for(int i = 0; i < num_item; i++) 
      begin thf_apb_sequence_simple seq = thf_apb_sequence_simple::type_id::create("seq");
        void'(seq.randomize()); seq.start(m_sequencer, this); 
      end 
  endtask 
endclass 
`endif