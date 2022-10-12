`timescale 1ns / 1ps

module digitDivider_HourMin(
    input [5:0] i_hour, i_min,
    output [3:0] o_10_hour, o_1_hour, o_10_min, o_1_min
    );

    assign o_10_hour = i_hour /10 % 10;
    assign o_1_hour = i_hour % 10;
    assign o_10_min = i_min / 10 % 10;
    assign o_1_min = i_min % 10;

endmodule
