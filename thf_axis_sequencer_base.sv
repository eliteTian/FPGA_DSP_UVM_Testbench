`ifndef THF_AXIS_SEQUENCER_BASE_SV
  `define THF_AXIS_SEQUENCER_BASE_SV

  class thf_axis_sequencer_base#(type ITEM_DRV = thf_axis_item_drv) extends uvm_sequencer#(.REQ(ITEM_DRV)) implements thf_axis_reset_handler;

    `uvm_component_param_utils(thf_axis_sequencer_base#(ITEM_DRV))

    function new(string name = "", uvm_component parent);
      super.new(name, parent);
    endfunction

    virtual function void handle_reset(uvm_phase phase);
      int objections_count;
      stop_sequences();

      objections_count = uvm_test_done.get_objection_count(this);

      if(objections_count > 0) begin
        uvm_test_done.drop_objection(this, $sformatf("Dropping %0d objections at reset", objections_count), objections_count);
      end

      start_phase_sequence(phase);
    endfunction
    
    virtual function int unsigned get_data_width();
      `uvm_fatal("ALGORITHM_ISSUE", "Implement get_data_width()")
    endfunction
    
  endclass

`endif