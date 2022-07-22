`timescale 1ns / 1ps

module ALU_Control(alu_ctrl, alu_op, opcode);  
 
  input [1:0] alu_op;  
  input [3:0] opcode;  
  output reg [2:0] alu_ctrl;
  wire [5:0] alu_ctrl_in;  
  
  assign alu_ctrl_in = {alu_op, opcode};  
  
  always @(alu_ctrl_in)  
    begin
      casex (alu_ctrl_in)
        6'b10xxxx: alu_ctrl = 3'b000;  
        6'b01xxxx: alu_ctrl = 3'b001;  
        6'b000010: alu_ctrl = 3'b000;  
        6'b000011: alu_ctrl = 3'b001;  
        6'b000100: alu_ctrl = 3'b010;  
        6'b000101: alu_ctrl = 3'b011;  
        6'b000110: alu_ctrl = 3'b100;  
        6'b000101: alu_ctrl = 3'b101;  
        6'b001000: alu_ctrl = 3'b110;  
        6'b001001: alu_ctrl = 3'b111;  
        default: alu_ctrl = 3'b000;
      endcase
    end

endmodule 
