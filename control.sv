module control(
  input [15:0] data,
  output [11:0] address,
  output [3:0] operation,
  output memory_write,
  input zflag, Clock, nReset
  );

timeunit 1ns; timeprecision 10ps;

`include "opcodes.sv"

enum logic { FETCH = 0, EXECUTE = 1 } state;
logic [11:0] Program_Counter;
logic [15:0] Instruction_Register;

logic [11:0] operand;
logic [3:0] opcode;
logic branch;

   assign operand = get_operand(Instruction_Register);
   assign opcode  = get_opcode(Instruction_Register);

   assign memory_write = (opcode == STA) && (state == EXECUTE);

   assign address = (state == FETCH) ? Program_Counter : operand;
   assign operation = (state == FETCH) ? NOP : opcode;

   assign branch = (state == EXECUTE) && ((operation ==JMP) ||
                               ((operation ==JMPZ) && (zflag == 1)) ||
                               ((operation ==JMPNZ) && (zflag == 0)));

   always_ff @(posedge Clock, negedge nReset)
      if (!nReset)
         begin
            Program_Counter <= 0;
            state <= FETCH;
            Instruction_Register <= 0;
         end
      else
         begin

            if (state == FETCH)
               begin
                  Instruction_Register <= #20 data;
                  state <= #20 EXECUTE;
               end
            else // execute cycle
               begin
                  state <= #20 FETCH;
               end

            if (branch)
               Program_Counter <= #20 operand;
            else if (state == FETCH)
               Program_Counter <= #20 Program_Counter + 1;

         end

   function [11:0] get_operand(input [15:0] instruction);
      return instruction[11:0];
   endfunction

   function [3:0] get_opcode(input [15:0] instruction);
      return instruction[15:12];
   endfunction

endmodule
