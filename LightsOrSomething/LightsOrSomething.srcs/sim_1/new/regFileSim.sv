`timescale 1ns / 1ps


module regFileSim;
    reg [3:0] a1, a2, a3;
    reg [31:0] wd3;
    reg clock, we;
    wire [31:0] rd1, rd2;
    
    registerFile dut(a1, a2, a3, wd3, we, clock, rd1, rd2);
    
    initial begin
        clock = 0;
        a1 = 0; 
        a2 = 1;
        a3 = 0;
        we = 1;
        wd3 = 32'hffffffff;
        #5;
        clock = 1;
        wd3 = 32'h11111111;
        #5;
        wd3 = 32'h00000555;
    end
endmodule
