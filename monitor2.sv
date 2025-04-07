class monitor2 extends uvm_monitor;
`uvm_component_utils(monitor2)
mux_seq_item req;
virtual muxinter inter;

uvm_blocking_put_port #(mux_seq_item)m_put_port1;

function new(string name,uvm_component parent);
super.new(name,parent);
m_put_port1=new("m_put_port1",this);
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

@(inter.out);
req.out=inter.out;
`uvm_info(get_full_name(),$psprintf("out=%0d",req.out),UVM_NONE)
`uvm_info(get_full_name(),$psprintf("out=%0d",req.out),UVM_NONE)

m_put_port1.put(req);
end
`uvm_info(get_name(),"message from monitor2", UVM_LOW)

endtask
endclass

