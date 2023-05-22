module gcd_top(
    input reset,
    input clk,
    output reg [3:0] gcd_output
);

reg [3:0] X,Y;
gcd_controller controller (
    .clk(clk),
    .reset(reset),
    .dp_gcd_output(gcd_output),
    .x_dp(X),
    .y_dp(Y)
);


gcd_datapath datapath (
    .clk(clk),
    .reset(reset),
    .gcd_output(gcd_output)

);


endmodule 