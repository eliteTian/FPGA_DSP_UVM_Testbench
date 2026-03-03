`ifndef THF_AXIS_TYPES_SV
	`define THF_AXIS_TYPES_SV

	//typedef virtual thf_axis_if 			  thf_axis_vif;
	typedef bit[`THF_AXIS_MAX_DATA_WIDTH-1:0] thf_axis_tdata;
	typedef bit 							  thf_axis_tvalid;
	typedef bit 							  thf_axis_tlast;

`endif