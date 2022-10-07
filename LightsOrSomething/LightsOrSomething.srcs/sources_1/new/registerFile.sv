`timescale 1ns / 1ps


module registerFile(    
    input [3:0] a1,
    input [3:0] a2,
    input [3:0] a3,
    input [31:0] wd3,
    input we,
    input clk,
    output [31:0] rd1, rd2
    );
    
    wire [15:0] decOut;
    FourToSixteenDecoder dec(a3, decOut);
    wire [15:0] regCLK;
    assign regCLK = decOut & {16{we}} & {16{clk}};
    wire [15:0] [31:0] regOutputs;
    generate
        genvar i;
        for(i = 0; i < 16; i = i + 1)begin
            reg32b register(
                wd3,
                regCLK[i],
                regOutputs[i]
            );
        end
    endgenerate
    
    SixteenToOneMux mux1(
        regOutputs,
        a1,
        rd1
    );
    
    SixteenToOneMux mux2(
        regOutputs,
        a2,
        rd2
    );


endmodule