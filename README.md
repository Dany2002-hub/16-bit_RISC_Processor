# RISC_Processor
This repository presents the Verilog code for a 16-bit RISC processor, which is designed based on its instruction set and Harvard-type datapath architecture. The instruction set of this RISC processor has 13 different instructions from the 3 broader types - Memory Access Instructions, Data Processing Instructions, and Control Flow Instructions. Further, this code was simulated in EDA Playground. 

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

A) Memory Access Instructions:

![2022-10-25 (3)](https://user-images.githubusercontent.com/76448256/197834751-0e831a15-ec1c-4342-bc3d-72695c07e812.png)

B) Data Processing Instructions:

![2022-10-25 (4)](https://user-images.githubusercontent.com/76448256/197835448-1e604e1e-f659-4022-8ca0-730c787dae23.png)

C) Control Flow - Branch instructions:

![2022-10-25 (3)](https://user-images.githubusercontent.com/76448256/197835556-7527a05a-1450-4dbf-80e5-24bbd9974d5c.png)

D) Control Flow - Jump Instruction:

![2022-10-25 (5)](https://user-images.githubusercontent.com/76448256/197835721-94229431-f811-4fb8-981b-f868c51a790e.png)

Opcode (bin):

![2022-10-25 (7)](https://user-images.githubusercontent.com/76448256/197838690-641a73f5-054d-498f-878c-741d83146bb2.png)

ALU Control Unit:

![2022-10-25 (10)](https://user-images.githubusercontent.com/76448256/197851376-d002dff2-5d78-4b67-be64-b939341d2e31.png)

















           
