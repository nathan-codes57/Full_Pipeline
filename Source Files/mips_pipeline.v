`timescale 1ns / 1ps

module mips_pipeline (
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
if_id_npc,
  input wire [1:0] wb_ctl,  //11 inputs, based off of outputs of ID/EX latch (Lab 2-2)
input wire [2:0] m_ctl,
input wire regdst, alusrc, clk,
input wire [1:0] aluop, 
input wire [31:0] npcout, rdata1, rdata2, s_extendout,
input wire [4:0] instrout_2016, instrout_1511,
output wire [1:0] wb_ctlout, //9 total outputs from EX/MEM latch
output wire branch, memread, memwrite,
output wire [31:0] EX_MEM_NPC,
output wire zero,
output wire [31:0] alu_result, rdata2out,
output wire [4:0] five_bit_muxout
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

    EXECUTE e3(
    .wb_ctl(wb_ctl),  //11 inputs, based off of outputs of ID/EX latch (Lab 2-2)
    .m_ctl(m_ctl),
    .regdst(regdst), .alusrc(alusrc),
    .aluop(aluop), 
    .npcout(npcout), .rdata1(rdata1), .rdata2(rdata2), .s_extendout(s_extendout),
    .instrout_2016(instrout_2016), .instrout_1511(instrout_1511),
    .wb_ctlout(wb_ctlout), //9 total outputs from EX/MEM latch
    .branch(branch), ,memread(memread), .memwrite(memwrite),
    .EX_MEM_NPC(EX_MEM_NPC),
    .zero(zero),
    .alu_result(alu_result), .rdata2out(rdata2out),
    .five_bit_muxout(five_bit_muxout)
  );

endmodule
