class agent2 extends uvm_agent;
`uvm_component_utils(agent2)
monitor2 mon2;

function new(string name="apb_agent2",uvm_component parent);
super.new(name,parent);
endfunction

 function void build_phase(uvm_phase phase);
super.build_phase(phase);
mon2=monitor2::type_id::create("mon2",this);
endfunction


endclass

