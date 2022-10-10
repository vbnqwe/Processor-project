# Processor-project
Basic single cycle 32-bit processor, has about 32*32 bits of ram so it is pretty much a potato.
Eventually it should be able to do conditionals, multiplication, for loops, store stuff in the stack and some other things. For now it is just a glorified calculator that can add, subtract, and, or, xor, invert and store stuff in the registers.
I will eventually add documentation for the machine code, but for the time being here is what I am using:
011<O>00<r1><r3><im> for add reg + imm
110<O>00<r1><r2><r3> for add reg + reg
01101101<r1><r3> for ldr from address reg1 into reg3
X0101110<r1><r2> for writing into address reg1 data in reg2
01110100XXXX<r3><im> for assign into r3
<O> means operation code for the alu
<rX> means register X
<im> means immediate

First instruction in the memory is ignored, as registers are only loaded on posedge of clk, which only occurs for 2nd line (index=1).
