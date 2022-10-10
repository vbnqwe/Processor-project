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
    reg carry_in;
    reg [31:0] sum;
    
    assign b = rTwo;
    assign bCompliment = ~rTwo;
        
    //comparator variables 
    reg [31:0] compareResult;


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
    
    always @ (opCode or rOne or rTwo)
    begin
        case(opCode)
            3'b000:
            begin
                input_b <= b;
                carry_in <= 0;
            end
            3'b001:
            begin
                input_b <= bCompliment;
                carry_in <= 1;
            end
            3'b010:
            begin
                input_b <= b;
                carry_in <= 0;
                compareResult <= rOne & input_b;
            end
            3'b011:
            begin
                input_b <= b;
                carry_in <= 0;
                compareResult <= rOne | input_b;
            end
            3'b100:
            begin
                input_b <= b;
                carry_in <= 0;
                compareResult <= rOne ^ input_b;
            end
            3'b101:
            begin
                compareResult <= rTwo;
                carry_in <= 0;
            end
            3'b110:
            begin
                input_b <= b;
                carry_in <= 0;
            end
            3'b111:
            begin
                input_b <= b;
                carry_in <= 0;
            end
        endcase
    end
    
    adder arith(
        rOne,
        input_b,
        carry_in,
        sum,
        of,
        c_out
    );
    
    reg [2:0] addCond, subCond;
    initial begin
        addCond = 3'b000;
        subCond = 3'b001;
    end
    wire compOrSum;
    assign compOrSum = (addCond == opCode) | (subCond == opCode);
    assign out = compOrSum ? sum : compareResult;
endmodule
