`timescale 1ns / 1ps

module Datapath(clk, jump, beq, bne, mem_read, mem_write, alu_src, reg_des, mem_reg, reg_write, alu_op, opcode);
  
  input clk, jump, beq, bne, mem_read, mem_write, alu_src, reg_des, mem_reg, reg_write;
  input [1:0] alu_op;
  output [3:0] opcode;
  
  reg  [15:0] PC_current;
  wire [15:0] PC_next, PC_2;
  wire [15:0] instruction;
  wire [2:0] reg_write_des;
  wire [15:0] reg_write_data;
  wire [2:0] reg_read_addr_1, reg_read_addr_2;
  wire [15:0] reg_read_data_1, reg_read_data_2;
  wire [15:0] sign_ext, read_data_2;
  wire [2:0] alu_ctrl;
  wire [15:0] alu_out;
  wire zero;
  wire [15:0] PC_j, PC_beq, PC_beq_2, PC_bne_2, PC_bne;
  wire beq_ctrl, bne_ctrl;
  wire [12:0] jump_off_shift;
  wire [15:0] mem_read_data;
  
// PC  
  initial 
    begin
      PC_current <= 16'd0;
    end
  
  always @(posedge clk)
    begin 
      PC_current <= PC_next;
    end
  
  assign PC_2 = PC_current + 16'd2;
  
// Instruction Memory  
  Instruction_memory Im(.pc(PC_current), .instruction(instruction));
  
// Destination register
  assign reg_write_des = (reg_des==1'b1) ? instruction[5:3] :instruction[8:6];

  assign reg_read_addr_1 = instruction[11:9];
  assign reg_read_addr_2 = instruction[8:6];

// Register files
  Registers reg_file
  (
    .clk(clk), 
    .reg_write_en(reg_write), 
    .reg_write_des(reg_write_des), 
    .reg_write_data(reg_write_data), 
    .reg_read_addr_1(reg_read_addr_1), 
    .reg_read_addr_2(reg_read_addr_2),
    .reg_read_data_1(reg_read_data_1), 
    .reg_read_data_2(reg_read_data_2)
  );
  
// Immediate extend  
  assign sign_ext = {{10{instruction[5]}},instruction[5:0]};
  
// ALU Control Unit
  ALU_Control Acu(.alu_ctrl(alu_ctrl), .alu_op(alu_op), .opcode(instruction[15:12])); 

// Multiplexer with ALU_src control
  assign read_data_2 = (alu_src==1'b1) ? sign_ext : reg_read_data_2;

// ALU Execution
  ALU_unit Au(.alu_ctrl(alu_ctrl), .data_1(reg_read_data_1), .data_2(read_data_2), .result(alu_out), .zero(zero)); 
  
// left shifting sign extended offset by 1
  assign PC_beq = PC_2 + {sign_ext[14:0],1'b0}; 
  assign PC_bne = PC_2 + {sign_ext[14:0],1'b0};
  
// Controls for branch instructions
  assign beq_ctrl = beq & zero;
  assign bne_ctrl = bne & (~zero);

  assign PC_beq_2 = (beq_ctrl==1'b1) ? PC_beq : PC_2;
  assign PC_bne_2 = (bne_ctrl==1'b1) ? PC_bne : PC_beq_2;
  assign PC_j = {PC_2[15:13], jump_off_shift};
  assign PC_next = (jump == 1'b1) ? PC_j :  PC_bne_2;
  
// Data Memory  
  Data_memory Dm
   (
    .clk(clk),
    .mem_access_addr(alu_out),
    .mem_write_data(reg_read_data_2),
    .mem_write_en(mem_write),
    .mem_read(mem_read),
    .mem_read_data(mem_read_data)
   );
 
// Write back
  assign reg_write_data = (mem_reg == 1'b1) ? mem_read_data: alu_out;
  
// Input for the Control Unit
  assign opcode = instruction[15:12];
  
endmodule
