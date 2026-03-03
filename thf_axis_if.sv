`ifndef THF_AXIS_IF_SV
	`define THF_AXIS_IF_SV

	`ifndef THF_AXIS_MAX_DATA_WIDTH
		`define THF_AXIS_MAX_DATA_WIDTH 8
	`endif
	interface thf_axis_if #(int unsigned DATA_WIDTH = 8)(input aclk);
      logic								  aresetn;
      logic 							  tvalid;
      logic								  tlast;
      logic 							  tready;
  	  logic [DATA_WIDTH-1:0] 			  tdata;
      bit has_checks;
      initial begin
        has_checks = 1;
      end
    endinterface

`endif