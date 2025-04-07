class mux_seq_item extends uvm_sequence_item;
`uvm_object_utils(mux_seq_item)
randc bit [7:0]i0;
randc bit [7:0]i1;
bit sel;
bit [7:0]out;

function new(string name="mux_seq_item");
super.new(name);
endfunction
endclass

