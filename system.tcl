# =========================================================================
# SimVision command script system.tcl

simvision {

 # =========================================================================
 # Wave Window

  # Open new waveform window

    window new WaveWindow  -name  "Waves for a Simple Microprocessor"
    window  geometry  "Waves for a Simple Microprocessor"  1010x325+50+25
    waveform  using  "Waves for a Simple Microprocessor"

  # Add basic signals to wave window

    waveform  add  -signals  system.Clock
    waveform  add  -signals  system.nReset
    waveform  add  -signals  system.Processor.Address
    waveform  add  -signals  system.Processor.Data_bus
    waveform  add  -signals  system.Processor.Mem_Write

 # =========================================================================
 # Register Window

  # Open new register window

    window new RegisterWindow  -name  "Registers for a Simple Microprocessor"
    window  geometry  "Registers for a Simple Microprocessor"  700x550+0+350
    register  using  "Registers for a Simple Microprocessor"

  # Add signal values (specified location and format)
  
 # =========================================================================

    register addtype -type text -x0 10 -y0 10 -text {Control} \
      -fill red

    register addtype -type text -x0 10 -y0 40 -text {State}

    register addtype -type signalvalue -x0 150 -y0 40 -radix %s \
      system.State

    register addtype -type text -x0 10 -y0 70 -text {PC}

    register addtype -type signalvalue -x0 150 -y0 70 -radix %d \
      system.Processor.Control.Program_Counter

    register addtype -type text -x0 10 -y0 95 -text {Instruction (hex)}

    register addtype -type signalvalue -x0 150 -y0 95 -radix %x \
      system.Processor.Control.Instruction_Register

    register addtype -type text -x0 10 -y0 110 -text \
      {  (assembly language)}

    register addtype -type signalvalue -x0 150 -y0 110 -radix %s \
      system.InstructionText

 # =========================================================================
    register addtype -type line -x0 300 -y0 5 -x1 300 -y1 135 \
      -fill green
 # =========================================================================

    register addtype -type text -x0 310 -y0 10 -text {Datapath} \
      -fill red

    register addtype -type text -x0 310 -y0 70 -text {Accumulator}

    register addtype -type signalvalue -x0 450 -y0 70 -radix %d \
      system.Processor.Datapath.Accumulator

 # =========================================================================
    register addtype -type line -x0 5 -y0 135 -x1 595 -y1 135 \
      -fill green
 # =========================================================================

    register addtype -type text        -x0 10 -y0 145 -text {Memory (code)} \
      -fill red

    register addtype -type text        -x0 10 -y0 170 -text {[0]}
    register addtype -type signalvalue -x0 40 -y0 170 -radix %x \
      {system.Processor.Memory.Data_stored[0]}
    register addtype -type signalvalue -x0 100 -y0 170 -radix %s \
      {system.DisassemblyListing[0]}

    register addtype -type text        -x0 10 -y0 190 -text {[1]}
    register addtype -type signalvalue -x0 40 -y0 190 -radix %x \
      {system.Processor.Memory.Data_stored[1]}
    register addtype -type signalvalue -x0 100 -y0 190 -radix %s \
      {system.DisassemblyListing[1]}

    register addtype -type text        -x0 10 -y0 210 -text {[2]}
    register addtype -type signalvalue -x0 40 -y0 210 -radix %x \
      {system.Processor.Memory.Data_stored[2]}
    register addtype -type signalvalue -x0 100 -y0 210 -radix %s \
      {system.DisassemblyListing[2]}

    register addtype -type text        -x0 10 -y0 230 -text {[3]}
    register addtype -type signalvalue -x0 40 -y0 230 -radix %x \
      {system.Processor.Memory.Data_stored[3]}
    register addtype -type signalvalue -x0 100 -y0 230 -radix %s \
      {system.DisassemblyListing[3]}

    register addtype -type text        -x0 10 -y0 250 -text {[4]}
    register addtype -type signalvalue -x0 40 -y0 250 -radix %x \
      {system.Processor.Memory.Data_stored[4]}
    register addtype -type signalvalue -x0 100 -y0 250 -radix %s \
      {system.DisassemblyListing[4]}

    register addtype -type text        -x0 10 -y0 270 -text {[5]}
    register addtype -type signalvalue -x0 40 -y0 270 -radix %x \
      {system.Processor.Memory.Data_stored[5]}
    register addtype -type signalvalue -x0 100 -y0 270 -radix %s \
      {system.DisassemblyListing[5]}

    register addtype -type text        -x0 10 -y0 290 -text {[6]}
    register addtype -type signalvalue -x0 40 -y0 290 -radix %x \
      {system.Processor.Memory.Data_stored[6]}
    register addtype -type signalvalue -x0 100 -y0 290 -radix %s \
      {system.DisassemblyListing[6]}

    register addtype -type text        -x0 10 -y0 310 -text {[7]}
    register addtype -type signalvalue -x0 40 -y0 310 -radix %x \
      {system.Processor.Memory.Data_stored[7]}
    register addtype -type signalvalue -x0 100 -y0 310 -radix %s \
      {system.DisassemblyListing[7]}

    register addtype -type text        -x0 10 -y0 330 -text {[8]}
    register addtype -type signalvalue -x0 40 -y0 330 -radix %x \
      {system.Processor.Memory.Data_stored[8]}
    register addtype -type signalvalue -x0 100 -y0 330 -radix %s \
      {system.DisassemblyListing[8]}

    register addtype -type text        -x0 10 -y0 350 -text {[9]}
    register addtype -type signalvalue -x0 40 -y0 350 -radix %x \
      {system.Processor.Memory.Data_stored[9]}
    register addtype -type signalvalue -x0 100 -y0 350 -radix %s \
      {system.DisassemblyListing[9]}

    register addtype -type text        -x0 10 -y0 380 -text {[99]}
    register addtype -type signalvalue -x0 40 -y0 380 -radix %x \
      {system.Processor.Memory.Data_stored[99]}
    register addtype -type signalvalue -x0 100 -y0 380 -radix %s \
      {system.DisassemblyListing[99]}

 # =========================================================================
    register addtype -type line -x0 250 -y0 135 -x1 250 -y1 400 \
      -fill green
 # =========================================================================

    register addtype -type text        -x0 260 -y0 145 \
      -text {Memory (constants)} -fill red

    register addtype -type text        -x0 260 -y0 170 -text {[20]}
    register addtype -type signalvalue -x0 310 -y0 170 -radix %d \
      {system.Processor.Memory.Data_stored[20]}
    register addtype -type text        -x0 260 -y0 190 -text {[21]}
    register addtype -type signalvalue -x0 310 -y0 190 -radix %d \
      {system.Processor.Memory.Data_stored[21]}

 # =========================================================================
    register addtype -type line -x0 450 -y0 135 -x1 450 -y1 400 \
      -fill green
 # =========================================================================

    register addtype -type text        -x0 460 -y0 145 -text {Memory (data)} \
      -fill red

    register addtype -type text        -x0 460 -y0 170 -text {[22]}
    register addtype -type signalvalue -x0 510 -y0 170 -radix %d \
      {system.Processor.Memory.Data_stored[22]}
    register addtype -type text        -x0 460 -y0 190 -text {[23]}
    register addtype -type signalvalue -x0 510 -y0 190 -radix %d \
      {system.Processor.Memory.Data_stored[23]}
    register addtype -type text        -x0 460 -y0 210 -text {[24]}
    register addtype -type signalvalue -x0 510 -y0 210 -radix %d \
      {system.Processor.Memory.Data_stored[24]}
    register addtype -type text        -x0 460 -y0 230 -text {[25]}
    register addtype -type signalvalue -x0 510 -y0 230 -radix %d \
      {system.Processor.Memory.Data_stored[25]}

}

# =========================================================================
# Probe

  # Any signals included in register window but not in waveform window
  # should be probed

    probe -create -shm system.State
    probe -create -shm system.Processor.Control.Program_Counter
    probe -create -shm system.Processor.Control.Instruction_Register
    probe -create -shm system.Processor.Datapath.Accumulator
    probe -create -shm system.InstructionText
    probe -create -shm system.Processor.Memory.Data_stored
    probe -create -shm system.DisassemblyListing
# =========================================================================
