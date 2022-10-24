# RISC_Processor
This repository presents the Verilog code for a 16-bit RISC processor, which is designed based on its instruction set and Harvard-type datapath architecture. The instruction set of this RISC processor has 13 different instructions from the 3 broader types - Memory Access Instructions, Data Processing Instructions, and Control Flow Instructions. Further, this code was simulated in both EDA Playground and Xilinx Vivado. 

![2022-10-24 (2)](https://user-images.githubusercontent.com/76448256/197538688-903011f5-b9f4-43de-9f03-30583dd797f2.png)

Instruction Set:

    A) Memory Access Instructions:
           1) Load Word: 
                LW r1, offset(r2) , r1:= Mem[r2 + offset]
           2) Store Word:
                SW r1, offset(r2) , Mem[r2 + offset] = r1
    
    B) Data Processing Instructions:
           3) Add:
                ADD r1, r2, r3 , r1:= r2 + r3
           4) Subtract:
                SUB r1, r2, r3 , r1:= r2 - r3
           5) Invert (1's complement):
                INV r1, r2 , r1:= ~r2
           6) Logical Shift Left:
                LSL r1, r2, r3 , r1:= r2 << r3
           7) Logical Shift Right:
                LSR r1, r2, r3 , r1:= r2 >> r3
           8) Bitwise AND:
                AND r1, r2, r3 , r1:= r2.r3
           9) Bitwise OR:
                OR r1, r2, r3 , r1: r2|r3
          10) Set on Less Than:
                SLT r1, r2, r3, r1:=1 if r2<r3 ; r1:=0 if r2>=r3

    C) Control Flow Instructions:
          11) Branch on Equal:
                BEQ r1, r2, offset , Branch to (PC + 2 + (offset << 1)) when r1 = r2
          12) Branch on Not Equal:
                BNE r1, r2, offset , Branch to (PC + 2 + (offset << 1)) when r1 != r2
          13) Jump:
                J offset , Jump to {PC[15:13], (offset << 1)}

Instruction Format:



           
