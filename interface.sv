interface muxinter;
logic [7:0]i0,i1;
logic sel;
logic [7:0]out;
modport muxdut(input i0,i1,sel,output out);
modport test(input out,output i0,i1,sel);
endinterface
