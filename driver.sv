class driver extends uvm_driver #(mux_seq_item);
	
	`uvm_component_utils(driver)
mux_seq_item req;
virtual muxinter inter;

 function new(string name, uvm_component parent);
        super.new(name,parent);    
    endfunction

    function void build_phase(uvm_phase phase);
if(!uvm_config_db#(virtual muxinter)::get(this,"*","inter",inter))
begin
        `uvm_error("config_db_error","not able to retrieve inter from config_db")
end

        `uvm_info("DRIVER","MESSAGE IS FROM OLD DRIVER BUILD PHASE WITH LOW",UVM_LOW)
           endfunction

 virtual  task run_phase(uvm_phase phase);
    
               forever begin
            seq_item_port.get_next_item(req);
            #1;
inter.i0=req.i0;
inter.i1=req.i1;
inter.sel=req.sel;
inter.out=req.out;
            req.print();
            seq_item_port.item_done();
                               end
    endtask
endclass    
