module memory(
  inout [15:0] data,
  input [11:0] address,
  input write, Clock
  );

timeunit 1ns; timeprecision 10ps;

`include "opcodes.sv"

// 256 16-bit words of memory
logic [15:0] Data_stored [ 0:255 ];

   assign data = (!write) ? Data_stored [address] : 16'bz;

   always_ff @(posedge Clock)
      if (write) Data_stored [address] <= #20 data;

   initial
      begin
         // DATA
         localparam CONST_0	= 12'd20;
         localparam CONST_1	= 12'd21;
         localparam VAR_X	= 12'd22;
         localparam VAR_Y	= 12'd23;
         Data_stored[20] = {16'd0};
         Data_stored[21] = {16'd1};
         Data_stored[22] = {16'd7};
         Data_stored[23] = {16'dx};

         // CODE:
         Data_stored[0] = {LDA,VAR_X};

         Data_stored[1] = {SUB,CONST_1};	// .loop
         Data_stored[2] = {JMPZ,12'd8};		// If Accumulator = 0 then Jump .done
         Data_stored[3] = {STA,VAR_Y};
         Data_stored[4] = {ADD,VAR_X};
         Data_stored[5] = {STA,VAR_X};
         Data_stored[6] = {LDA,VAR_Y};
         Data_stored[7] = {JMP,12'd1};		// Jump .loop
         Data_stored[8] = {LDA,VAR_X};		// .done
         Data_stored[9] = {JMP,12'd99};		// Jump .end

         Data_stored[99] = {JMP,12'd99};	// .end

      end

endmodule
