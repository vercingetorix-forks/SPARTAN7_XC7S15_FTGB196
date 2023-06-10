`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2023 18:10:28
// Design Name: 
// Module Name: led_top_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module led_top_tb(

    );
    
    parameter CLK_PERIOD=20;
    parameter DLY_CNT = 32'd5000000;
    parameter HALF_DLY_CNT = 32'd2500000;
    
    reg clk;
    reg rst;
    reg sw;
    wire led_1;
    wire led_2;
  //  wire [31:0] cnt;
    
led_top #(.DLY_CNT(DLY_CNT), 
.HALF_DLY_CNT(HALF_DLY_CNT))
DUT (
.sys_clk(clk),
.sys_rst_n(rst),
.sw_1(sw),
.led_1(led_1),
.led_2(led_2)//,
//.cnt(cnt)
);

initial begin
clk = 1;
rst = 0;
sw = 0;
#(1*CLK_PERIOD) rst=1;
//#(5000*CLK_PERIOD) rst=1;
$finish;
end

always #(CLK_PERIOD/2) clk = ~clk;
always #(CLK_PERIOD/2) sw = ~sw;

endmodule
