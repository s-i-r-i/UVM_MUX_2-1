`uvm_blocking_put_imp_decl(_i)
`uvm_blocking_put_imp_decl(_o)
class scoreboard extends uvm_scoreboard;
`uvm_component_utils(scoreboard)
uvm_blocking_put_imp_i#(mux_seq_item,scoreboard)my_export;
uvm_blocking_put_imp_o#(mux_seq_item,scoreboard)my_export1;
mux_seq_item pkt1,pkt2;

function new(string name,uvm_component parent);
        super.new(name,parent);   
my_export=new("my_export",this);
my_export1=new("my_export1",this);
 
    endfunction

    function void build_phase(uvm_phase phase);
        pkt1 = mux_seq_item::type_id::create("pkt1",this);
        pkt2 = mux_seq_item::type_id::create("pkt2",this);

        `uvm_info(get_name(),"MESSAGE IS FROm scoreboard BUILD PHASE WITH NONE",UVM_NONE)
    endfunction



task put_i(mux_seq_item pkt1);
this.pkt1=pkt1;
endtask

task put_o(mux_seq_item pkt2);
this.pkt2=pkt2;
if(pkt1.out==pkt2.out)
begin 
`uvm_info(get_full_name(),$sformatf("pkt1.out=%0d,pkt2.out=%0d",pkt1.out,pkt2.out),UVM_NONE)
end
else
begin
`uvm_info(get_full_name(),$sformatf("failed"),UVM_NONE)
`uvm_info(get_full_name(),$sformatf("pkt1.out=%0d,pkt2.out=%0d",pkt1.out,pkt2.out),UVM_NONE)
end

endtask
endclass
