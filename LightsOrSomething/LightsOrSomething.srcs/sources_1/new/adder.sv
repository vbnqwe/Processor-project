`timescale 1ns / 1ps


module adder(
    input [31:0] input_a,
    input [31:0] input_b,
    input c_i,
    output [31:0] out,
    output overflow,
    output c_o
    );
    
    assign {c_o, out} = input_a + input_b + c_i;
    assign overflow = c_o;
endmodule
