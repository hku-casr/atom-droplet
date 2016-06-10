`timescale 1ns / 1ps


module subblkselpingpong(

    input clk,
    input ce,
    input reset,
    
    input [7:0] d15,
    input [7:0] d14,
    input [7:0] d13,
    input [7:0] d12,
    input [7:0] d11,
    input [7:0] d10,
    input [7:0] d09,
    input [7:0] d08,
    
    input [7:0] d07,
    input [7:0] d06,
    input [7:0] d05,
    input [7:0] d04,
    input [7:0] d03,
    input [7:0] d02,
    input [7:0] d01,
    input [7:0] d00,
    

    input [3:0] sft,
    input [3:0] next_sft,
    
    input eol,
    input blkgap,
    
    output reg [7:0] q15,
    output reg [7:0] q14,
    output reg [7:0] q13,
    output reg [7:0] q12,
    output reg [7:0] q11,
    output reg [7:0] q10,
    output reg [7:0] q09,
    output reg [7:0] q08,
    
    output reg [7:0] q07,
    output reg [7:0] q06,
    output reg [7:0] q05,
    output reg [7:0] q04,
    output reg [7:0] q03,
    output reg [7:0] q02,
    output reg [7:0] q01,
    output reg [7:0] q00
    
    
    
    );
    wire [7:0] pong00;
    wire [7:0] pong01;
    wire [7:0] pong02;
    wire [7:0] pong03;
    wire [7:0] pong04;
    wire [7:0] pong05;
    
    wire [7:0] pong06;
    wire [7:0] pong07;
    wire [7:0] pong08;
    wire [7:0] pong09;
    wire [7:0] pong10;
    
    wire [7:0] pong11;
    wire [7:0] pong12;
    wire [7:0] pong13;
    wire [7:0] pong14;
    wire [7:0] pong15;
    
    wire [7:0] ping00;
    wire [7:0] ping01;
    wire [7:0] ping02;
    wire [7:0] ping03;
    wire [7:0] ping04;
    wire [7:0] ping05;
    
    wire [7:0] ping06;
    wire [7:0] ping07;
    wire [7:0] ping08;
    wire [7:0] ping09;
    wire [7:0] ping10;
    
    wire [7:0] ping11;
    wire [7:0] ping12;
    wire [7:0] ping13;
    wire [7:0] ping14;
    wire [7:0] ping15;
    
    
    wire [7:0] zeroSig;
    assign zeroSig = 8'd0;
    
    reg pingpong;   
    wire needpang;
    
    //delay every signals for 5 cycles
    reg [8*(4)-1:0] p0ToP4_d15;
    reg [8*(4)-1:0] p0ToP4_d14;
    reg [8*(4)-1:0] p0ToP4_d13;
    reg [8*(4)-1:0] p0ToP4_d12;
    reg [8*(4)-1:0] p0ToP4_d11;
    reg [8*(4)-1:0] p0ToP4_d10;
    reg [8*(4)-1:0] p0ToP4_d09;
    reg [8*(4)-1:0] p0ToP4_d08;
    
    reg [8*(4)-1:0] p0ToP4_d07;
    reg [8*(4)-1:0] p0ToP4_d06;
    reg [8*(4)-1:0] p0ToP4_d05;
    reg [8*(4)-1:0] p0ToP4_d04;
    reg [8*(4)-1:0] p0ToP4_d03;
    reg [8*(4)-1:0] p0ToP4_d02;
    reg [8*(4)-1:0] p0ToP4_d01;
    reg [8*(4)-1:0] p0ToP4_d00;
    
    reg [4*(4)-1:0] p0ToP4_sft;
    reg [(4)-1:0] p0ToP4_eol;
    reg [(4)-1:0] p0ToP4_blkgap;

    
    reg [(4)-1:0] p0ToP4_pingpong;
    reg [(4)-1:0] p0ToP4_needpang;
    reg [(9-4)-1:0] p4Top9_pingpong;

        
    always@(posedge clk or posedge reset) begin
        if (reset) begin
            p0ToP4_d15 <= 0;
            p0ToP4_d14 <= 0;
            p0ToP4_d13 <= 0;
            p0ToP4_d12 <= 0;
            p0ToP4_d11 <= 0;
            p0ToP4_d10 <= 0;
            p0ToP4_d09 <= 0;
            p0ToP4_d08 <= 0;
            
            p0ToP4_d07 <= 0;
            p0ToP4_d06 <= 0;
            p0ToP4_d05 <= 0;
            p0ToP4_d04 <= 0;
            p0ToP4_d03 <= 0;
            p0ToP4_d02 <= 0;
            p0ToP4_d01 <= 0;
            p0ToP4_d00 <= 0;
            
            p0ToP4_sft <= 0;
            p0ToP4_eol <= 0;
            p0ToP4_blkgap <= 0;
            
            p0ToP4_pingpong <= 0;
            p0ToP4_needpang <= 0;
            p4Top9_pingpong <= 0;
            
        end else begin
            p0ToP4_d15 <= {p0ToP4_d15[0 +: 8*(4-1)],d15};
            p0ToP4_d14 <= {p0ToP4_d14[0 +: 8*(4-1)],d14};
            p0ToP4_d13 <= {p0ToP4_d13[0 +: 8*(4-1)],d13};
            p0ToP4_d12 <= {p0ToP4_d12[0 +: 8*(4-1)],d12};
            p0ToP4_d11 <= {p0ToP4_d11[0 +: 8*(4-1)],d11};
            p0ToP4_d10 <= {p0ToP4_d10[0 +: 8*(4-1)],d10};
            p0ToP4_d09 <= {p0ToP4_d09[0 +: 8*(4-1)],d09};
            p0ToP4_d08 <= {p0ToP4_d08[0 +: 8*(4-1)],d08};
            p0ToP4_d07 <= {p0ToP4_d07[0 +: 8*(4-1)],d07};
            p0ToP4_d06 <= {p0ToP4_d06[0 +: 8*(4-1)],d06};
            p0ToP4_d05 <= {p0ToP4_d05[0 +: 8*(4-1)],d05};
            p0ToP4_d04 <= {p0ToP4_d04[0 +: 8*(4-1)],d04};
            p0ToP4_d03 <= {p0ToP4_d03[0 +: 8*(4-1)],d03};
            p0ToP4_d02 <= {p0ToP4_d02[0 +: 8*(4-1)],d02};
            p0ToP4_d01 <= {p0ToP4_d01[0 +: 8*(4-1)],d01};
            p0ToP4_d00 <= {p0ToP4_d00[0 +: 8*(4-1)],d00};
            
            p0ToP4_sft <= {p0ToP4_sft[0 +: 4*(4-1)],sft};
            p0ToP4_eol <= {p0ToP4_eol[0 +: 4-1],eol};
            p0ToP4_blkgap <= {p0ToP4_blkgap[0 +: 4-1],blkgap};
            
            p0ToP4_pingpong <= {p0ToP4_pingpong[0 +: 4-1],pingpong};
            p0ToP4_needpang <= {p0ToP4_needpang[0 +: 4-1],needpang};
            p4Top9_pingpong <= {p4Top9_pingpong[0 +: (9-4)-1], p4pingpong};
        end
    end
    
    wire [7:0] p4d15;
    wire [7:0] p4d14;
    wire [7:0] p4d13;
    wire [7:0] p4d12;
    wire [7:0] p4d11;
    wire [7:0] p4d10;    
    wire [7:0] p4d09;
    wire [7:0] p4d08;
    
    wire [7:0] p4d07;
    wire [7:0] p4d06;
    wire [7:0] p4d05;
    wire [7:0] p4d04;
    wire [7:0] p4d03;
    wire [7:0] p4d02;
    wire [7:0] p4d01;
    wire [7:0] p4d00;
    
    wire [3:0] p4sft;
    //wire p4blkgap;
    //wire p4eol;
    
    wire p4pingpong;
    wire p9pingpong;
        
    assign p4d15 = p0ToP4_d15[8*(4-1)+: 8];
    assign p4d14 = p0ToP4_d14[8*(4-1)+: 8];
    assign p4d13 = p0ToP4_d13[8*(4-1)+: 8];
    assign p4d12 = p0ToP4_d12[8*(4-1)+: 8];
    assign p4d11 = p0ToP4_d11[8*(4-1)+: 8];
    assign p4d10 = p0ToP4_d10[8*(4-1)+: 8];
    assign p4d09 = p0ToP4_d09[8*(4-1)+: 8];
    assign p4d08 = p0ToP4_d08[8*(4-1)+: 8];
    
    assign p4d07 = p0ToP4_d07[8*(4-1)+: 8];
    assign p4d06 = p0ToP4_d06[8*(4-1)+: 8];
    assign p4d05 = p0ToP4_d05[8*(4-1)+: 8];
    assign p4d04 = p0ToP4_d04[8*(4-1)+: 8];
    assign p4d03 = p0ToP4_d03[8*(4-1)+: 8];
    assign p4d02 = p0ToP4_d02[8*(4-1)+: 8];
    assign p4d01 = p0ToP4_d01[8*(4-1)+: 8];
    assign p4d00 = p0ToP4_d00[8*(4-1)+: 8];
    
    assign p4sft = p0ToP4_sft[4*(4-1)+: 4];
    //assign p4eol = p0ToP4_eol[4-1];
    //assign p4blkgap = p0ToP4_blkgap[4-1];
    
    assign p4pingpong = p0ToP4_pingpong[4-1];
    assign p4needpang = p0ToP4_needpang[4-1];
    assign p9pingpong = p4Top9_pingpong[(9-4)-1];
    
    
    
    wire [7:0] p5pang15;
    wire [7:0] p5pang14;
    wire [7:0] p5pang13;
    wire [7:0] p5pang12;
    wire [7:0] p5pang11;
    wire [7:0] p5pang10;    
    wire [7:0] p5pang09;
    wire [7:0] p5pang08;
    
    wire [7:0] p5pang07;
    wire [7:0] p5pang06;
    wire [7:0] p5pang05;
    wire [7:0] p5pang04;
    wire [7:0] p5pang03;
    wire [7:0] p5pang02;
    wire [7:0] p5pang01;
    wire [7:0] p5pang00;
        
    muxpang_pipe5 muxPang(
        .clk(clk),.reset(reset),.next_sft(next_sft),
        .d15(d15),.d14(d14),.d13(d13),.d12(d12),.d11(d11),.d10(d10),.d09(d09),.d08(d08),
        .d07(d07),.d06(d06),.d05(d05),.d04(d04),.d03(d03),.d02(d02),.d01(d01),.d00(d00),

        .pang00(p5pang00),
        .pang01(p5pang01),
        .pang02(p5pang02),
        .pang03(p5pang03),
        .pang04(p5pang04),
        .pang05(p5pang05),
        .pang06(p5pang06),
        .pang07(p5pang07),

        .pang08(p5pang08),
        .pang09(p5pang09),
        .pang10(p5pang10),
        .pang11(p5pang11),
        .pang12(p5pang12),
        .pang13(p5pang13),
        .pang14(p5pang14),
        .pang15(p5pang15)
    );
    
    //pong
    eachblktoeachpingpong_pipe6 muxpong0(
        .clk(clk),.reset(reset),
    
        .a00(p4d00),
        .a01(p5pang00),
        .a02(p5pang00),
        .a03(p5pang00),
        .a04(p5pang00),
        .a05(p5pang00),
        .a06(p5pang00),
        .a07(p5pang00),
        .a08(p5pang00),
        .a09(p5pang00),
        .a10(p5pang00),
        .a11(p5pang00),
        .a12(p5pang00),
        .a13(p5pang00),
        .a14(p5pang00),
        .a15(p5pang00),

        .aneedpangstartinc(4'd1),
        .aneedpangendinc(4'd15),
    
        .b00(zeroSig),
        .b01(p4d01),
        .b02(p4d02),
        .b03(p4d03),
        .b04(p4d04),
        .b05(p4d05),
        .b06(p4d06),
        .b07(p4d07),
        .b08(p4d08),
        .b09(p4d09),
        .b10(p4d10),
        .b11(p4d11),
        .b12(p4d12),
        .b13(p4d13),
        .b14(p4d14),
        .b15(p4d15),

        .bneedpangstartinc(4'd0),
        .bneedpangendinc(4'd0),
    
        .pingpong(p4pingpong),
        .aneedpang(p4needpang),
        .bneedpang(1'b0),
        .sft(p4sft),
    
        .subblko(pong00)
    );    
    
     eachblktoeachpingpong_pipe6 muxpong1(
        .clk(clk),.reset(reset),
    
        .a00(p4d01),
        .a01(p5pang01),
        .a02(p5pang01),
        .a03(p5pang01),
        .a04(p5pang01),
        .a05(p5pang01),
        .a06(p5pang01),
        .a07(p5pang01),
        .a08(p5pang01),
        .a09(p5pang01),
        .a10(p5pang01),
        .a11(p5pang01),
        .a12(p5pang01),
        .a13(p5pang01),
        .a14(p5pang01),
        .a15(p4d00),

        .aneedpangstartinc(4'd1),
        .aneedpangendinc(4'd14),
    
        .b00(zeroSig),
        .b01(p4d02),
        .b02(p4d03),
        .b03(p4d04),
        .b04(p4d05),
        .b05(p4d06),
        .b06(p4d07),
        .b07(p4d08),
        .b08(p4d09),
        .b09(p4d10),
        .b10(p4d11),
        .b11(p4d12),
        .b12(p4d13),
        .b13(p4d14),
        .b14(p4d15),
        .b15(zeroSig),

        .bneedpangstartinc(4'd0),
        .bneedpangendinc(4'd0),
    
        .pingpong(p4pingpong),
        .aneedpang(p4needpang),
        .bneedpang(1'b0),
        .sft(p4sft),
    
        .subblko(pong01)
    );    
    

     eachblktoeachpingpong_pipe6 muxpong2(
        .clk(clk),.reset(reset),
    
        .a00(p4d02),
        .a01(p5pang02),
        .a02(p5pang02),
        .a03(p5pang02),
        .a04(p5pang02),
        .a05(p5pang02),
        .a06(p5pang02),
        .a07(p5pang02),
        .a08(p5pang02),
        .a09(p5pang02),
        .a10(p5pang02),
        .a11(p5pang02),
        .a12(p5pang02),
        .a13(p5pang02),
        .a14(p4d00),
        .a15(p4d01),

        .aneedpangstartinc(4'd1),
        .aneedpangendinc(4'd13),
    
        .b00(zeroSig),
        .b01(p4d03),
        .b02(p4d04),
        .b03(p4d05),
        .b04(p4d06),
        .b05(p4d07),
        .b06(p4d08),
        .b07(p4d09),
        .b08(p4d10),
        .b09(p4d11),
        .b10(p4d12),
        .b11(p4d13),
        .b12(p4d14),
        .b13(p4d15),
        .b14(zeroSig),
        .b15(zeroSig),

        .bneedpangstartinc(4'd0),
        .bneedpangendinc(4'd0),
    
        .pingpong(p4pingpong),
        .aneedpang(p4needpang),
        .bneedpang(1'b0),
        .sft(p4sft),
    
        .subblko(pong02)
    ); 


     eachblktoeachpingpong_pipe6 muxpong3(
        .clk(clk),.reset(reset),
    
        .a00(p4d03),
        .a01(p5pang03),
        .a02(p5pang03),
        .a03(p5pang03),
        .a04(p5pang03),
        .a05(p5pang03),
        .a06(p5pang03),
        .a07(p5pang03),
        .a08(p5pang03),
        .a09(p5pang03),
        .a10(p5pang03),
        .a11(p5pang03),
        .a12(p5pang03),
        .a13(p4d00),
        .a14(p4d01),
        .a15(p4d02),

        .aneedpangstartinc(4'd1),
        .aneedpangendinc(4'd12),
    
        .b00(zeroSig),
        .b01(p4d04),
        .b02(p4d05),
        .b03(p4d06),
        .b04(p4d07),
        .b05(p4d08),
        .b06(p4d09),
        .b07(p4d10),
        .b08(p4d11),
        .b09(p4d12),
        .b10(p4d13),
        .b11(p4d14),
        .b12(p4d15),
        .b13(zeroSig),
        .b14(zeroSig),
        .b15(zeroSig),

        .bneedpangstartinc(4'd0),
        .bneedpangendinc(4'd0),
    
        .pingpong(p4pingpong),
        .aneedpang(p4needpang),
        .bneedpang(1'b0),
        .sft(p4sft),
    
        .subblko(pong03)
    );
    
    
     eachblktoeachpingpong_pipe6 muxpong4(
        .clk(clk),.reset(reset),
    
        .a00(p4d04),
        .a01(p5pang04),
        .a02(p5pang04),
        .a03(p5pang04),
        .a04(p5pang04),
        .a05(p5pang04),
        .a06(p5pang04),
        .a07(p5pang04),
        .a08(p5pang04),
        .a09(p5pang04),
        .a10(p5pang04),
        .a11(p5pang04),
        .a12(p4d00),
        .a13(p4d01),
        .a14(p4d02),
        .a15(p4d03),

        .aneedpangstartinc(4'd1),
        .aneedpangendinc(4'd11),
    
        .b00(zeroSig),
        .b01(p4d05),
        .b02(p4d06),
        .b03(p4d07),
        .b04(p4d08),
        .b05(p4d09),
        .b06(p4d10),
        .b07(p4d11),
        .b08(p4d12),
        .b09(p4d13),
        .b10(p4d14),
        .b11(p4d15),
        .b12(zeroSig),
        .b13(zeroSig),
        .b14(zeroSig),
        .b15(zeroSig),

        .bneedpangstartinc(4'd0),
        .bneedpangendinc(4'd0),
    
        .pingpong(p4pingpong),
        .aneedpang(p4needpang),
        .bneedpang(1'b0),
        .sft(p4sft),
    
        .subblko(pong04)
    ); 
    
    
     eachblktoeachpingpong_pipe6 muxpong5(
        .clk(clk),.reset(reset),
    
        .a00(p4d05),
        .a01(p5pang05),
        .a02(p5pang05),
        .a03(p5pang05),
        .a04(p5pang05),
        .a05(p5pang05),
        .a06(p5pang05),
        .a07(p5pang05),
        .a08(p5pang05),
        .a09(p5pang05),
        .a10(p5pang05),
        .a11(p4d00),
        .a12(p4d01),
        .a13(p4d02),
        .a14(p4d03),
        .a15(p4d04),

        .aneedpangstartinc(4'd1),
        .aneedpangendinc(4'd10),
    
        .b00(zeroSig),
        .b01(p4d06),
        .b02(p4d07),
        .b03(p4d08),
        .b04(p4d09),
        .b05(p4d10),
        .b06(p4d11),
        .b07(p4d12),
        .b08(p4d13),
        .b09(p4d14),
        .b10(p4d15),
        .b11(zeroSig),
        .b12(zeroSig),
        .b13(zeroSig),
        .b14(zeroSig),
        .b15(zeroSig),

        .bneedpangstartinc(4'd0),
        .bneedpangendinc(4'd0),
    
        .pingpong(p4pingpong),
        .aneedpang(p4needpang),
        .bneedpang(1'b0),
        .sft(p4sft),
    
        .subblko(pong05)
    ); 
    
    
     eachblktoeachpingpong_pipe6 muxpong6(
        .clk(clk),.reset(reset),
    
        .a00(p4d06),
        .a01(p5pang06),
        .a02(p5pang06),
        .a03(p5pang06),
        .a04(p5pang06),
        .a05(p5pang06),
        .a06(p5pang06),
        .a07(p5pang06),
        .a08(p5pang06),
        .a09(p5pang06),
        .a10(p4d00),
        .a11(p4d01),
        .a12(p4d02),
        .a13(p4d03),
        .a14(p4d04),
        .a15(p4d05),

        .aneedpangstartinc(4'd1),
        .aneedpangendinc(4'd9),
    
        .b00(zeroSig),
        .b01(p4d07),
        .b02(p4d08),
        .b03(p4d09),
        .b04(p4d10),
        .b05(p4d11),
        .b06(p4d12),
        .b07(p4d13),
        .b08(p4d14),
        .b09(p4d15),
        .b10(zeroSig),
        .b11(zeroSig),
        .b12(zeroSig),
        .b13(zeroSig),
        .b14(zeroSig),
        .b15(zeroSig),

        .bneedpangstartinc(4'd0),
        .bneedpangendinc(4'd0),
    
        .pingpong(p4pingpong),
        .aneedpang(p4needpang),
        .bneedpang(1'b0),
        .sft(p4sft),
    
        .subblko(pong06)
    );
    
    
     eachblktoeachpingpong_pipe6 muxpong7(
        .clk(clk),.reset(reset),
    
        .a00(p4d07),
        .a01(p5pang07),
        .a02(p5pang07),
        .a03(p5pang07),
        .a04(p5pang07),
        .a05(p5pang07),
        .a06(p5pang07),
        .a07(p5pang07),
        .a08(p5pang07),
        .a09(p4d00),
        .a10(p4d01),
        .a11(p4d02),
        .a12(p4d03),
        .a13(p4d04),
        .a14(p4d05),
        .a15(p4d06),

        .aneedpangstartinc(4'd1),
        .aneedpangendinc(4'd8),
    
        .b00(zeroSig),
        .b01(p4d08),
        .b02(p4d09),
        .b03(p4d10),
        .b04(p4d11),
        .b05(p4d12),
        .b06(p4d13),
        .b07(p4d14),
        .b08(p4d15),
        .b09(zeroSig),
        .b10(zeroSig),
        .b11(zeroSig),
        .b12(zeroSig),
        .b13(zeroSig),
        .b14(zeroSig),
        .b15(zeroSig),

        .bneedpangstartinc(4'd0),
        .bneedpangendinc(4'd0),
    
        .pingpong(p4pingpong),
        .aneedpang(p4needpang),
        .bneedpang(1'b0),
        .sft(p4sft),
    
        .subblko(pong07)
    );
    
    
     eachblktoeachpingpong_pipe6 muxpong8(
        .clk(clk),.reset(reset),
    
        .a00(p4d08),
        .a01(p5pang08),
        .a02(p5pang08),
        .a03(p5pang08),
        .a04(p5pang08),
        .a05(p5pang08),
        .a06(p5pang08),
        .a07(p5pang08),
        .a08(p4d00),
        .a09(p4d01),
        .a10(p4d02),
        .a11(p4d03),
        .a12(p4d04),
        .a13(p4d05),
        .a14(p4d06),
        .a15(p4d07),

        .aneedpangstartinc(4'd1),
        .aneedpangendinc(4'd7),
    
        .b00(zeroSig),
        .b01(p4d09),
        .b02(p4d10),
        .b03(p4d11),
        .b04(p4d12),
        .b05(p4d13),
        .b06(p4d14),
        .b07(p4d15),
        .b08(zeroSig),
        .b09(zeroSig),
        .b10(zeroSig),
        .b11(zeroSig),
        .b12(zeroSig),
        .b13(zeroSig),
        .b14(zeroSig),
        .b15(zeroSig),

        .bneedpangstartinc(4'd0),
        .bneedpangendinc(4'd0),
    
        .pingpong(p4pingpong),
        .aneedpang(p4needpang),
        .bneedpang(1'b0),
        .sft(p4sft),
    
        .subblko(pong08)
    );
    
    
     eachblktoeachpingpong_pipe6 muxpong9(
        .clk(clk),.reset(reset),
    
        .a00(p4d09),
        .a01(p5pang09),
        .a02(p5pang09),
        .a03(p5pang09),
        .a04(p5pang09),
        .a05(p5pang09),
        .a06(p5pang09),
        .a07(p4d00),
        .a08(p4d01),
        .a09(p4d02),
        .a10(p4d03),
        .a11(p4d04),
        .a12(p4d05),
        .a13(p4d06),
        .a14(p4d07),
        .a15(p4d08),

        .aneedpangstartinc(4'd1),
        .aneedpangendinc(4'd6),
    
        .b00(zeroSig),
        .b01(p4d10),
        .b02(p4d11),
        .b03(p4d12),
        .b04(p4d13),
        .b05(p4d14),
        .b06(p4d15),
        .b07(zeroSig),
        .b08(zeroSig),
        .b09(zeroSig),
        .b10(zeroSig),
        .b11(zeroSig),
        .b12(zeroSig),
        .b13(zeroSig),
        .b14(zeroSig),
        .b15(zeroSig),

        .bneedpangstartinc(4'd0),
        .bneedpangendinc(4'd0),
    
        .pingpong(p4pingpong),
        .aneedpang(p4needpang),
        .bneedpang(1'b0),
        .sft(p4sft),
    
        .subblko(pong09)
    );
    
    
     eachblktoeachpingpong_pipe6 muxpong10(
        .clk(clk),.reset(reset),
    
        .a00(p4d10),
        .a01(p5pang10),
        .a02(p5pang10),
        .a03(p5pang10),
        .a04(p5pang10),
        .a05(p5pang10),
        .a06(p4d00),
        .a07(p4d01),
        .a08(p4d02),
        .a09(p4d03),
        .a10(p4d04),
        .a11(p4d05),
        .a12(p4d06),
        .a13(p4d07),
        .a14(p4d08),
        .a15(p4d09),

        .aneedpangstartinc(4'd1),
        .aneedpangendinc(4'd5),
    
        .b00(zeroSig),
        .b01(p4d11),
        .b02(p4d12),
        .b03(p4d13),
        .b04(p4d14),
        .b05(p4d15),
        .b06(zeroSig),
        .b07(zeroSig),
        .b08(zeroSig),
        .b09(zeroSig),
        .b10(zeroSig),
        .b11(zeroSig),
        .b12(zeroSig),
        .b13(zeroSig),
        .b14(zeroSig),
        .b15(zeroSig),

        .bneedpangstartinc(4'd0),
        .bneedpangendinc(4'd0),
    
        .pingpong(p4pingpong),
        .aneedpang(p4needpang),
        .bneedpang(1'b0),
        .sft(p4sft),
    
        .subblko(pong10)
    );
    
    
     eachblktoeachpingpong_pipe6 muxpong11(
        .clk(clk),.reset(reset),
    
        .a00(p4d11),
        .a01(p5pang11),
        .a02(p5pang11),
        .a03(p5pang11),
        .a04(p5pang11),
        .a05(p4d00),
        .a06(p4d01),
        .a07(p4d02),
        .a08(p4d03),
        .a09(p4d04),
        .a10(p4d05),
        .a11(p4d06),
        .a12(p4d07),
        .a13(p4d08),
        .a14(p4d09),
        .a15(p4d10),

        .aneedpangstartinc(4'd1),
        .aneedpangendinc(4'd4),
    
        .b00(zeroSig),
        .b01(p4d12),
        .b02(p4d13),
        .b03(p4d14),
        .b04(p4d15),
        .b05(zeroSig),
        .b06(zeroSig),
        .b07(zeroSig),
        .b08(zeroSig),
        .b09(zeroSig),
        .b10(zeroSig),
        .b11(zeroSig),
        .b12(zeroSig),
        .b13(zeroSig),
        .b14(zeroSig),
        .b15(zeroSig),

        .bneedpangstartinc(4'd0),
        .bneedpangendinc(4'd0),
    
        .pingpong(p4pingpong),
        .aneedpang(p4needpang),
        .bneedpang(1'b0),
        .sft(p4sft),
    
        .subblko(pong11)
    );
    
    
    
     eachblktoeachpingpong_pipe6 muxpong12(
        .clk(clk),.reset(reset),
    
        .a00(p4d12),
        .a01(p5pang12),
        .a02(p5pang12),
        .a03(p5pang12),
        .a04(p4d00),
        .a05(p4d01),
        .a06(p4d02),
        .a07(p4d03),
        .a08(p4d04),
        .a09(p4d05),
        .a10(p4d06),
        .a11(p4d07),
        .a12(p4d08),
        .a13(p4d09),
        .a14(p4d10),
        .a15(p4d11),

        .aneedpangstartinc(4'd1),
        .aneedpangendinc(4'd3),
    
        .b00(zeroSig),
        .b01(p4d13),
        .b02(p4d14),
        .b03(p4d15),
        .b04(zeroSig),
        .b05(zeroSig),
        .b06(zeroSig),
        .b07(zeroSig),
        .b08(zeroSig),
        .b09(zeroSig),
        .b10(zeroSig),
        .b11(zeroSig),
        .b12(zeroSig),
        .b13(zeroSig),
        .b14(zeroSig),
        .b15(zeroSig),

        .bneedpangstartinc(4'd0),
        .bneedpangendinc(4'd0),
    
        .pingpong(p4pingpong),
        .aneedpang(p4needpang),
        .bneedpang(1'b0),
        .sft(p4sft),
    
        .subblko(pong12)
    );
    
    
    
     eachblktoeachpingpong_pipe6 muxpong13(
        .clk(clk),.reset(reset),
    
        .a00(p4d13),
        .a01(p5pang13),
        .a02(p5pang13),
        .a03(p4d00),
        .a04(p4d01),
        .a05(p4d02),
        .a06(p4d03),
        .a07(p4d04),
        .a08(p4d05),
        .a09(p4d06),
        .a10(p4d07),
        .a11(p4d08),
        .a12(p4d09),
        .a13(p4d10),
        .a14(p4d11),
        .a15(p4d12),

        .aneedpangstartinc(4'd1),
        .aneedpangendinc(4'd2),
    
        .b00(zeroSig),
        .b01(p4d14),
        .b02(p4d15),
        .b03(zeroSig),
        .b04(zeroSig),
        .b05(zeroSig),
        .b06(zeroSig),
        .b07(zeroSig),
        .b08(zeroSig),
        .b09(zeroSig),
        .b10(zeroSig),
        .b11(zeroSig),
        .b12(zeroSig),
        .b13(zeroSig),
        .b14(zeroSig),
        .b15(zeroSig),

        .bneedpangstartinc(4'd0),
        .bneedpangendinc(4'd0),
    
        .pingpong(p4pingpong),
        .aneedpang(p4needpang),
        .bneedpang(1'b0),
        .sft(p4sft),
    
        .subblko(pong13)
    );
    
    
    
     eachblktoeachpingpong_pipe6 muxpong14(
        .clk(clk),.reset(reset),
    
        .a00(p4d14),
        .a01(p5pang14),
        .a02(p4d00),
        .a03(p4d01),
        .a04(p4d02),
        .a05(p4d03),
        .a06(p4d04),
        .a07(p4d05),
        .a08(p4d06),
        .a09(p4d07),
        .a10(p4d08),
        .a11(p4d09),
        .a12(p4d10),
        .a13(p4d11),
        .a14(p4d12),
        .a15(p4d13),

        .aneedpangstartinc(4'd1),
        .aneedpangendinc(4'd1),
    
        .b00(zeroSig),
        .b01(p4d15),
        .b02(zeroSig),
        .b03(zeroSig),
        .b04(zeroSig),
        .b05(zeroSig),
        .b06(zeroSig),
        .b07(zeroSig),
        .b08(zeroSig),
        .b09(zeroSig),
        .b10(zeroSig),
        .b11(zeroSig),
        .b12(zeroSig),
        .b13(zeroSig),
        .b14(zeroSig),
        .b15(zeroSig),

        .bneedpangstartinc(4'd0),
        .bneedpangendinc(4'd0),
    
        .pingpong(p4pingpong),
        .aneedpang(p4needpang),
        .bneedpang(1'b0),
        .sft(p4sft),
    
        .subblko(pong14)
    ); 
    
        
     eachblktoeachpingpong_pipe6 muxpong15(
        .clk(clk),.reset(reset),
    
        .a00(p4d15),
        .a01(p4d00),
        .a02(p4d01),
        .a03(p4d02),
        .a04(p4d03),
        .a05(p4d04),
        .a06(p4d05),
        .a07(p4d06),
        .a08(p4d07),
        .a09(p4d08),
        .a10(p4d09),
        .a11(p4d10),
        .a12(p4d11),
        .a13(p4d12),
        .a14(p4d13),
        .a15(p4d14),

        .aneedpangstartinc(4'd0),
        .aneedpangendinc(4'd0),
    
        .b00(zeroSig),
        .b01(zeroSig),
        .b02(zeroSig),
        .b03(zeroSig),
        .b04(zeroSig),
        .b05(zeroSig),
        .b06(zeroSig),
        .b07(zeroSig),
        .b08(zeroSig),
        .b09(zeroSig),
        .b10(zeroSig),
        .b11(zeroSig),
        .b12(zeroSig),
        .b13(zeroSig),
        .b14(zeroSig),
        .b15(zeroSig),

        .bneedpangstartinc(4'd0),
        .bneedpangendinc(4'd0),
    
        .pingpong(p4pingpong),
        .aneedpang(1'b1),
        .bneedpang(1'b0),
        .sft(p4sft),
    
        .subblko(pong15)
    );
     
    
    //ping
    eachblktoeachpingpong_pipe6 muxping0(
        .clk(clk),.reset(reset),
    
        .a00(zeroSig),
        .a01(p4d01),
        .a02(p4d02),
        .a03(p4d03),
        .a04(p4d04),
        .a05(p4d05),
        .a06(p4d06),
        .a07(p4d07),
        .a08(p4d08),
        .a09(p4d09),
        .a10(p4d10),
        .a11(p4d11),
        .a12(p4d12),
        .a13(p4d13),
        .a14(p4d14),
        .a15(p4d15),

        .aneedpangstartinc(4'd0),
        .aneedpangendinc(4'd0),
    
        .b00(p4d00),
        .b01(p5pang00),
        .b02(p5pang00),
        .b03(p5pang00),
        .b04(p5pang00),
        .b05(p5pang00),
        .b06(p5pang00),
        .b07(p5pang00),
        .b08(p5pang00),
        .b09(p5pang00),
        .b10(p5pang00),
        .b11(p5pang00),
        .b12(p5pang00),
        .b13(p5pang00),
        .b14(p5pang00),
        .b15(p5pang00),

        .bneedpangstartinc(4'd1),
        .bneedpangendinc(4'd15),
    
        .pingpong(p4pingpong),
        .aneedpang(1'b0),
        .bneedpang(p4needpang),
        .sft(p4sft),
    
        .subblko(ping00)
    ); 
    

    eachblktoeachpingpong_pipe6 muxping1(
        .clk(clk),.reset(reset),
    
        .a00(zeroSig),
        .a01(p4d02),
        .a02(p4d03),
        .a03(p4d04),
        .a04(p4d05),
        .a05(p4d06),
        .a06(p4d07),
        .a07(p4d08),
        .a08(p4d09),
        .a09(p4d10),
        .a10(p4d11),
        .a11(p4d12),
        .a12(p4d13),
        .a13(p4d14),
        .a14(p4d15),
        .a15(zeroSig),

        .aneedpangstartinc(4'd0),
        .aneedpangendinc(4'd0),
    
        .b00(p4d01),
        .b01(p5pang01),
        .b02(p5pang01),
        .b03(p5pang01),
        .b04(p5pang01),
        .b05(p5pang01),
        .b06(p5pang01),
        .b07(p5pang01),
        .b08(p5pang01),
        .b09(p5pang01),
        .b10(p5pang01),
        .b11(p5pang01),
        .b12(p5pang01),
        .b13(p5pang01),
        .b14(p5pang01),
        .b15(p4d00),

        .bneedpangstartinc(4'd1),
        .bneedpangendinc(4'd14),
    
        .pingpong(p4pingpong),
        .aneedpang(1'b0),
        .bneedpang(p4needpang),
        .sft(p4sft),
    
        .subblko(ping01)
    ); 
    

    eachblktoeachpingpong_pipe6 muxping2(
        .clk(clk),.reset(reset),
    
        .a00(zeroSig),
        .a01(p4d03),
        .a02(p4d04),
        .a03(p4d05),
        .a04(p4d06),
        .a05(p4d07),
        .a06(p4d08),
        .a07(p4d09),
        .a08(p4d10),
        .a09(p4d11),
        .a10(p4d12),
        .a11(p4d13),
        .a12(p4d14),
        .a13(p4d15),
        .a14(zeroSig),
        .a15(zeroSig),

        .aneedpangstartinc(4'd0),
        .aneedpangendinc(4'd0),
    
        .b00(p4d02),
        .b01(p5pang02),
        .b02(p5pang02),
        .b03(p5pang02),
        .b04(p5pang02),
        .b05(p5pang02),
        .b06(p5pang02),
        .b07(p5pang02),
        .b08(p5pang02),
        .b09(p5pang02),
        .b10(p5pang02),
        .b11(p5pang02),
        .b12(p5pang02),
        .b13(p5pang02),
        .b14(p4d00),
        .b15(p4d01),

        .bneedpangstartinc(4'd1),
        .bneedpangendinc(4'd13),
    
        .pingpong(p4pingpong),
        .aneedpang(1'b0),
        .bneedpang(p4needpang),
        .sft(p4sft),
    
        .subblko(ping02)
    ); 
    

    eachblktoeachpingpong_pipe6 muxping3(
        .clk(clk),.reset(reset),
    
        .a00(zeroSig),
        .a01(p4d04),
        .a02(p4d05),
        .a03(p4d06),
        .a04(p4d07),
        .a05(p4d08),
        .a06(p4d09),
        .a07(p4d10),
        .a08(p4d11),
        .a09(p4d12),
        .a10(p4d13),
        .a11(p4d14),
        .a12(p4d15),
        .a13(zeroSig),
        .a14(zeroSig),
        .a15(zeroSig),

        .aneedpangstartinc(4'd0),
        .aneedpangendinc(4'd0),
    
        .b00(p4d03),
        .b01(p5pang03),
        .b02(p5pang03),
        .b03(p5pang03),
        .b04(p5pang03),
        .b05(p5pang03),
        .b06(p5pang03),
        .b07(p5pang03),
        .b08(p5pang03),
        .b09(p5pang03),
        .b10(p5pang03),
        .b11(p5pang03),
        .b12(p5pang03),
        .b13(p4d00),
        .b14(p4d01),
        .b15(p4d02),

        .bneedpangstartinc(4'd1),
        .bneedpangendinc(4'd12),
    
        .pingpong(p4pingpong),
        .aneedpang(1'b0),
        .bneedpang(p4needpang),
        .sft(p4sft),
    
        .subblko(ping03)
    ); 
    
    eachblktoeachpingpong_pipe6 muxping4(
        .clk(clk),.reset(reset),
    
        .a00(zeroSig),
        .a01(p4d05),
        .a02(p4d06),
        .a03(p4d07),
        .a04(p4d08),
        .a05(p4d09),
        .a06(p4d10),
        .a07(p4d11),
        .a08(p4d12),
        .a09(p4d13),
        .a10(p4d14),
        .a11(p4d15),
        .a12(zeroSig),
        .a13(zeroSig),
        .a14(zeroSig),
        .a15(zeroSig),

        .aneedpangstartinc(4'd0),
        .aneedpangendinc(4'd0),
    
        .b00(p4d04),
        .b01(p5pang04),
        .b02(p5pang04),
        .b03(p5pang04),
        .b04(p5pang04),
        .b05(p5pang04),
        .b06(p5pang04),
        .b07(p5pang04),
        .b08(p5pang04),
        .b09(p5pang04),
        .b10(p5pang04),
        .b11(p5pang04),
        .b12(p4d00),
        .b13(p4d01),
        .b14(p4d02),
        .b15(p4d03),

        .bneedpangstartinc(4'd1),
        .bneedpangendinc(4'd11),
    
        .pingpong(p4pingpong),
        .aneedpang(1'b0),
        .bneedpang(p4needpang),
        .sft(p4sft),
    
        .subblko(ping04)
    ); 
    
    eachblktoeachpingpong_pipe6 muxping5(
        .clk(clk),.reset(reset),
    
        .a00(zeroSig),
        .a01(p4d06),
        .a02(p4d07),
        .a03(p4d08),
        .a04(p4d09),
        .a05(p4d10),
        .a06(p4d11),
        .a07(p4d12),
        .a08(p4d13),
        .a09(p4d14),
        .a10(p4d15),
        .a11(zeroSig),
        .a12(zeroSig),
        .a13(zeroSig),
        .a14(zeroSig),
        .a15(zeroSig),

        .aneedpangstartinc(4'd0),
        .aneedpangendinc(4'd0),
    
        .b00(p4d05),
        .b01(p5pang05),
        .b02(p5pang05),
        .b03(p5pang05),
        .b04(p5pang05),
        .b05(p5pang05),
        .b06(p5pang05),
        .b07(p5pang05),
        .b08(p5pang05),
        .b09(p5pang05),
        .b10(p5pang05),
        .b11(p4d00),
        .b12(p4d01),
        .b13(p4d02),
        .b14(p4d03),
        .b15(p4d04),

        .bneedpangstartinc(4'd1),
        .bneedpangendinc(4'd10),
    
        .pingpong(p4pingpong),
        .aneedpang(1'b0),
        .bneedpang(p4needpang),
        .sft(p4sft),
    
        .subblko(ping05)
    );        

    eachblktoeachpingpong_pipe6 muxping6(
        .clk(clk),.reset(reset),
    
        .a00(zeroSig),
        .a01(p4d07),
        .a02(p4d08),
        .a03(p4d09),
        .a04(p4d10),
        .a05(p4d11),
        .a06(p4d12),
        .a07(p4d13),
        .a08(p4d14),
        .a09(p4d15),
        .a10(zeroSig),
        .a11(zeroSig),
        .a12(zeroSig),
        .a13(zeroSig),
        .a14(zeroSig),
        .a15(zeroSig),

        .aneedpangstartinc(4'd0),
        .aneedpangendinc(4'd0),
    
        .b00(p4d06),
        .b01(p5pang06),
        .b02(p5pang06),
        .b03(p5pang06),
        .b04(p5pang06),
        .b05(p5pang06),
        .b06(p5pang06),
        .b07(p5pang06),
        .b08(p5pang06),
        .b09(p5pang06),
        .b10(p4d00),
        .b11(p4d01),
        .b12(p4d02),
        .b13(p4d03),
        .b14(p4d04),
        .b15(p4d05),

        .bneedpangstartinc(4'd1),
        .bneedpangendinc(4'd9),
    
        .pingpong(p4pingpong),
        .aneedpang(1'b0),
        .bneedpang(p4needpang),
        .sft(p4sft),
    
        .subblko(ping06)
    );
    
    eachblktoeachpingpong_pipe6 muxping7(
        .clk(clk),.reset(reset),
    
        .a00(zeroSig),
        .a01(p4d08),
        .a02(p4d09),
        .a03(p4d10),
        .a04(p4d11),
        .a05(p4d12),
        .a06(p4d13),
        .a07(p4d14),
        .a08(p4d15),
        .a09(zeroSig),
        .a10(zeroSig),
        .a11(zeroSig),
        .a12(zeroSig),
        .a13(zeroSig),
        .a14(zeroSig),
        .a15(zeroSig),

        .aneedpangstartinc(4'd0),
        .aneedpangendinc(4'd0),
    
        .b00(p4d07),
        .b01(p5pang07),
        .b02(p5pang07),
        .b03(p5pang07),
        .b04(p5pang07),
        .b05(p5pang07),
        .b06(p5pang07),
        .b07(p5pang07),
        .b08(p5pang07),
        .b09(p4d00),
        .b10(p4d01),
        .b11(p4d02),
        .b12(p4d03),
        .b13(p4d04),
        .b14(p4d05),
        .b15(p4d06),

        .bneedpangstartinc(4'd1),
        .bneedpangendinc(4'd8),
    
        .pingpong(p4pingpong),
        .aneedpang(1'b0),
        .bneedpang(p4needpang),
        .sft(p4sft),
    
        .subblko(ping07)
    );
    
    eachblktoeachpingpong_pipe6 muxping8(
        .clk(clk),.reset(reset),
    
        .a00(zeroSig),
        .a01(p4d09),
        .a02(p4d10),
        .a03(p4d11),
        .a04(p4d12),
        .a05(p4d13),
        .a06(p4d14),
        .a07(p4d15),
        .a08(zeroSig),
        .a09(zeroSig),
        .a10(zeroSig),
        .a11(zeroSig),
        .a12(zeroSig),
        .a13(zeroSig),
        .a14(zeroSig),
        .a15(zeroSig),

        .aneedpangstartinc(4'd0),
        .aneedpangendinc(4'd0),
    
        .b00(p4d08),
        .b01(p5pang08),
        .b02(p5pang08),
        .b03(p5pang08),
        .b04(p5pang08),
        .b05(p5pang08),
        .b06(p5pang08),
        .b07(p5pang08),
        .b08(p4d00),
        .b09(p4d01),
        .b10(p4d02),
        .b11(p4d03),
        .b12(p4d04),
        .b13(p4d05),
        .b14(p4d06),
        .b15(p4d07),

        .bneedpangstartinc(4'd1),
        .bneedpangendinc(4'd7),
    
        .pingpong(p4pingpong),
        .aneedpang(1'b0),
        .bneedpang(p4needpang),
        .sft(p4sft),
    
        .subblko(ping08)
    );    
    
    eachblktoeachpingpong_pipe6 muxping9(
        .clk(clk),.reset(reset),
    
        .a00(zeroSig),
        .a01(p4d10),
        .a02(p4d11),
        .a03(p4d12),
        .a04(p4d13),
        .a05(p4d14),
        .a06(p4d15),
        .a07(zeroSig),
        .a08(zeroSig),
        .a09(zeroSig),
        .a10(zeroSig),
        .a11(zeroSig),
        .a12(zeroSig),
        .a13(zeroSig),
        .a14(zeroSig),
        .a15(zeroSig),

        .aneedpangstartinc(4'd0),
        .aneedpangendinc(4'd0),
    
        .b00(p4d09),
        .b01(p5pang09),
        .b02(p5pang09),
        .b03(p5pang09),
        .b04(p5pang09),
        .b05(p5pang09),
        .b06(p5pang09),
        .b07(p4d00),
        .b08(p4d01),
        .b09(p4d02),
        .b10(p4d03),
        .b11(p4d04),
        .b12(p4d05),
        .b13(p4d06),
        .b14(p4d07),
        .b15(p4d08),

        .bneedpangstartinc(4'd1),
        .bneedpangendinc(4'd6),
    
        .pingpong(p4pingpong),
        .aneedpang(1'b0),
        .bneedpang(p4needpang),
        .sft(p4sft),
    
        .subblko(ping09)
    );
    
    
    eachblktoeachpingpong_pipe6 muxping10(
        .clk(clk),.reset(reset),
    
        .a00(zeroSig),
        .a01(p4d11),
        .a02(p4d12),
        .a03(p4d13),
        .a04(p4d14),
        .a05(p4d15),
        .a06(zeroSig),
        .a07(zeroSig),
        .a08(zeroSig),
        .a09(zeroSig),
        .a10(zeroSig),
        .a11(zeroSig),
        .a12(zeroSig),
        .a13(zeroSig),
        .a14(zeroSig),
        .a15(zeroSig),

        .aneedpangstartinc(4'd0),
        .aneedpangendinc(4'd0),
    
        .b00(p4d10),
        .b01(p5pang10),
        .b02(p5pang10),
        .b03(p5pang10),
        .b04(p5pang10),
        .b05(p5pang10),
        .b06(p4d00),
        .b07(p4d01),
        .b08(p4d02),
        .b09(p4d03),
        .b10(p4d04),
        .b11(p4d05),
        .b12(p4d06),
        .b13(p4d07),
        .b14(p4d08),
        .b15(p4d09),

        .bneedpangstartinc(4'd1),
        .bneedpangendinc(4'd5),
    
        .pingpong(p4pingpong),
        .aneedpang(1'b0),
        .bneedpang(p4needpang),
        .sft(p4sft),
    
        .subblko(ping10)
    ); 
    
    
    eachblktoeachpingpong_pipe6 muxping11(
        .clk(clk),.reset(reset),
    
        .a00(zeroSig),
        .a01(p4d12),
        .a02(p4d13),
        .a03(p4d14),
        .a04(p4d15),
        .a05(zeroSig),
        .a06(zeroSig),
        .a07(zeroSig),
        .a08(zeroSig),
        .a09(zeroSig),
        .a10(zeroSig),
        .a11(zeroSig),
        .a12(zeroSig),
        .a13(zeroSig),
        .a14(zeroSig),
        .a15(zeroSig),

        .aneedpangstartinc(4'd0),
        .aneedpangendinc(4'd0),
    
        .b00(p4d11),
        .b01(p5pang11),
        .b02(p5pang11),
        .b03(p5pang11),
        .b04(p5pang11),
        .b05(p4d00),
        .b06(p4d01),
        .b07(p4d02),
        .b08(p4d03),
        .b09(p4d04),
        .b10(p4d05),
        .b11(p4d06),
        .b12(p4d07),
        .b13(p4d08),
        .b14(p4d09),
        .b15(p4d10),

        .bneedpangstartinc(4'd1),
        .bneedpangendinc(4'd4),
    
        .pingpong(p4pingpong),
        .aneedpang(1'b0),
        .bneedpang(p4needpang),
        .sft(p4sft),
    
        .subblko(ping11)
    );    
    
    eachblktoeachpingpong_pipe6 muxping12(
        .clk(clk),.reset(reset),
    
        .a00(zeroSig),
        .a01(p4d13),
        .a02(p4d14),
        .a03(p4d15),
        .a04(zeroSig),
        .a05(zeroSig),
        .a06(zeroSig),
        .a07(zeroSig),
        .a08(zeroSig),
        .a09(zeroSig),
        .a10(zeroSig),
        .a11(zeroSig),
        .a12(zeroSig),
        .a13(zeroSig),
        .a14(zeroSig),
        .a15(zeroSig),

        .aneedpangstartinc(4'd0),
        .aneedpangendinc(4'd0),
    
        .b00(p4d12),
        .b01(p5pang12),
        .b02(p5pang12),
        .b03(p5pang12),
        .b04(p4d00),
        .b05(p4d01),
        .b06(p4d02),
        .b07(p4d03),
        .b08(p4d04),
        .b09(p4d05),
        .b10(p4d06),
        .b11(p4d07),
        .b12(p4d08),
        .b13(p4d09),
        .b14(p4d10),
        .b15(p4d11),

        .bneedpangstartinc(4'd1),
        .bneedpangendinc(4'd3),
    
        .pingpong(p4pingpong),
        .aneedpang(1'b0),
        .bneedpang(p4needpang),
        .sft(p4sft),
    
        .subblko(ping12)
    );    
    
    eachblktoeachpingpong_pipe6 muxping13(
        .clk(clk),.reset(reset),
    
        .a00(zeroSig),
        .a01(p4d14),
        .a02(p4d15),
        .a03(zeroSig),
        .a04(zeroSig),
        .a05(zeroSig),
        .a06(zeroSig),
        .a07(zeroSig),
        .a08(zeroSig),
        .a09(zeroSig),
        .a10(zeroSig),
        .a11(zeroSig),
        .a12(zeroSig),
        .a13(zeroSig),
        .a14(zeroSig),
        .a15(zeroSig),

        .aneedpangstartinc(4'd0),
        .aneedpangendinc(4'd0),
    
        .b00(p4d13),
        .b01(p5pang13),
        .b02(p5pang13),
        .b03(p4d00),
        .b04(p4d01),
        .b05(p4d02),
        .b06(p4d03),
        .b07(p4d04),
        .b08(p4d05),
        .b09(p4d06),
        .b10(p4d07),
        .b11(p4d08),
        .b12(p4d09),
        .b13(p4d10),
        .b14(p4d11),
        .b15(p4d12),

        .bneedpangstartinc(4'd1),
        .bneedpangendinc(4'd2),
    
        .pingpong(p4pingpong),
        .aneedpang(1'b0),
        .bneedpang(p4needpang),
        .sft(p4sft),
    
        .subblko(ping13)
    );    
    
    eachblktoeachpingpong_pipe6 muxping14(
        .clk(clk),.reset(reset),
    
        .a00(zeroSig),
        .a01(p4d15),
        .a02(zeroSig),
        .a03(zeroSig),
        .a04(zeroSig),
        .a05(zeroSig),
        .a06(zeroSig),
        .a07(zeroSig),
        .a08(zeroSig),
        .a09(zeroSig),
        .a10(zeroSig),
        .a11(zeroSig),
        .a12(zeroSig),
        .a13(zeroSig),
        .a14(zeroSig),
        .a15(zeroSig),

        .aneedpangstartinc(4'd0),
        .aneedpangendinc(4'd0),
    
        .b00(p4d14),
        .b01(p5pang14),
        .b02(p4d00),
        .b03(p4d01),
        .b04(p4d02),
        .b05(p4d03),
        .b06(p4d04),
        .b07(p4d05),
        .b08(p4d06),
        .b09(p4d07),
        .b10(p4d08),
        .b11(p4d09),
        .b12(p4d10),
        .b13(p4d11),
        .b14(p4d12),
        .b15(p4d13),

        .bneedpangstartinc(4'd1),
        .bneedpangendinc(4'd1),
    
        .pingpong(p4pingpong),
        .aneedpang(1'b0),
        .bneedpang(p4needpang),
        .sft(p4sft),
    
        .subblko(ping14)
    );
    
    eachblktoeachpingpong_pipe6 muxping15(
        .clk(clk),.reset(reset),
    
        .a00(zeroSig),
        .a01(zeroSig),
        .a02(zeroSig),
        .a03(zeroSig),
        .a04(zeroSig),
        .a05(zeroSig),
        .a06(zeroSig),
        .a07(zeroSig),
        .a08(zeroSig),
        .a09(zeroSig),
        .a10(zeroSig),
        .a11(zeroSig),
        .a12(zeroSig),
        .a13(zeroSig),
        .a14(zeroSig),
        .a15(zeroSig),

        .aneedpangstartinc(4'd0),
        .aneedpangendinc(4'd0),
    
        .b00(p4d15),
        .b01(p4d00),
        .b02(p4d01),
        .b03(p4d02),
        .b04(p4d03),
        .b05(p4d04),
        .b06(p4d05),
        .b07(p4d06),
        .b08(p4d07),
        .b09(p4d08),
        .b10(p4d09),
        .b11(p4d10),
        .b12(p4d11),
        .b13(p4d12),
        .b14(p4d13),
        .b15(p4d14),

        .bneedpangstartinc(4'd0),
        .bneedpangendinc(4'd0),
    
        .pingpong(p4pingpong),
        .aneedpang(1'b0),
        .bneedpang(1'b1),
        .sft(p4sft),
    
        .subblko(ping15)
    );    
       
        
    
    reg eol_p1;

    always@(posedge clk or posedge reset) begin
        if (reset) begin
            pingpong <= 0;
            eol_p1 <= 0;
        end else begin
            pingpong <= ~pingpong;
            eol_p1 <= eol;
        end        
    end
    assign needpang = eol_p1 && !blkgap;
    
    
    /*always@(posedge clk or posedge reset) begin
        if (reset) begin
            q00 <= 8'd0;
            q01 <= 8'd0;
            q02 <= 8'd0;
            q03 <= 8'd0;
            q04 <= 8'd0;
            q05 <= 8'd0;
            
            q06 <= 8'd0;
            q07 <= 8'd0;
            q08 <= 8'd0;
            q09 <= 8'd0;
            q10 <= 8'd0;
            
            q11 <= 8'd0;
            q12 <= 8'd0;
            q13 <= 8'd0;
            q14 <= 8'd0;
            q15 <= 8'd0;
        end else begin*/
        always@(posedge clk) begin
            if (p9pingpong == 1'b1) begin
                q00 <= ping00;
                q01 <= ping01;
                q02 <= ping02;
                q03 <= ping03;
                q04 <= ping04;
                q05 <= ping05;
                
                q06 <= ping06;
                q07 <= ping07;
                q08 <= ping08;
                q09 <= ping09;
                q10 <= ping10;
                
                q11 <= ping11;
                q12 <= ping12;
                q13 <= ping13;
                q14 <= ping14;
                q15 <= ping15;
                
            end else begin
                q00 <= pong00;
                q01 <= pong01;
                q02 <= pong02;
                q03 <= pong03;
                q04 <= pong04;
                q05 <= pong05;
                
                q06 <= pong06;
                q07 <= pong07;
                q08 <= pong08;
                q09 <= pong09;
                q10 <= pong10;
                
                q11 <= pong11;
                q12 <= pong12;
                q13 <= pong13;
                q14 <= pong14;
                q15 <= pong15;
            end
        end        
    //end

    /*wire [7:0] prePong07;
    wire preTakePang07;
    
    sixteenToOneMux_Pipe4 MuxPing7(
        .clk(clk), .reset(reset), .sel(sft), 
        .subblki0(d07),
            
        .subblki1(pang07),  
        .subblki2(pang07),  
        .subblki3(pang07),  
        .subblki4(pang07),  
        .subblki5(pang07), 
        .subblki6(pang07),  
        .subblki7(pang07),  
        .subblki8(pang07), 
         
        .subblki9(d00),     
        .subblki10(d01),    
        .subblki11(d02), 
        .subblki12(d03),    
        .subblki13(d04),    
        .subblki14(d05),    
        .subblki15(d06),    
        .subblko(prePong07),
        
        .needpang(needpang), .needpangStartInc(0), .needpangEndInc(8), .takePango(preTakePang07)
    );*/
    
    
    
    
endmodule
