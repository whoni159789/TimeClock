`timescale 1ns / 1ps

module MUX_4x1(
    input [3:0] i_in_1, i_in_2, i_in_3, i_in_4,
    input [1:0] i_digitPosition,
    output [3:0] o_value
    );

    reg [3:0] r_value;
    assign o_value = r_value;

    always @(*) begin
        case (i_digitPosition)
            2'b00 : r_value = i_in_4;
            2'b01 : r_value = i_in_3;
            2'b10 : r_value = i_in_2;
            2'b11 : r_value = i_in_1;
        endcase
    end
endmodule
