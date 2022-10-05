`timescale 1ns / 1ps


module adder_tb;
    reg clk;
    //reg [31:0] a1, a2;
    wire [31:0] out;
    //wire [2:0] oc;
    
    
   top dut(clk, out);
    
    initial begin
       
        clk = 0;
        #5;
        clk = 1;
        #5;
        clk = 0;
        #5;
        clk = 1;
        #5;
        
        
    end
    
    /*ALU dut(oc, a1, a2, out);
    
    initial begin
        a1 = 1;
        a2 = 3;
        oc = 5;
    end*/
    
    
    
endmodule
