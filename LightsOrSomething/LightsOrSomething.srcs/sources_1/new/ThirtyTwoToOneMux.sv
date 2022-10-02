`timescale 1ns / 1ps


module ThirtyTwoToOneMux(
    input [31:0] [31:0] in,
    input [4:0] sel,
    output [31:0] out
    );
    
    wire [31:0] mux1Wire, mux2Wire;
    SixteenToOneMux mux1(in[15:0], sel[3:0], mux1Wire);
    SixteenToOneMux mux2(in[31:16], sel[3:0], mux2Wire);
    assign out = sel[4] ? mux2Wire : mux1Wire;
endmodule
