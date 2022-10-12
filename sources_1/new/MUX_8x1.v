`timescale 1ns / 1ps

module MUX_8x1(
    input [3:0] i_in_1, i_in_2, i_in_3, i_in_4, i_dot_1, i_dot_2, i_dot_3, i_dot_4,
    input [2:0] i_digitPosition,
    output [3:0] o_value
    );

    reg [3:0] r_value;
    assign o_value = r_value;

    always @(*) begin
        case (i_digitPosition)
            3'b000 : r_value = i_in_4;
            3'b001 : r_value = i_in_3;
            3'b010 : r_value = i_in_2;
            3'b011 : r_value = i_in_1;
            3'b100 : r_value = i_dot_4;
            3'b101 : r_value = i_dot_3;
            3'b110 : r_value = i_dot_2;
            3'b111 : r_value = i_dot_1;
        endcase
    end
endmodule
