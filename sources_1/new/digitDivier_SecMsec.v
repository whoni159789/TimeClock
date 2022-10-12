`timescale 1ns / 1ps

module digitDivier_SecMsec(
    input [5:0] i_sec,
    input [6:0] i_msec,
    output [3:0] o_10_sec, o_1_sec, o_10_msec, o_1_msec
    );

    assign o_10_sec = i_sec /10 % 10;
    assign o_1_sec = i_sec % 10;
    assign o_10_msec = i_msec / 10 % 10;
    assign o_1_msec = i_msec % 10;

endmodule
