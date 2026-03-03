`ifndef THF_AXIS_TEST_RANDOM_SV
  `define THF_AXIS_TEST_RANDOM_SV

  class thf_axis_test_random extends thf_fpga_dsp_test_base;

    `uvm_component_utils(thf_axis_test_random)
    
    function new(string name = "", uvm_component parent);
      super.new(name, parent);
    endfunction
    
    virtual task run_phase(uvm_phase phase);
      phase.raise_objection(this, "TEST_DONE");
      
      #(100ns);
      
//       fork
//         begin
//           thf_axis_sequence_slave_response_forever seq = cfs_md_sequence_slave_response_forever::type_id::create("seq");
          
//           seq.start(env.md_tx_agent.sequencer);
//         end
//       join_none
      
      repeat(100) begin
        thf_axis_sequence_simple_master seq_simple = thf_axis_sequence_simple_master::type_id::create("seq_simple");
        seq_simple.set_sequencer(env.axis_rx_agent.sequencer);

        void'(seq_simple.randomize());

        seq_simple.start(env.axis_rx_agent.sequencer);
      end
      
      #(500ns);
      
      `uvm_info("DEBUG", "this is the end of the test", UVM_LOW)
      
      phase.drop_objection(this, "TEST_DONE"); 
    endtask
    
  endclass

`endif