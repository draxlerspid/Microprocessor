module system;

timeunit 1ns; timeprecision 10ps;

`include "opcodes.sv"

logic Clock, notReset;

   processor Processor ( Clock, notReset);

   always
     begin
	Clock = 0;
       #250
	Clock = 1;
       #500
	Clock = 0;
       #250
	Clock = 0;
     end

   initial
     begin
       notReset = 1;
       #100
       notReset = 0;
       #800
       notReset = 1;
       #100
       notReset = 1;
       #100000
       $display("Too long - giving up");
       $stop;
       $finish;
     end

   always @(posedge Clock)
      if ( Processor.Control.Program_Counter == 99 )
	 begin
            $display("Terminating at instruction 99\n");
            @(posedge Clock);
            @(posedge Clock);
            $stop;
            $finish;
	 end

   // status interpretation

   function [9:0][7:0] get_state(input fetch_cycle);
      case (fetch_cycle)
         0       : return "Fetch";
         1       : return "Execute";
         default : return "*ERR*";
      endcase
   endfunction

   logic [9:0][7:0] State;
   assign State = get_state(Processor.Control.state);

   function [5:0][7:0] get_mnemonic(input [15:0] instruction);
      case (instruction[15:12])
         NOP    : return "NOP   ";
         JMP    : return "JMP   ";
         JMPZ   : return "JMPZ  ";
         JMPNZ  : return "JMPNZ ";
         LDA    : return "LDA   ";
         ADD    : return "ADD   ";
         SUB    : return "SUB   ";
         AND    : return "AND   ";
         OR     : return "OR    ";
         NOT    : return "NOT   ";
         LSL    : return "LSL   ";
         LSR    : return "LSR   ";
         STA    : return "STA   ";
         default : return "*ERR* ";
      endcase
   endfunction
   
   logic [5:0][7:0] Mnemonic;
   assign Mnemonic = get_mnemonic(Processor.Control.Instruction_Register);

   function [11:0] get_operand(input [15:0] instruction);
      return instruction[11:0];
   endfunction

   function [7:0] get_digit_zero(input [15:0] number);
      return "0" + (number%10);
   endfunction

   function [7:0] get_digit(input [15:0] number);
      if ( number > 0 )
        return get_digit_zero(number);
      else
        return " ";
   endfunction

   function [9:0][7:0] disassemble(input [15:0] instruction);
      return {
        get_mnemonic(instruction),
        get_digit(instruction[11:0]/1000),
        get_digit(instruction[11:0]/100),
        get_digit(instruction[11:0]/10),
        get_digit_zero(instruction[11:0])
      };
   endfunction

   logic [9:0][7:0] InstructionText;
   assign InstructionText = disassemble(Processor.Control.Instruction_Register);


   logic [9:0][7:0] DisassemblyListing [ 255:0 ];
   integer i;
   initial
      begin
         #1 for ( i = 0; i < 256; i = i + 1 )
	   DisassemblyListing[i] = disassemble(Processor.Memory.Data_stored[i]);
      end


endmodule
