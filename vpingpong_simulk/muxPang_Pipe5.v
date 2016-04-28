`timescale 1ns / 1ps

module muxpang_pipe5(
        
    input clk,
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
    
    input [3:0] next_sft,
    
    output [7:0] pang00,
    output [7:0] pang01,
    output [7:0] pang02,
    output [7:0] pang03,
    output [7:0] pang04,
    output [7:0] pang05,
    output [7:0] pang06,
    output [7:0] pang07,
    
    output [7:0] pang08,
    output [7:0] pang09,
    output [7:0] pang10,
    output [7:0] pang11,
    output [7:0] pang12,
    output [7:0] pang13,
    output [7:0] pang14,
    output [7:0] pang15

    );
    
    wire [7:0] zeroSig;
    assign zeroSig = 8'd0;
    
    eachblktoeachpang_pipe5 muxpang0(
        .clk(clk),.reset(reset), .next_sft(next_sft),
        .z00(d00), .z01(d01), .z02(d02), .z03(d03), .z04(d04), .z05(d05), .z06(d06), .z07(d07),
        .z08(d08), .z09(d09), .z10(d10), .z11(d11), .z12(d12), .z13(d13), .z14(d14), .z15(d15),
    
        .zneedfull(1'b1), .zneedpangstartinc(4'd15), .zneedpangendinc(4'd15),
        .subblko(pang00)
    );
    
    eachblktoeachpang_pipe5 muxpang1(
        .clk(clk),.reset(reset), .next_sft(next_sft),
        .z00(d01), .z01(d02), .z02(d03), .z03(d04), .z04(d05), .z05(d06), .z06(d07), .z07(d08),
        .z08(d09), .z09(d10), .z10(d11), .z11(d12), .z12(d13), .z13(d14), .z14(d15), .z15(zeroSig),
    
        .zneedfull(1'b0), .zneedpangstartinc(4'd15), .zneedpangendinc(4'd15),
        .subblko(pang01)
    );
    
    eachblktoeachpang_pipe5 muxpang2(
        .clk(clk),.reset(reset), .next_sft(next_sft),
        .z00(d02), .z01(d03), .z02(d04), .z03(d05), .z04(d06), .z05(d07), .z06(d08), .z07(d09),
        .z08(d10), .z09(d11), .z10(d12), .z11(d13), .z12(d14), .z13(d15), .z14(zeroSig), .z15(zeroSig),
    
        .zneedfull(1'b0), .zneedpangstartinc(4'd14), .zneedpangendinc(4'd15),
        .subblko(pang02)
    );
    
    eachblktoeachpang_pipe5 muxpang3(
        .clk(clk),.reset(reset), .next_sft(next_sft),
        .z00(d03), .z01(d04), .z02(d05), .z03(d06), .z04(d07), .z05(d08), .z06(d09), .z07(d10),
        .z08(d11), .z09(d12), .z10(d13), .z11(d14), .z12(d15), .z13(zeroSig), .z14(zeroSig), .z15(zeroSig),
    
        .zneedfull(1'b0), .zneedpangstartinc(4'd13), .zneedpangendinc(4'd15),
        .subblko(pang03)
    );
    
    eachblktoeachpang_pipe5 muxpang4(
        .clk(clk),.reset(reset), .next_sft(next_sft),
        .z00(d04), .z01(d05), .z02(d06), .z03(d07), .z04(d08), .z05(d09), .z06(d10), .z07(d11),
        .z08(d12), .z09(d13), .z10(d14), .z11(d15), .z12(zeroSig), .z13(zeroSig), .z14(zeroSig), .z15(zeroSig),
    
        .zneedfull(1'b0), .zneedpangstartinc(4'd12), .zneedpangendinc(4'd15),
        .subblko(pang04)
    );
    
    eachblktoeachpang_pipe5 muxpang5(
        .clk(clk),.reset(reset), .next_sft(next_sft),
        .z00(d05), .z01(d06), .z02(d07), .z03(d08), .z04(d09), .z05(d10), .z06(d11), .z07(d12),
        .z08(d13), .z09(d14), .z10(d15), .z11(zeroSig), .z12(zeroSig), .z13(zeroSig), .z14(zeroSig), .z15(zeroSig),
    
        .zneedfull(1'b0), .zneedpangstartinc(4'd11), .zneedpangendinc(4'd15),
        .subblko(pang05)
    );
    
    eachblktoeachpang_pipe5 muxpang6(
        .clk(clk),.reset(reset), .next_sft(next_sft),
        .z00(d06), .z01(d07), .z02(d08), .z03(d09), .z04(d10), .z05(d11), .z06(d12), .z07(d13),
        .z08(d14), .z09(d15), .z10(zeroSig), .z11(zeroSig), .z12(zeroSig), .z13(zeroSig), .z14(zeroSig), .z15(zeroSig),
    
        .zneedfull(1'b0), .zneedpangstartinc(4'd10), .zneedpangendinc(4'd15),
        .subblko(pang06)
    );
    
    eachblktoeachpang_pipe5 muxpang7(
        .clk(clk),.reset(reset), .next_sft(next_sft),
        .z00(d07), .z01(d08), .z02(d09), .z03(d10), .z04(d11), .z05(d12), .z06(d13), .z07(d14),
        .z08(d15), .z09(zeroSig), .z10(zeroSig), .z11(zeroSig), .z12(zeroSig), .z13(zeroSig), .z14(zeroSig), .z15(zeroSig),
    
        .zneedfull(1'b0), .zneedpangstartinc(4'd9), .zneedpangendinc(4'd15),
        .subblko(pang07)
    );
    
    eachblktoeachpang_pipe5 muxpang8(
        .clk(clk),.reset(reset), .next_sft(next_sft),
        .z00(d08), .z01(d09), .z02(d10), .z03(d11), .z04(d12), .z05(d13), .z06(d14), .z07(d15),
        .z08(zeroSig), .z09(zeroSig), .z10(zeroSig), .z11(zeroSig), .z12(zeroSig), .z13(zeroSig), .z14(zeroSig), .z15(zeroSig),
    
        .zneedfull(1'b0), .zneedpangstartinc(4'd8), .zneedpangendinc(4'd15),
        .subblko(pang08)
    );
    
    eachblktoeachpang_pipe5 muxpang9(
        .clk(clk),.reset(reset), .next_sft(next_sft),
        .z00(d09), .z01(d10), .z02(d11), .z03(d12), .z04(d13), .z05(d14), .z06(d15), .z07(zeroSig),
        .z08(zeroSig), .z09(zeroSig), .z10(zeroSig), .z11(zeroSig), .z12(zeroSig), .z13(zeroSig), .z14(zeroSig), .z15(zeroSig),
    
        .zneedfull(1'b0), .zneedpangstartinc(4'd7), .zneedpangendinc(4'd15),
        .subblko(pang09)
    );
    
    eachblktoeachpang_pipe5 muxpang10(
        .clk(clk),.reset(reset), .next_sft(next_sft),
        .z00(d10), .z01(d11), .z02(d12), .z03(d13), .z04(d14), .z05(d15), .z06(zeroSig), .z07(zeroSig),
        .z08(zeroSig), .z09(zeroSig), .z10(zeroSig), .z11(zeroSig), .z12(zeroSig), .z13(zeroSig), .z14(zeroSig), .z15(zeroSig),
    
        .zneedfull(1'b0), .zneedpangstartinc(4'd6), .zneedpangendinc(4'd15),
        .subblko(pang10)
    );
    
    eachblktoeachpang_pipe5 muxpang11(
        .clk(clk),.reset(reset), .next_sft(next_sft),
        .z00(d11), .z01(d12), .z02(d13), .z03(d14), .z04(d15), .z05(zeroSig), .z06(zeroSig), .z07(zeroSig),
        .z08(zeroSig), .z09(zeroSig), .z10(zeroSig), .z11(zeroSig), .z12(zeroSig), .z13(zeroSig), .z14(zeroSig), .z15(zeroSig),
    
        .zneedfull(1'b0), .zneedpangstartinc(4'd5), .zneedpangendinc(4'd15),
        .subblko(pang11)
    );
    
    eachblktoeachpang_pipe5 muxpang12(
        .clk(clk),.reset(reset), .next_sft(next_sft),
        .z00(d12), .z01(d13), .z02(d14), .z03(d15), .z04(zeroSig), .z05(zeroSig), .z06(zeroSig), .z07(zeroSig),
        .z08(zeroSig), .z09(zeroSig), .z10(zeroSig), .z11(zeroSig), .z12(zeroSig), .z13(zeroSig), .z14(zeroSig), .z15(zeroSig),
    
        .zneedfull(1'b0), .zneedpangstartinc(4'd4), .zneedpangendinc(4'd15),
        .subblko(pang12)
    );
    
    eachblktoeachpang_pipe5 muxpang13(
        .clk(clk),.reset(reset), .next_sft(next_sft),
        .z00(d13), .z01(d14), .z02(d15), .z03(zeroSig), .z04(zeroSig), .z05(zeroSig), .z06(zeroSig), .z07(zeroSig),
        .z08(zeroSig), .z09(zeroSig), .z10(zeroSig), .z11(zeroSig), .z12(zeroSig), .z13(zeroSig), .z14(zeroSig), .z15(zeroSig),
    
        .zneedfull(1'b0), .zneedpangstartinc(4'd3), .zneedpangendinc(4'd15),
        .subblko(pang13)
    );
    
    eachblktoeachpang_pipe5 muxpang14(
        .clk(clk),.reset(reset), .next_sft(next_sft),
        .z00(d14), .z01(d15), .z02(zeroSig), .z03(zeroSig), .z04(zeroSig), .z05(zeroSig), .z06(zeroSig), .z07(zeroSig),
        .z08(zeroSig), .z09(zeroSig), .z10(zeroSig), .z11(zeroSig), .z12(zeroSig), .z13(zeroSig), .z14(zeroSig), .z15(zeroSig),
    
        .zneedfull(1'b0), .zneedpangstartinc(4'd2), .zneedpangendinc(4'd15),
        .subblko(pang14)
    );
    
    eachblktoeachpang_pipe5 muxpang15(
        .clk(clk),.reset(reset), .next_sft(next_sft),
        .z00(d15), .z01(zeroSig), .z02(zeroSig), .z03(zeroSig), .z04(zeroSig), .z05(zeroSig), .z06(zeroSig), .z07(zeroSig),
        .z08(zeroSig), .z09(zeroSig), .z10(zeroSig), .z11(zeroSig), .z12(zeroSig), .z13(zeroSig), .z14(zeroSig), .z15(zeroSig),
    
        .zneedfull(1'b0), .zneedpangstartinc(4'd1), .zneedpangendinc(4'd15),
        .subblko(pang15)
    );
    
endmodule
