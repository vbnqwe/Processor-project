`timescale 1ns / 1ps


module adder_tb;
    reg [3:0] address;
    wire [31:0] data;
    
    InstructionMemory dut(address, data);
    
    initial begin
        address = 0;
        #5;
        address = 1;
    end
endmodule
