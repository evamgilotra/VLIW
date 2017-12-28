module datapath(input clk, input reset, output [31:0] result);

wire [31:0] pcOut, adderOut,IR,p0_adderOut,p0_IR,aluOut,signExt5to32,signExt12to32,pcIn;
wire [15:0] IR2,p0_IR2;
wire regWrite1,regWrite2,MemToReg1,branch,PCSrc,memRd,memWr,compOut;
wire [1:0] MemToReg2,aluSrcB,aluOp;

comparator32bits branch_comp(regRS1,regRT1,compOut);

mux2to1_32bits pcMux(adderOut,branch_address,compOut && branch,pcIn);

register32bit_PC PC(clk, reset ,1'b1, pcIn,pcOut);

pc_adder PC_adder(32'd2, pcOut, adderOut);

IM im(clk,reset,pcOut[4:0],IR);

/*module IF_ID(input clk,input reset,input regWrite,input IF_Flush, input [31:0] pc, input [31:0] instr1, 
				input [15:0] instr2, output [31:0] p0_instr1, output [15:0] p0_instr2, output [31:0] p0_pc);*/
IF_ID if_id(clk,reset,1'b1,1'b0,adderOut,IR,IR2,p0_IR,p0_IR2,p0_adderOut);

CtrlCkt CC(clk, p0_IR,p0_IR2,regWrite1,regWrite2,MemToReg1,MemToReg2,branch,PCSrc,aluSrcB,aluOp,memRd,memWr);

wire [31:0] branch_address;

adder branch_cal(p0_adderOut,{ {14{p0_IR[15]}}, p0_IR[15:0], 2'b0},branch_address);

signExt5to32 sext5to32(p0_IR[24:20],signExt5to32);
signExt12to32 sext12to32(p0_IR[31:20],signExt12to32);	
/*module regfile(input clk,
                    input reset,
                    input regWrite1,
                    input regWrite2,
                    //input mode,
                    input [4:0]rs1,
                    input [4:0]rt1,
                    input [4:0]rs2,
                    input [4:0]rt2,
                    input [4:0]rd1,
                    input [4:0]rd2,
                    input [31:0]writeData1,
                    input [31:0]writeData2,
                    output [31:0]regRs1,
                    output [31:0]regRt1,
                    output [31:0]regRs2,
                    output [31:0]regRt2
                    );*/
wire [31:0] muxOut_MemtoReg1,muxOut_MemtoReg2,regRS1,regRT1,regRS2,regRT2;
wire p3_ctrl_regWrite1,p3_ctrl_regWrite2;
wire [4:0] p3_RD1,p3_RD2;
						  
regfile regFile(clk,reset,p3_ctrl_regWrite1,p3_ctrl_regWrite2,p0_IR[19:15],p0_IR[24:20],p0_IR2[11:7],p0_IR2[6:2],p3_RD1,
					p3_RD2,p3_aluOut,muxOut_MemtoReg2,regRS1,regRT1,regRS2,regRT2);
					
				/*input clk, input reset, input regWrite, input ID_Flush, input [31:0] pc, input [31:0] regRS1,
				input [31:0] regRS2, input [31:0] regRT1, input [31:0] regRT2, input [31:0] signExt5to32, 
				input [31:0] signExt6to32, input [31:0] signExt12to32,input [31:0] signExt12to32_BGE, input [4:0] RD2, 
				input [4:0] RD1, 
				input ctrl_regWrite1, 
				input ctrl_regWrite2, input ctrl_MemtoReg1, input [1:0] ctrl_MemtoReg2, input ctrl_branch, input ctrl_PCSrc, 
				input [1:0] ctrl_aluSrcB, 
				input [1:0] ctrl_aluOp, input ctrl_memRd, input ctrl_memWr,
				
				output [31:0] p1_pc, output [31:0] p1_regRS1,
				output [31:0] p1_regRS2, output [31:0] p1_regRT1, output [31:0] p1_regRT2, output [31:0] p1_signExt5to32, 
				output [31:0] p1_signExt6to32, output [31:0] p1_signExt12to32, input [31:0] p1_signExt12to32_BGE,
				output [4:0] p1_RD2,output [4:0] p1_RD1, 
				output p1_ctrl_regWrite1, output p1_ctrl_regWrite2, output p1_ctrl_MemtoReg1, output [1:0] p1_ctrl_MemtoReg2, 
				output p1_ctrl_branch, output p1_ctrl_PCSrc, output [1:0] p1_ctrl_aluSrcB, 
				output [1:0] p1_ctrl_aluOp, output p1_ctrl_memRd, output p1_ctrl_memWr*/
				
wire [31:0] p1_pc,p1_regRS1,p1_regRS2,p1_regRT1,p1_regRT2,p1_signExt5to32, 
				p1_signExt6to32,p1_signExt12to32, p1_signExt12to32_BGE,aluIn;
wire [4:0] p1_RD1,p1_RD2;
wire p1_ctrl_regWrite1, 
				p1_ctrl_regWrite2, p1_ctrl_MemtoReg1, zFlag ,
				p1_ctrl_branch, p1_ctrl_PCSrc,p1_ctrl_memRd, p1_ctrl_memWr;
wire [1:0] p1_ctrl_aluSrcB, p1_ctrl_MemtoReg2,
				p1_ctrl_aluOp;
					
ID_EX id_ex(clk,reset,1'b1,1'b0,p0_adderOut,regRS1,regRS2,regRT1,regRT2,signExt5to32,32'd0,signExt12to32,32'b0,p0_IR2[11:7],
				p0_IR[11:7],regWrite1,regWrite2,MemtoReg1,
				MemToReg2,branch,PCSrc,aluSrcB,aluOp,memRd,memWr,
				
				p1_pc,p1_regRS1,p1_regRS2,p1_regRT1,p1_regRT2,p1_signExt5to32, 
				p1_signExt6to32,p1_signExt12to32, p1_signExt12to32_BGE,p1_RD2,p1_RD1, p1_ctrl_regWrite1, 
				p1_ctrl_regWrite2, p1_ctrl_MemtoReg1, p1_ctrl_MemtoReg2, 
				p1_ctrl_branch, p1_ctrl_PCSrc, p1_ctrl_aluSrcB, 
				p1_ctrl_aluOp, p1_ctrl_memRd, p1_ctrl_memWr);
				
mux4to1_32bits mux1(p1_regRT1,p1_signExt5to32,p1_signExt12to32,p1_signExt12to32_BGE,p1_ctrl_aluSrcB,aluIn);

ALU alu(p1_ctrl_aluOp,p1_regRS1,aluIn,zFlag,aluOut); 

/*module EX_MEM(input clk, input reset, input regWrite, input EX_Flush, input [31:0] p1_pc, input [4:0] p1_RD1, 
					input [4:0] p1_RD2, input p1_ctrl_regWrite1, input p1_ctrl_regWrite2 ,input p1_ctrl_MemtoReg1, 
					input [1:0] p1_ctrl_MemtoReg2 , input p1_ctrl_memRd, input p1_ctrl_memWr,
					
					output [31:0] p2_pc, output [4:0] p2_RD1, output [4:0] p2_RD2, output p2_ctrl_regWrite1, 
					output p2_ctrl_regWrite2,
					output p2_ctrl_MemtoReg1, output [1:0] p2_ctrl_MemtoReg2, 
					output p2_ctrl_memRd, output p2_ctrl_memWr);*/
					
wire [31:0] p2_pc,p3_pc,p2_aluOut,p3_aluOut;
wire [4:0] p2_RD1,p2_RD2;
wire p2_ctrl_regWrite1, p2_ctrl_regWrite2, p2_ctrl_MemtoReg1,p2_ctrl_memRd, p2_ctrl_memWr;
wire [1:0] 	p2_ctrl_MemtoReg2;				
EX_MEM ex_mem(clk,reset,1'b1,1'b0,p1_pc,p1_RD1,p1_RD2,p1_ctrl_regWrite1,p1_ctrl_regWrite2,
					p1_ctrl_MemtoReg1, p1_ctrl_MemtoReg2,p1_ctrl_memRd, p1_ctrl_memWr, aluOut,
					
					p2_pc,p2_RD1,p2_RD2,p2_ctrl_regWrite1, p2_ctrl_regWrite2, p2_ctrl_MemtoReg1, p2_ctrl_MemtoReg2, 
					p2_ctrl_memRd, p2_ctrl_memWr,p2_aluOut);	
					
/*module MEM_WB(input clk, input reset, input regWrite, input MEM_Flush, input [31:0] p2_pc, input[4:0] p2_RD1, input [4:0] p2_RD2, 
					input p2_ctrl_regWrite1, input p2_ctrl_regWrite2, input p2_ctrl_MemtoReg1, input p2_ctrl_MemtoReg2, 
					
					
					output [31:0] p3_pc, output[4:0] p3_RD1, output [4:0] p3_RD2, 
					output p3_ctrl_regWrite1, output p3_ctrl_regWrite2, output p3_ctrl_MemtoReg1, output p3_ctrl_MemtoReg2);*/
wire p3_ctrl_MemtoReg1;
wire [1:0]	p3_ctrl_MemtoReg2;
				
MEM_WB mem_wb(clk,reset,1'b1,1'b0,p2_pc,p2_RD1,p2_RD2,p2_ctrl_regWrite1, p2_ctrl_regWrite2, p2_ctrl_MemtoReg1, 
					p2_ctrl_MemtoReg2,p2_aluOut,
					
					p3_pc, p3_RD1, p3_RD2, 
					p3_ctrl_regWrite1, p3_ctrl_regWrite2, p3_ctrl_MemtoReg1, p3_ctrl_MemtoReg2,p3_aluOut);
	
assign result = p3_aluOut;	
endmodule 