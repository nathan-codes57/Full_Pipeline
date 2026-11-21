`timescale 1ns / 1ps

module mips_pipeline (

input wire clk, rst

);

wire [31:0] Instruction;
wire [4:0] WriteReg;
wire [31:0] WriteData;
wire RegWrite;
wire [31:0] NPC_in;
wire [1:0] WB_out;
wire [2:0] M_out;
wire [1:0] ALUOp;
wire ALUSrc;
wire RegDst;
wire [31:0] NPC_out;
wire [31:0] ReadData1_out;
wire [31:0] ReadData2_out;
wire [31:0] SignExt;
wire [4:0] Instr_2016_out;
wire [4:0] Instr_1511_out;
wire ex_mem_pc_src;
wire [31:0] ex_mem_pc;
wire [31:0] if_id_instr;
wire [31:0] if_id_npc;
wire [1:0] wb_ctlout; //9 total outputs from EX/MEM latch
wire branch, memread, memwrite;
wire zero;
wire [31:0] alu_result, rdata2out;
wire [4:0] five_bit_muxou;
wire MEM_WB_memtoreg;
wire [31:0] read_data;
wire [31:0] mem_alu_result;
wire [4:0] five_bit_muxout;

fetch f1(
.clk(clk), .rst(rst),
.ex_mem_pc_src(ex_mem_pc_src),
.ex_mem_pc(ex_mem_pc),
.if_id_instr(Instruction),
.if_id_npc(if_id_npc)
);

Decode d2(
.clk(clk), .rst(rst),
.Instruction(Instruction),
.WriteReg(),//WriteReg
.WriteData(),//WriteData
.RegWrite(),//RegWrite
.NPC_in(if_id_npc),
.WB_out(WB_out),
.M_out(M_out),
.ALUOp(ALUOp),
.ALUSrc(ALUSrc),
.RegDst(RegDst),
.NPC_out(NPC_out),
.ReadData1_out(ReadData1_out),
.ReadData2_out(ReadData2_out),
.SignExt(SignExt),
.Instr_2016_out(Instr_2016_out),
.Instr_1511_out(Instr_1511_out)
);

EXECUTE ex3 (

.wb_ctl(WB_out),  //11 inputs, based off of outputs of ID/EX latch (Lab 2-2)
.m_ctl(M_out),
.regdst(RegDst),
.alusrc(ALUSrc),
.clk(clk),
.aluop(ALUOp), 
.npcout(NPC_out), 
.rdata1(ReadData1_out),
.rdata2(ReadData2_out),
.s_extendout(SignExt),
.instrout_2016(Instr_2016_out),
.instrout_1511(Instr_1511_out),
.wb_ctlout(wb_ctlout), //9 total outputs from EX/MEM latch
.branch(branch),
.memread(memread),
.memwrite(memwrite),
.EX_MEM_NPC(ex_mem_pc),
.zero(zero),
.alu_result(alu_result),
.rdata2out(rdata2out),
.five_bit_muxout(five_bit_muxout)

);

MEMORY m4 (

.clk(clk),
.wb_ctlout(wb_ctlout),
.branch(branch),
.memread(memread),
.memwrite(memwrite),
.zero(ZERO),
.alu_result(alu_result),
.rdata2out(rdata2out),
.five_bit_muxout(five_bit_muxout),
.MEM_PCSrc(ex_mem_pc_src), //from AND gate
.MEM_WB_regwrite(RegWrite),//RegWrite
.MEM_WB_memtoreg(MEM_WB_memtoreg),
.read_data(read_data),
.mem_alu_result(mem_alu_result),
.mem_write_reg(WriteReg)//WriteReg

);

WB wb5 (

.mem_alu_result(mem_alu_result),
.readdata(read_data),
.memtoreg(MEM_WB_memtoreg),
.writedata(WriteData)//WriteData

);


endmodule