`timescale 1ns / 1ps


module registerFile(    
    input [3:0] a1,
    input [3:0] a2,
    input [3:0] a3,
    input [31:0] wd3,
    input we,
    output [31:0] rd1,
    output [31:0] rd2
    );
    
    wire [15:0] decOut;
    FourToSixteenDecoder dec(a3, decOut);
    wire [15:0] regCLK;
    assign regCLK = decOut & {16{we}};
    
    wire [15:0] [31:0] regOutput;
    wire [15:0] [31:0] dataInWire;
    
    genvar i;
    generate
        for(i = 0; i < 16; i = i + 1)begin
            reg32b register(
                wd3,
                regCLK[i],
                (regOutput[i])
            );
        end
    endgenerate
    SixteenToOneMux m1(regOutput, a1, rd1);
    SixteenToOneMux m2(regOutput, a2, rd2);
    

endmodule


