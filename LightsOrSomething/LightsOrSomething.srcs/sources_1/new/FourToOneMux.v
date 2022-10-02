`timescale 1ns / 1ps


module FourToOneMux(
    input [3:0] [31:0] in,
    input [1:0] sel,
    output [31:0] out
    );
    
    wire [31:0] mux1Wire, mux2Wire;
    TwoToOneMux mux1 (in[1:0], sel[0], mux1Wire);
    TwoToOneMux mux2 (in[3:2], sel[0], mux2Wire);
    assign out = sel[1] ? mux2Wire : mux1Wire;
endmodule
