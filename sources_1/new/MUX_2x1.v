`timescale 1ns / 1ps

module MUX_2x1(
    input i_modeSW,
    input [3:0] i_value_HourMin, i_value_SecMsec,
    output [3:0] o_value
    );

    reg [3:0] r_value;
    assign o_value = r_value;

    always @(*) begin
        case (i_modeSW)
            1'b0 : r_value = i_value_HourMin;
            1'b1 : r_value = i_value_SecMsec;
        endcase
    end
endmodule
