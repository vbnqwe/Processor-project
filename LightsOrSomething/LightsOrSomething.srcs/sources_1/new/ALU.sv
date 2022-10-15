`timescale 1ns / 1ps


module ALU(
    input [2:0] opCode,
    input [31:0] rOne,
    input [31:0] rTwo,
    output reg [31:0] out,
    output of,
    output c_out,
    output [31:0] test
    );
    
    wire [31:0] notrTwo, inputOne, inputTwo;
    assign notrTwo = ~rTwo;
    wire ifNegative;
    assign ifNegative = opCode[0] & ~opCode[1] & ~opCode[2];
    assign inputTwo = ifNegative ? notrTwo : rTwo;
    assign inputOne = rOne;
    
    wire [31:0] sumOp;
        
    adder arith(
        inputOne,
        inputTwo,
        ifNegative,
        sumOp,
        of,
        c_out
    );
    
    always @ (rOne or rTwo or opCode)
    begin
        case(opCode)
            3'b000: out <= sumOp;
            3'b001: out <= sumOp;
            3'b010: out <= rTwo & rOne;
            3'b011: out <= rTwo | rOne;
            3'b100: out <= rTwo ^ rOne;
            3'b101: out <= rTwo;
            3'b110: out <= sumOp;
            3'b111: out <= sumOp;
        endcase
    end
   
    /*
    Opcode table:
    000 - add
    001 - subtract
    010 - and
    011 - or
    100 - xor
    101 - assign
    ADD SHIFTING FOR OPCODES BELOW
    110 - arithmetic shift left
    111 - logical shift left
    */
    assign test = rOne | rTwo;
endmodule
