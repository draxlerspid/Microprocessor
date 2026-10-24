module datapath(
  inout [15:0] data,
  output zflag,
  input [3:0] func,
  input Clock, nReset
  );

timeunit 1ns; timeprecision 10ps;

`include "opcodes.sv"

logic [15:0] Accumulator;

wire [15:0] ALU_output;

   alu ALU ( zflag, ALU_output, Accumulator, data, func);

   always_ff @(posedge Clock)
      Accumulator <= #20 ALU_output;

   assign data = ( func == STA ) ? Accumulator : 16'bz;

endmodule

