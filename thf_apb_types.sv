`ifndef THF_APB_TYPES_SV
	`define THF_APB_TYPES_SV

	typedef virtual thf_apb_if thf_apb_vif;
    typedef enum bit{THF_APB_READ = 0, THF_APB_WRITE = 1} thf_apb_dir;
    typedef bit[`THF_APB_MAX_DATA_WIDTH-1:0] thf_apb_data;
	typedef bit[`THF_APB_MAX_ADDR_WIDTH-1:0] thf_apb_addr; 
    typedef enum bit {THF_APB_OKAY = 0, THF_APB_ERR = 1} thf_apb_response;
               

`endif