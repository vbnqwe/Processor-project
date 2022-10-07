`timescale 1ns / 1ps


module reg32b(
    input logic [31:0] data,
    input logic CLK,
    output logic [31:0] out
    );
    
    reg [31:0] register;
    initial begin
        register = 32'h00000000;
    end
    always @(posedge CLK)begin
        register <= data;
    end
    
    assign out = register;
  
    
endmodule
