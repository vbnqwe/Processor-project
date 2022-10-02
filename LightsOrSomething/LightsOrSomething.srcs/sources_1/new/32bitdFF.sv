`timescale 1ns / 1ps


module FF32Bit(
    input [31:0] data,
    input CLK,
    output [31:0] out
    );
    
    always @(posedge CLK) begin
        out <= data;
    end
endmodule
