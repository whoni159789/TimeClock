`timescale 1ns / 1ps

module Counter_FND(
    input i_clk,
    input i_reset,
    output [1:0] o_digitPosition
    );

    reg [1:0] r_digitPosition;
    assign o_digitPosition = r_digitPosition;

    always @(posedge i_clk or posedge i_reset) begin
        if(i_reset) begin
            r_digitPosition <= 0;
        end
        else begin
            r_digitPosition <= r_digitPosition + 1;
        end
    end
endmodule
