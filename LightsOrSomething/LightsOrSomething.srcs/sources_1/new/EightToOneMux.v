`timescale 1ns / 1ps



module EightToOneMux(
    input [7:0] [31:0] in,
    input [2:0] sel,
    output [31:0] out
    );
    wire [31:0] mux1Wire, mux2Wire;
    FourToOneMux mux1(in[3:0], sel[1:0], mux1Wire);
    FourToOneMux mux2(in[7:4], sel[1:0], mux2Wire);
    assign out = sel[2] ? mux2Wire : mux1Wire;
endmodule
