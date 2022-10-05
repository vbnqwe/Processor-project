module InstructionMemory(
    input [3:0] address,
    output [31:0] data
    );

    wire [15:0] decOut;
    reg [31:0] ROM [15:0];
    
    always @ (address) begin
        //work lines:
        //assign reg1 = 5;
        //assign reg2 = 6;
        //assign reg0 = reg1 + reg2
        //0111_0100_0000_0001_0000_0000_0000_0005
        //0111_0100_0000_0002_0000_0000_0000_0006
        //1100_0000_0001_0002_0000_0000_0000_0000
        //32'h74010005
        //32'h74020006
        //32'hC0120000
        ROM[0] = 32'h74010005;
        ROM[1] = 32'h74000006;
        ROM[2] = 32'hC0120000;
        ROM[3] = 32'h74000008;
        ROM[4] = 32'h74000009;
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