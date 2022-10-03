`timescale 1ns / 1ps


module adder_tb;
    reg clk;
    wire [31:0] out;
    
    top dut(clk, out);
    
    initial begin
        clk = 0;
        #5;
        clk = 1;
        #5;
        clk = 0;
        #5;
        clk = 1;
    end
endmodule
