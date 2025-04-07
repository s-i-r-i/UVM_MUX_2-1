class environment extends uvm_env;

`uvm_component_utils(environment)
agent1 agt_1;
agent2 agt_2;
scoreboard score;
virtual muxinter inter;

function new(string name,uvm_component parent);
        super.new(name,parent);    
    endfunction

    function void build_phase(uvm_phase phase);
        agt_1 = agent1::type_id::create("agt_1",this);
        agt_2 = agent2::type_id::create("agt_2",this);
 score = scoreboard::type_id::create("score",this);

        `uvm_info(get_name(),"MESSAGE IS FROM ENVIRONMENT BUILD PHASE WITH NONE",UVM_NONE)
    endfunction

function void connect_phase(uvm_phase phase);
agt_1.mon1.m_put_port.connect(score.my_export);
agt_2.mon2.m_put_port1.connect(score.my_export1);
 `uvm_info(get_full_name(),"connect environment phase",UVM_LOW)

endfunction

    function void end_of_elaboration_phase(uvm_phase phase);
        uvm_top.print_topology();
        `uvm_info(get_full_name(),"END OF ELABORATION",UVM_LOW)
        `uvm_info("ENVIRONMENT","ENVIRONMENT FUNCTION",UVM_HIGH)
    endfunction
endclass        
