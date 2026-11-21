`timescale 1ns / 1ps

module mips_pipeline_tb;
    reg clk;
    reg rst;

    mips_pipeline uut (
        .clk(clk),
        .rst(rst)
    );
    
   wire [31:0] instruction;
   wire [31:0] instruction_addr;
   wire [31:0] Reg1data;
   wire [31:0] Reg2data;
   wire [4:0] Reg1addr;
   wire [4:0] Reg2addr;
   wire [31:0] alu_result;
   wire [31:0] signextend;
   wire [31:0] WriteData;
   wire [4:0] WriteReg;
   wire RegWrite;
   wire [31:0] ReadData;
   wire MemtoReg;
   wire [31:0] ALUin;
   
   assign instruction = uut.f1.instr_data;
   assign instruction_addr = uut.f1.pc_out;
   assign Reg1addr = uut.d2.ReadReg1;
   assign Reg1data = uut.ReadData1_out;
   assign Reg2addr = uut.d2.ReadReg2;
   assign Reg2data = uut.d2.ReadData2;
   assign ALUin = uut.ex3.b;
   assign alu_result = uut.ex3.aluout;
   assign signextend = uut.SignExt;
   assign RegWrite = uut.RegWrite;
   assign WriteData = uut.WriteData;
   assign WriteReg = uut.WriteReg;
   assign MemtoReg = uut.MEM_WB_memtoreg;
   assign ReadData = uut.read_data;
   

    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    initial begin
        rst = 1;
        #10 rst = 0;


        #100 $finish;
    end
    
    
endmodule