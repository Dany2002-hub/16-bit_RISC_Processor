`timescale 1ns / 1ps

module Registers(clk, reg_write_en, reg_write_des, reg_write_data, reg_read_addr_1, reg_read_addr_2, reg_read_data_1, reg_read_data_2);
  
  input clk;
  input reg_write_en;
  input [2:0] reg_write_des;
  input [15:0] reg_write_data;
  input [2:0] reg_read_addr_1, reg_read_addr_2;
  output [15:0] reg_read_data_1, reg_read_data_2;
  reg [15:0] reg_file [7:0];
  integer i;
  
  initial
    begin
      for(i=0;i<8;i=i+1)
        begin
          reg_file[i] <= 16'd0;
        end
    end
  
  
  always @(posedge clk )
    begin
      if(reg_write_en) 
        begin
          reg_file[reg_write_des] <= reg_write_data;
        end
    end
  
  assign reg_read_data_1 = reg_file[reg_read_addr_1];
  assign reg_read_data_2 = reg_file[reg_read_addr_2];
  
endmodule
