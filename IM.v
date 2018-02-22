// Instruction Memory Design

module D_ff_IM(input clk, input reset, input d, output reg q);
	always@(reset or posedge clk)
	if(reset)
		q=d;
endmodule

module register_IM16(input clk, input reset, input [15:0] d_in, output [15:0] q_out);
	D_ff_IM dIM0 (clk, reset, d_in[0], q_out[0]);
	D_ff_IM dIM1 (clk, reset, d_in[1], q_out[1]);
	D_ff_IM dIM2 (clk, reset, d_in[2], q_out[2]);
	D_ff_IM dIM3 (clk, reset, d_in[3], q_out[3]);
	D_ff_IM dIM4 (clk, reset, d_in[4], q_out[4]);
	D_ff_IM dIM5 (clk, reset, d_in[5], q_out[5]);
	D_ff_IM dIM6 (clk, reset, d_in[6], q_out[6]);
	D_ff_IM dIM7 (clk, reset, d_in[7], q_out[7]);
	D_ff_IM dIM8 (clk, reset, d_in[8], q_out[8]);
	D_ff_IM dIM9 (clk, reset, d_in[9], q_out[9]);
	D_ff_IM dIM10 (clk, reset, d_in[10], q_out[10]);
	D_ff_IM dIM11 (clk, reset, d_in[11], q_out[11]);
	D_ff_IM dIM12 (clk, reset, d_in[12], q_out[12]);
	D_ff_IM dIM13 (clk, reset, d_in[13], q_out[13]);
	D_ff_IM dIM14 (clk, reset, d_in[14], q_out[14]);
	D_ff_IM dIM15 (clk, reset, d_in[15], q_out[15]);
endmodule

module register_IM32(input clk, input reset, input [15:0] d_in, output [15:0] q_out);
	D_ff_IM dIM0 (clk, reset, d_in[0], q_out[0]);
	D_ff_IM dIM1 (clk, reset, d_in[1], q_out[1]);
	D_ff_IM dIM2 (clk, reset, d_in[2], q_out[2]);
	D_ff_IM dIM3 (clk, reset, d_in[3], q_out[3]);
	D_ff_IM dIM4 (clk, reset, d_in[4], q_out[4]);
	D_ff_IM dIM5 (clk, reset, d_in[5], q_out[5]);
	D_ff_IM dIM6 (clk, reset, d_in[6], q_out[6]);
	D_ff_IM dIM7 (clk, reset, d_in[7], q_out[7]);
	D_ff_IM dIM8 (clk, reset, d_in[8], q_out[8]);
	D_ff_IM dIM9 (clk, reset, d_in[9], q_out[9]);
	D_ff_IM dIM10 (clk, reset, d_in[10], q_out[10]);
	D_ff_IM dIM11 (clk, reset, d_in[11], q_out[11]);
	D_ff_IM dIM12 (clk, reset, d_in[12], q_out[12]);
	D_ff_IM dIM13 (clk, reset, d_in[13], q_out[13]);
	D_ff_IM dIM14 (clk, reset, d_in[14], q_out[14]);
	D_ff_IM dIM15 (clk, reset, d_in[15], q_out[15]);
	D_ff_IM dIM16 (clk, reset, d_in[0], q_out[16]);
	D_ff_IM dIM17 (clk, reset, d_in[1], q_out[17]);
	D_ff_IM dIM18 (clk, reset, d_in[2], q_out[18]);
	D_ff_IM dIM19 (clk, reset, d_in[3], q_out[19]);
	D_ff_IM dIM20 (clk, reset, d_in[4], q_out[20]);
	D_ff_IM dIM21 (clk, reset, d_in[5], q_out[21]);
	D_ff_IM dIM22 (clk, reset, d_in[6], q_out[22]);
	D_ff_IM dIM23 (clk, reset, d_in[7], q_out[23]);
	D_ff_IM dIM24 (clk, reset, d_in[8], q_out[24]);
	D_ff_IM dIM25 (clk, reset, d_in[9], q_out[25]);
	D_ff_IM dIM26 (clk, reset, d_in[10], q_out[26]);
	D_ff_IM dIM27 (clk, reset, d_in[11], q_out[27]);
	D_ff_IM dIM28 (clk, reset, d_in[12], q_out[28]);
	D_ff_IM dIM29 (clk, reset, d_in[13], q_out[29]);
	D_ff_IM dIM30 (clk, reset, d_in[14], q_out[30]);
	D_ff_IM dIM31 (clk, reset, d_in[15], q_out[31]);
endmodule

module mux32to1_IM(input [31:0] outR0,outR2,outR4,outR6,outR8,outR10,outR12,outR14,
	outR16,outR18,outR20,outR22,outR24,outR26,outR28,outR30, input [15:0] outR1,outR3,outR5,outR7,outR9,outR11,outR13,outR15,
		outR17,outR19,outR21,outR23,outR25,outR27,outR29,outR31,
	input [3:0] Sel, output reg [47:0] outBus );
	
	always@(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15,
		outR16,outR17,outR18,outR19,outR20,outR21,outR22,outR23,outR24,outR25,outR26,outR27,outR28,outR29,outR30,outR31,
		Sel)
		case (Sel)
			4'd0: outBus = {outR0,outR1};
			4'd1: outBus = {outR2,outR3};
			4'd2: outBus = {outR4,outR5};
			4'd3: outBus = {outR6,outR7};
			4'd4: outBus = {outR8,outR9};
			4'd5: outBus = {outR10,outR11};
			4'd6: outBus = {outR12,outR13};
			4'd7: outBus = {outR14,outR15};
			4'd8: outBus = {outR16,outR17};
			4'd9: outBus = {outR18,outR19};
			4'd10: outBus = {outR20,outR21};
			4'd11: outBus = {outR22,outR23};
			4'd12: outBus = {outR24,outR25};
			4'd13: outBus = {outR26,outR27};
			4'd14: outBus = {outR28,outR29};
			4'd15: outBus = {outR30,outR31};
		endcase
endmodule

module IM(input clk, input reset, input [3:0] pc_4bits, output [31:0] IR);
	wire [15:0] Qout0, Qout1, Qout2, Qout3, Qout4, Qout5, Qout6, Qout7,
					Qout8, Qout9, Qout10, Qout11, Qout12, Qout13, Qout14, Qout15,
					Qout16, Qout17, Qout18, Qout19, Qout20, Qout21, Qout22, Qout23,
					Qout24, Qout25, Qout26, Qout27, Qout28, Qout29, Qout30, Qout31;
	register_IM32 rIM0 (clk, reset, 32'b0000000_00010_00001_000_00011_0110011, Qout0); 		// add $3,$2,$1
	register_IM16 rIM1 (clk, reset, 16'b1000_00110_00101_10, Qout1); 						// c.mv $6,$5
	register_IM32 rIM2 (clk, reset, 32'b0100000_00001_00010_101_00100_0010011, Qout2);		// srai $4,$1,(1)
	register_IM16 rIM3 (clk, reset, 16'b0101_1_00110_0101_01, Qout3); 						//c.li $6, (5)
	register_IM32 rIM4 (clk, reset, 32'b000011111111_00001_110_00101_0010011, Qout4);		// andi $1, $5
	register_IM16 rIM5 (clk, reset, 16'b010_101_010_0_1_011_00, Qout5); 					//c.lw $3,$2,(26)
	register_IM32 rIM6 (clk, reset, 32'b100100100100_00011_000_00111_1100111, Qout6); 		//jalr $7,$3,(2340)
	register_IM16 rIM7 (clk, reset, 16'b1000_00101_01000_10, Qout7); 						// c.mv $5,$8
	register_IM32 rIM8 (clk, reset, 32'b0001110_00111_00101_001_00001_0100011, Qout8);		//sh $5,$7,(449)
	register_IM16 rIM9 (clk, reset, 16'b0101_1_00110_0111_01, Qout9); 						//c.li $6, (7) 
	register_IM32 rIM10 (clk, reset, 32'b1_000010_00110_01000_101_0101_1_1100011, Qout10); 	//bge $6,$8,(3109)
	register_IM16 rIM11 (clk, reset, 16'b010_101_010_1_0_011_00, Qout11); 					//c.lw $3,$2,(11)
	register_IM32 rIM12 (clk, reset, 16'h0000, Qout12); 
	register_IM16 rIM13 (clk, reset, 16'h0000, Qout13); 
	register_IM32 rIM14 (clk, reset, 16'h0000, Qout14); 	
	register_IM16 rIM15 (clk, reset, 16'h0000, Qout15);
	register_IM32 rIM16 (clk, reset, 16'h0000, Qout16);
	register_IM16 rIM17 (clk, reset, 16'h0000, Qout17);
	register_IM32 rIM18 (clk, reset, 16'h0000, Qout18);
	register_IM16 rIM19 (clk, reset, 16'h0000, Qout19);
	register_IM32 rIM20 (clk, reset, 16'h0000, Qout20);
	register_IM16 rIM21 (clk, reset, 16'h0000, Qout21);
	register_IM32 rIM22 (clk, reset, 16'h0000, Qout22);
	register_IM16 rIM23 (clk, reset, 16'h0000, Qout23);
	register_IM32 rIM24 (clk, reset, 16'h0000, Qout24);
	register_IM16 rIM25 (clk, reset, 16'h0000, Qout25); 		
	register_IM32 rIM26 (clk, reset, 16'h0000, Qout26); 	
	register_IM16 rIM27 (clk, reset, 16'h0000, Qout27); 	
	register_IM32 rIM28 (clk, reset, 16'h0000, Qout28); 
	register_IM16 rIM29 (clk, reset, 16'h0000, Qout29); 
	register_IM32 rIM30 (clk, reset, 16'h0000, Qout30); 	
	register_IM16 rIM31 (clk, reset, 16'h0000, Qout31); 		
	mux32to1_IM mIM (Qout0,Qout1,Qout2,Qout3,Qout4,Qout5,Qout6,Qout7,Qout8,Qout9,Qout10,Qout11,Qout12,Qout13,Qout14,Qout15,
		Qout16,Qout17,Qout18,Qout19,Qout20,Qout21,Qout22,Qout23,Qout24,Qout25,Qout26,Qout27,Qout28,Qout29,Qout30,Qout31,
		pc_5bits[3:0],IR);
endmodule
