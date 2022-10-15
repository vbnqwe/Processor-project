/*
RULES FOR WRITING CODE:
*<O> is opcode, <rX> is register X or regX
add reg1 + immidiate into reg3:                          011<O>00<r1><r3><-----im------>0
add reg1 + reg2 into reg3:                               110<O>00<r1><r2><r3>000000000000
load data from address in reg1 into reg3:                01101101<r1><r3>0000000000000000 
write data from reg3 into address in reg1:               00101111<r1><r3>0000000000000000
assign immidiate into reg3:                              011101000000<r3><-----im------>0
operation between reg1 and reg2 for branch to immidiate: X00<O>0X<r1><r2><-----im------>1
 */


module InstructionMemory(
    input [3:0] address,
    output [31:0] data
    );

    wire [15:0] decOut;
    reg [31:0] ROM [15:0];
    
    always @ (address) begin
        //work lines:
        //1100_0000_0000_0000_1111_1111_1111_1111
        //a000ffff
        //ROM[0] = 32'h74000000; //EMPTY LINE, registers will not be updated
        
        //below is a test for adding to registers 
        //ROM[1] = 32'h7400000a; //assign 0005 into reg 0 
        //ROM[2] = 32'h74010008; //assign 0004 into reg 1 
        //ROM[3] = 32'hc0012000; //r1 and r0 into r2*/
        
        //below is a test for writing stuff to stack
        //ROM[1] = 32'h74000002; //1 into r0 (address)
        //ROM[2] = 32'h74010004; //5 into r1 (data);
        //ROM[3] = 32'h2f010000; //r1 data goes into location stored in r0
        
        //below is a test for branching
        //ROM[1] = 32'h7400000a; //assign 0005 into reg 0 
        //ROM[2] = 32'h74010008; //assign 0004 into reg 1 
        //ROM[3] = 32'hc0012000; if reg 0 == reg 1, 
        ROM[4] = 32'h00120000; 
        ROM[5] = 32'h00000000;
        ROM[6] = 32'h00000000;
        ROM[7] = 32'h00000000;
        ROM[8] = 32'h00000000;
        ROM[9] = 32'h00000000;
        ROM[10] = 32'h00000000;
        ROM[11] = 32'h00000000;
        ROM[12] = 32'h00000000;
        ROM[13] = 32'h00000000;
        ROM[14] = 32'h00000000;
        ROM[15] = 32'h00000000;
        
    end   
    
    assign data = ROM[address];
    
endmodule