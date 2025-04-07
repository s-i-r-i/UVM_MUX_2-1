
class test extends uvm_test;
`uvm_component_utils(test)
environment env;
mux_seq seq;

function new(string name="test",uvm_component parent);
super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
env=environment::type_id::create("env",this);
seq=mux_seq::type_id::create("seq",this);
`uvm_info(get_full_name(),"message from test",UVM_LOW)
endfunction

task run_phase(uvm_phase phase);
begin
phase.raise_objection(this,"start of test");
seq.start(env.agt_1.sqr);
#20;
phase.drop_objection(this,"end of test");
`uvm_info(get_full_name(),"message from test runphase",UVM_LOW)
end
endtask
endclass

