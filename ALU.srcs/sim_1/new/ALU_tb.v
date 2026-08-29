`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2025 10:16:46
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb();
reg [3:0] A,B;
reg [2:0] ALU_sel;
wire [3:0] ALU_out;
wire Carryout;

ALU uut(.A(A), .B(B), .ALU_sel(ALU_sel), .ALU_out(ALU_out), .Carryout(Carryout));

initial begin 
$monitor("Time = %0t | A = %b (%d) | B = %b (%d) | ALU_sel = %b | ALU_out = %b (%d) | Carryout = %b", 
         $time, A, A, B, B, ALU_sel, ALU_out, ALU_out, Carryout);

A = 4'b0110; B = 4'b0010;

ALU_sel = 3'b000; #10;
ALU_sel = 3'b001; #10;
ALU_sel = 3'b010; #10;
ALU_sel = 3'b011; #10;
ALU_sel = 3'b100; #10;
ALU_sel = 3'b101; #10;
ALU_sel = 3'b110; #10;
ALU_sel = 3'b111; #10;


$stop;
end

endmodule