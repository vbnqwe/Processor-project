`timescale 1ns / 1ps


module reg32b(
    input logic [31:0] data,
    input logic CLK,
    output logic [31:0] out
    );
    
    always_ff @(posedge CLK)begin
        out <= data;
    end
endmodule
