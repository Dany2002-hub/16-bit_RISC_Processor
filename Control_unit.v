`timescale 1ns / 1ps

module Control_unit(opcode, alu_op, jump, beq, bne, mem_read, mem_write, alu_src, reg_des, mem_reg, reg_write);
  
  input [3:0] opcode;
  output reg jump, beq, bne, mem_read, mem_write, alu_src, reg_des, mem_reg, reg_write;
  output reg [1:0] alu_op;
  
  always @(*)
    begin
      case(opcode)
        4'b0000: // Load Word (LW)
          begin
            reg_des = 1'b0;
            alu_src = 1'b1;
            mem_reg = 1'b1;
            reg_write = 1'b1;
            mem_read = 1'b1;
            mem_write = 1'b0;
            beq = 1'b0;
            bne = 1'b0;
            alu_op = 2'b10;
            jump = 1'b0;   
          end
        
        4'b0001:  // Store Word (SW)
          begin
            reg_des = 1'b0;
            alu_src = 1'b1;
            mem_reg = 1'b0;
            reg_write = 1'b0;
            mem_read = 1'b0;
            mem_write = 1'b1;
            beq = 1'b0;
            bne = 1'b0;
            alu_op = 2'b10;
            jump = 1'b0;
          end
        
        4'b0010:  // ADD
          begin
            reg_des = 1'b1;
            alu_src = 1'b0;
            mem_reg = 1'b0;
            reg_write = 1'b1;
            mem_read = 1'b0;
            mem_write = 1'b0;
            beq = 1'b0;
            bne = 1'b0;
            alu_op = 2'b00;
            jump = 1'b0;
          end
        
        4'b0011:   // SUB
          begin
            reg_des = 1'b1;
            alu_src = 1'b0;
            mem_reg = 1'b0;
            reg_write = 1'b1;
            mem_read = 1'b0;
            mem_write = 1'b0;
            beq = 1'b0;
            bne = 1'b0;
            alu_op = 2'b00;
            jump = 1'b0;  
          end
        
        4'b0100: 
          begin
            reg_des = 1'b1;
            alu_src = 1'b0;
            mem_reg = 1'b0;
            reg_write = 1'b1;
            mem_read = 1'b0;
            mem_write = 1'b0;
            beq = 1'b0;
            bne = 1'b0;
            alu_op = 2'b00;
            jump = 1'b0; 
          end
        
        4'b0101:
          begin
            reg_des = 1'b1;
            alu_src = 1'b0;
            mem_reg = 1'b0;
            reg_write = 1'b1;
            mem_read = 1'b0;
            mem_write = 1'b0;
            beq = 1'b0;
            bne = 1'b0;
            alu_op = 2'b00;
            jump = 1'b0;
          end
        
        4'b0110:
          begin
            reg_des = 1'b1;
            alu_src = 1'b0;
            mem_reg = 1'b0;
            reg_write = 1'b1;
            mem_read = 1'b0;
            mem_write = 1'b0;
            beq = 1'b0;
            bne = 1'b0;
            alu_op = 2'b00;
            jump = 1'b0;
          end
        
        4'b0111:
          begin
            reg_des = 1'b1;
            alu_src = 1'b0;
            mem_reg = 1'b0;
            reg_write = 1'b1;
            mem_read = 1'b0;
            mem_write = 1'b0;
            beq = 1'b0;
            bne = 1'b0;
            alu_op = 2'b00;
            jump = 1'b0; 
          end
        
        4'b1000:
          begin
            reg_des = 1'b1;
            alu_src = 1'b0;
            mem_reg = 1'b0;
            reg_write = 1'b1;
            mem_read = 1'b0;
            mem_write = 1'b0;
            beq = 1'b0;
            bne = 1'b0;
            alu_op = 2'b00;
            jump = 1'b0;
          end
        
        4'b1001:
          begin
            reg_des = 1'b1;
            alu_src = 1'b0;
            mem_reg = 1'b0;
            reg_write = 1'b1;
            mem_read = 1'b0;
            mem_write = 1'b0;
            beq = 1'b0;
            bne = 1'b0;
            alu_op = 2'b00;
            jump = 1'b0;
          end
        
        4'b1010:   // BEQ
          begin
            reg_des = 1'b0;
            alu_src = 1'b0;
            mem_reg = 1'b0;
            reg_write = 1'b0;
            mem_read = 1'b0;
            mem_write = 1'b0;
            beq = 1'b1;
            bne = 1'b0;
            alu_op = 2'b01;
            jump = 1'b0;
          end
        
        4'b1011:   // BNE
          begin
            reg_des = 1'b0;
            alu_src = 1'b0;
            mem_reg = 1'b0;
            reg_write = 1'b0;
            mem_read = 1'b0;
            mem_write = 1'b0;
            beq = 1'b0;
            bne = 1'b1;
            alu_op = 2'b01;
            jump = 1'b0; 
          end
        
        4'b1100:   // Jump
          begin
            reg_des = 1'b0;
            alu_src = 1'b0;
            mem_reg = 1'b0;
            reg_write = 1'b0;
            mem_read = 1'b0;
            mem_write = 1'b0;
            beq = 1'b0;
            bne = 1'b0;
            alu_op = 2'b00;
            jump = 1'b1;
          end
        
        default: 
          begin
            reg_des = 1'b1;
            alu_src = 1'b0;
            mem_reg = 1'b0;
            reg_write = 1'b1;
            mem_read = 1'b0;
            mem_write = 1'b0;
            beq = 1'b0;
            bne = 1'b0;
            alu_op = 2'b00;
            jump = 1'b0;
          end
      endcase
    end
endmodule
