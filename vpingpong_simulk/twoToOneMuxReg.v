`timescale 1ns / 1ps

module twotoonemuxreg(
    
    input clk,
    input reset,
    
    input sel,
    input [7:0] subblki0,
    input [7:0] subblki1,
    
    output reg [7:0] subblko

    );


    always@(posedge clk) begin

        subblko <= (sel == 1)? subblki1: subblki0;

    end
endmodule
