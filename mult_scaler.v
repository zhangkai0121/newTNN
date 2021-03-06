`include "network_params.vh"
module mult_scaler(clk,rst_n,in1,in2,out);
input clk;
input rst_n;
input signed [`ADD_OUT_WIDTH - 1 : 0 ]in1;
input signed [`SCALER_WIDTH - 1 : 0 ]in2;
output signed[`MULT_SCALER_OUT_WIDTH - 1 : 0 ]out;
reg signed [`ADD_OUT_WIDTH + `SCALER_WIDTH  - 1 :0]temp_out;

always@(posedge clk or negedge rst_n)
    if(!rst_n)
        temp_out<= 0;
    else
        temp_out <= in1 * in2;
assign out[`MULT_SCALER_OUT_WIDTH - 1 : 0 ] = temp_out[`ADD_OUT_WIDTH + `SCALER_WIDTH  - 1: `ADD_OUT_WIDTH + `SCALER_WIDTH - `MULT_SCALER_OUT_WIDTH ];
endmodule