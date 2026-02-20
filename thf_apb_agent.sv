`ifndef THF_APB_AGENT_SV
`define THF_APB_AGENT_SV

class thf_apb_agent extends uvm_agent implements thf_apb_reset_handler;
  
  thf_apb_agent_config agent_config;
  thf_apb_driver driver;  
  thf_apb_sequencer sequencer;
  thf_apb_monitor monitor;
  thf_apb_coverage coverage;

  
  `uvm_component_utils(thf_apb_agent)
  
  function new(string name ="", uvm_component parent);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent_config = thf_apb_agent_config::type_id::create("agent_config",this);
    monitor = thf_apb_monitor::type_id::create("monitor",this);
    
    if(agent_config.get_has_coverage()) begin
      coverage = thf_apb_coverage::type_id::create("coverage", this);
    end
      
    if(agent_config.get_active_passive() == UVM_ACTIVE) begin
      sequencer = thf_apb_sequencer::type_id::create("sequencer",this);
      driver = thf_apb_driver::type_id::create("driver",this);   
    end
  endfunction
  
  virtual function void connect_phase(uvm_phase phase);
    thf_apb_vif vif;
    super.connect_phase(phase);
    
    if(uvm_config_db#(thf_apb_vif)::get(this, "", "vif",vif) ==0) begin
      `uvm_fatal("APB_NO_VIF", "Could not get from the database the APB VIF")
    end else begin
      agent_config.set_vif(vif);
    end
    
    monitor.agent_config = agent_config;
    
    if(agent_config.get_active_passive() == UVM_ACTIVE) begin
      driver.agent_config = agent_config;
      driver.seq_item_port.connect(sequencer.seq_item_export);
    end
    
    if(agent_config.get_has_coverage()) begin
      coverage.agent_config = agent_config;
      monitor.output_port.connect(coverage.port_item);
    end
   
  endfunction
  
  virtual function void handle_reset(uvm_phase phase);
    uvm_component children[$];
    get_children(children);
    
    foreach(children[idx]) begin
      thf_apb_reset_handler reset_handler;
      
      if($cast(reset_handler, children[idx])) begin
        reset_handler.handle_reset(phase);
      end
    end
    
  endfunction
  
    
  virtual task wait_reset_start();
    agent_config.wait_reset_start();
  endtask
  
  virtual task wait_reset_end();
    agent_config.wait_reset_end();
  endtask 
  
  virtual task run_phase(uvm_phase phase);
    forever begin
      wait_reset_start();
      handle_reset(phase);
      wait_reset_end();
    end
  endtask
    
    
  
endclass

`endif
    