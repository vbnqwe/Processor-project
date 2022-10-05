`timescale 1ns / 1ps


module top(
        input clock,
        output [31:0] r0, r1, r2
    );
    


    wire [3:0] addedAddress;
    wire [3:0] address;
    reg [3:0] register = 0; 
    wire [31:0] dataWire;
    assign addedAddress = 1 + address;
    InstructionMemory instMem(
        address,
        dataWire
    );
    
    always @ (posedge clock)begin
        register = addedAddress;
    end
    
    assign address = register;
    
    wire [3:0] a1, a2, a3a, a3b;
    wire [15:0] imm;
    wire [31:0] wd3, rd1, rd2;
    wire a2OrA3, regWrite, immOrReg, ifWrite, ifLoad;
    wire [2:0] opCode;
    assign a2OrA3 = dataWire[31];
    assign regWrite = dataWire[30];
    assign immOrReg = dataWire[29];
    assign opCode = dataWire[28:26];
    assign ifWrite = dataWire[25];
    assign ifLoad = dataWire[24];
     
    assign a1 = dataWire[23:20];
    assign a2 = dataWire[19:16];
    assign a3a = dataWire[19:16];
    assign a3b = dataWire[15:12];
    assign immExt = {{16{dataWire[15]}}, dataWire[15:0]};

    
    wire [31:0] immExt;    
    
    assign a3 = a2OrA3 ? a3a : a3b;
    
    registerFile rf(
        a1,
        a2,
        a3,
        wd3,
        regWrite,
        rd1,
        rd2
    );
    
    wire [31:0] rTwo;
    wire [31:0] aluOut;
    assign rTwo = immOrReg ? immExt : rd2; 
    wire of, carry_out;


    assign r0 = aluOut;
    ALU arith(
        opCode,
        rd1,
        rTwo,
        aluOut,
        of,
        carry_out
    );
    
    wire [3:0] dataAddress;
    assign dataAddress = rd2[3:0];
    wire [31:0] memOut;
    
    MemoryArray stack(
        clock,
        ifWrite,
        dataAddress,
        aluOut,
        memOut
    );
    
    wire [31:0] result;
    assign result = ifLoad ? memOut : aluOut;
    assign wd3 = result;
endmodule
