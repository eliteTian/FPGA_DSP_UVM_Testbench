`ifndef THF_AXIS_DRIVER_MASTER_SV
  `define THF_AXIS_DRIVER_MASTER_SV

class thf_axis_driver_master#(int unsigned DATA_WIDTH = 8) extends thf_axis_driver#(.DATA_WIDTH(DATA_WIDTH), .ITEM_DRV(thf_axis_item_drv_master));

  typedef virtual thf_axis_if#(DATA_WIDTH) thf_axis_vif;

    `uvm_component_param_utils(thf_axis_driver_master#(DATA_WIDTH))

    function new(string name = "", uvm_component parent);
      super.new(name, parent);
    endfunction

    //Task which drives one single item on the bus
    protected virtual task drive_transaction(thf_axis_item_drv_master item);
      
      thf_axis_vif vif = agent_config.get_vif();
      
      int unsigned data_width_in_bytes = DATA_WIDTH / 8;

      `uvm_info("DEBUG", $sformatf("Driving \"%0s\": %0s", item.get_full_name(), item.convert2string()), UVM_NONE)
      

      for(int i = 0; i < item.pre_drive_delay; i++) begin
        @(posedge vif.aclk);
      end

      vif.tvalid  <= 1;
  
      begin
        bit[DATA_WIDTH-1:0] data = 0;
        
        foreach(item.data[idx]) begin
          bit[DATA_WIDTH-1:0] temp = item.data[idx] << ((idx) * 8);
          
          data = data | temp;
        end
        
        vif.tdata <= data;
      end
      
      @(posedge vif.aclk);
      `uvm_info("DEBUG", $sformatf("Waiting for tready \"%0s\": %0s", item.get_full_name(), item.convert2string()), UVM_NONE) 
//       while(vif.tready !== 1) begin
//         @(posedge vif.aclk);
//       end
      `uvm_info("DEBUG", $sformatf("tready asserted \"%0s\": %0s", item.get_full_name(), item.convert2string()), UVM_NONE) 
      vif.tvalid  <= 0;
      vif.tdata   <= 0;

      
      for(int i = 0; i < item.post_drive_delay; i++) begin
        @(posedge vif.aclk);
      end
         
    endtask

    //Function to handle the reset
    virtual function void handle_reset(uvm_phase phase);
      thf_axis_vif vif = agent_config.get_vif();
      super.handle_reset(phase);
      vif.tvalid  <= 0;
      vif.tdata   <= 0;     
    endfunction

  endclass

`endif