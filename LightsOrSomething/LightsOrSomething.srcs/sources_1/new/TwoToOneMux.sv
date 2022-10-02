`timescale 1ns / 1ps


module TwoToOneMux(
    input [1:0] [31:0] in,
    input sel,
    output [31:0] out
    );
    
    assign out = sel ? in[1] : in[0];
endmodule
