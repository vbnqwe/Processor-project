`timescale 1ns / 1ps


module shifter(
    input [31:0] number,
    input [5:0] shift,
    input [1:0] shift_type,
    output [31:0] shifted_number
    );
    
    reg [31:0] lsl_shift = number << shift;
    reg [31:0] lsr_shift = number >> shift;
    reg [31:0] asr_shift = number >>> shift;
    reg [31:0] ror_shift; //IMPLIMENT SOMETIME LATER
    
    /*always @ (shift_type) begin
        case(shift_type)
            00: shifted_number <= lsl_shift;
            01: shifted_number <= lsr_shift;
            10: shifted_number <= asr_shift;
            11: shifted_number <= ror_shift;
        endcase    
    end*/
    
endmodule
