`timescale 1ns / 1ps


module MemoryArray(
    input logic WE, //write enable
    input logic [3:0] address,
    input logic [31:0] data,
    output logic [31:0] outData,
    output logic [16:0] [31:0] allStack
    );
    
    reg [16:0] [31:0] mem;
    assign allStack = mem;
    always@(WE)
        if(WE) 
            mem[address] <= data;
    
    assign outData = mem[address];
    
endmodule
