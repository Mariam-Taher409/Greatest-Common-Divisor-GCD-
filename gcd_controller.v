module gcd_controller(
    input reset,
    input clk,
    input reg [3:0] x_dp,
    input reg [3:0] y_dp,
    output reg [3:0] dp_gcd_output  
);

parameter state_register_width =4;
parameter [state_register_width -1:0] rst_state =4'd0,    
                                      non_equallety_condition_state =4'd1,
                                      greater_val_state =4'd2,
                                      x_minus_state =4'd3,
                                      y_minus_state =4'd4,
                                      gcd_state =4'd5;

reg [state_register_width -1:0] curr_state ,next_state;


always @(posedge clk) begin
    
    if(reset) begin
        next_state <=rst_state;

        else begin
            curr_state <=next_state;

            case(curr_state) 

            rst_state : begin
                gcd_output =0;
            end

            non_equallety_condition_state : begin
                if(x_dp!=y_dp) begin
                    if(x_dp>y_dp) begin 
                        x_minus_state : begin 
                            x_dp<=x_dp-y_dp;
                        end
                    end
                    else begin 
                        y_minus_state : begin
                            y_dp<=y_dp-x_dp;
                        end
                    end
                end
                else if(x_dp==y_dp) begin
                    dp_gcd_output :begin
                        gcd_output <=x_dp;
                    end
                end

            end


            endcase

        end

    end
end

    

endmodule