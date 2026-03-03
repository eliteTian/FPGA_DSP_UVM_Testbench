`ifndef THF_AXIS_ITEM_DRV_MASTER_SV
  `define THF_AXIS_ITEM_DRV_MASTER_SV

  class thf_axis_item_drv_master extends thf_axis_item_drv;
    
    //Pre drive delay
    rand int unsigned pre_drive_delay;

    //Post drive delay
    rand int unsigned post_drive_delay;

    //Data driven by the master
    rand bit[7:0] data[$];

    //validity of the data
    rand bit valid;
    
    rand int unsigned length;
    
    constraint pre_drive_delay_default {
      soft pre_drive_delay <= 5;
    }

    constraint post_drive_delay_default {
      soft post_drive_delay <= 5;
    }

    constraint data_default {
      soft data.size() == 1;
    }
    
    constraint data_hard {
      soft data.size() > 0;
    }
    
    constraint valid_default {
      soft valid == 1;
    }
    constraint length_default {
      soft length == 1;
    }    
    
    `uvm_object_utils(thf_axis_item_drv_master)

    function new(string name = "");
      super.new(name);
    endfunction
    
    virtual function string convert2string();
      string data_as_string = "{";
      
      foreach(data[idx]) begin
        data_as_string = $sformatf("%0s'h%02x%0s", data_as_string, data[idx], idx == data.size() - 1 ? "" : ", ");
      end
      
      data_as_string = $sformatf("%0s}", data_as_string);
      
      return $sformatf("data: %0s, length: %0d, pre_drive_delay: %0d, post_drive_delay: %0d", data_as_string, length, pre_drive_delay, post_drive_delay);
      
    endfunction

  endclass

`endif