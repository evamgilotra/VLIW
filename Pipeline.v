module D_ff_pipeline (input clk, input reset, input regWrite, input d, output reg q);
	always @ (negedge clk)
	begin
	if(reset==1'b1)
		q=0;
	else
		if(regWrite == 1'b1) begin q=d; end
	end
endmodule

module register16bit( input clk, input reset, input regWrite, input [15:0] writeData, output  [15:0] outR );
  
  // Short Hand Notation
	D_ff_pipeline d[15:0] (clk, reset, regWrite, writeData, outR);

endmodule

module register32bit( input clk, input reset, input regWrite, input [31:0] writeData, output  [31:0] outR );
  
  // Short Hand Notation
	D_ff_pipeline d1 (clk, reset, regWrite, writeData[0], outR[0]);
	D_ff_pipeline d2 (clk, reset, regWrite, writeData[1], outR[1]);
	D_ff_pipeline d3 (clk, reset, regWrite, writeData[2], outR[2]);
	D_ff_pipeline d4 (clk, reset, regWrite, writeData[3], outR[3]);
	D_ff_pipeline d5 (clk, reset, regWrite, writeData[4], outR[4]);
	D_ff_pipeline d6 (clk, reset, regWrite, writeData[5], outR[5]);
	D_ff_pipeline d7 (clk, reset, regWrite, writeData[6], outR[6]);
	D_ff_pipeline d8 (clk, reset, regWrite, writeData[7], outR[7]);
	D_ff_pipeline d9 (clk, reset, regWrite, writeData[8], outR[8]);
	D_ff_pipeline d10 (clk, reset, regWrite, writeData[9], outR[9]);
	D_ff_pipeline d11 (clk, reset, regWrite, writeData[10], outR[10]);
	D_ff_pipeline d12 (clk, reset, regWrite, writeData[11], outR[11]);
	D_ff_pipeline d13 (clk, reset, regWrite, writeData[12], outR[12]);
	D_ff_pipeline d14 (clk, reset, regWrite, writeData[13], outR[13]);
	D_ff_pipeline d15 (clk, reset, regWrite, writeData[14], outR[14]);
	D_ff_pipeline d16 (clk, reset, regWrite, writeData[15], outR[15]);
	D_ff_pipeline d17 (clk, reset, regWrite, writeData[16], outR[16]);
	D_ff_pipeline d18 (clk, reset, regWrite, writeData[17], outR[17]);
	D_ff_pipeline d19 (clk, reset, regWrite, writeData[18], outR[18]);
	D_ff_pipeline d20 (clk, reset, regWrite, writeData[19], outR[19]);
	D_ff_pipeline d21 (clk, reset, regWrite, writeData[20], outR[20]);
	D_ff_pipeline d22 (clk, reset, regWrite, writeData[21], outR[21]);
	D_ff_pipeline d23 (clk, reset, regWrite, writeData[22], outR[22]);
	D_ff_pipeline d24 (clk, reset, regWrite, writeData[23], outR[23]);
	D_ff_pipeline d25 (clk, reset, regWrite, writeData[24], outR[24]);
	D_ff_pipeline d26 (clk, reset, regWrite, writeData[25], outR[25]);
	D_ff_pipeline d27 (clk, reset, regWrite, writeData[26], outR[26]);
	D_ff_pipeline d28 (clk, reset, regWrite, writeData[27], outR[27]);
	D_ff_pipeline d29 (clk, reset, regWrite, writeData[28], outR[28]);
	D_ff_pipeline d30 (clk, reset, regWrite, writeData[29], outR[29]);
	D_ff_pipeline d31 (clk, reset, regWrite, writeData[30], outR[30]);
	D_ff_pipeline d32 (clk, reset, regWrite, writeData[31], outR[31]);
endmodule

//Register 1 bit
module register1bit( input clk, input reset, input regWrite, input writeData, output outR );
  
	D_ff_pipeline d0(clk, reset, regWrite, writeData, outR);
	
endmodule

//Register 2 bits
module register2bit( input clk, input reset, input regWrite, input [1:0]writeData, output [1:0] outR );
  
  // Short Hand Notation
	D_ff_pipeline d[1:0](clk, reset, regWrite, writeData, outR);	
	
endmodule

//Register 5 bits
module register5bit( input clk, input reset, input regWrite, input [4:0]writeData, output [4:0] outR );
  
  // Short Hand Notation
	D_ff_pipeline d[4:0](clk, reset, regWrite, writeData, outR);

endmodule

module IF_ID(input clk,input reset,input regWrite,input IF_Flush, input [31:0] pc, input [31:0] instr1, 
				input [15:0] instr2, output [31:0] p0_instr1, output [15:0] p0_instr2, output [31:0] p0_pc);
	register32bit reginstr1( clk, reset | IF_Flush, regWrite, instr1, p0_instr1 );
	register16bit reginstr2( clk, reset | IF_Flush, regWrite, instr2, p0_instr2 );
	register32bit regpc( clk, reset | IF_Flush, regWrite, pc, p0_pc );
endmodule

module signExt5to32( input [4:0] offset, output reg [31:0] signExtOffset);
						 
	always@(offset)
		signExtOffset = {{27{offset[4]}}, offset};
	 
endmodule

module signExt6to32( input [5:0] offset, output reg [31:0] signExtOffset);
						 
	always@(offset)
		signExtOffset = {{26{offset[5]}}, offset};
	 
endmodule

module signExt12to32( input [11:0] offset, output reg [31:0] signExtOffset);
						 
	always@(offset)
		signExtOffset = {{20{offset[11]}}, offset};
	 
endmodule



module ID_EX(input clk, input reset, input regWrite, input ID_Flush, input [31:0] pc, input [31:0] regRS1,
				input [31:0] regRS2, input [31:0] regRT1, input [31:0] regRT2, input [31:0] signExt5to32, 
				input [31:0] signExt6to32, input [31:0] signExt12to32,input [31:0] signExt12to32_BGE, input [4:0] RD2, input [4:0] RD1, input ctrl_regWrite1, 
				input ctrl_regWrite2, input ctrl_MemtoReg1, input [1:0] ctrl_MemtoReg2, input ctrl_branch, input ctrl_PCSrc, input [1:0] ctrl_aluSrcB, 
				input [1:0] ctrl_aluOp, input ctrl_memRd, input ctrl_memWr,
				
				output [31:0] p1_pc, output [31:0] p1_regRS1,
				output [31:0] p1_regRS2, output [31:0] p1_regRT1, output [31:0] p1_regRT2, output [31:0] p1_signExt5to32, 
				output [31:0] p1_signExt6to32, output [31:0] p1_signExt12to32, input [31:0] p1_signExt12to32_BGE,
				output [4:0] p1_RD2,output [4:0] p1_RD1, 
				output p1_ctrl_regWrite1, output p1_ctrl_regWrite2, output p1_ctrl_MemtoReg1, output [1:0] p1_ctrl_MemtoReg2, 
				output p1_ctrl_branch, output p1_ctrl_PCSrc, output [1:0] p1_ctrl_aluSrcB, 
				output [1:0] p1_ctrl_aluOp, output p1_ctrl_memRd, output p1_ctrl_memWr)	;
				
				//register output and signExt
				register32bit r1(clk,  reset|ID_Flush,  regWrite, pc, p1_pc );
				register32bit r2(clk,  reset|ID_Flush,  regWrite, regRS1, p1_regRS1 );
				register32bit r3(clk,  reset|ID_Flush,  regWrite, regRS2, p1_regRS2 );
				register32bit r4(clk,  reset|ID_Flush,  regWrite, regRT1, p1_regRT1 );
				register32bit r5(clk,  reset|ID_Flush,  regWrite, regRT2, p1_regRT2 );
				register32bit r6(clk,  reset|ID_Flush,  regWrite, signExt5to32, p1_signExt5to32 );
				register32bit r7(clk,  reset|ID_Flush,  regWrite, signExt6to32, p1_signExt6to32 );
				register32bit r8(clk,  reset|ID_Flush,  regWrite, signExt12to32, p1_signExt12to32 );
				register32bit r9(clk,  reset|ID_Flush,  regWrite, signExt12to32_BGE, p1_signExt12to32_BGE );
				
				register5bit r10(clk, reset|ID_Flush,  regWrite, RD1, p1_RD1);
				register5bit r11(clk, reset|ID_Flush,  regWrite, RD2, p1_RD2);
				
				register1bit r12(clk, reset|ID_Flush,  regWrite, ctrl_regWrite1, p1_ctrl_regWrite1);
				register1bit r13(clk, reset|ID_Flush,  regWrite, ctrl_regWrite2, p1_ctrl_regWrite2); 
				register1bit r14(clk, reset|ID_Flush,  regWrite, ctrl_MemtoReg1, p1_ctrl_MemtoReg1);
				register2bit r15(clk, reset|ID_Flush,  regWrite, ctrl_MemtoReg2, p1_ctrl_MemtoReg2);
				register1bit r16(clk, reset|ID_Flush, 	regWrite, ctrl_branch, p1_ctrl_branch);
				register1bit r17(clk, reset|ID_Flush, 	regWrite, ctrl_PCSrc, p1_ctrl_PCSrc);
				register2bit r18(clk, reset|ID_Flush, 	regWrite, ctrl_aluSrcB, p1_ctrl_aluSrcB);
				register2bit r19(clk, reset|ID_Flush,  regWrite, ctrl_aluOp, p1_ctrl_aluOp);
				register1bit r20(clk, reset|ID-Flush,  regWrite, ctrl_memRd, p1_ctrl_memRd);
				register1bit r21(clk, reset|ID_Flush,  regWrite, ctrl_memWr, p1_ctrl_memWr);
endmodule

module EX_MEM(input clk, input reset, input regWrite, input EX_Flush, input [31:0] p1_pc, input [4:0] p1_RD1, 
					input [4:0] p1_RD2, input p1_ctrl_regWrite1, input p1_ctrl_regWrite2 ,input p1_ctrl_MemtoReg1, 
					input [1:0] p1_ctrl_MemtoReg2 , input p1_ctrl_memRd, input p1_ctrl_memWr, input [31:0] aluOut,
					
					output [31:0] p2_pc, output [4:0] p2_RD1, output [4:0] p2_RD2, output p2_ctrl_regWrite1, 
					output p2_ctrl_regWrite2,
					output p2_ctrl_MemtoReg1, output [1:0] p2_ctrl_MemtoReg2, 
					output p2_ctrl_memRd, output p2_ctrl_memWr, output [31:0] p2_aluOut);
					
					register32bit r1(clk,  reset|EX_Flush,  regWrite, p1_pc, p2_pc);
					register5bit  r2(clk,  reset|EX_Flush, regWrite, p1_RD1,p2_RD1);
					register5bit  r3(clk,  reset|EX_Flush, regWrite, p1_RD2,p2_RD2);
					register1bit  r4(clk,  reset|EX_Flush, regWrite, p1_ctrl_regWrite1, p2_ctrl_regWrite1);
					register1bit  r5(clk,  reset|EX_Flush, regWrite, p1_ctrl_regWrite2, p2_ctrl_regWrite2);
					register1bit  r6(clk,  reset|EX_Flush, regWrite, p1_ctrl_MemtoReg1, p2_ctrl_MemtoReg1);
					register2bit  r7(clk,  reset|EX_Flush, regWrite, p1_ctrl_MemtoReg2, p2_ctrl_MemtoReg2);
					register1bit  r9(clk,  reset|EX_Flush, regWrite, p1_ctrl_memRd, p2_ctrl_memRd);
					register1bit r10(clk,  reset|EX_Flush, regWrite, p1_ctrl_memWr, p2_ctrl_memWr);
					register32bit r11(clk,  reset|EX_Flush,  regWrite, aluOut, p2_aluOut);
endmodule

module MEM_WB(input clk, input reset, input regWrite, input MEM_Flush, input [31:0] p2_pc, input[4:0] p2_RD1, input [4:0] p2_RD2, 
					input p2_ctrl_regWrite1, input p2_ctrl_regWrite2, input p2_ctrl_MemtoReg1, input [1:0] p2_ctrl_MemtoReg2, input [31:0] p2_aluOut,
					 
					
					output [31:0] p3_pc, output[4:0] p3_RD1, output [4:0] p3_RD2, 
					output p3_ctrl_regWrite1, output p3_ctrl_regWrite2, output p3_ctrl_MemtoReg1, output [1:0] p3_ctrl_MemtoReg2, output [31:0] p3_aluOut 
					);

					register32bit r1(clk,  reset|MEM_Flush, regWrite, p2_pc, p3_pc);
					register5bit  r2(clk,  reset|MEM_Flush, regWrite, p2_RD1,p3_RD1);
					register5bit  r3(clk,  reset|MEM_Flush, regWrite, p2_RD2,p3_RD2);
					register1bit  r4(clk,  reset|MEM_Flush, regWrite, p2_ctrl_regWrite1, p3_ctrl_regWrite1);
					register1bit  r5(clk,  reset|MEM_Flush, regWrite, p2_ctrl_regWrite2, p3_ctrl_regWrite2);
					register1bit  r6(clk,  reset|MEM_Flush, regWrite, p2_ctrl_MemtoReg1, p3_ctrl_MemtoReg1);
					register2bit  r7(clk,  reset|MEM_Flush, regWrite, p2_ctrl_MemtoReg2, p3_ctrl_MemtoReg2);
					register32bit r8(clk,  reset|EX_Flush,  regWrite, p2_aluOut, p3_aluOut);
endmodule