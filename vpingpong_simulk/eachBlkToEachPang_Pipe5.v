`timescale 1ns / 1ps

module eachblktoeachpang_pipe5(

    input clk,
    input reset,
    
    input [7:0] z00,
    input [7:0] z01,
    input [7:0] z02,
    input [7:0] z03,
    input [7:0] z04,
    input [7:0] z05,
    input [7:0] z06,
    input [7:0] z07,
    
    input [7:0] z08,
    input [7:0] z09,
    input [7:0] z10,
    input [7:0] z11,
    input [7:0] z12,
    input [7:0] z13,
    input [7:0] z14,
    input [7:0] z15,
    
    input zneedfull,
    input [3:0] zneedpangstartinc,
    input [3:0] zneedpangendinc,
    
    input [3:0] next_sft,
    
    output reg [7:0] subblko
    
    );
    
    wire [7:0] zsubblko;
    wire ztakeblk;
        
    sixteentoonemuxtakeblk_pipe4 pangPath(
        .clk(clk), 
        .reset(reset),
        .sel(next_sft), 
        
        .subblki0(z00),
        .subblki1(z01),  
        .subblki2(z02),  
        .subblki3(z03),  
        .subblki4(z04),  
        .subblki5(z05), 
        .subblki6(z06),  
        .subblki7(z07),  
        
        .subblki8(z08),
        .subblki9(z09),     
        .subblki10(z10),    
        .subblki11(z11), 
        .subblki12(z12),    
        .subblki13(z13),    
        .subblki14(z14),    
        .subblki15(z15),
         
        .subblko(zsubblko),
        
        .myturnpingpong(1'b1), 
        
        .needpang(zneedfull),
        .needpangstartinc(zneedpangstartinc), 
        .needpangendinc(zneedpangendinc),         
        .takeblko(ztakeblk)
    );
    
    always@(posedge clk or posedge reset) begin
        if (reset) begin            
            subblko <= 0;         
            
        end else begin
            
            if (ztakeblk) begin
                subblko <= zsubblko;
            end 
        end
    end
    
endmodule
