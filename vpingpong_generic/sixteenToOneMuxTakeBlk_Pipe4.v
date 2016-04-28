`timescale 1ns / 1ps

`include "macro_para.v"

module sixteenToOneMuxTakeBlk_Pipe4(
    
    input clk,
    input reset,
    
    input [`SFT_BIT-1:0] sel,

    input [`SUB_BLK_BIT-1:0] subBlki0,
    input [`SUB_BLK_BIT-1:0] subBlki1,

    input [`SUB_BLK_BIT-1:0] subBlki2,
    input [`SUB_BLK_BIT-1:0] subBlki3,
    
    input [`SUB_BLK_BIT-1:0] subBlki4,
    input [`SUB_BLK_BIT-1:0] subBlki5,
    
    input [`SUB_BLK_BIT-1:0] subBlki6,
    input [`SUB_BLK_BIT-1:0] subBlki7,
    
    
    input [`SUB_BLK_BIT-1:0] subBlki8,
    input [`SUB_BLK_BIT-1:0] subBlki9,

    input [`SUB_BLK_BIT-1:0] subBlki10,
    input [`SUB_BLK_BIT-1:0] subBlki11,
    
    input [`SUB_BLK_BIT-1:0] subBlki12,
    input [`SUB_BLK_BIT-1:0] subBlki13,
    
    input [`SUB_BLK_BIT-1:0] subBlki14,
    input [`SUB_BLK_BIT-1:0] subBlki15,
    
    output  [`SUB_BLK_BIT-1:0] subBlko,

    
    input needPang,
    input myTurnPingPong,
    input [`SFT_BIT-1:0] needPangStartInc,
    input [`SFT_BIT-1:0] needPangEndInc,
    
    output reg takeBlko

    );
    
    reg [`SFT_BIT-1:0] p0toP1_sel;
    reg [`SFT_BIT-1:0] p1toP2_sel;
    reg [`SFT_BIT-1:0] p2toP3_sel;
    
    reg p0ToP1_takeBlk, p1ToP2_takeBlk, p2ToP3_takeBlk;
    reg p0ToP1_needPang;
    reg p0ToP1_myTurnPingPong, p1ToP2_myTurnPingPong;
    
    
    always@(posedge clk or posedge reset) begin
        if (reset) begin

            p0toP1_sel <= 0;
            p1toP2_sel <= 0;
            p2toP3_sel <= 0;
            
            p0ToP1_takeBlk <= 0;
            p1ToP2_takeBlk <= 0;
            p2ToP3_takeBlk <= 0;
            takeBlko <= 0;
            
            p0ToP1_needPang <= 0;
            
            p0ToP1_myTurnPingPong <= myTurnPingPong;
            p1ToP2_myTurnPingPong <= p0ToP1_myTurnPingPong;
             
        end else begin
            
            p0toP1_sel <= sel;
            p1toP2_sel <= p0toP1_sel;
            p2toP3_sel <= p1toP2_sel;
                    
            p0ToP1_takeBlk <= sel < needPangStartInc  || sel > needPangEndInc;
            p1ToP2_takeBlk <= p0ToP1_takeBlk || p0ToP1_needPang;
            p2ToP3_takeBlk <= p1ToP2_takeBlk && p1ToP2_myTurnPingPong;
            takeBlko <= p2ToP3_takeBlk;
            
            p0ToP1_needPang <= needPang;
            
            p0ToP1_myTurnPingPong <= myTurnPingPong;
            p1ToP2_myTurnPingPong <= p0ToP1_myTurnPingPong;
        end
    end 
    
    //Level0
    wire [`SUB_BLK_BIT-1:0] p0ToP1_0, p0ToP1_1, p0ToP1_2, p0ToP1_3, p0ToP1_4, p0ToP1_5, p0ToP1_6, p0ToP1_7;
    
    
    twoToOneMuxReg twoToOne_Pipe0_0(
        .clk(clk),.reset(reset),.sel(sel[0]),.subBlki0(subBlki0),.subBlki1(subBlki1),.subBlko(p0ToP1_0)
    );
    twoToOneMuxReg twoToOne_Pipe0_1(
        .clk(clk),.reset(reset),.sel(sel[0]),.subBlki0(subBlki2),.subBlki1(subBlki3),.subBlko(p0ToP1_1)
    );
    twoToOneMuxReg twoToOne_Pipe0_2(
        .clk(clk),.reset(reset),.sel(sel[0]),.subBlki0(subBlki4),.subBlki1(subBlki5),.subBlko(p0ToP1_2)
    );
    twoToOneMuxReg twoToOne_Pipe0_3(
        .clk(clk),.reset(reset),.sel(sel[0]),.subBlki0(subBlki6),.subBlki1(subBlki7),.subBlko(p0ToP1_3)
    );
    twoToOneMuxReg twoToOne_Pipe0_4(
        .clk(clk),.reset(reset),.sel(sel[0]),.subBlki0(subBlki8),.subBlki1(subBlki9),.subBlko(p0ToP1_4)
    ); 
    twoToOneMuxReg twoToOne_Pipe0_5(
        .clk(clk),.reset(reset),.sel(sel[0]),.subBlki0(subBlki10),.subBlki1(subBlki11),.subBlko(p0ToP1_5)
    );
    twoToOneMuxReg twoToOne_Pipe0_6(
        .clk(clk),.reset(reset),.sel(sel[0]),.subBlki0(subBlki12),.subBlki1(subBlki13),.subBlko(p0ToP1_6)
    );                    
    twoToOneMuxReg twoToOne_Pipe0_7(
        .clk(clk),.reset(reset),.sel(sel[0]),.subBlki0(subBlki14),.subBlki1(subBlki15),.subBlko(p0ToP1_7)
    );
    
    //Level1
    wire [`SUB_BLK_BIT-1:0] p1ToP2_0, p1ToP2_1, p1ToP2_2, p1ToP2_3;
    
    twoToOneMuxReg twoToOne_Pipe1_0(
        .clk(clk),.reset(reset),.sel(p0toP1_sel[1]),.subBlki0(p0ToP1_0),.subBlki1(p0ToP1_1),.subBlko(p1ToP2_0)
    );
    twoToOneMuxReg twoToOne_Pipe1_1(
        .clk(clk),.reset(reset),.sel(p0toP1_sel[1]),.subBlki0(p0ToP1_2),.subBlki1(p0ToP1_3),.subBlko(p1ToP2_1)
    );
    twoToOneMuxReg twoToOne_Pipe1_2(
        .clk(clk),.reset(reset),.sel(p0toP1_sel[1]),.subBlki0(p0ToP1_4),.subBlki1(p0ToP1_5),.subBlko(p1ToP2_2)
    );
    twoToOneMuxReg twoToOne_Pipe1_3(
        .clk(clk),.reset(reset),.sel(p0toP1_sel[1]),.subBlki0(p0ToP1_6),.subBlki1(p0ToP1_7),.subBlko(p1ToP2_3)
    ); 

    //Level2
    wire [`SUB_BLK_BIT-1:0] p2ToP3_0, p2ToP3_1;
    
    twoToOneMuxReg twoToOne_Pipe2_0(
        .clk(clk),.reset(reset),.sel(p1toP2_sel[2]),.subBlki0(p1ToP2_0),.subBlki1(p1ToP2_1),.subBlko(p2ToP3_0)
    );    
    twoToOneMuxReg twoToOne_Pipe2_1(
        .clk(clk),.reset(reset),.sel(p1toP2_sel[2]),.subBlki0(p1ToP2_2),.subBlki1(p1ToP2_3),.subBlko(p2ToP3_1)
    );    

    //Level3
    twoToOneMuxReg twoToOne_Pipe3_0(
        .clk(clk),.reset(reset),.sel(p2toP3_sel[3]),.subBlki0(p2ToP3_0),.subBlki1(p2ToP3_1),.subBlko(subBlko)
    ); 
        
        
endmodule
