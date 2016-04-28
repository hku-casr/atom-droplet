`timescale 1ns / 1ps

`include "macro_para.v"

module muxPang_Pipe5(
        
    input clk,
    input reset,
    
    input [`SUB_BLK_BIT-1:0] d15,
    input [`SUB_BLK_BIT-1:0] d14,
    input [`SUB_BLK_BIT-1:0] d13,
    input [`SUB_BLK_BIT-1:0] d12,
    input [`SUB_BLK_BIT-1:0] d11,
    input [`SUB_BLK_BIT-1:0] d10,
    input [`SUB_BLK_BIT-1:0] d09,
    input [`SUB_BLK_BIT-1:0] d08,
    
    input [`SUB_BLK_BIT-1:0] d07,
    input [`SUB_BLK_BIT-1:0] d06,
    input [`SUB_BLK_BIT-1:0] d05,
    input [`SUB_BLK_BIT-1:0] d04,
    input [`SUB_BLK_BIT-1:0] d03,
    input [`SUB_BLK_BIT-1:0] d02,
    input [`SUB_BLK_BIT-1:0] d01,
    input [`SUB_BLK_BIT-1:0] d00,
    
    input [`SFT_BIT-1:0] next_sft,
    
    output [`SUB_BLK_BIT-1:0] pang00,
    output [`SUB_BLK_BIT-1:0] pang01,
    output [`SUB_BLK_BIT-1:0] pang02,
    output [`SUB_BLK_BIT-1:0] pang03,
    output [`SUB_BLK_BIT-1:0] pang04,
    output [`SUB_BLK_BIT-1:0] pang05,
    output [`SUB_BLK_BIT-1:0] pang06,
    output [`SUB_BLK_BIT-1:0] pang07,
    
    output [`SUB_BLK_BIT-1:0] pang08,
    output [`SUB_BLK_BIT-1:0] pang09,
    output [`SUB_BLK_BIT-1:0] pang10,
    output [`SUB_BLK_BIT-1:0] pang11,
    output [`SUB_BLK_BIT-1:0] pang12,
    output [`SUB_BLK_BIT-1:0] pang13,
    output [`SUB_BLK_BIT-1:0] pang14,
    output [`SUB_BLK_BIT-1:0] pang15

    );
    
    wire [`SUB_BLK_BIT-1:0] zeroSig;
    assign zeroSig = `SUB_BLK_BIT'd0;
    
    eachBlkToEachPang_Pipe5 muxpang0(
        .clk(clk),.reset(reset), .next_sft(next_sft),
        .z00(d00), .z01(d01), .z02(d02), .z03(d03), .z04(d04), .z05(d05), .z06(d06), .z07(d07),
        .z08(d08), .z09(d09), .z10(d10), .z11(d11), .z12(d12), .z13(d13), .z14(d14), .z15(d15),
    
        .zNeedFull(1'b1), .zNeedPangStartInc(`SFT_BIT'd15), .zNeedPangEndInc(`SFT_BIT'd15),
        .subBlko(pang00)
    );
    
    eachBlkToEachPang_Pipe5 muxpang1(
        .clk(clk),.reset(reset), .next_sft(next_sft),
        .z00(d01), .z01(d02), .z02(d03), .z03(d04), .z04(d05), .z05(d06), .z06(d07), .z07(d08),
        .z08(d09), .z09(d10), .z10(d11), .z11(d12), .z12(d13), .z13(d14), .z14(d15), .z15(zeroSig),
    
        .zNeedFull(1'b0), .zNeedPangStartInc(`SFT_BIT'd15), .zNeedPangEndInc(`SFT_BIT'd15),
        .subBlko(pang01)
    );
    
    eachBlkToEachPang_Pipe5 muxpang2(
        .clk(clk),.reset(reset), .next_sft(next_sft),
        .z00(d02), .z01(d03), .z02(d04), .z03(d05), .z04(d06), .z05(d07), .z06(d08), .z07(d09),
        .z08(d10), .z09(d11), .z10(d12), .z11(d13), .z12(d14), .z13(d15), .z14(zeroSig), .z15(zeroSig),
    
        .zNeedFull(1'b0), .zNeedPangStartInc(`SFT_BIT'd14), .zNeedPangEndInc(`SFT_BIT'd15),
        .subBlko(pang02)
    );
    
    eachBlkToEachPang_Pipe5 muxpang3(
        .clk(clk),.reset(reset), .next_sft(next_sft),
        .z00(d03), .z01(d04), .z02(d05), .z03(d06), .z04(d07), .z05(d08), .z06(d09), .z07(d10),
        .z08(d11), .z09(d12), .z10(d13), .z11(d14), .z12(d15), .z13(zeroSig), .z14(zeroSig), .z15(zeroSig),
    
        .zNeedFull(1'b0), .zNeedPangStartInc(`SFT_BIT'd13), .zNeedPangEndInc(`SFT_BIT'd15),
        .subBlko(pang03)
    );
    
    eachBlkToEachPang_Pipe5 muxpang4(
        .clk(clk),.reset(reset), .next_sft(next_sft),
        .z00(d04), .z01(d05), .z02(d06), .z03(d07), .z04(d08), .z05(d09), .z06(d10), .z07(d11),
        .z08(d12), .z09(d13), .z10(d14), .z11(d15), .z12(zeroSig), .z13(zeroSig), .z14(zeroSig), .z15(zeroSig),
    
        .zNeedFull(1'b0), .zNeedPangStartInc(`SFT_BIT'd12), .zNeedPangEndInc(`SFT_BIT'd15),
        .subBlko(pang04)
    );
    
    eachBlkToEachPang_Pipe5 muxpang5(
        .clk(clk),.reset(reset), .next_sft(next_sft),
        .z00(d05), .z01(d06), .z02(d07), .z03(d08), .z04(d09), .z05(d10), .z06(d11), .z07(d12),
        .z08(d13), .z09(d14), .z10(d15), .z11(zeroSig), .z12(zeroSig), .z13(zeroSig), .z14(zeroSig), .z15(zeroSig),
    
        .zNeedFull(1'b0), .zNeedPangStartInc(`SFT_BIT'd11), .zNeedPangEndInc(`SFT_BIT'd15),
        .subBlko(pang05)
    );
    
    eachBlkToEachPang_Pipe5 muxpang6(
        .clk(clk),.reset(reset), .next_sft(next_sft),
        .z00(d06), .z01(d07), .z02(d08), .z03(d09), .z04(d10), .z05(d11), .z06(d12), .z07(d13),
        .z08(d14), .z09(d15), .z10(zeroSig), .z11(zeroSig), .z12(zeroSig), .z13(zeroSig), .z14(zeroSig), .z15(zeroSig),
    
        .zNeedFull(1'b0), .zNeedPangStartInc(`SFT_BIT'd10), .zNeedPangEndInc(`SFT_BIT'd15),
        .subBlko(pang06)
    );
    
    eachBlkToEachPang_Pipe5 muxpang7(
        .clk(clk),.reset(reset), .next_sft(next_sft),
        .z00(d07), .z01(d08), .z02(d09), .z03(d10), .z04(d11), .z05(d12), .z06(d13), .z07(d14),
        .z08(d15), .z09(zeroSig), .z10(zeroSig), .z11(zeroSig), .z12(zeroSig), .z13(zeroSig), .z14(zeroSig), .z15(zeroSig),
    
        .zNeedFull(1'b0), .zNeedPangStartInc(`SFT_BIT'd9), .zNeedPangEndInc(`SFT_BIT'd15),
        .subBlko(pang07)
    );
    
    eachBlkToEachPang_Pipe5 muxpang8(
        .clk(clk),.reset(reset), .next_sft(next_sft),
        .z00(d08), .z01(d09), .z02(d10), .z03(d11), .z04(d12), .z05(d13), .z06(d14), .z07(d15),
        .z08(zeroSig), .z09(zeroSig), .z10(zeroSig), .z11(zeroSig), .z12(zeroSig), .z13(zeroSig), .z14(zeroSig), .z15(zeroSig),
    
        .zNeedFull(1'b0), .zNeedPangStartInc(`SFT_BIT'd8), .zNeedPangEndInc(`SFT_BIT'd15),
        .subBlko(pang08)
    );
    
    eachBlkToEachPang_Pipe5 muxpang9(
        .clk(clk),.reset(reset), .next_sft(next_sft),
        .z00(d09), .z01(d10), .z02(d11), .z03(d12), .z04(d13), .z05(d14), .z06(d15), .z07(zeroSig),
        .z08(zeroSig), .z09(zeroSig), .z10(zeroSig), .z11(zeroSig), .z12(zeroSig), .z13(zeroSig), .z14(zeroSig), .z15(zeroSig),
    
        .zNeedFull(1'b0), .zNeedPangStartInc(`SFT_BIT'd7), .zNeedPangEndInc(`SFT_BIT'd15),
        .subBlko(pang09)
    );
    
    eachBlkToEachPang_Pipe5 muxpang10(
        .clk(clk),.reset(reset), .next_sft(next_sft),
        .z00(d10), .z01(d11), .z02(d12), .z03(d13), .z04(d14), .z05(d15), .z06(zeroSig), .z07(zeroSig),
        .z08(zeroSig), .z09(zeroSig), .z10(zeroSig), .z11(zeroSig), .z12(zeroSig), .z13(zeroSig), .z14(zeroSig), .z15(zeroSig),
    
        .zNeedFull(1'b0), .zNeedPangStartInc(`SFT_BIT'd6), .zNeedPangEndInc(`SFT_BIT'd15),
        .subBlko(pang10)
    );
    
    eachBlkToEachPang_Pipe5 muxpang11(
        .clk(clk),.reset(reset), .next_sft(next_sft),
        .z00(d11), .z01(d12), .z02(d13), .z03(d14), .z04(d15), .z05(zeroSig), .z06(zeroSig), .z07(zeroSig),
        .z08(zeroSig), .z09(zeroSig), .z10(zeroSig), .z11(zeroSig), .z12(zeroSig), .z13(zeroSig), .z14(zeroSig), .z15(zeroSig),
    
        .zNeedFull(1'b0), .zNeedPangStartInc(`SFT_BIT'd5), .zNeedPangEndInc(`SFT_BIT'd15),
        .subBlko(pang11)
    );
    
    eachBlkToEachPang_Pipe5 muxpang12(
        .clk(clk),.reset(reset), .next_sft(next_sft),
        .z00(d12), .z01(d13), .z02(d14), .z03(d15), .z04(zeroSig), .z05(zeroSig), .z06(zeroSig), .z07(zeroSig),
        .z08(zeroSig), .z09(zeroSig), .z10(zeroSig), .z11(zeroSig), .z12(zeroSig), .z13(zeroSig), .z14(zeroSig), .z15(zeroSig),
    
        .zNeedFull(1'b0), .zNeedPangStartInc(`SFT_BIT'd4), .zNeedPangEndInc(`SFT_BIT'd15),
        .subBlko(pang12)
    );
    
    eachBlkToEachPang_Pipe5 muxpang13(
        .clk(clk),.reset(reset), .next_sft(next_sft),
        .z00(d13), .z01(d14), .z02(d15), .z03(zeroSig), .z04(zeroSig), .z05(zeroSig), .z06(zeroSig), .z07(zeroSig),
        .z08(zeroSig), .z09(zeroSig), .z10(zeroSig), .z11(zeroSig), .z12(zeroSig), .z13(zeroSig), .z14(zeroSig), .z15(zeroSig),
    
        .zNeedFull(1'b0), .zNeedPangStartInc(`SFT_BIT'd3), .zNeedPangEndInc(`SFT_BIT'd15),
        .subBlko(pang13)
    );
    
    eachBlkToEachPang_Pipe5 muxpang14(
        .clk(clk),.reset(reset), .next_sft(next_sft),
        .z00(d14), .z01(d15), .z02(zeroSig), .z03(zeroSig), .z04(zeroSig), .z05(zeroSig), .z06(zeroSig), .z07(zeroSig),
        .z08(zeroSig), .z09(zeroSig), .z10(zeroSig), .z11(zeroSig), .z12(zeroSig), .z13(zeroSig), .z14(zeroSig), .z15(zeroSig),
    
        .zNeedFull(1'b0), .zNeedPangStartInc(`SFT_BIT'd2), .zNeedPangEndInc(`SFT_BIT'd15),
        .subBlko(pang14)
    );
    
    eachBlkToEachPang_Pipe5 muxpang15(
        .clk(clk),.reset(reset), .next_sft(next_sft),
        .z00(d15), .z01(zeroSig), .z02(zeroSig), .z03(zeroSig), .z04(zeroSig), .z05(zeroSig), .z06(zeroSig), .z07(zeroSig),
        .z08(zeroSig), .z09(zeroSig), .z10(zeroSig), .z11(zeroSig), .z12(zeroSig), .z13(zeroSig), .z14(zeroSig), .z15(zeroSig),
    
        .zNeedFull(1'b0), .zNeedPangStartInc(`SFT_BIT'd1), .zNeedPangEndInc(`SFT_BIT'd15),
        .subBlko(pang15)
    );
    
endmodule
