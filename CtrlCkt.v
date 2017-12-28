module CtrlCkt(input clk, input [31:0] IR1, input [15:0] IR2, output reg regWrite1, output reg regWrite2, output reg MemtoReg1 ,
					output  reg [1:0] MemtoReg2 ,output reg branch, output reg PCSrc, output reg [1:0] aluSrcB, output reg [1:0] aluOp, 
					output reg memRd, output reg memWr);
					
					always@(IR1)
						begin
							
							case(IR1[6:0])
								7'b0010011: //srai
								begin
								if(IR1[14:12] == 3'b101 )
								begin
									regWrite1 = 1'b1;
									//regWrite2 = 1'b0;
									MemtoReg1 = 1'b0;
									//MemtoReg2 = 2'b0;
									branch = 1'b0;
									PCSrc = 1'b0;
									aluSrcB = 2'b01;
									aluOp = 2'd2;
									memRd = 1'b0;
									memWr = 1'b0;
									
								end	
									else if (IR1[14:12] == 3'b110) //andi
								begin
									regWrite1 = 1'b1;
									regWrite2 = 1'b0;
									MemtoReg1 = 1'b0;
									MemtoReg2 = 2'b0;
									branch = 1'b0;
									PCSrc = 1'b0;
									aluSrcB = 2'b10;
									aluOp = 2'd1;
									memRd = 1'b0;
									memWr = 1'b0;
								end
								end
								7'b0110011: //add
								begin
									regWrite1 = 1'b1;
									regWrite2 = 1'b0;
									MemtoReg1 = 1'b0;
									MemtoReg2 = 2'b0;
									branch = 1'b0;
									PCSrc = 1'b0;
									aluSrcB = 2'b00;
									aluOp = 2'd0;
									memRd = 1'b0;
									memWr = 1'b0;
								end

								7'b1100111: //jalr
								begin
									regWrite1 = 1'b1;
									//regWrite2 = 1'b0;
									MemtoReg1 = 1'b1;
									MemtoReg2 = 2'b0;
									//branch = 1'b0;
									PCSrc = 1'b1;
									aluSrcB = 2'b11;
									aluOp = 2'd0;
									//memRd = 1'b0;
									//memWr = 1'b0;
								end
								
								
								
								7'b0100011: //sh
								begin
									regWrite1 = 1'b1;
									regWrite2 = 1'b0;
									MemtoReg1 = 2'b0;
									MemtoReg2 = 1'b0;
									branch = 1'b0;
									PCSrc = 1'b0;
									aluSrcB = 2'b10;
									aluOp = 2'd0;
									memRd = 1'b0;
									memWr = 1'b1;
								end

								7'b1100011: //bge
								begin
									regWrite1 = 1'b0;
									regWrite2 = 1'b0;
									MemtoReg1 = 1'b0;
									MemtoReg2 = 2'b0;
									branch = 1'b1;
									PCSrc = 1'b0;
									aluSrcB = 2'b00;
									aluOp = 2'd0;
									memRd = 1'b0;
									memWr = 1'b0;
								end
								
							endcase
						end
						
					always @ (IR2[1:0])
						begin
							case(IR2[1:0])
								2'b10: begin //c.mv
									regWrite1 = 1'b0;
									regWrite2 = 1'b1;
									MemtoReg1 = 1'b0;
									MemtoReg2 = 2'b00;
									branch = 1'b0;
									PCSrc = 1'b0;
									aluSrcB = 2'b00;
									aluOp = 2'd0;
									memRd = 1'b0;
									memWr = 1'b0;
									end
									
								2'b01: begin //c.li
									regWrite1 = 1'b0;
									regWrite2 = 1'b1;
									MemtoReg1 = 1'b0;
									MemtoReg2 = 2'b10;
									branch = 1'b0;
									PCSrc = 1'b0;
									aluSrcB = 2'b00;
									aluOp = 2'd0;
									memRd = 1'b0;
									memWr = 1'b0;
									end
									
								2'b00: begin //c.lw
									regWrite1 = 1'b0;
									regWrite2 = 1'b1;
									MemtoReg1 = 1'b0;
									MemtoReg2 = 2'b01;
									branch = 1'b0;
									PCSrc = 1'b0;
									aluSrcB = 2'b00;
									aluOp = 2'd0;
									memRd = 1'b1;
									memWr = 1'b0;
									end
								endcase
							end		

endmodule	