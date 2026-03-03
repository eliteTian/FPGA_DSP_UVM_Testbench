`ifndef THF_AXIS_PKG_SV
	`define THF_AXIS_PKG_SV

	`include "uvm_macros.svh"
    `include "thf_axis_if.sv"
	package thf_axis_pkg;
		import uvm_pkg::*;
 		`include "thf_axis_types.sv"
 		`include "thf_axis_reset_handler.sv"
 		`include "thf_axis_agent_config.sv" 
 
        `include "thf_axis_item_base.sv"
        `include "thf_axis_item_drv.sv"
         `include "thf_axis_item_drv_master.sv"
//         `include "thf_axis_item_drv_slave.sv"
//         `include "thf_axis_item_mon.sv"
         `include "thf_axis_agent_config.sv"
//         `include "thf_axis_agent_config_slave.sv"
         `include "thf_axis_agent_config_master.sv"
//         `include "thf_axis_monitor.sv"
//         `include "thf_axis_coverage.sv"
         `include "thf_axis_sequencer_base.sv"
         `include "thf_axis_sequencer_base_master.sv"
         `include "thf_axis_sequencer_master.sv"
//         `include "thf_axis_sequencer_base_slave.sv"
//         `include "thf_axis_sequencer_slave.sv"
         `include "thf_axis_driver.sv"
         `include "thf_axis_driver_master.sv"
//         `include "thf_axis_driver_slave.sv"
         `include "thf_axis_agent.sv"      //20260224 building
//         `include "thf_axis_agent_slave.sv"
         `include "thf_axis_agent_master.sv"

         `include "thf_axis_sequence_base.sv"
//         `include "thf_axis_sequence_base_slave.sv"
         `include "thf_axis_sequence_base_master.sv"
         `include "thf_axis_sequence_simple_master.sv"
//         `include "thf_axis_sequence_simple_slave.sv"
//         `include "thf_axis_sequence_slave_response.sv"
//         `include "thf_axis_sequence_slave_response_forever.sv"
        endpackage

`endif