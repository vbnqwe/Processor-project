`timescale 1ns / 1ps


module FourToSixteenDecoder(
    input [3:0] in,
    output logic [15:0] out
    );
    
    //wire [15:0] enableWire;
    //assign enableWire = {32{enable}};
    //wire [15:0] outputWire;
    ThreeToEightDecoder dec1(in[2:0], ~in[3], out[7:0]);
    ThreeToEightDecoder dec2(in[2:0], in[3], out[15:8]);
    //assign out = outputWire & enableWire;
endmodule
