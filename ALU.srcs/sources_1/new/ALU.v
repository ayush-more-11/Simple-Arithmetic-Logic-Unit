`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2025 10:15:06
// Design Name: 
// Module Name: ALU
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


module ALU(
input[3:0] A,
input[3:0] B,
input[2:0] ALU_sel,
output reg [3:0] ALU_out,
output reg Carryout );

always@(*)begin

    case(ALU_sel)
        3'b000: {Carryout, ALU_out} = A + B;
        3'b001: {Carryout, ALU_out} = A - B;
        3'b010: begin ALU_out = A & B; Carryout = 0; end
        3'b011: begin ALU_out = A | B; Carryout = 0; end
        3'b100: begin ALU_out = A ^ B; Carryout = 0; end
        3'b101: begin ALU_out = ~A; Carryout = 0; end
        3'b110: begin ALU_out = A + 1; Carryout = 0; end
        3'b111: begin ALU_out = A - 1; Carryout = 0; end
        default: begin ALU_out = 4'b0000; Carryout = 0; end

     endcase

end

endmodule
