`timescale 1ns / 1ps
`include "parameters.v"

module testbench;
  
  reg clk;
  
  RISC_16_bit_proc LUT(.clk(clk));
  
  initial 
    begin
      $dumpfile("dump.vcd"); 
      $dumpvars;
      
      clk <= 0;
      `simulation_time;
      
      $finish;
    end
  
  always 
    begin
      #5 clk = ~clk;
    end

endmodule
