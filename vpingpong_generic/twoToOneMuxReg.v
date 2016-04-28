`timescale 1ns / 1ps

`include "macro_para.v"

module twoToOneMuxReg(
    
    input clk,
    input reset,
    
    input sel,
    input [`SUB_BLK_BIT-1:0] subBlki0,
    input [`SUB_BLK_BIT-1:0] subBlki1,
    
    output reg [`SUB_BLK_BIT-1:0] subBlko

    );


    always@(posedge clk or posedge reset) begin
        if (reset) begin
            subBlko <= 0;
            
        end else begin
            subBlko <= (sel == 1)? subBlki1: subBlki0;
        end
    end

endmodule
