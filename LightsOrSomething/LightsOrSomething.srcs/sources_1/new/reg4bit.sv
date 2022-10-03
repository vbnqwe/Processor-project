`timescale 1ns / 1ps


module reg4bit(
    input logic [3:0] dataIn,
    input logic CLK,
    output logic [3:0] dataOut
    );
    always_ff @(posedge CLK)begin
        dataOut <= dataIn;
    end
    
endmodule
