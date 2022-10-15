# Processor-project
Basic single cycle 32-bit processor, has about 32*32 bits of ram so it is pretty much a potato. More ram can be included easily but for the time being I will only use this limited amount for testing purposes.
Eventually it should be able to do conditionals, loops and multiplication, but for now it can just do basic logic and arithmetic operations and store/load data from memory. 

RULES FOR WRITING CODE:
*<O> is opcode, <rX> is register X or regX

add reg1 + immidiate into reg3:
011<O>00<r1><r3><-----im------>0

add reg1 + reg2 into reg3:
110<O>00<r1><r2><r3>000000000000

load data from address in reg1 into reg3:
01101101<r1><r3>0000000000000000 

write data from reg3 into address in reg1:
00101111<r1><r3>0000000000000000

assign immidiate into reg3:
011101000000<r3><-----im------>0

operation between reg1 and reg2 for branch to immidiate: X00<O>0X<r1><r2><-----im------>1

First instruction in the memory is ignored, as registers are only loaded on posedge of clk, which only occurs for 2nd line (index=1).
