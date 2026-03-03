`include "thf_fpga_dsp_test_pkg.sv"
module testbench();
  
  import uvm_pkg::*;
  import thf_fpga_dsp_test_pkg::*;
  
  reg clk;
  initial begin
    clk = 0;
    
    forever begin
      clk = #5ns ~clk;
    end
  end
  

  //Instance of the APB interface
  thf_apb_if apb_if(.pclk(clk));  
  //Instance of the AXIS master interface
  thf_axis_if axis_rx_if(.aclk(clk)); 
  
  initial begin
    apb_if.preset_n = 1;
    axis_rx_if.aresetn = 1;
    #3ns;
    apb_if.preset_n = 0;
    axis_rx_if.aresetn = 0;
    #30ns;
    apb_if.preset_n = 1;
    axis_rx_if.aresetn = 1;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    uvm_config_db#(virtual thf_apb_if)::set(null,"uvm_test_top.env.apb_agent", "vif", apb_if);
    uvm_config_db#(virtual thf_axis_if#(`THF_AXIS_MAX_DATA_WIDTH))::set(null,"uvm_test_top.env.axis_rx_agent", "vif", axis_rx_if);
    run_test("");
  end

  
  
   fpga_dsp fpga_dsp_u(
//     .clk(clk),
//     .rstn(apb_if.preset_n),
    .apb_slave_pclk			(apb_if.pclk), 
    .apb_slave_presetn		(apb_if.preset_n),     
    .apb_slave_paddr		(apb_if.paddr),
    .apb_slave_pwrite		(apb_if.pwrite),
    .apb_slave_psel			(apb_if.psel),
    .apb_slave_penable		(apb_if.penable),
    .apb_slave_pwdata		(apb_if.pwdata),
    .apb_slave_prdata		(apb_if.prdata),
    .apb_slave_pready		(apb_if.pready),
    .apb_slave_pslverr		(apb_if.pslverr),
  
     .axis4_s_aclk			(axis_rx_if.aclk),
     .axis4_s_aresetn		(axis_rx_if.aresetn),
     .axis4_s_tdata			(axis_rx_if.tdata),
     .axis4_s_tready		(axis_rx_if.tready),
     .axis4_s_tvalid		(axis_rx_if.tvalid),
     .axis4_s_tlast			(axis_rx_if.tlast)        
  );

  
endmodule