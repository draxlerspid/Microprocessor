# Microprocessor 
Behavioural Model of a Microprocessor on Cadence Xcelium
Microprocessor
A small behavioural model of a 16-bit accumulator processor, written in SystemVerilog and simulated in Cadence Xcelium.

Every instruction is 16 bits: the top 4 bits are the opcode and the bottom 12 bits are an address. Memory is 256 words. The processor works in two steps, fetch and then execute, so one instruction takes two clock cycles.

Instructions: NOP, JMP, JMPZ, JMPNZ, LDA, ADD, SUB, AND, OR, NOT, LSL, LSR, STA.

Files
control.sv - program counter, instruction register and the fetch/execute state machine
datapath.sv - the accumulator, connected to the ALU
alu.sv - the ALU (load, add, subtract, and, or, not, shift left, shift right) and the zero flag
memory.sv - 256 x 16 memory, with the test program already loaded
processor.sv - joins control, datapath and memory
opcodes.sv - the opcode values
system.sv - the testbench
system.tcl - SimVision script that opens the waveform and register windows
Microprocessor.png, ALU_xcelium_wave.pdf - a picture of the design and a waveform from Xcelium
Test program
memory.sv starts with 7 in a variable X and counts down to zero. Each time round the loop the counter is added into X, so the program should end with 28 in the accumulator (7+6+5+4+3+2+1). After that it jumps to address 99 and sits in a loop there.

Testbench
system.sv makes the clock (1 us period), holds reset low at the start, and stops the simulation when the program counter reaches 99. If that never happens it gives up after about 100 us.

It also turns the instruction register into text (for example ADD 22) and shows Fetch or Execute for the current state, so the waveform is easy to read.

Nothing is checked automatically. You read the result off the waveform.

Running it
With Xcelium, something like this:

xrun -sv -access +rwc -gui alu.sv control.sv datapath.sv memory.sv processor.sv system.sv -input system.tcl &

Note : 
The "-y library" option tells the simulator that other SystemVerilog files are located in the directory library.
xmverilog  +gui +access+r  -y library  +libext+.sv  +incdir+library  system.sv  +tcl+system.tcl  &




