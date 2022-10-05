`timescale 1ns / 1ps


module ALU(
    input [2:0] opCode,
    input [31:0] rOne,
    input [31:0] rTwo,
    output [31:0] out,
    output of,
    output c_out
    );
    
    //addition/subration variables
    wire [31:0] b;
    wire [31:0] bCompliment;
    reg [31:0] input_b;
    reg [31:0] sum;
    
    assign b = rTwo;
    assign bCompliment = ~rTwo;
        
    //comparator variables 
    reg [31:0] compRes;


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
    
    always @ (opCode, rOne, rTwo)
    begin
        case(opCode)
            3'b000: 
            begin 
                input_b = b;
                compRes = input_b + rOne;
            end
            3'b001: 
            begin
                input_b = bCompliment;
                compRes = input_b + rOne + 1;
            end
            3'b010: 
            begin
                input_b = b;
                compRes = rOne & input_b;
            end
            3'b011: 
            begin
                input_b = b;
                compRes = rOne | input_b;
            end
            3'b100: 
            begin
                input_b = b;
                compRes = rOne ^ input_b;
            end
            3'b101:
            begin
                input_b = b;
                compRes = b;
            end
            3'b110: 
            begin
                input_b = b;
                compRes = rOne ^ input_b;
            end
            3'b111: 
            begin
                input_b = bCompliment;
                compRes = rOne ^ input_b;
            end
            default: ;
        endcase       
    end
    
        
    
    adder arith(
        .input_a (rOne),
        .input_b (input_b),
        .c_i (opCode[0]),
        .out (sum),
        .overflow(of),
        .c_o (c_out)
    );
    
    assign out = opCode[1] ? compRes : (opCode[2] ? compRes : sum);
    
endmodule
