`timescale 1ns / 1ps

module full_pipeline (

input wire clk, rst,
input wire [31:0] Instruction,
input wire [4:0] WriteReg,
input wire [31:0] WriteData,
input wire RegWrite,
input wire [31:0] NPC_in,
output wire [1:0] WB_out,
output wire [2:0] M_out,
output wire [1:0] ALUOp,
output wire ALUSrc,
output wire RegDst,
output wire [31:0] NPC_out,
output wire [31:0] ReadData1_out,
output wire [31:0] ReadData2_out,
output wire [31:0] SignExt,
output wire [4:0] Instr_2016_out,
output wire [4:0] Instr_1511_out
input wire ex_mem_pc_src,
input wire [31:0] ex_mem_pc,
output wire [31:0] if_id_instr,
if_id_npc
);

fetch f1(
.clk(clk), .rst(rst),
.ex_mem_pc_src(ex_mem_pc_src),
.if_id_instr(if_id_instr),
.if_id_npc(if_if_npc)
);

Decode d2(
.clk(clk), .rst(rst),
.Instruction(Instruction),
.WriteReg(WriteReg),
.WriteData(WriteData),
.RegWrite(RegWrite),
.NPC_in(NPC_in),
.WB_out(WB_out),
.M_out(M_out),
.ALUOp(ALUOp),
.ALUSrc(ALUSrc),
.RegDst(RegDst),
.NPC_out(NPC_out),
.ReadData2_out(ReadData1_out),
.ReadData2_out(ReadData2_out),
.SignExt(SignExt),
.Instr_2016_out(Instr_2016_out),
.Instr_1511_out(Instr_1511_out)
);


endmodule
