`timescale 1ns / 1ps

module Decoder_3x4(
    input [2:0] i_digitPosition,
    output [3:0] o_Digit
    );

    reg [3:0] r_Digit;
    assign o_Digit = r_Digit;

    always @(*) begin
        r_Digit = 4'b1111;
        case (i_digitPosition)
            3'b000 : r_Digit = 4'b1110;
            3'b001 : r_Digit = 4'b1101;
            3'b010 : r_Digit = 4'b1011;
            3'b011 : r_Digit = 4'b0111;
            3'b100 : r_Digit = 4'b1110;
            3'b101 : r_Digit = 4'b1101;
            3'b110 : r_Digit = 4'b1011;
            3'b111 : r_Digit = 4'b0111;
        endcase
    end
endmodule
