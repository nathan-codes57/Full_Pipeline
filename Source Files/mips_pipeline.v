`timescale 1ns / 1ps

module mips_pipeline (
input wire clk, rst,
);

wire [31:0] Instruction,
wire [4:0] WriteReg,
wire [31:0] WriteData,
wire RegWrite,
wire [31:0] NPC_in,
wire [1:0] WB_out,
wire [2:0] M_out,
wire [1:0] ALUOp,
wire ALUSrc,
wire RegDst,
wire [31:0] NPC_out,
wire [31:0] ReadData1_out,
wire [31:0] ReadData2_out,
wire [31:0] SignExt,
wire [4:0] Instr_2016_out,
wire [4:0] Instr_1511_out
wire ex_mem_pc_src,
wire [31:0] ex_mem_pc,
wire [31:0] if_id_instr,
if_id_npc,
wire [1:0] wb_ctl,  //11 inputs, based off of outputs of ID/EX latch (Lab 2-2)
wire [2:0] m_ctl,
wire regdst, alusrc, clk,
wire [1:0] aluop, 
wire [31:0] npcout, rdata1, rdata2, s_extendout,
wire [4:0] instrout_2016, instrout_1511,
wire [1:0] wb_ctlout, //9 total outputs from EX/MEM latch
wire branch, memread, memwrite,
wire [31:0] EX_MEM_NPC,
wire zero,
wire [31:0] alu_result, rdata2out,
wire [4:0] five_bit_muxout
wire MEM_WB_regwrite, MEM_WB_memtoreg
wire [31:0] read_data, mem_alu_result,
wire [4:0] mem_write_reg;
  
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

  
  MEMORY m4(
    .wb_ctlout(wb_ctlout),
    .branch(branch), .memread(memread), ,memwrite(memwrite),
    .zero(zero),
    .alu_result(alu_result), .rdata2out(rdata2out),
    .five_bit_muxout(five_bit_muxout),
    .ex_mem_pc_src(MEM_PCSrc), //from AND gate
    .MEM_WB_regwrite(MEM_WB_regwrite), .MEM_WB_memtoreg(MEM_WB_memtoreg),
    .read_data(read_data), .mem_alu_result(mem_alu_result),
    .mem_write_reg(mem_write_reg)
  );

endmodule
