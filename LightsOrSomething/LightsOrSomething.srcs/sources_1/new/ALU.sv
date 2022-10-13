`timescale 1ns / 1ps


module ALU(
    input [2:0] opCode,
    input [31:0] rOne,
    input [31:0] rTwo,
    output [31:0] out,
    output of,
    output c_out
    );
    
    wire [31:0] notrTwo, inputOne, inputTwo;
    assign notrTwo = ~rTwo;
    wire ifNegative;
    assign ifNegative = opCode[0] & ~opCode[1] & ~opCode[2];
    assign inputTwo = ifNegative ? notrTwo : rTwo;
    assign inputOne = rOne;
    
    wire [31:0] andOp, orOp, xorOp, assignOp, sumOp;
    assign andOp = rOne & rTwo;
    assign orOp = rOne | rTwo;
    assign xorOp = rOne ^ rTwo;
    assign assignOp = rTwo;
        
    adder arith(
        inputOne,
        inputTwo,
        ifNegative,
        sumOp,
        of,
        c_out
    );
    
    reg [31:0] tempOutput;
    always @ (rOne or rTwo or opCode)
    begin
        case(opCode)
            3'b000: tempOutput <= sumOp;
            3'b001: tempOutput <= sumOp;
            3'b010: tempOutput <= andOp;
            3'b011: tempOutput <= orOp;
            3'b100: tempOutput <= xorOp;
            3'b101: tempOutput <= assignOp;
            3'b110: tempOutput <= sumOp;
            3'b111: tempOutput <= sumOp;
        endcase
    end
    assign out = tempOutput;
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
    
endmodule
