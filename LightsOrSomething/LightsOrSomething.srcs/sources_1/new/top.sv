`timescale 1ns / 1ps


module top(
        input clock,
        output [31:0] out, codeLine, test
    );
    
    
    
    /**********************************************************
    -------------------Instruction Memory----------------------
    **********************************************************/
    assign line = dataWire;

    wire [3:0] addedAddress;
    wire [3:0] address;
    reg [3:0] addressReg = 0; 
    wire [31:0] dataWire;
    
    assign address = addressReg;
    
    assign addedAddress = 1 + address;
    
    InstructionMemory instMem(
        address,
        dataWire
    );
    
    always_ff @ (posedge clock)begin
        addressReg <= addedAddress;
    end
        
    
    
    /**********************************************************
    -------------------Wire assignment-------------------------
    **********************************************************/
    wire a2OrA3, regOrMemWrite, immOrReg, ifWriteMem, ifLoadMem;
    wire [2:0] opCode;
    wire [3:0] a1, a2, a3;
    wire [15:0] imm;
    assign a2OrA3 = dataWire[31]; //1 for a2 position, 0 for a3 position
    assign regOrMemWrite  = dataWire[30]; //1 for reg write, 0 for mem write
    assign immOrReg = dataWire[29];
    assign opCode = dataWire[28:26];
    assign ifWriteMem = dataWire[25];
    assign ifLoadMem = dataWire[24];
    assign a1 = dataWire[23:20];
    assign a2 = dataWire[19:16];
    assign a3 = a2OrA3 ? dataWire[15:12] : dataWire[19:16];
    assign imm = dataWire[15:0];
    
    
    
    /**********************************************************
    -----------------------Register file-----------------------
    **********************************************************/
    wire [31:0] wd3, rd1, rd2;
    registerFile regs(
        a1,
        a2,
        a3,
        wd3,
        regOrMemWrite,
        clock,
        rd1,
        rd2
    );
    wire [31:0] r2;
    assign r2 = immOrReg ? imm : rd2;
    
    
    /**********************************************************
    ----------------------------ALU----------------------------
    **********************************************************/
    wire of, carry_out;
    wire [31:0] aluOut;
    ALU aluModule(
        opCode,
        rd1,
        r2,
        aluOut,
        of,
        carry_out
    );
    
    assign out = rd1;
    assign wd3 = aluOut;//dataWire[15:0];
    assign codeLine = rd2;
endmodule
