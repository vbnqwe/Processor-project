`timescale 1ns / 1ps


module MemoryArray(
    input logic CLK,
    input logic WE, //write enable
    input logic [3:0] address,
    input logic [31:0] data,
    output logic [31:0] outData
    );
    
    reg [16:0] [31:0] mem;
    
    always_ff@(posedge CLK)
        if(WE) mem[address] <= data;
    
    assign outData = mem[address];
    
endmodule
