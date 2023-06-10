`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:40:55 02/28/2016 
// Design Name: 
// Module Name:    led_top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module led_top(
    input sys_clk,
    input sys_rst_n,
    input sw_1,
    output led_1,
    output led_2//, 
  //  output [31:0] cnt
    );

//parameter DLY_CNT = 32'd50 000 000;
//parameter HALF_DLY_CNT = 32'd25000000;

parameter DLY_CNT = 32'd5000000;
parameter HALF_DLY_CNT = 32'd2500000;

parameter CLOCK_RATE = 32'd50000000;

parameter HZ_DELAY_COUNT = 32'd50000000;
parameter HZ_HALF_DELAY_COUNT = 32'd25000000;


parameter HALF_HZ_DELAY_COUNT = 32'd100000000;
parameter HALF_HZ_HALF_DELAY_COUNT = 32'd50000000;

parameter QUARTER_HZ_DELAY_COUNT = 32'd200000000;
parameter QUARTER_HZ_HALF_DELAY_COUNT = 32'd100000000;


// 2023-05-29 astephen assert initial values for the behavioural simulation

(*mark_debug = "true"*)reg r_led  = 1'b0;
//(*mark_debug = "true"*)reg sw_1  = 1'b0;

(*mark_debug = "true"*)reg [31:0]count = 32'd0;

(*mark_debug = "true"*)reg [7:0]state = 8'd0;
(*mark_debug = "true"*)reg [31:0]count_top = 32'd0;
(*mark_debug = "true"*)reg [31:0]count_half = 32'd0;

//counter control
always@(posedge sys_clk or negedge sys_rst_n)
begin
	if(!sys_rst_n)
		begin
			count <= 32'd0;
			state <= 8'd0;
			count_top <= HZ_DELAY_COUNT;
			count_half <= HZ_HALF_DELAY_COUNT;
		end
	else if(count == count_top)
		begin
			count <= 32'd1;
			if (state == 0) 
			begin
			 count_top <= HALF_HZ_DELAY_COUNT;
			 count_half <= HALF_HZ_HALF_DELAY_COUNT;
			 state = 1;
			end
			else if (state == 1)
			begin
			 count_top <= QUARTER_HZ_DELAY_COUNT;
			 count_half <= QUARTER_HZ_HALF_DELAY_COUNT;
			 state = 2;
			end
			else if (state == 2) 
			begin
			 count_top <= HZ_DELAY_COUNT;
			 count_half <= HZ_HALF_DELAY_COUNT;
			 state = 0;
			end
		end
	else
		begin
			count <= count+32'd1;
			//ip_sw_1 <= sw_1;
		end
end

//led output register control
always@(posedge sys_clk or negedge sys_rst_n)
begin
	if(!sys_rst_n)
		begin
			r_led <= 1'b0;
		end
	else if(count < count_half)
		begin
			r_led <= 1'b1;
		end
	else
		begin
			r_led <= 1'b0;
		end 
end

assign led_1 = r_led;
assign led_2 = 0'b0;

//assign cnt = count;
endmodule
