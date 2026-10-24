module alu(
  output logic zflag,
  output logic [15:0] result,
  input [15:0] inputA, inputB,
  input [3:0] operation
  );

timeunit 1ns; timeprecision 10ps;

`include "opcodes.sv"

  assign zflag = (inputA == 0);

  always_comb
    case (operation)
      LDA	: result = inputB;
      ADD	: result = inputA + inputB;
      SUB	: result = inputA - inputB;
      AND	: result = inputA & inputB;
      OR	: result = inputA | inputB;
      NOT	: result = ~inputA;
      LSL	: result = inputA << 1;
      LSR	: result = inputA >> 1;
      default	: result = inputA;
    endcase

endmodule
