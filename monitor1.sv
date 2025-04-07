class monitor1 extends uvm_monitor;
`uvm_component_utils(monitor1)
mux_seq_item req;
virtual muxinter inter;

uvm_blocking_put_port #(mux_seq_item)m_put_port;

function new(string name,uvm_component parent);
super.new(name,parent);
m_put_port=new("m_put_port",this);
endfunction 

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
req=mux_seq_item::type_id::create("req");
if(!uvm_config_db#(virtual muxinter)::get(this,"","inter",inter))
begin
`uvm_error("config_db_error","not able to retrieve interface from configdb")
end
endfunction

task run_phase(uvm_phase phase);
//pkt=apb_seq_item::type_id::create("pkt");
forever
begin

@(inter.i0,inter.i1,inter.sel);
req.i0=inter.i0;
req.i1=inter.i1;
req.sel=inter.sel;
begin

req.out=req.sel?req.i1:req.i0;
`uvm_info(get_full_name(),$psprintf("i0=%0d,i1=%0d,sel=%0d",req.i0,req.i1,req.sel),UVM_NONE)
`uvm_info(get_full_name(),$psprintf("out=%0d",req.out),UVM_NONE)
end
m_put_port.put(req);
end
`uvm_info(get_name(),"message from monitor1", UVM_LOW)

endtask
endclass

