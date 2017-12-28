module D_ff(input clk, input reset, input regWrite, input d, output reg q);
	always@(negedge clk)
		begin
			if(reset)
				q=0;
			else
				if(regWrite == 1) begin q=d; end
		end
endmodule

module register32bit_PC(input clk, input reset, input regWrite, input [31:0] writeData, output  [31:0] outR);
	D_ff d0(clk,reset,regWrite,writeData[0],outR[0]);
	D_ff d1(clk,reset,regWrite,writeData[1],outR[1]);
	D_ff d2(clk,reset,regWrite,writeData[2],outR[2]);
	D_ff d3(clk,reset,regWrite,writeData[3],outR[3]);
	D_ff d4(clk,reset,regWrite,writeData[4],outR[4]);
	D_ff d5(clk,reset,regWrite,writeData[5],outR[5]);
	D_ff d6(clk,reset,regWrite,writeData[6],outR[6]);
	D_ff d7(clk,reset,regWrite,writeData[7],outR[7]);
	D_ff d8(clk,reset,regWrite,writeData[8],outR[8]);
	D_ff d9(clk,reset,regWrite,writeData[9],outR[9]);
	D_ff d10(clk,reset,regWrite,writeData[10],outR[10]);
	D_ff d11(clk,reset,regWrite,writeData[11],outR[11]);
	D_ff d12(clk,reset,regWrite,writeData[12],outR[12]);
	D_ff d13(clk,reset,regWrite,writeData[13],outR[13]);
	D_ff d14(clk,reset,regWrite,writeData[14],outR[14]);
	D_ff d15(clk,reset,regWrite,writeData[15],outR[15]);
	D_ff d16(clk,reset,regWrite,writeData[16],outR[16]);
	D_ff d17(clk,reset,regWrite,writeData[17],outR[17]);
	D_ff d18(clk,reset,regWrite,writeData[18],outR[18]);
	D_ff d19(clk,reset,regWrite,writeData[19],outR[19]);
	D_ff d20(clk,reset,regWrite,writeData[20],outR[20]);
	D_ff d21(clk,reset,regWrite,writeData[21],outR[21]);
	D_ff d22(clk,reset,regWrite,writeData[22],outR[22]);
	D_ff d23(clk,reset,regWrite,writeData[23],outR[23]);
	D_ff d24(clk,reset,regWrite,writeData[24],outR[24]);
	D_ff d25(clk,reset,regWrite,writeData[25],outR[25]);
	D_ff d26(clk,reset,regWrite,writeData[26],outR[26]);
	D_ff d27(clk,reset,regWrite,writeData[27],outR[27]);
	D_ff d28(clk,reset,regWrite,writeData[28],outR[28]);
	D_ff d29(clk,reset,regWrite,writeData[29],outR[29]);
	D_ff d30(clk,reset,regWrite,writeData[30],outR[30]);
	D_ff d31(clk,reset,regWrite,writeData[31],outR[31]);
endmodule

module mux2to1_5bits(input [4:0] in0, input [4:0] in1, input sel, output reg [4:0] muxOut);
    always@(in0, in1, sel)
		begin
			case(sel)
				1'b0: muxOut=in0;
				1'b1: muxOut=in1;
			endcase
		end
endmodule

module pc_adder(input [31:0] in1, input [31:0] in2, output reg [31:0] adder_out);
	always@(in1 or in2)
	begin
		adder_out = in1 + in2;
	end
endmodule