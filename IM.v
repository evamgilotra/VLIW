// Instruction Memory Design

module D_ff_IM(input clk, input reset, input d, output reg q);
	always@(reset or posedge clk)
	if(reset)
		q=d;
endmodule

module register_IM(input clk, input reset, input [15:0] d_in, output [15:0] q_out);
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

module mux32to1_IM(input [15:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15,
	outR16,outR17,outR18,outR19,outR20,outR21,outR22,outR23,outR24,outR25,outR26,outR27,outR28,outR29,outR30,outR31,
	input [4:0] Sel, output reg [31:0] outBus );
	
	always@(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15,
		outR16,outR17,outR18,outR19,outR20,outR21,outR22,outR23,outR24,outR25,outR26,outR27,outR28,outR29,outR30,outR31,
		Sel)
		case (Sel)
			5'd0: outBus = {outR1,outR0};
			5'd1: outBus = {outR2,outR1};
			5'd2: outBus = {outR3,outR2};
			5'd3: outBus = {outR4,outR3};
			5'd4: outBus = {outR5,outR4};
			5'd5: outBus = {outR6,outR5};
			5'd6: outBus = {outR7,outR6};
			5'd7: outBus = {outR8,outR7};
			5'd8: outBus = {outR9,outR8};
			5'd9: outBus = {outR10,outR9};
			5'd10: outBus = {outR11,outR10};
			5'd11: outBus = {outR12,outR11};
			5'd12: outBus = {outR13,outR12};
			5'd13: outBus = {outR14,outR13};
			5'd14: outBus = {outR15,outR14};
			5'd15: outBus = {outR16,outR15};
			5'd16: outBus = {outR17,outR16};
			5'd17: outBus = {outR18,outR17};
			5'd18: outBus = {outR19,outR18};
			5'd19: outBus = {outR20,outR19};
			5'd20: outBus = {outR21,outR20};
			5'd21: outBus = {outR22,outR21};
			5'd22: outBus = {outR23,outR22};
			5'd23: outBus = {outR24,outR23};
			5'd24: outBus = {outR25,outR24};
			5'd25: outBus = {outR26,outR25};
			5'd26: outBus = {outR27,outR26};
			5'd27: outBus = {outR28,outR27};
			5'd28: outBus = {outR29,outR28};
			5'd29: outBus = {outR30,outR29};
			5'd30: outBus = {outR31,outR30};
			5'd31: outBus = {32'b0,outR31};
		endcase
endmodule

module IM(input clk, input reset, input [4:0] pc_5bits, output [31:0] IR);
	wire [15:0] Qout0, Qout1, Qout2, Qout3, Qout4, Qout5, Qout6, Qout7,
					Qout8, Qout9, Qout10, Qout11, Qout12, Qout13, Qout14, Qout15,
					Qout16, Qout17, Qout18, Qout19, Qout20, Qout21, Qout22, Qout23,
					Qout24, Qout25, Qout26, Qout27, Qout28, Qout29, Qout30, Qout31;
	register_IM rIM0 (clk, reset, 16'b1_000_00011_0110011, Qout0); 
	register_IM rIM1 (clk, reset, 16'b0000000_00010_0000, Qout1); // add $3,$2,$1
	register_IM rIM2 (clk, reset, 16'b0_101_00100_0010011, Qout2);
	register_IM rIM3 (clk, reset, 16'b0100000_00001_0001, Qout3); // srai $4,$1,(1)
	register_IM rIM4 (clk, reset, 16'b1_110_00101_0010011, Qout4);
	register_IM rIM5 (clk, reset, 16'b000011111111_0000, Qout5); // andi $1, $5
	register_IM rIM6 (clk, reset, 16'h0000, Qout6); 
	register_IM rIM7 (clk, reset, 16'h0000, Qout7); 
	register_IM rIM8 (clk, reset, 16'h0000, Qout8);
	register_IM rIM9 (clk, reset, 16'h0000, Qout9); 
	register_IM rIM10 (clk, reset, 16'b0000000000000000, Qout10); 	
	register_IM rIM11 (clk, reset, 16'b001100_01010_01011, Qout11); 
	register_IM rIM12 (clk, reset, 16'h0000, Qout12); 
	register_IM rIM13 (clk, reset, 16'h0000, Qout13); 
	register_IM rIM14 (clk, reset, 16'h0000, Qout14); 	
	register_IM rIM15 (clk, reset, 16'h0000, Qout15);
	register_IM rIM16 (clk, reset, 16'h0000, Qout16);
	register_IM rIM17 (clk, reset, 16'h0000, Qout17);
	register_IM rIM18 (clk, reset, 16'h0000, Qout18);
	register_IM rIM19 (clk, reset, 16'h0000, Qout19);
	register_IM rIM20 (clk, reset, 16'h0000, Qout20);
	register_IM rIM21 (clk, reset, 16'h0000, Qout21);
	register_IM rIM22 (clk, reset, 16'h0000, Qout22);
	register_IM rIM23 (clk, reset, 16'h0000, Qout23);
	register_IM rIM24 (clk, reset, 16'h0000, Qout24);
	register_IM rIM25 (clk, reset, 16'h0000, Qout25); 		
	register_IM rIM26 (clk, reset, 16'h0000, Qout26); 	
	register_IM rIM27 (clk, reset, 16'h0000, Qout27); 	
	register_IM rIM28 (clk, reset, 16'h0000, Qout28); 
	register_IM rIM29 (clk, reset, 16'h0000, Qout29); 
	register_IM rIM30 (clk, reset, 16'h0000, Qout30); 	
	register_IM rIM31 (clk, reset, 16'h0000, Qout31); 		
	mux32to1_IM mIM (Qout0,Qout1,Qout2,Qout3,Qout4,Qout5,Qout6,Qout7,Qout8,Qout9,Qout10,Qout11,Qout12,Qout13,Qout14,Qout15,
		Qout16,Qout17,Qout18,Qout19,Qout20,Qout21,Qout22,Qout23,Qout24,Qout25,Qout26,Qout27,Qout28,Qout29,Qout30,Qout31,
		pc_5bits[4:0],IR);
endmodule
