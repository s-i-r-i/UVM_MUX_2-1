module muxdut(muxinter.muxdut inter);
always_comb
begin
assign inter.out=inter.sel?inter.i1:inter.i0;
end
endmodule
