`timescale 1ns / 1ps


module MemoryArray(
    input logic WE, //write enable
    input logic [3:0] address,
    input logic [31:0] data,
    output logic [31:0] outData,
    output logic [31:0] zeroOut
    );
    
    reg [16:0] [31:0] mem;
    assign zeroOut = mem[5];
    always@(WE)
        if(WE) 
            mem[address] <= data;
    
    assign outData = mem[address];
    
endmodule
