`timescale 1ns / 1ps


module top(
        input clock,
        output [31:0] r0
    );
    
    wire CLK;
    assign CLK = clock;
    //Various mux decidor things
    wire ldrMem;
    wire wriMem;
    wire branch;
    wire [2:0] opCode;
    wire rd2ImmMux;
    wire dst;
    wire we;
    wire [15:0] imm;

    wire [3:0] a1, a2, a3;
    wire [31:0] w3, rd1, rd2;
    registerFile rf(
        a1,
        a2,
        a3,
        w3,
        we,
        rd1,
        rd2,
        r0
    );
    
    
    wire [31:0] aluInputOne, aluInputTwo, aluOut;
    wire of, c_out;
    
    wire [31:0] signExt;
    assign aluInputOne = rd1;
    assign aluInputTwo = rd2ImmMux ? signExt : rd2;
    
    ALU alu(
        opCode,
        aluInputOne,
        aluInputTwo,
        aluOut,
        of,
        c_out
    );
    
    
    wire [31:0] readData;
    MemoryArray memArr(
        CLK,
        wriMem,
        aluOut,
        rd2,
        readData
    );
    
    assign w3 = ldrMem ? readData : aluOut;
    
    
    
    wire [3:0] instAddress;
    wire [31:0] addData;
    wire [3:0] addedInstAddress;
    assign addedInstAddress = 1 + instAddress;
    reg4bit instReg(
        addedInstAddress,
        CLK,
        instAddress
    );
    InstructionMemory instMem(
        instAddress,
        addData
    );
    
    assign dst = addData[31];
    assign we = addData[30];
    assign rd2ImmMux = addData[29];
    assign opCode = addData[28:26];
    assign wriMem = addData[25];
    assign ldrMem = addData[24];
    assign a1 = addData[23:20];
    assign a2 = addData[19:16];
    assign a3 = dst ? addData[19:16] : addData[15:12];
    assign imm = addData[15:0];
    
    
    SignExtender extender(
        imm,
        signExt
    );
    
endmodule
