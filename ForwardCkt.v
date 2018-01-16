module forwarding(input [2:0] rd_sw, input [2:0] lw_sw_sel, input [2:0] add_sel, input [2:0] sub_rm_sel,
	input [2:0] sub_rn_sel, input [2:0] cmp_shft_rd, input [2:0] EXMEM_rd1, input [2:0] MEMWB_rd1, input [2:0] MEMWB_rd2, 
	input EXMEM_regWrite1, input MEMWB_regWrite1, input MEMWB_regWrite2, input [1:0] ALUsrc1, input [1:0] ALUsrc2,
	input EXMEM_flagWrite1, input EXMEM_flagWrite2, input EXMEM_n_flag, output reg sel_n_flag, 
	output reg [1:0] sel_ALUsrc1, output reg [1:0] sel_ALUsrc2, output reg [1:0] sel_StoreData, output reg [1:0] sel_lw_sw_sel);
	
	always @(rd_sw or lw_sw_sel or add_sel or sub_rm_sel or sub_rn_sel or cmp_shft_rd or EXMEM_rd1 or MEMWB_rd1 or MEMWB_rd2 or ALUsrc1 or ALUsrc2 or EXMEM_flagWrite1 or EXMEM_flagWrite2 or EXMEM_regWrite1 or MEMWB_regWrite1 or MEMWB_regWrite2)
	begin
		sel_ALUsrc1 = 2'b00;
		sel_ALUsrc2 = 2'b00;
		//sel_EXMEMStoreData = 2'b00;
		sel_lw_sw_sel = 2'b00;
		sel_n_flag = 1'b0;
		sel_StoreData = 2'b00;
		
		if((EXMEM_regWrite1==1'b1) && (EXMEM_rd1==rd_sw)) sel_StoreData = 2'b01;
		else
		begin
			if((MEMWB_regWrite1==1'b1) && (MEMWB_rd1==rd_sw)) sel_StoreData = 2'b10;			
			if((MEMWB_regWrite2==1'b1) && (MEMWB_rd2==rd_sw)) sel_StoreData = 2'b11;
		end
		
		//address calculation dependency
		if((EXMEM_regWrite1==1'b1) && (EXMEM_rd1==lw_sw_sel)) sel_lw_sw_sel = 2'b01;
		else
		begin
			if((MEMWB_regWrite1==1'b1) && (MEMWB_rd1==lw_sw_sel)) sel_lw_sw_sel = 2'b10;			
			if((MEMWB_regWrite2==1'b1) && (MEMWB_rd2==lw_sw_sel)) sel_lw_sw_sel = 2'b11;
		end
		
		//ALU SRCA DEPENDENCY
		if((EXMEM_regWrite1==1'b1) && ((ALUsrc1==2'b00 && EXMEM_rd1==add_sel) || 
		   (ALUsrc1==2'b01 && EXMEM_rd1==sub_rn_sel) || 
		   (ALUsrc1==2'b10 && EXMEM_rd1==cmp_shft_rd))) sel_ALUsrc1 = 2'b01;// ex/mem1--aluALUsrc1
		else
		begin
			if((MEMWB_regWrite1==1'b1) && ((ALUsrc1==2'b00 && MEMWB_rd1==add_sel) || 
			   (ALUsrc1==2'b01 && MEMWB_rd1==sub_rn_sel) || 
			   (ALUsrc1==2'b10 && MEMWB_rd1==cmp_shft_rd))) sel_ALUsrc1 = 2'b10;// mem/wb1--aluALUsrc1
			
			if((MEMWB_regWrite2==1'b1) && ((ALUsrc1==2'b00 && MEMWB_rd2==add_sel) || 
			   (ALUsrc1==2'b01 && MEMWB_rd2==sub_rn_sel) || 
			   (ALUsrc1==2'b10 && MEMWB_rd2==cmp_shft_rd))) sel_ALUsrc1 = 2'b11;// mem/wb2--aluALUsrc1
		end
		
		//ALU SRCB DEPENDENCY
		if((EXMEM_regWrite1==1'b1) && ((ALUsrc2==2'b00 && EXMEM_rd1==sub_rm_sel) ||
		   (ALUsrc2==2'b01 && EXMEM_rd1==sub_rn_sel))) sel_ALUsrc2 = 2'b01;// ex/mem1--aluALUsrc2
		else
		begin
			if((MEMWB_regWrite1==1'b1) && ((ALUsrc2==2'b00 && MEMWB_rd1==sub_rm_sel) || 
			  (ALUsrc2==2'b01 && MEMWB_rd1==sub_rn_sel))) sel_ALUsrc2 = 2'b10;// mem/wb1--aluALUsrc2
			
			if((MEMWB_regWrite2==1'b1) && ((ALUsrc2==2'b00 && MEMWB_rd2==sub_rm_sel) || 
			  (ALUsrc2==2'b01 && MEMWB_rd2==sub_rn_sel))) sel_ALUsrc2 = 2'b11;// mem/wb2--aluALUsrc2
		end
		
			if((EXMEM_flagWrite1==1'b1) && ((EXMEM_n_flag==1'b1) || (EXMEM_flagWrite2==1'b0))) sel_n_flag = 1'b1; // EX/MEM
		
	end
endmodule