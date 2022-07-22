`timescale 1ns / 1ps

module ALU_unit(alu_ctrl, data_1, data_2, result, zero);
  
  input [2:0] alu_ctrl;
  input [15:0] data_1, data_2;
  output reg [15:0] result;
  output zero;
  
  always @(*)
    begin 
      case(alu_ctrl)
        3'b000: result = data_1 + data_2;  // Add
        3'b001: result = data_1 - data_2;  // Sub
        3'b010: result = ~(data_1);        // Invert
        3'b011: result = data_1 << data_2; // Logical Shift Left
        3'b100: result = data_1 >> data_2; // Logical Shift Right
        3'b101: result = data_1 & data_2;  // Bitwise And
        3'b110: result = data_1 | data_2;  // Bitwise Or
        3'b111: result = (data_1 < data_2) ? 16'd1: 16'd0; // Set on Less than
        default: result = data_1 + data_2; 
      endcase
    end
  
  assign zero = (result==16'd0) ? 1'b1: 1'b0;
 
endmodule
