`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/23/2023 07:32:34 AM
// Design Name: 
// Module Name: Traffic_light_controller
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


module Traffic_light_controller(
input clk, reset_n,
input Sa,Sb,
output  Ra, Ga, Ya,
output  Rb, Gb, Yb
    );
   reg [3:0]state, next_state;
  parameter s0=0,s1=1,s2=2,s3=3,
  s4=4,s5=5,s6=6,s7=7,s8=8,s9=9,
  s10=10,s11=11,s12=12;
    always @(posedge clk,negedge reset_n)
    begin
    if(~reset_n)
    state<=s0;
    else
    state<=next_state;
    end
    always @(*)
    begin
    case(state)
    s0,s1,s2,s3,s4,s6,s7,s8,s9,s10:next_state=state+1;
    s5:next_state=Sb?s6:state;    
    s11:next_state=(!Sa&&Sb)?state:s12;    
    s12:next_state=s0;
    default:next_state=s0;
    endcase
    end
    assign Ga=(state==s0||state==s1||state==s2||state==s3||state==s4||state==s5);
    assign Rb=(state==s0||state==s1||state==s2||state==s3||state==s4||state==s5||state==s6);
    assign Ya=(state==s6);
    assign Ra=(state==s7||state==s8||state==s9||state==s10||state==s11||state==s12);
    assign Gb=(state==s7||state==s8||state==s9||state==s10||state==s11);
    assign Yb=(state==s12);   
    
       
        
        
    
    
endmodule
