`timescale 1ns / 1ps


module adder_tb;
    reg clk;
    wire [31:0] out, wd3;
    top dut(clk, out, wd3);
    
    initial begin
        clk = 0;
        #5;
        clk = 1;
        #5;
        clk = 0;
        #5;
        clk = 1;
        #5;
        clk = 0;
        #5;
        clk = 1;
        #5;
        clk = 0;
        #5;
        clk = 1;
        #5;
    end
    
    /*reg [31:0] r1, r2;
    reg [2:0] oc;
    wire [31:0] out;
    
    ALU dut(oc ,r1, r2, out);
    
    initial begin
        oc =5;
        r1 = 15;
        r2 = 10;
    end*/
    
    /*reg [3:0] a1, a2, a3;
    reg [31:0] wd3;
    reg clk, we;
    wire [31:0] rd1, rd2;
    
    
    registerFile dut(
        a1,
        a2,
        a3,
        wd3,
        we, 
        clk,
        rd1,
        rd2
    );
    
    initial begin
        clk = 0;
        wd3 = 1;

        #5;
        a1 = 0;
        a2 = 1;
        a3 = 0;
        we = 1;
        clk = 1;
        #5;
        
    end*/
endmodule
