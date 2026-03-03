`ifndef THF_AXIS_RESET_HANDLER_SV
  `define THF_AXIS_RESET_HANDLER_SV

interface class thf_axis_reset_handler;
  
     pure virtual function void handle_reset(uvm_phase phase);
    
    endclass

 `endif