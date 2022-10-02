`timescale 1ns / 1ps


module SignExtender(
    input [15:0] value,
    output [31:0] out
    );
    
    wire [15:0] high;
    assign high = {16{1'b1}};
    assign low = {16{1'b0}};
    assign out = value[15] ? {high, value} : {low, value};
endmodule
