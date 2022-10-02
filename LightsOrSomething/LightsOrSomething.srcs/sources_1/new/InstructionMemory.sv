module InstructionMemory(
    input [3:0] address,
    output [31:0] data
    );

    wire [15:0] decOut;
    reg [15:0] ROM [31:0];
    
    initial
    begin
        ROM[0] = 32'hffff0000;
        ROM[1] = 32'h0000ffff;
    end
    
    FourToSixteenDecoder dec(address, decOut);
    
    wire [15:0] [31:0] ROMOut;
    genvar i;
    generate
        for(i = 0; i < 16; i = i + 1)begin
            assign ROMOut[i] = {32{decOut[i]}} & ROM[i];
        end    
    endgenerate 
    
    assign data = |ROMOut;
    
endmodule