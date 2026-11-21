`timescale 1ns / 1ps

module WB_tb;

    reg [31:0] mem_alu_result;
    reg [31:0] readdata;
    reg memtoreg;
    wire [31:0] writedata;

    WB uut (
        .mem_alu_result(mem_alu_result),
        .readdata(readdata),
        .memtoreg(memtoreg),
        .writedata(writedata)
    );
        
    initial begin
    readdata = 32'b11111111111000011111111;
    memtoreg = 1;
    mem_alu_result = 32'b1110101010101010;
        #5
        
        #10
        memtoreg = 0;
        #10
        memtoreg = 1;
        #10
        memtoreg = 0;
        #10
        memtoreg = 1;
        #10
        memtoreg = 0;
        #10


        #10 $finish;
    end
    
    endmodule