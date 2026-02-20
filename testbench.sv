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
  
  initial begin
    apb_if.preset_n = 1;
    #3ns;
    apb_if.preset_n = 0;
    #30ns;
    apb_if.preset_n = 1;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    uvm_config_db#(virtual thf_apb_if)::set(null,"uvm_test_top.env.apb_agent", "vif", apb_if);
    run_test("");
  end

  
  
   fpga_dsp fpga_dsp_u(
    .clk(clk),
    .rstn(apb_if.preset_n),
    .apb_slave_paddr(apb_if.paddr),
    .apb_slave_pwrite(apb_if.pwrite),
    .apb_slave_psel(apb_if.psel),
    .apb_slave_penable(apb_if.penable),
    .apb_slave_pwdata(apb_if.pwdata),
    .apb_slave_prdata(apb_if.prdata),
    .apb_slave_pready(apb_if.pready),
    .apb_slave_pslverr(apb_if.pslverr)
  );

  
endmodule