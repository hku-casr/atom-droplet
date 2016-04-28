`timescale 1ns / 1ps


module eachblktoeachpingpong_pipe6(

    input clk,
    input reset,
    
    input [7:0] a00,
    input [7:0] a01,
    input [7:0] a02,
    input [7:0] a03,
    input [7:0] a04,
    input [7:0] a05,
    input [7:0] a06,
    input [7:0] a07,
    
    input [7:0] a08,
    input [7:0] a09,
    input [7:0] a10,
    input [7:0] a11,
    input [7:0] a12,
    input [7:0] a13,
    input [7:0] a14,
    input [7:0] a15,
    
    input [3:0] aneedpangstartinc,
    input [3:0] aneedpangendinc,
    
    input [7:0] b00,
    input [7:0] b01,
    input [7:0] b02,
    input [7:0] b03,
    input [7:0] b04,
    input [7:0] b05,
    input [7:0] b06,
    input [7:0] b07,
    
    input [7:0] b08,
    input [7:0] b09,
    input [7:0] b10,
    input [7:0] b11,
    input [7:0] b12,
    input [7:0] b13,
    input [7:0] b14,
    input [7:0] b15,
    
    input [3:0] bneedpangstartinc,
    input [3:0] bneedpangendinc,
    
    input pingpong,
    input aneedpang,
    input bneedpang,
    input [3:0] sft,
    
    output reg [7:0] subblko
    );
    

    
    wire [7:0] asubblko;
    wire atakeblk;
    
    sixteentoonemuxtakeblk_pipe4 aPath(
        .clk(clk), 
        .reset(reset),
        .sel(sft), 
        
        .subblki0(a00),           
        .subblki1(a01),  
        .subblki2(a02),  
        .subblki3(a03),  
        .subblki4(a04),  
        .subblki5(a05), 
        .subblki6(a06),  
        .subblki7(a07),  
        
        .subblki8(a08),        
        .subblki9(a09),     
        .subblki10(a10),    
        .subblki11(a11), 
        .subblki12(a12),    
        .subblki13(a13),    
        .subblki14(a14),    
        .subblki15(a15),
         
        .subblko(asubblko),
        .myturnpingpong(pingpong),
        
        .needpang(aneedpang),     
        .needpangstartinc(aneedpangstartinc), 
        .needpangendinc(aneedpangendinc),         
        .takeblko(atakeblk)
    );

    wire [7:0] bsubblko;
    wire btakeblk;
    
    sixteentoonemuxtakeblk_pipe4 bPath(
        .clk(clk), 
        .reset(reset),
        .sel(sft), 
        
        .subblki0(b00),           
        .subblki1(b01),  
        .subblki2(b02),
        .subblki3(b03),  
        .subblki4(b04),  
        .subblki5(b05), 
        .subblki6(b06),  
        .subblki7(b07),  
        
        .subblki8(b08),        
        .subblki9(b09),     
        .subblki10(b10),    
        .subblki11(b11), 
        .subblki12(b12),    
        .subblki13(b13),    
        .subblki14(b14),    
        .subblki15(b15),
         
        .subblko(bsubblko),
        
        .myturnpingpong(!pingpong), 
        
        .needpang(bneedpang),
        //.needpang(1'b0),
        .needpangstartinc(bneedpangstartinc), 
        .needpangendinc(bneedpangendinc),         
        .takeblko(btakeblk)
    );
    
    reg p4toP5_atakeblk;
    reg p4toP5_btakeblk;
    
    //determine taking the result from the mux
    //note it is now determining the result for an element in  ping/pong
    reg [7:0] p4toP5_asubblk;
    reg [7:0] p4toP5_bsubblk;
    
    always@(posedge clk or posedge reset) begin
        if (reset) begin            
            p4toP5_asubblk <= 0;
            p4toP5_bsubblk <= 0;
            
            p4toP5_atakeblk <= 0;
            p4toP5_btakeblk <= 0;
            
        end else begin
            
            if (atakeblk) begin
                p4toP5_asubblk <= asubblko;
            end 
            
            if (btakeblk) begin
                p4toP5_bsubblk <= bsubblko;
            end
            
            p4toP5_atakeblk <= atakeblk;
            p4toP5_btakeblk <= btakeblk;

        end
    end
    
    reg p0ToP1_pingpong;
    reg p1ToP2_pingpong;
    reg p2ToP3_pingpong;
    reg p3ToP4_pingpong;
    reg p4ToP5_pingpong;
    
    always@(posedge clk or posedge reset) begin
        if (reset) begin            
            subblko <= 0;
                                    
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
            
            if (p4ToP5_pingpong && p4toP5_atakeblk) begin
                subblko <= p4toP5_asubblk;
            end else if (!p4ToP5_pingpong && p4toP5_btakeblk) begin
                subblko <= p4toP5_bsubblk;
            end
        end
    end
    
    
endmodule
