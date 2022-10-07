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
        ROM[0] = 32'h00000000; //EMPTY LINE, registers will not be updated 
        ROM[1] = 32'hc0001111; 
        ROM[2] = 32'h00000000;
        ROM[3] = 32'h00000000;
        ROM[4] = 32'h00000000;
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