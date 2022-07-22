`timescale 1ns / 1ps

`include "parameters.v"
`include "Instruction_memory.v"
`include "Data_memory.v"
`include "Registers.v"
`include "ALU_unit.v"
`include "ALU_Control.v"
`include "Datapath.v"
`include "Control_unit.v"


module RISC_16_bit_proc(clk);
  input clk;
  wire jump, bne, beq, mem_read, mem_write, alu_src, reg_des, mem_reg, reg_write;
  wire[1:0] alu_op;
  wire [3:0] opcode;
  
  Datapath Dpu
  (
    .clk(clk),
    .jump(jump),
    .beq(beq),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .alu_src(alu_src),
    .reg_des(reg_des),
    .mem_reg(mem_reg),
    .reg_write(reg_write),
    .bne(bne),
    .alu_op(alu_op),
    .opcode(opcode)
  );
  
  Control_unit Cu
  (
    .opcode(opcode),
    .reg_des(reg_des),
    .mem_reg(mem_reg),
    .alu_op(alu_op),
    .jump(jump),
    .bne(bne),
    .beq(beq),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .alu_src(alu_src),
    .reg_write(reg_write)
  );
  
endmodule
