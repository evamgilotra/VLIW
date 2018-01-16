module hazard_detection_ckt (input [15:0] opcodeg2, input[15:0] opcodeg1, input IDEX_MemRead,
	input EXMEM_MemRead, input IDEX_flagWrite1, input [2:0] IDEX_rd, input EXMEM_n_flag,
	output reg PCWrite, output reg IFWrite, output reg IDEX_ctrl_flush);
	
	always@(opcodeg1, opcodeg2, IDEX_MemRead, EXMEM_MemRead, IDEX_flagWrite1, IDEX_rd, EXMEM_n_flag)
	begin
		
		PCWrite = 1'b1;
		IFWrite = 1'b1;
		IDEX_ctrl_flush = 1'b0;
		
		// hazard detection for load
		if(IDEX_MemRead == 1'b1)
		begin
			if( (opcodeg1[15:11] == 5'b00100 && IDEX_rd == opcodeg1[10:8]) || // lw-add
				(opcodeg1[15:11] == 5'b00011 && (IDEX_rd == opcodeg1[8:6] || IDEX_rd == opcodeg1[5:3])) || // lw-sub
				(opcodeg1[15:11] == 5'b01000 && (IDEX_rd == opcodeg1[5:3] || IDEX_rd == opcodeg1[2:0])) || // lw-shft/cmp
				(opcodeg2[15:11] == 5'b10001 && IDEX_rd == opcodeg2[5:3]) || // lw-lw
				(opcodeg2[15:11] == 5'b10000 && (IDEX_rd == opcodeg2[5:3] || IDEX_rd == opcodeg2[2:0])) || // lw-sw
				(opcodeg2[15:11] == 5'b11010) // lw-br
				)	
			begin
				PCWrite = 1'b0;
				IFWrite = 1'b0;
				IDEX_ctrl_flush = 1'b1;
			end
		end
		
		// hazard detection for branch
		else if(opcodeg2[15:11] == 5'b11010)
		begin
			if( (EXMEM_MemRead == 1'b1 && EXMEM_n_flag == 1'b0) || // br-lw (2nd stall)
				(IDEX_flagWrite1 == 1'b1) // other branches (first stall)
				)
			begin
				PCWrite = 1'b0;
				IFWrite = 1'b0;
				IDEX_ctrl_flush = 1'b1;
			end
		end
		
	end
endmodule

/* module hazard_detection_ckt (input [15:0] opcodeg2, input[15:0] opcodeg1, input IDEX_MemRead,
	input EXMEM_MemRead, input IDEX_flagWrite1, input IDEX_rd, input EXMEM_n_flag,
	output reg PCWrite, output reg IFWrite, output reg IDEX_ctrl_flush); */

module hazard_detection_ckt_testbench;

	reg [15:0] opcodeg1, opcodeg2;
	reg IDEX_MemRead, EXMEM_MemRead, IDEX_flagWrite1, IDEX_rd, EXMEM_n_flag;
	
	wire PCWrite, IFWrite, IDEX_ctrl_flush;
	
	hazard_detection_ckt hdckt(opcodeg2, opcodeg1, IDEX_MemRead, EXMEM_MemRead,
		IDEX_flagWrite1, IDEX_rd, EXMEM_n_flag, PCWrite, IFWrite, IDEX_ctrl_flush);
	
	initial
	begin
	
		// test lw-add
		opcodeg1 = 16'b00100_001_00000000; // add Rd = 001 | imm = 00000000
		IDEX_MemRead = 1'b1;
		IDEX_rd = 3'b001;
		//
		
		#10 // test lw-sub Rm conflict
		opcodeg1 = 16'b00011_01_001_000_000; // sub Rm = 001 | Rn = 000 | Rd = 000
		IDEX_MemRead = 1'b1;
		IDEX_rd = 3'b001;
		//
		
		#10	// test lw-sub Rn conflict
		opcodeg1 = 16'b00011_01_000_001_000; // sub Rm = 000 | Rn = 001 | Rd = 000
		IDEX_MemRead = 1'b1;
		IDEX_rd = 3'b001;
		//
		
		#10	// test lw-sub Rm Rn both conflict
		opcodeg1 = 16'b00011_01_001_001_000; // sub Rm = 001 | Rn = 001 | Rd = 000
		IDEX_MemRead = 1'b1;
		IDEX_rd = 3'b001;
		//
		
		#10	// test lw-shft Rm conflict
		opcodeg1 = 16'b01000_01000_001_000; // shft Rm = 001 | Rd = 000
		IDEX_MemRead = 1'b1;
		IDEX_rd = 3'b001;
		//
		
		#10	// test lw-shft Rd conflict
		opcodeg1 = 16'b01000_01000_000_001; // shft Rm = 000 | Rd = 001
		IDEX_MemRead = 1'b1;
		IDEX_rd = 3'b001;
		//
		
		#10	// test lw-shft Rm Rd conflict
		opcodeg1 = 16'b01000_01000_001_001; // shft Rm = 001 | Rd = 001
		IDEX_MemRead = 1'b1;
		IDEX_rd = 3'b001;
		//
		
		#10	// test lw-cmp Rm conflict
		opcodeg1 = 16'b01000_00001_001_000; // cmp Rm = 001 | Rd = 000
		IDEX_MemRead = 1'b1;
		IDEX_rd = 3'b001;
		//
		
		#10	// test lw-cmp Rd conflict
		opcodeg1 = 16'b01000_00001_000_001; // cmp Rm = 000 | Rd = 001
		IDEX_MemRead = 1'b1;
		IDEX_rd = 3'b001;
		//
		
		#10	// test lw-cmp Rd Rm conflict
		opcodeg1 = 16'b01000_00001_001_001; // cmp Rm = 001 | Rd = 001
		IDEX_MemRead = 1'b1;
		IDEX_rd = 3'b001;
		//
		
		#10	// test lw-lw Rd conflict
		opcodeg2 = 16'b10001_00000_000_001; // lw Rn = 000 | Rd = 001
		IDEX_MemRead = 1'b1;
		IDEX_rd = 3'b001;
		//
		
		#10	// test lw-lw Rn conflict
		opcodeg2 = 16'b10001_00000_001_000; // lw Rn = 001 | Rd = 000
		IDEX_MemRead = 1'b1;
		IDEX_rd = 3'b001;
		//
		
		#10	// test lw-lw both Rn Rd conflict
		opcodeg2 = 16'b10001_00000_001_001; // lw Rn = 001 | Rd = 001
		IDEX_MemRead = 1'b1;
		IDEX_rd = 3'b001;
		//
		
		#10	// test lw-sw Rn conflict
		opcodeg2 = 16'b10000_00000_001_000; // sw Rn = 001 | Rd = 000
		IDEX_MemRead = 1'b1;
		IDEX_rd = 3'b001;
		//
		
		#10	// test lw-sw Rd conflict
		opcodeg2 = 16'b10000_00000_000_001; // sw Rn = 000 | Rd = 001
		IDEX_MemRead = 1'b1;
		IDEX_rd = 3'b001;
		//
		
		#10	// test lw-sw Rn Rd both conflict
		opcodeg2 = 16'b10000_00000_001_001; // sw Rn = 001 | Rd = 001
		IDEX_MemRead = 1'b1;
		IDEX_rd = 3'b001;
		//
		
		#10 // test add-br
		opcodeg2 = 16'b11010_000_00000000;
		IDEX_flagWrite1 = 1'b1;
		
		#10 // test 2nd stall for lw-branch
		opcodeg2 = 16'b11010_000_00000000;
		EXMEM_MemRead = 1'b1;
		EXMEM_n_flag = 1'b0;
		
	end
endmodule
