`timescale 1ns / 1ps


module full_adder(
    input a,
    input b,
    input carry_in,
    output out,
    output carry_out
    );
    
    assign carry_out = (a & b) | (a & carry_in) | (b & carry_in);
    assign out = (a & b & carry_in) | (~a & ~b & carry_in) | (a & ~b & ~carry_in) | (a & ~b & ~carry_in);
endmodule
