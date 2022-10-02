`timescale 1ns / 1ps


module schematicTest(
    input [3:0] a,
    input [1:0] b,
    output c
    );
    
    assign c = b[1] ? (b[0] ? a[0] : a[1]) : (b[0] ? a[2] : a[3]);
    
endmodule
