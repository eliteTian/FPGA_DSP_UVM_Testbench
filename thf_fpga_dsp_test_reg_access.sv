


`ifndef THF_FPGA_DSP_TEST_REG_ACCESS_SV
	`define THF_FPGA_DSP_TEST_REG_ACCESS_SV

	class thf_fpga_dsp_test_reg_access extends thf_fpga_dsp_test_base;
      `uvm_component_utils(thf_fpga_dsp_test_reg_access)
      function new(string name = "", uvm_component parent);
        super.new(name,parent);
      endfunction
      
      virtual task run_phase(uvm_phase phase);
        phase.raise_objection(this,"TEST_DONE");
        `uvm_info("DEBUG","start of test", UVM_LOW)
        #100ns;
        
       
//          fork
        begin   
//           begin
//             thf_apb_vif vif = env.apb_agent.agent_config.get_vif();
//             repeat(3) begin
//               @(posedge vif.psel);
//             end
            
//             #11ns;
//             vif.preset_n <= 0;
//             repeat(4) begin
//               @(posedge vif.pclk);
//             end
            
//             vif.preset_n <= 1;
//           end
          
//           begin
//             thf_apb_sequence_simple seq_simple = thf_apb_sequence_simple::type_id::create("seq_simple");
            
//             void'(seq_simple.randomize() with { 
//               item.addr =='h0;
//               item.dir == THF_APB_WRITE;
//               item.data == 'h11;
//             });
//             seq_simple.start(env.apb_agent.sequencer);
            
//           end

          begin
            thf_apb_sequence_rw seq_rw = thf_apb_sequence_rw::type_id::create("seq_rw");
            void'(seq_rw.randomize() with { 
              addr =='hC;
            });   
            seq_rw.start(env.apb_agent.sequencer);
          end


//          join
           end
        
//           begin 
//             thf_apb_sequence_random seq_random = thf_apb_sequence_random::type_id::create("seq_random"); 			  
//             void'(seq_random.randomize() with { num_item ==3; }); 
//             seq_random.start(env.apb_agent.sequencer); 
//           end      
        

      
        `uvm_info("DEBUG","end of test", UVM_LOW)       
        phase.drop_objection(this,"TEST_DONE");
      endtask
      
	endclass

`endif

