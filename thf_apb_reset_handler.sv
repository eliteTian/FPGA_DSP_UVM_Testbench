`ifndef THF_APB_RESET_HANDLER_SV
  `define THF_APB_RESET_HANDLER_SV

interface class thf_apb_reset_handler;
  
  pure virtual function void handle_reset(uvm_phase phase);
    
    endclass

 `endif