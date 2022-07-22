`include "parameters.v"

module Instruction_memory(pc, instruction);
  
  input[15:0] pc;
  output[15:0] instruction;
  reg [`col - 1:0] inst_memory [`row_inst - 1:0];
  wire [3 : 0] inst_addr = pc[4 : 1];
  
  initial
    begin
      $readmemb("input.prog", inst_memory, 0, 13);
    end
  
  assign instruction =  inst_memory[inst_addr]; 
  
endmodule
