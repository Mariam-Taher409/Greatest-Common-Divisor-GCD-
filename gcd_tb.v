`timescale 1ns/1ps
module gcd_tb;

parameter clk_period =10 ;
reg clk=0;
always#(clk_period /2)  clk= ~clk;

reg  [3:0] x_tb ,y_tb ,gcd_output_tb ;
wire reset ;

gcd_top top(
    .clk(clk),
    .reset(reset),
    .x_tb(X),
    .y_tb(Y),
    .gcd_output(gcd_output_tb)
);

initial begin
    clk =0;
    reset =1;

    x_tb=4'd4;
    y_tb=4'd14;

    #(clk_period);

    $display("The GCD for x:%d ,y:%d is =%d \n",X,Y,gcd_output_tb);

     clk =0;
    reset =1;

    x_tb=4'd8;
    y_tb=4'd4;

    #(clk_period);

    $display("The GCD for x:%d ,y:%d is =%d \n",X,Y,gcd_output_tb);

    $finish();

end

endmodule