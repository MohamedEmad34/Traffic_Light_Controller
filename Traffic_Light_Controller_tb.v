`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/23/2023 08:29:58 AM
// Design Name: 
// Module Name: Traffic_light_controller_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Traffic_light_controller_tb(

    );
    reg clk, reset_n, Sa,Sb;
    wire Ra,Ga,Ya,Rb,Gb,Yb;
    Traffic_light_controller TLC(.clk(clk),.reset_n(reset_n),.Sa(Sa),.Sb(Sb),.Ra(Ra),.Ga(Ga),
    .Ya(Ya),.Rb(Rb),.Gb(Gb),.Yb(Yb));
    wire [1:0] light_A, light_B;
    localparam R=0;
    localparam Y=1;
    localparam G=2;
    assign light_A=Ra?R:Ya?Y:Ga?G:light_A;
    assign light_B=Rb?R:Yb?Y:Gb?G:light_B;
   localparam T=10;
   always 
   begin
   clk=1'b0;
   #(T/2);
   clk=1'b1;
   #(T/2);
   end
   initial 
   begin
   reset_n=1'b0;
   #2
   reset_n=1'b1;
   // no car at any street
   Sa=0;
   Sb=0;
   
   end
   always 
   begin
   #50
   Sa=0;
   Sb=1;
   #50
   Sb=1;
   Sa=1;
   #50
   Sa=1;
   Sb=0;
   #100 
   $stop;
   end
   
    
    
    
endmodule
