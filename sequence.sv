class mux_seq extends uvm_sequence#(mux_seq_item);
`uvm_object_utils(mux_seq)
mux_seq_item req;
function new(string name="mux_seq");
super.new(name);
endfunction

virtual task body();
//req=mux_seq_item::type_id::create("req");
repeat(2)
begin
`uvm_do(req);
end
endtask
endclass
