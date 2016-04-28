`timescale 1ns / 1ps

`include "macro_para.v"

module eachBlkToEachPang_Pipe5(

    input clk,
    input reset,
    
    input [`SUB_BLK_BIT-1:0] z00,
    input [`SUB_BLK_BIT-1:0] z01,
    input [`SUB_BLK_BIT-1:0] z02,
    input [`SUB_BLK_BIT-1:0] z03,
    input [`SUB_BLK_BIT-1:0] z04,
    input [`SUB_BLK_BIT-1:0] z05,
    input [`SUB_BLK_BIT-1:0] z06,
    input [`SUB_BLK_BIT-1:0] z07,
    
    input [`SUB_BLK_BIT-1:0] z08,
    input [`SUB_BLK_BIT-1:0] z09,
    input [`SUB_BLK_BIT-1:0] z10,
    input [`SUB_BLK_BIT-1:0] z11,
    input [`SUB_BLK_BIT-1:0] z12,
    input [`SUB_BLK_BIT-1:0] z13,
    input [`SUB_BLK_BIT-1:0] z14,
    input [`SUB_BLK_BIT-1:0] z15,
    
    input zNeedFull,
    input [`SFT_BIT-1:0] zNeedPangStartInc,
    input [`SFT_BIT-1:0] zNeedPangEndInc,
    
    input [`SFT_BIT-1:0] next_sft,
    
    output reg [`SUB_BLK_BIT-1:0] subBlko
    
    );
    
    wire [`SUB_BLK_BIT-1:0] zSubBlko;
    wire zTakeBlk;
        
    sixteenToOneMuxTakeBlk_Pipe4 pangPath(
        .clk(clk), 
        .reset(reset),
        .sel(next_sft), 
        
        .subBlki0(z00),
        .subBlki1(z01),  
        .subBlki2(z02),  
        .subBlki3(z03),  
        .subBlki4(z04),  
        .subBlki5(z05), 
        .subBlki6(z06),  
        .subBlki7(z07),  
        
        .subBlki8(z08),
        .subBlki9(z09),     
        .subBlki10(z10),    
        .subBlki11(z11), 
        .subBlki12(z12),    
        .subBlki13(z13),    
        .subBlki14(z14),    
        .subBlki15(z15),
         
        .subBlko(zSubBlko),
        
        .myTurnPingPong(1'b1), 
        
        .needPang(zNeedFull),
        .needPangStartInc(zNeedPangStartInc), 
        .needPangEndInc(zNeedPangEndInc),         
        .takeBlko(zTakeBlk)
    );
    
    always@(posedge clk or posedge reset) begin
        if (reset) begin            
            subBlko <= 0;         
            
        end else begin
            
            if (zTakeBlk) begin
                subBlko <= zSubBlko;
            end 
        end
    end
    
endmodule
