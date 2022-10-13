`timescale 1ns / 1ps


module adder_tb;
    reg clk;
    wire [31:0] out1, out2, data;
    wire [16:0] [31:0] stackOut;
    wire [31:0] important;
    assign important = stackOut[0];
    top dut(clk, out1, out2, data);
    
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
    
    /*reg we;
    reg [3:0] address;
    reg [31:0] dataIn;
    wire [31:0] dataOut;
    wire [31:0] first;
    
    MemoryArray dut(we, address, dataIn, dataOut, first);
    
    initial begin
        address = 0;
        dataIn = 5;
        we = 1;
    end*/
    
    /*reg [2:0] opCode;
    reg [31:0] rOne;
    reg [31:0] rTwo;
    wire [31:0] out;
    wire of;
    wire c_out;
    
    ALU dut(opCode, rOne, rTwo, out, of, c_out);
    initial begin
        opCode = 3'b011;
        rOne = 5;
        rTwo = 0;
        
        
        
    end*/
   
endmodule
