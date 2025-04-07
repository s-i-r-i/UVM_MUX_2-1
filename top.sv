`include "uvm_macros.svh"
import uvm_pkg::*;
`include "interface.sv"
`include "dut.sv"
`include "seq_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor1.sv"
`include "monitor2.sv"
`include "agent1.sv"
`include "agent2.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"

module top;
muxinter inter();
muxdut dut(inter);

initial begin
uvm_config_db#(virtual muxinter)::set(uvm_root::get(),"*","inter",inter);
run_test("test");
end
endmodule


