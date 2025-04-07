class agent1 extends uvm_agent;
`uvm_component_utils(agent1)
sequencer sqr;
driver drv;
monitor1 mon1;

function new(string name="agent1",uvm_component parent);
super.new(name,parent);
endfunction

 function void build_phase(uvm_phase phase);
super.build_phase(phase);
sqr=sequencer::type_id::create("sqr",this);
drv=driver::type_id::create("drv",this);
mon1=monitor1::type_id::create("mon1",this);
endfunction

 function void connect_phase(uvm_phase phase);
	 drv.seq_item_port.connect(sqr.seq_item_export);
 endfunction

endclass

