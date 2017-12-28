module D_ff_2 (input clk, input reset, input regWrite1, input regWrite2, input decOut1b1, input decOut1b2, input d1, input d2, output reg	 q);
	always @ (posedge clk)
	begin
	if(reset==1'b1)
		q=1'b0;
	else if(regWrite1 == 1'b1 && decOut1b1==1'b1) 
		q=d1;
	else if(regWrite2 == 1'b1 && decOut1b2==1'b1) 
		q=d2;
	end
endmodule

module register32bit_2( input clk, input reset, input regWrite1, input regWrite2, input decOut1b1, input decOut1b2, input [31:0] writeData1, input [31:0] writeData2, output [31:0] outR);
	D_ff_2 d0(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[0], writeData2[0], outR[0]);
	D_ff_2 d1(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[1], writeData2[1], outR[1]);
	D_ff_2 d2(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[2], writeData2[2], outR[2]);
	D_ff_2 d3(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[3], writeData2[3], outR[3]);
	D_ff_2 d4(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[4], writeData2[4], outR[4]);
	D_ff_2 d5(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[5], writeData2[5], outR[5]);
	D_ff_2 d6(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[6], writeData2[6], outR[6]);
	D_ff_2 d7(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[7], writeData2[7], outR[7]);
	D_ff_2 d8(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[8], writeData2[8], outR[8]);
	D_ff_2 d9(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[9], writeData2[9], outR[9]);
	D_ff_2 d10(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[10], writeData2[10], outR[10]);
	D_ff_2 d11(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[11], writeData2[11], outR[11]);
	D_ff_2 d12(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[12], writeData2[12], outR[12]);
	D_ff_2 d13(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[13], writeData2[13], outR[13]);
	D_ff_2 d14(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[14], writeData2[14], outR[14]);
	D_ff_2 d15(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[15], writeData2[15], outR[15]);
	D_ff_2 d16(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[16], writeData2[16], outR[16]);
	D_ff_2 d17(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[17], writeData2[17], outR[17]);
	D_ff_2 d18(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[18], writeData2[18], outR[18]);
	D_ff_2 d19(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[19], writeData2[19], outR[19]);
	D_ff_2 d20(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[20], writeData2[20], outR[20]);
	D_ff_2 d21(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[21], writeData2[21], outR[21]);
	D_ff_2 d22(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[22], writeData2[22], outR[22]);
	D_ff_2 d23(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[23], writeData2[23], outR[23]);
	D_ff_2 d24(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[24], writeData2[24], outR[24]);
	D_ff_2 d25(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[25], writeData2[25], outR[25]);
	D_ff_2 d26(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[26], writeData2[26], outR[26]);
	D_ff_2 d27(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[27], writeData2[27], outR[27]);
	D_ff_2 d28(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[28], writeData2[28], outR[28]);
	D_ff_2 d29(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[29], writeData2[29], outR[29]);
	D_ff_2 d30(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[30], writeData2[30], outR[30]);
	D_ff_2 d31(clk, reset, regWrite1, regWrite2, decOut1b1, decOut1b2,  writeData1[31], writeData2[31], outR[31]);
endmodule

module registerSet( input clk, input reset, input regWrite1, input regWrite2, input [31:0] decOut1, input [31:0] decOut2, input [31:0] writeData1, input [31:0] writeData2, output [31:0] outR0, output [31:0] outR1, output [31:0] outR2, output [31:0] outR3, output [31:0] outR4, output [31:0] outR5, output [31:0] outR6, output [31:0] outR7,
						output [31:0] outR8,
						output [31:0] outR9,
						output [31:0] outR10,
						output [31:0] outR11,
						output [31:0] outR12,
						output [31:0] outR13,
						output [31:0] outR14,
						output [31:0] outR15,
						output [31:0] outR16,
						output [31:0] outR17,
						output [31:0] outR18,
						output [31:0] outR19,
						output [31:0] outR20,
						output [31:0] outR21,
						output [31:0] outR22,
						output [31:0] outR23,
						output [31:0] outR24,
						output [31:0] outR25,
						output [31:0] outR26,
						output [31:0] outR27,
						output [31:0] outR28,
						output [31:0] outR29,
						output [31:0] outR30,
						output [31:0] outR31);
	register32bit_2 r0 (clk, reset, 1'b0, 1'b0, decOut1[0], decOut2[0],  writeData1 ,writeData2, outR0);
	register32bit_2 r1 (clk, reset, 1'b1, regWrite2, 1'b1, decOut2[1], 32'd4 , writeData2, outR1 );
	register32bit_2 r2 (clk, reset, 1'b1, regWrite2, 1'b1, decOut2[2], 32'd6 , writeData2 , outR2 );
	register32bit_2 r3 (clk, reset, regWrite1, regWrite2, decOut1[3], decOut2[3], writeData1 , writeData2 , outR3 );
	register32bit_2 r4 (clk, reset, regWrite1, regWrite2, decOut1[4], decOut2[4], writeData1 , writeData2 , outR4 );
	register32bit_2 r5 (clk, reset, regWrite1, regWrite2, decOut1[5], decOut2[5], writeData1 , writeData2 , outR5 );
	register32bit_2 r6 (clk, reset, regWrite1, regWrite2, decOut1[6], decOut2[6], writeData1 , writeData2 , outR6 );
	register32bit_2 r7 (clk, reset, regWrite1, regWrite2, decOut1[7], decOut2[7], writeData1 , writeData2 , outR7 );
	register32bit_2 r8 (clk, reset, regWrite1, regWrite2, decOut1[8], decOut2[8], writeData1 , writeData2 , outR8 );
	register32bit_2 r9 (clk, reset, regWrite1, regWrite2, decOut1[9], decOut2[9], writeData1 , writeData2 , outR9 );
	register32bit_2 r10 (clk, reset, regWrite1, regWrite2, decOut1[10], decOut2[10], writeData1 , writeData2 , outR10 );
	register32bit_2 r11 (clk, reset, regWrite1, regWrite2, decOut1[11], decOut2[11], writeData1 , writeData2 , outR11 );
	register32bit_2 r12 (clk, reset, regWrite1, regWrite2, decOut1[12], decOut2[12], writeData1 , writeData2 , outR12 );
	register32bit_2 r13 (clk, reset, regWrite1, regWrite2, decOut1[13], decOut2[13], writeData1 , writeData2 , outR13 );
	register32bit_2 r14 (clk, reset, regWrite1, regWrite2, decOut1[14], decOut2[14], writeData1 , writeData2 , outR14 );
	register32bit_2 r15 (clk, reset, regWrite1, regWrite2, decOut1[15], decOut2[15], writeData1 , writeData2 , outR15 );
	register32bit_2 r16 (clk, reset, regWrite1, regWrite2, decOut1[16], decOut2[16], writeData1 , writeData2 , outR16 );
	register32bit_2 r17 (clk, reset, regWrite1, regWrite2, decOut1[17], decOut2[17], writeData1 , writeData2 , outR17 );
	register32bit_2 r18 (clk, reset, regWrite1, regWrite2, decOut1[18], decOut2[18], writeData1 , writeData2 , outR18 );
	register32bit_2 r19 (clk, reset, regWrite1, regWrite2, decOut1[19], decOut2[19], writeData1 , writeData2 , outR19 );
	register32bit_2 r20 (clk, reset, regWrite1, regWrite2, decOut1[20], decOut2[20], writeData1 , writeData2 , outR20 );
	register32bit_2 r21 (clk, reset, regWrite1, regWrite2, decOut1[21], decOut2[21], writeData1 , writeData2 , outR21 );
	register32bit_2 r22 (clk, reset, regWrite1, regWrite2, decOut1[22], decOut2[22], writeData1 , writeData2 , outR22 );
	register32bit_2 r23 (clk, reset, regWrite1, regWrite2, decOut1[23], decOut2[23], writeData1 , writeData2 , outR23 );
	register32bit_2 r24 (clk, reset, regWrite1, regWrite2, decOut1[24], decOut2[24], writeData1 , writeData2 , outR24 );
	register32bit_2 r25 (clk, reset, regWrite1, regWrite2, decOut1[25], decOut2[25], writeData1 , writeData2 , outR25 );
	register32bit_2 r26 (clk, reset, regWrite1, regWrite2, decOut1[26], decOut2[26], writeData1 , writeData2 , outR26 );
	register32bit_2 r27 (clk, reset, regWrite1, regWrite2, decOut1[27], decOut2[27], writeData1 , writeData2 , outR27 );
	register32bit_2 r28 (clk, reset, regWrite1, regWrite2, decOut1[28], decOut2[28], writeData1 , writeData2 , outR28 );
	register32bit_2 r29 (clk, reset, regWrite1, regWrite2, decOut1[29], decOut2[29], writeData1 , writeData2 , outR29 );
	register32bit_2 r30 (clk, reset, regWrite1, regWrite2, decOut1[30], decOut2[30], writeData1 , writeData2 , outR30 );
	register32bit_2 r31 (clk, reset, regWrite1, regWrite2, decOut1[31], decOut2[31], writeData1 , writeData2 , outR31 );
endmodule


module decoder5to32( input [4:0] destReg, output reg [31:0] decOut);
	always@(destReg)
	case(destReg)
			5'd0: decOut={16'd0,16'b0000000000000001};
			5'd1: decOut={16'd0,16'b0000000000000010};
			5'd2: decOut={16'd0,16'b0000000000000100};
			5'd3: decOut={16'd0,16'b0000000000001000};
			5'd4: decOut={16'd0,16'b0000000000010000};
			5'd5: decOut={16'd0,16'b0000000000100000};
			5'd6: decOut={16'd0,16'b0000000001000000};
			5'd7: decOut={16'd0,16'b0000000010000000};
			5'd8: decOut={16'd0,16'b0000000100000000};
			5'd9: decOut={16'd0,16'b0000001000000000};
			5'd10:decOut={16'd0,16'b0000010000000000};
			5'd11:decOut={16'd0,16'b0000100000000000};
			5'd12:decOut={16'd0,16'b0001000000000000};
			5'd13:decOut={16'd0,16'b0010000000000000};
			5'd14:decOut={16'd0,16'b0100000000000000};
			5'd15:decOut={16'd0,16'b1000000000000000};
			5'd16:decOut={16'b0000000000000001,16'd0};
			5'd17:decOut={16'b0000000000000010,16'd0};
			5'd18:decOut={16'b0000000000000100,16'd0};
			5'd19:decOut={16'b0000000000001000,16'd0};
			5'd20:decOut={16'b0000000000010000,16'd0};
			5'd21:decOut={16'b0000000000100000,16'd0};
			5'd22:decOut={16'b0000000001000000,16'd0};
			5'd23:decOut={16'b0000000010000000,16'd0};
			5'd24:decOut={16'b0000000100000000,16'd0};
			5'd25:decOut={16'b0000001000000000,16'd0};
			5'd26:decOut={16'b0000010000000000,16'd0};
			5'd27:decOut={16'b0000100000000000,16'd0};
			5'd28:decOut={16'b0001000000000000,16'd0};
			5'd29:decOut={16'b0010000000000000,16'd0};
			5'd30:decOut={16'b0100000000000000,16'd0};
			5'd31:decOut={16'b1000000000000000,16'd0};
			
	endcase
endmodule

module mux32to1( input [31:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,
					outR14,outR15,outR16,outR17,outR18,outR19,outR20,outR21,outR22,outR23,outR24,outR25,outR26,outR27,outR28,
					outR29,outR30,outR31 , input [4:0] Sel, output reg [31:0] outBus );
	always@(outR0 or outR1 or outR2 or outR3 or outR4 or outR5 or outR6 or outR7 or outR8 or outR9 or outR10 or outR11 or outR12 or outR13 or outR14 or outR15 or outR16 or outR17 or outR18 or outR19 or outR20 or outR21 or outR22 or outR23 or outR24 or outR25 or outR26 or outR27 or outR28 or outR29 or outR30 or outR31 or Sel)
	case (Sel)
				5'd0: outBus=outR0;
				5'd1: outBus=outR1;
				5'd2: outBus=outR2;
				5'd3: outBus=outR3;
				5'd4: outBus=outR4;
				5'd5: outBus=outR5;
				5'd6: outBus=outR6;
				5'd7: outBus=outR7;
				5'd8: outBus=outR8;
				5'd9: outBus=outR9;
				5'd10: outBus=outR10;
				5'd11: outBus=outR11;
				5'd12: outBus=outR12;
				5'd13: outBus=outR13;
				5'd14: outBus=outR14;
				5'd15: outBus=outR15;
				5'd16: outBus=outR16;
				5'd17: outBus=outR17;
				5'd18: outBus=outR18;
				5'd19: outBus=outR19;
				5'd20: outBus=outR20;
				5'd21: outBus=outR21;
				5'd22: outBus=outR22;
				5'd23: outBus=outR23;
				5'd24: outBus=outR24;
				5'd25: outBus=outR25;
				5'd26: outBus=outR26;
				5'd27: outBus=outR27;
				5'd28: outBus=outR28;
				5'd29: outBus=outR29;
				5'd30: outBus=outR30;
				5'd31: outBus=outR31;
				
	endcase
endmodule

module regfile(input clk,
                    input reset,
                    input regWrite1,
                    input regWrite2,
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
                    );

wire [31:0] decOut1,decOut2;
wire [31:0]    outR1;
wire [31:0]    outR2;
wire [31:0]    outR3;
wire [31:0]    outR4;
wire [31:0]    outR5;
wire [31:0]    outR6;
wire [31:0]    outR7;
wire [31:0]    outR8;
wire [31:0]    outR9;
wire [31:0]    outR0;
wire [31:0]    outR10;
wire [31:0]    outR11;
wire [31:0]    outR12;
wire [31:0]    outR13;
wire [31:0]    outR14;
wire [31:0]    outR15;
wire [31:0]    outR16;
wire [31:0]    outR17;
wire [31:0]    outR18;
wire [31:0]    outR19;
wire [31:0]    outR20;
wire [31:0]    outR21;
wire [31:0]    outR22;
wire [31:0]    outR23;
wire [31:0]    outR24;
wire [31:0]    outR25;
wire [31:0]    outR26;
wire [31:0]    outR27;
wire [31:0]    outR28;
wire [31:0]    outR29;
wire [31:0]    outR30;
wire [31:0]    outR31;


decoder5to32 dec5t32_1(rd1,decOut1);
decoder5to32 dec5t32_2(rd2,decOut2);

registerSet rSet(clk,reset,regWrite1,regWrite2,decOut1,decOut2,writeData1,writeData2,
                        outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,
                        outR14,outR15,outR16,outR17,outR18,outR19,outR20,outR21,outR22,outR23,outR24,outR25,outR26,
                        outR27,outR28,outR29,outR30,outR31);
mux32to1 m32t1_1(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,
                        outR14,outR15,outR16,outR17,outR18,outR19,outR20,outR21,outR22,outR23,outR24,outR25,outR26,
                        outR27,outR28,outR29,outR30,outR31,rs1,regRs1);
mux32to1 m32t1_2(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,
                        outR14,outR15,outR16,outR17,outR18,outR19,outR20,outR21,outR22,outR23,outR24,outR25,outR26,
                        outR27,outR28,outR29,outR30,outR31,rs2,regRs2);
mux32to1 m32t1_3(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,
                        outR14,outR15,outR16,outR17,outR18,outR19,outR20,outR21,outR22,outR23,outR24,outR25,outR26,
                        outR27,outR28,outR29,outR30,outR31,rt1,regRt1);
mux32to1 m32t1_4(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,
                        outR14,outR15,outR16,outR17,outR18,outR19,outR20,outR21,outR22,outR23,outR24,outR25,outR26,
                        outR27,outR28,outR29,outR30,outR31,rt2,regRt2);
                        
                        


endmodule