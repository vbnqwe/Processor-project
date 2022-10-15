`timescale 1ns / 1ps


module adder(
    input [31:0] input_a,
    input [31:0] input_b,
    input c_i,
    output [31:0] out,
    output lt,
    output gt,
    output eq
    );
    wire carry1, carry2;
    assign {carry, out} = input_a + input_b + c_i;
    assign lt = c_o;
endmodule
