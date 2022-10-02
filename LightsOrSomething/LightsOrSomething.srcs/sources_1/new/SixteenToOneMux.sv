`timescale 1ns / 1ps


module SixteenToOneMux(
    input [15:0] [31:0] in,
    input [3:0] sel,
    output [31:0] out
    );
    
    wire [31:0] mux1Wire, mux2Wire;
    EightToOneMux mux1(in[7:0], sel[2:0], mux1Wire);
    EightToOneMux mux2(in[15:8], sel[2:0], mux2Wire);
    assign out = sel[3] ? mux2Wire : mux1Wire;
endmodule
