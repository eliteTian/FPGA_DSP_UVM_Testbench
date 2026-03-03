`ifndef THF_APB_DRIVER_SV
	`define THF_APB_DRIVER_SV
	
class thf_apb_driver extends uvm_driver#(.REQ(thf_apb_item_drv)) implements thf_apb_reset_handler;
  `uvm_component_utils(thf_apb_driver)
  thf_apb_agent_config agent_config;
  
  protected process process_drive_transactions;
  
  function new(string name ="", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    forever begin
      fork
        begin
          wait_reset_end();
          drive_transactions();
          disable fork;
          end
        join
    end
  endtask
  
  virtual task wait_reset_end();
    agent_config.wait_reset_end();
  endtask
  
  protected virtual task drive_transactions();
 
    fork
      begin
        process_drive_transactions = process::self();
        forever begin
          thf_apb_item_drv item;
          seq_item_port.get_next_item(item);
          drive_transaction(item);
          seq_item_port.item_done();
        end
      end
    join
  endtask
  
  protected virtual task drive_transaction(thf_apb_item_drv item);
     thf_apb_vif vif = agent_config.get_vif();
    `uvm_info("DEBUG", $sformatf("Driving \"%0s\" :%0s", item.get_full_name(), item.convert2string()), UVM_NONE)
    
    for(int i = 0; i < item.pre_drive_delay; i++) begin
      @(posedge vif.pclk);
    end
    @(posedge vif.pclk);    

  //  logic[31:0] i = item.pre_drive_delay;   
//     do begin
//       @(posedge vif.pclk);
//     end while (i--!=0);  
    //@(posedge vif.pclk);
    
    vif.psel <= 1; //Bug: psel not aligned to posedge of pclk
    //vif.penable <= 1; //this triggers assertion in the apb_if.sv
    vif.pwrite <= bit'(item.dir);
    vif.paddr <= item.addr;
    if(item.dir == THF_APB_WRITE) begin
      vif.pwdata <= item.data;
    end
    
    @(posedge vif.pclk)
    vif.penable <= 1;
    //vif.pwrite <= !vif.pwrite; //this triggers assertion
  
    @(posedge vif.pclk);
    while(vif.pready != 1) begin
      @(posedge vif.pclk);     
    end
    
    vif.psel <= 0;
    vif.penable <= 0;
    vif.pwdata <= 0;
    vif.pwrite <= 0;
    vif.paddr <= 0; 
    
    for(int i = 0; i < item.post_drive_delay; i++) begin
      @(posedge vif.pclk);
    end
    
  endtask
  
   virtual function void handle_reset(uvm_phase phase);
    thf_apb_vif vif = agent_config.get_vif();
    
    if(process_drive_transactions != null) begin
      process_drive_transactions.kill();
      process_drive_transactions = null;
      
    end
      
      
    vif.psel <= 0;
    vif.penable <= 0;
    vif.pwdata <= 0;
    vif.pwrite <= 0;
    vif.paddr <= 0; 
    
  endfunction
       
                                     

endclass


`endif