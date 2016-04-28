`timescale 1ns / 1ps


module sixteentoonemuxtakeblk_pipe4(
    
    input clk,
    input reset,
    
    input [3:0] sel,

    input [7:0] subblki0,
    input [7:0] subblki1,

    input [7:0] subblki2,
    input [7:0] subblki3,
    
    input [7:0] subblki4,
    input [7:0] subblki5,
    
    input [7:0] subblki6,
    input [7:0] subblki7,
    
    
    input [7:0] subblki8,
    input [7:0] subblki9,

    input [7:0] subblki10,
    input [7:0] subblki11,
    
    input [7:0] subblki12,
    input [7:0] subblki13,
    
    input [7:0] subblki14,
    input [7:0] subblki15,
    
    output  [7:0] subblko,

    
    input needpang,
    input myturnpingpong,
    input [3:0] needpangstartinc,
    input [3:0] needpangendinc,
    
    output reg takeblko

    );
    
    reg [3:0] p0toP1_sel;
    reg [3:0] p1toP2_sel;
    reg [3:0] p2toP3_sel;
    
    reg p0ToP1_takeBlk, p1ToP2_takeBlk, p2ToP3_takeBlk;
    reg p0ToP1_needpang;
    reg p0ToP1_myturnpingpong, p1ToP2_myturnpingpong;
    
    
    always@(posedge clk or posedge reset) begin
        if (reset) begin

            p0toP1_sel <= 0;
            p1toP2_sel <= 0;
            p2toP3_sel <= 0;
            
            p0ToP1_takeBlk <= 0;
            p1ToP2_takeBlk <= 0;
            p2ToP3_takeBlk <= 0;
            takeblko <= 0;
            
            p0ToP1_needpang <= 0;
            
            p0ToP1_myturnpingpong <= myturnpingpong;
            p1ToP2_myturnpingpong <= p0ToP1_myturnpingpong;
             
        end else begin
            
            p0toP1_sel <= sel;
            p1toP2_sel <= p0toP1_sel;
            p2toP3_sel <= p1toP2_sel;
                    
            p0ToP1_takeBlk <= sel < needpangstartinc  || sel > needpangendinc;
            p1ToP2_takeBlk <= p0ToP1_takeBlk || p0ToP1_needpang;
            p2ToP3_takeBlk <= p1ToP2_takeBlk && p1ToP2_myturnpingpong;
            takeblko <= p2ToP3_takeBlk;
            
            p0ToP1_needpang <= needpang;
            
            p0ToP1_myturnpingpong <= myturnpingpong;
            p1ToP2_myturnpingpong <= p0ToP1_myturnpingpong;
        end
    end 
    
    //Level0
    wire [7:0] p0ToP1_0, p0ToP1_1, p0ToP1_2, p0ToP1_3, p0ToP1_4, p0ToP1_5, p0ToP1_6, p0ToP1_7;
    
    
    twotoonemuxreg twoToOne_Pipe0_0(
        .clk(clk),.reset(reset),.sel(sel[0]),.subblki0(subblki0),.subblki1(subblki1),.subblko(p0ToP1_0)
    );
    twotoonemuxreg twoToOne_Pipe0_1(
        .clk(clk),.reset(reset),.sel(sel[0]),.subblki0(subblki2),.subblki1(subblki3),.subblko(p0ToP1_1)
    );
    twotoonemuxreg twoToOne_Pipe0_2(
        .clk(clk),.reset(reset),.sel(sel[0]),.subblki0(subblki4),.subblki1(subblki5),.subblko(p0ToP1_2)
    );
    twotoonemuxreg twoToOne_Pipe0_3(
        .clk(clk),.reset(reset),.sel(sel[0]),.subblki0(subblki6),.subblki1(subblki7),.subblko(p0ToP1_3)
    );
    twotoonemuxreg twoToOne_Pipe0_4(
        .clk(clk),.reset(reset),.sel(sel[0]),.subblki0(subblki8),.subblki1(subblki9),.subblko(p0ToP1_4)
    ); 
    twotoonemuxreg twoToOne_Pipe0_5(
        .clk(clk),.reset(reset),.sel(sel[0]),.subblki0(subblki10),.subblki1(subblki11),.subblko(p0ToP1_5)
    );
    twotoonemuxreg twoToOne_Pipe0_6(
        .clk(clk),.reset(reset),.sel(sel[0]),.subblki0(subblki12),.subblki1(subblki13),.subblko(p0ToP1_6)
    );                    
    twotoonemuxreg twoToOne_Pipe0_7(
        .clk(clk),.reset(reset),.sel(sel[0]),.subblki0(subblki14),.subblki1(subblki15),.subblko(p0ToP1_7)
    );
    
    //Level1
    wire [7:0] p1ToP2_0, p1ToP2_1, p1ToP2_2, p1ToP2_3;
    
    twotoonemuxreg twoToOne_Pipe1_0(
        .clk(clk),.reset(reset),.sel(p0toP1_sel[1]),.subblki0(p0ToP1_0),.subblki1(p0ToP1_1),.subblko(p1ToP2_0)
    );
    twotoonemuxreg twoToOne_Pipe1_1(
        .clk(clk),.reset(reset),.sel(p0toP1_sel[1]),.subblki0(p0ToP1_2),.subblki1(p0ToP1_3),.subblko(p1ToP2_1)
    );
    twotoonemuxreg twoToOne_Pipe1_2(
        .clk(clk),.reset(reset),.sel(p0toP1_sel[1]),.subblki0(p0ToP1_4),.subblki1(p0ToP1_5),.subblko(p1ToP2_2)
    );
    twotoonemuxreg twoToOne_Pipe1_3(
        .clk(clk),.reset(reset),.sel(p0toP1_sel[1]),.subblki0(p0ToP1_6),.subblki1(p0ToP1_7),.subblko(p1ToP2_3)
    ); 

    //Level2
    wire [7:0] p2ToP3_0, p2ToP3_1;
    
    twotoonemuxreg twoToOne_Pipe2_0(
        .clk(clk),.reset(reset),.sel(p1toP2_sel[2]),.subblki0(p1ToP2_0),.subblki1(p1ToP2_1),.subblko(p2ToP3_0)
    );    
    twotoonemuxreg twoToOne_Pipe2_1(
        .clk(clk),.reset(reset),.sel(p1toP2_sel[2]),.subblki0(p1ToP2_2),.subblki1(p1ToP2_3),.subblko(p2ToP3_1)
    );    

    //Level3
    twotoonemuxreg twoToOne_Pipe3_0(
        .clk(clk),.reset(reset),.sel(p2toP3_sel[3]),.subblki0(p2ToP3_0),.subblki1(p2ToP3_1),.subblko(subblko)
    ); 
        
        
endmodule
