`timescale 1ns / 1ps

`include "macro_para.v"

module eachBlkToEachPingPong_Pipe6(

    input clk,
    input reset,
    
    input [`SUB_BLK_BIT-1:0] a00,
    input [`SUB_BLK_BIT-1:0] a01,
    input [`SUB_BLK_BIT-1:0] a02,
    input [`SUB_BLK_BIT-1:0] a03,
    input [`SUB_BLK_BIT-1:0] a04,
    input [`SUB_BLK_BIT-1:0] a05,
    input [`SUB_BLK_BIT-1:0] a06,
    input [`SUB_BLK_BIT-1:0] a07,
    
    input [`SUB_BLK_BIT-1:0] a08,
    input [`SUB_BLK_BIT-1:0] a09,
    input [`SUB_BLK_BIT-1:0] a10,
    input [`SUB_BLK_BIT-1:0] a11,
    input [`SUB_BLK_BIT-1:0] a12,
    input [`SUB_BLK_BIT-1:0] a13,
    input [`SUB_BLK_BIT-1:0] a14,
    input [`SUB_BLK_BIT-1:0] a15,
    
    input [`SFT_BIT-1:0] aNeedPangStartInc,
    input [`SFT_BIT-1:0] aNeedPangEndInc,
    
    input [`SUB_BLK_BIT-1:0] b00,
    input [`SUB_BLK_BIT-1:0] b01,
    input [`SUB_BLK_BIT-1:0] b02,
    input [`SUB_BLK_BIT-1:0] b03,
    input [`SUB_BLK_BIT-1:0] b04,
    input [`SUB_BLK_BIT-1:0] b05,
    input [`SUB_BLK_BIT-1:0] b06,
    input [`SUB_BLK_BIT-1:0] b07,
    
    input [`SUB_BLK_BIT-1:0] b08,
    input [`SUB_BLK_BIT-1:0] b09,
    input [`SUB_BLK_BIT-1:0] b10,
    input [`SUB_BLK_BIT-1:0] b11,
    input [`SUB_BLK_BIT-1:0] b12,
    input [`SUB_BLK_BIT-1:0] b13,
    input [`SUB_BLK_BIT-1:0] b14,
    input [`SUB_BLK_BIT-1:0] b15,
    
    input [`SFT_BIT-1:0] bNeedPangStartInc,
    input [`SFT_BIT-1:0] bNeedPangEndInc,
    
    input pingpong,
    input aNeedPang,
    input bNeedPang,
    input [`SFT_BIT-1:0] sft,
    
    output reg [`SUB_BLK_BIT-1:0] subBlko
    );
    

    
    wire [`SUB_BLK_BIT-1:0] aSubBlko;
    wire aTakeBlk;
    
    sixteenToOneMuxTakeBlk_Pipe4 aPath(
        .clk(clk), 
        .reset(reset),
        .sel(sft), 
        
        .subBlki0(a00),           
        .subBlki1(a01),  
        .subBlki2(a02),  
        .subBlki3(a03),  
        .subBlki4(a04),  
        .subBlki5(a05), 
        .subBlki6(a06),  
        .subBlki7(a07),  
        
        .subBlki8(a08),        
        .subBlki9(a09),     
        .subBlki10(a10),    
        .subBlki11(a11), 
        .subBlki12(a12),    
        .subBlki13(a13),    
        .subBlki14(a14),    
        .subBlki15(a15),
         
        .subBlko(aSubBlko),
        .myTurnPingPong(pingpong),
        
        .needPang(aNeedPang),     
        .needPangStartInc(aNeedPangStartInc), 
        .needPangEndInc(aNeedPangEndInc),         
        .takeBlko(aTakeBlk)
    );

    wire [`SUB_BLK_BIT-1:0] bSubBlko;
    wire bTakeBlk;
    
    sixteenToOneMuxTakeBlk_Pipe4 bPath(
        .clk(clk), 
        .reset(reset),
        .sel(sft), 
        
        .subBlki0(b00),           
        .subBlki1(b01),  
        .subBlki2(b02),
        .subBlki3(b03),  
        .subBlki4(b04),  
        .subBlki5(b05), 
        .subBlki6(b06),  
        .subBlki7(b07),  
        
        .subBlki8(b08),        
        .subBlki9(b09),     
        .subBlki10(b10),    
        .subBlki11(b11), 
        .subBlki12(b12),    
        .subBlki13(b13),    
        .subBlki14(b14),    
        .subBlki15(b15),
         
        .subBlko(bSubBlko),
        
        .myTurnPingPong(!pingpong), 
        
        .needPang(bNeedPang),
        //.needPang(1'b0),
        .needPangStartInc(bNeedPangStartInc), 
        .needPangEndInc(bNeedPangEndInc),         
        .takeBlko(bTakeBlk)
    );
    
    reg p4toP5_aTakeBlk;
    reg p4toP5_bTakeBlk;
    
    //determine taking the result from the mux
    //note it is now determining the result for an element in  ping/pong
    reg [`SUB_BLK_BIT-1:0] p4toP5_aSubBlk;
    reg [`SUB_BLK_BIT-1:0] p4toP5_bSubBlk;
    
    always@(posedge clk or posedge reset) begin
        if (reset) begin            
            p4toP5_aSubBlk <= 0;
            p4toP5_bSubBlk <= 0;
            
            p4toP5_aTakeBlk <= 0;
            p4toP5_bTakeBlk <= 0;
            
        end else begin
            
            if (aTakeBlk) begin
                p4toP5_aSubBlk <= aSubBlko;
            end 
            
            if (bTakeBlk) begin
                p4toP5_bSubBlk <= bSubBlko;
            end
            
            p4toP5_aTakeBlk <= aTakeBlk;
            p4toP5_bTakeBlk <= bTakeBlk;

        end
    end
    
    reg p0ToP1_pingpong;
    reg p1ToP2_pingpong;
    reg p2ToP3_pingpong;
    reg p3ToP4_pingpong;
    reg p4ToP5_pingpong;
    
    always@(posedge clk or posedge reset) begin
        if (reset) begin            
            subBlko <= 0;
                                    
            p0ToP1_pingpong <= 0;
            p1ToP2_pingpong <= 0;
            p2ToP3_pingpong <= 0;
            p3ToP4_pingpong <= 0;
            p4ToP5_pingpong <= 0;
            
        end else begin
        
            p0ToP1_pingpong <= pingpong;
            p1ToP2_pingpong <= p0ToP1_pingpong;
            p2ToP3_pingpong <= p1ToP2_pingpong;
            p3ToP4_pingpong <= p2ToP3_pingpong;
            p4ToP5_pingpong <= p3ToP4_pingpong;
            
            if (p4ToP5_pingpong && p4toP5_aTakeBlk) begin
                subBlko <= p4toP5_aSubBlk;
            end else if (!p4ToP5_pingpong && p4toP5_bTakeBlk) begin
                subBlko <= p4toP5_bSubBlk;
            end
        end
    end
    
    
endmodule
