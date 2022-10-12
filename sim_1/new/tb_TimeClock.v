`timescale 1ns / 1ps

module tb_TimeClock();
    // input
    reg i_clk = 1'b0;
    reg i_reset;
    reg i_modeSW;

    // ourput
    wire [3:0] o_FND_Digit;
    wire [7:0] o_FND_Font;

    // wire
    wire w_digit_clk;
    wire [2:0] w_digitPosition;

    wire w_time_clk;
    wire [5:0] w_hour, w_min, w_sec;
    wire [6:0] w_msec;
    wire [3:0] w_10_hour, w_1_hour, w_10_min, w_1_min, w_10_sec, w_1_sec, w_10_msec, w_1_msec;
    wire [3:0] w_fndDP;
    wire [3:0] w_hourmin_value, w_secmsec_value, w_value;

    // Digit Part
    ClockDivider_Digit clkdiv_digit(
        .i_clk(i_clk), 
        .i_reset(i_reset),
        .o_clk(w_digit_clk)
    );

    Counter_FND count_fnd(
        .i_clk(w_digit_clk),
        .i_reset(i_reset),
        .o_digitPosition(w_digitPosition)
    );

    Decoder_3x4 Digit(
        .i_digitPosition(w_digitPosition),
        .o_Digit(o_FND_Digit)
    );

    // Time Data Part
    ClockDivider_TimeClock clkdiv_time(
        .i_clk(i_clk), 
        .i_reset(i_reset),
        .o_clk(w_time_clk)
    );

    Counter_TimeClock count_time(
        .i_clk(w_time_clk), 
        .i_reset(i_reset),
        .o_hour(w_hour), 
        .o_min(w_min), 
        .o_sec(w_sec),
        .o_msec(w_msec)
    );
    
    digitDivider_HourMin digitdiv_HourMin(
        .i_hour(w_hour), 
        .i_min(w_min), 
        .o_10_hour(w_10_hour),
        .o_1_hour(w_1_hour), 
        .o_10_min(w_10_min), 
        .o_1_min(w_1_min)
    );

    digitDivier_SecMsec digitdiv_SecMsec(
        .i_sec(w_sec),
        .i_msec(w_msec),
        .o_10_sec(w_10_sec), 
        .o_1_sec(w_1_sec), 
        .o_10_msec(w_10_msec), 
        .o_1_msec(w_1_msec)
    );

    Comparator comp(
        .i_msec(w_msec),
        .o_fndDP(w_fndDP)
    );

    MUX_8x1 HorMin(
        .i_in_1(w_10_hour),
        .i_in_2(w_1_hour), 
        .i_in_3(w_10_min), 
        .i_in_4(w_1_min), 
        .i_dot_1(11), 
        .i_dot_2(w_fndDP), 
        .i_dot_3(11), 
        .i_dot_4(11),
        .i_digitPosition(w_digitPosition),
        .o_value(w_hourmin_value)
    );

    MUX_8x1 SecMsec(
        .i_in_1(w_10_sec),
        .i_in_2(w_1_sec), 
        .i_in_3(w_10_msec), 
        .i_in_4(w_1_msec), 
        .i_dot_1(11), 
        .i_dot_2(w_fndDP), 
        .i_dot_3(11), 
        .i_dot_4(11),
        .i_digitPosition(w_digitPosition),
        .o_value(w_secmsec_value)
    );

    MUX_2x1 ModeSelect(
        .i_modeSW(i_modeSW),
        .i_value_HourMin(w_hourmin_value), 
        .i_value_SecMsec(w_secmsec_value),
        .o_value(w_value)
    );

    BCDToFND_Decoder Font(
        .i_value(w_value),
        .o_font(o_FND_Font)
    );

    // Test Part
    always #1 i_clk = ~i_clk;

    initial begin
        #00 i_reset = 1'b1; i_modeSW = 1;

        #100 i_reset = 1'b0; i_modeSW = 1;
        #1100 i_reset = 1'b0; i_modeSW = 1;

        #5100 $finish;
    end

endmodule
