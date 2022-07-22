`include "parameters.v"

module Data_memory(clk, mem_access_addr, mem_write_data, mem_write_en, mem_read, mem_read_data);
  
  input clk;
  input [15:0] mem_access_addr;
  input [15:0] mem_write_data;
  input mem_write_en;
  input mem_read;
  output [15:0]   mem_read_data;
  reg [`col - 1:0] data_memory [`row_data - 1:0];
  wire [2:0] data_addr = mem_access_addr[2:0];
  
  initial
    begin
      $readmemb("input.data", data_memory);
      `simulation_time;
    end
  
  always @(posedge clk) 
    begin
      if (mem_write_en)
        begin
          data_memory[data_addr] <= mem_write_data;
        end
    end

  assign mem_read_data = (mem_read==1'b1) ? data_memory[data_addr]: 16'd0; 
  
endmodule
