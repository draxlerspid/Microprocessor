module processor(
  input Clock, notReset
  );

timeunit 1ns; timeprecision 10ps;

wire [15:0] Data_bus;
wire [11:0] Address;
wire [3:0] Operation;
wire Zflag, Mem_Write;

  control Control ( Data_bus, Address, Operation, Mem_Write, Zflag, Clock, notReset );
  datapath Datapath ( Data_bus, Zflag, Operation, Clock, notReset );
  memory Memory ( Data_bus, Address, Mem_Write, Clock );

endmodule
