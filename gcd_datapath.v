module gcd_datapath(
    input reset,
    input clk,
    input wire [3:0] x_in,
    input wire [3:0] y_in,
    output reg [3:0] gcd_output  
);

reg [3:0] x;
reg [3:0] y;
integer i;

always @(posedge clk) begin
    if(reset) begin
        gcd_output <=0;
    end 
    else begin
        x=x_in;
        y=y_in;

        for(i=1;i<=5;i=i+1) begin
             if(x!=y) begin

                if(x>y) begin
                    x=x-y;
                end
                else if(y>x) begin y=y-x;
                end
            
            else if(x==y) begin 
                gcd_output=x;
            end

        end


        end
       


    end
end

endmodule