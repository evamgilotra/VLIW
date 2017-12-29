module D_ff (input clk, input reset, input regWrite, input sel, input d, output reg q);
	always @ ( negedge clk )
	begin
	if ( reset == 1'b1 )
		q = 0;
	else
	if(regWrite == 1'b1 && sel == 1'b1)
		q = d; 
	end
endmodule

module mux16to1_4bits (input [3:0] in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, input [3:0] sel, output reg [3:0] outR);
	always @ (in0 or in1 or in2 or in3 or in4 or in5 or in6 or in7 or in8 or in9 or in10 or in11 or in12 or in13 or in14 or in15 or sel)
	 begin
	 case (sel)
		4'b0000: outR=in0;
		4'b0001: outR=in1;
		4'b0010: outR=in2;
		4'b0011: outR=in3;
		4'b0100: outR=in4;
		4'b0101: outR=in5;
		4'b0110: outR=in6;
		4'b0111: outR=in7;
		4'b1000: outR=in8;
		4'b1001: outR=in9;
		4'b1010: outR=in10;
		4'b1011: outR=in11;
		4'b1100: outR=in12;
		4'b1101: outR=in13;
		4'b1110: outR=in14;
		4'b1111: outR=in15;
	 endcase
	 end
endmodule

module decoder4to16 (input [3:0] decIn, output reg [15:0] decOut);	//INDEX DECODER
	always @ (decIn)
	 begin
	   case (decIn)
			4'b0000: decOut=16'b0000000000000001; 
			4'b0001: decOut=16'b0000000000000010;
			4'b0010: decOut=16'b0000000000000100;
			4'b0011: decOut=16'b0000000000001000;
			4'b0100: decOut=16'b0000000000010000;
			4'b0101: decOut=16'b0000000000100000;
			4'b0110: decOut=16'b0000000001000000;
			4'b0111: decOut=16'b0000000010000000;
			4'b1000: decOut=16'b0000000100000000; 
			4'b1001: decOut=16'b0000001000000000;
			4'b1010: decOut=16'b0000010000000000;
			4'b1011: decOut=16'b0000100000000000;
			4'b1100: decOut=16'b0001000000000000;
			4'b1101: decOut=16'b0010000000000000;
			4'b1110: decOut=16'b0100000000000000;
			4'b1111: decOut=16'b1000000000000000;
	   endcase
	 end
endmodule 

module cacheEncoder (input [3:0] in, output reg [1:0] out);		 
	always @ (in)
	begin
			case(in)
				4'b0001: out = 2'b00;
				4'b0010: out = 2'b01;
				4'b0100: out = 2'b10;
				4'b1000: out = 2'b11;
			endcase
	end
endmodule

module mux4to1_8bits (input en, input [7:0] in1, in2, in3, in4, input [1:0] sel, output reg [7:0] outR);	//SELECT DATA BLOCK
	always @ (en or in1 or in2 or in3 or in4 or sel)
	begin
	if (en == 1'b1)
	begin
		case(sel)
			2'b00: outR = in1;
			2'b01: outR = in2;
			2'b10: outR = in3;
			2'b11: outR = in4;
		endcase
	end
	end
endmodule

module mux16to1_1bit (input in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, input [3:0] sel, output reg outR); 
	always @ (in0 or in1 or in2 or in3 or in4 or in5 or in6 or in7 or in8 or in9 or in10 or in11 or in12 or in13 or in14 or in15 or sel)
	 begin
		case (sel)
		4'b0000: outR=in0;
		4'b0001: outR=in1;
		4'b0010: outR=in2;
		4'b0011: outR=in3;
		4'b0100: outR=in4;
		4'b0101: outR=in5;
		4'b0110: outR=in6;
		4'b0111: outR=in7;
		4'b1000: outR=in8;
		4'b1001: outR=in9;
		4'b1010: outR=in10;
		4'b1011: outR=in11;
		4'b1100: outR=in12;
		4'b1101: outR=in13;
		4'b1110: outR=in14;
		4'b1111: outR=in15;
	 endcase
	 end
endmodule

module mux16to1_8bits (input [7:0] in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, input [3:0] sel, output reg [7:0] outR); 	//TO SELECT BYTE USING OFFSET
	always @ (in0 or in1 or in2 or in3 or in4 or in5 or in6 or in7 or in8 or in9 or in10 or in11 or in12 or in13 or in14 or in15 or sel)
	 begin
		case (sel)
		4'b0000: outR=in0;
		4'b0001: outR=in1;
		4'b0010: outR=in2;
		4'b0011: outR=in3;
		4'b0100: outR=in4;
		4'b0101: outR=in5;
		4'b0110: outR=in6;
		4'b0111: outR=in7;
		4'b1000: outR=in8;
		4'b1001: outR=in9;
		4'b1010: outR=in10;
		4'b1011: outR=in11;
		4'b1100: outR=in12;
		4'b1101: outR=in13;
		4'b1110: outR=in14;
		4'b1111: outR=in15;
	 endcase
	 end
endmodule
	 
module mux16to1_20bits (input [19:0] in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, input [3:0] sel, output reg [19:0] outR); 	
	always @ (in0 or in1 or in2 or in3 or in4 or in5 or in6 or in7 or in8 or in9 or in10 or in11 or in12 or in13 or in14 or in15 or sel)
	 begin
		case (sel)
		4'b0000: outR=in0;
		4'b0001: outR=in1;
		4'b0010: outR=in2;
		4'b0011: outR=in3;
		4'b0100: outR=in4;
		4'b0101: outR=in5;
		4'b0110: outR=in6;
		4'b0111: outR=in7;
		4'b1000: outR=in8;
		4'b1001: outR=in9;
		4'b1010: outR=in10;
		4'b1011: outR=in11;
		4'b1100: outR=in12;
		4'b1101: outR=in13;
		4'b1110: outR=in14;
		4'b1111: outR=in15;
	 endcase
	 end
endmodule

module mux16to1_128bits (input [127:0] in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, input [3:0] sel, output reg [127:0] outR); 
	always @ (in0 or in1 or in2 or in3 or in4 or in5 or in6 or in7 or in8 or in9 or in10 or in11 or in12 or in13 or in14 or in15 or sel)
	 begin
		case (sel)
		4'b0000: outR=in0;
		4'b0001: outR=in1;
		4'b0010: outR=in2;
		4'b0011: outR=in3;
		4'b0100: outR=in4;
		4'b0101: outR=in5;
		4'b0110: outR=in6;
		4'b0111: outR=in7;
		4'b1000: outR=in8;
		4'b1001: outR=in9;
		4'b1010: outR=in10;
		4'b1011: outR=in11;
		4'b1100: outR=in12;
		4'b1101: outR=in13;
		4'b1110: outR=in14;
		4'b1111: outR=in15;
	 endcase
	 end
endmodule

module cacheRegister1Bit (input clk, input reset, input regWrite, input sel, input writeData, output outR);	//V/INV BIT
  D_ff d0 ( clk, reset, regWrite, sel, writeData, outR );
endmodule

module cacheRegister4Bit (input clk, input reset, input regWrite, input sel, input [3:0] writeData, output [3:0] outR);	//TO STORE LAST 4 BITS OF TAG IN HALT TAG ARRAY
  D_ff D0 (clk, reset, regWrite, sel, writeData[0], outR[0] );
  D_ff D1 (clk, reset, regWrite, sel, writeData[1], outR[1] );
  D_ff D2 (clk, reset, regWrite, sel, writeData[2], outR[2] );
  D_ff D3 (clk, reset, regWrite, sel, writeData[3], outR[3] );
endmodule

module cacheRegister20bit (input clk, input reset, input regWrite, input sel, input [19:0] writeData, output [19:0] outR); //TO STORE REMAINING 20 BITS OF TAG IN MAIN TAG
  D_ff D0  (clk, reset, regWrite, sel, writeData[0],  outR[0]);
  D_ff D1  (clk, reset, regWrite, sel, writeData[1],  outR[1]);
  D_ff D2  (clk, reset, regWrite, sel, writeData[2],  outR[2]);
  D_ff D3  (clk, reset, regWrite, sel, writeData[3],  outR[3]);
  D_ff D4  (clk, reset, regWrite, sel, writeData[4],  outR[4]);
  D_ff D5  (clk, reset, regWrite, sel, writeData[5],  outR[5]);
  D_ff D6  (clk, reset, regWrite, sel, writeData[6],  outR[6]);
  D_ff D7  (clk, reset, regWrite, sel, writeData[7],  outR[7]);
  D_ff D8  (clk, reset, regWrite, sel, writeData[8],  outR[8]);
  D_ff D9  (clk, reset, regWrite, sel, writeData[9],  outR[9]);
  D_ff D10 (clk, reset, regWrite, sel, writeData[10], outR[10]);
  D_ff D11 (clk, reset, regWrite, sel, writeData[11], outR[11]);
  D_ff D12 (clk, reset, regWrite, sel, writeData[12], outR[12]);
  D_ff D13 (clk, reset, regWrite, sel, writeData[13], outR[13]);
  D_ff D14 (clk, reset, regWrite, sel, writeData[14], outR[14]);
  D_ff D15 (clk, reset, regWrite, sel, writeData[15], outR[15]);
  D_ff D16 (clk, reset, regWrite, sel, writeData[16], outR[16]);
  D_ff D17 (clk, reset, regWrite, sel, writeData[17], outR[17]);
  D_ff D18 (clk, reset, regWrite, sel, writeData[18], outR[18]);
  D_ff D19 (clk, reset, regWrite, sel, writeData[19], outR[19]);
endmodule

module cache1Byte (input clk, input reset,input sel, input regWrite, input [7:0] writeData, output reg [7:0] outR); //ONE BYTE
  D_ff D0 (clk, reset, regWrite, sel, writeData[0], outR[0]);
  D_ff D1 (clk, reset, regWrite, sel, writeData[1], outR[1]);
  D_ff D2 (clk, reset, regWrite, sel, writeData[2], outR[2]);
  D_ff D3 (clk, reset, regWrite, sel, writeData[3], outR[3]);
  D_ff D4 (clk, reset, regWrite, sel, writeData[4], outR[4]);
  D_ff D5 (clk, reset, regWrite, sel, writeData[5], outR[5]);
  D_ff D6 (clk, reset, regWrite, sel, writeData[6], outR[6]);
  D_ff D7 (clk, reset, regWrite, sel, writeData[7], outR[7]);
endmodule

module cache16Bytes (input clk, input reset, input regWrite, input sel, input [127:0] writeData, output reg [127:0] outR); //CACHE LINE SIZE = 16 BYTES
	cache1Byte B0 (clk, reset, regWrite, sel, writeData[7:0], outR[7:0]);
	cache1Byte B1 (clk, reset, regWrite, sel, writeData[15:8], outR[15:8]);
	cache1Byte B2 (clk, reset, regWrite, sel, writeData[23:16], outR[23:16]);
	cache1Byte B3 (clk, reset, regWrite, sel, writeData[31:24], outR[31:24]);
	cache1Byte B4 (clk, reset, regWrite, sel, writeData[39:32], outR[39:32]);
	cache1Byte B5 (clk, reset, regWrite, sel, writeData[47:40], outR[47:40]);
	cache1Byte B6 (clk, reset, regWrite, sel, writeData[55:48], outR[55:48]);
	cache1Byte B7 (clk, reset, regWrite, sel, writeData[63:56], outR[63:56]);
	cache1Byte B8 (clk, reset, regWrite, sel, writeData[71:64], outR[71:64]);
	cache1Byte B9 (clk, reset, regWrite, sel, writeData[79:72], outR[79:72]);
	cache1Byte B10 (clk, reset, regWrite, sel, writeData[87:80], outR[87:80]);
	cache1Byte B11 (clk, reset, regWrite, sel, writeData[95:88], outR[95:88]);
	cache1Byte B12 (clk, reset, regWrite, sel, writeData[103:96], outR[103:96]);
	cache1Byte B13 (clk, reset, regWrite, sel, writeData[111:104], outR[111:104]);
	cache1Byte B14 (clk, reset, regWrite, sel, writeData[119:112], outR[119:112]);
	cache1Byte B15 (clk, reset, regWrite, sel, writeData[127:120], outR[127:120]);
endmodule
	
module cacheCompareHaltTag (input [3:0] tag1, input [3:0] tag2, output reg compRes);	//COMPARE TAG IN HALT TAG ARRAY
	always @ (tag1 or tag2)
	begin
		if(tag1 == tag2)
			compRes = 1'b1;
		else
			compRes = 1'b0;
	end
endmodule

module cacheCompareMainTag (input en, input [19:0] tag1, input [19:0] tag2, output reg compRes);	//COMPARE TAG WITH MAIN TAG 
	always @ (en or tag1 or tag2)
	begin
	if (en == 0)
		compRes = 1'b0;
		else
		begin
			if(tag1 == tag2)
				compRes = 1'b1;
			else
				compRes = 1'b0;
		end
	end
endmodule


module cacheHaltTagArray (input clk, input reset, input haltTagWrite, input [15:0] sel, input [3:0] haltTagIn,
	output [3:0] haltTagOut0, haltTagOut1, haltTagOut2, haltTagOut3, haltTagOut4, haltTagOut5, haltTagOut6, haltTagOut7, haltTagOut8, haltTagOut9, haltTagOut10, haltTagOut11, haltTagOut12, haltTagOut13, haltTagOut14, haltTagOut15); //HALT TAG ARRAY
	
	cacheRegister4Bit R0 (clk, reset, haltTagWrite, sel[0], haltTagIn, haltTagOut0);
	cacheRegister4Bit R1 (clk, reset, haltTagWrite, sel[1], haltTagIn, haltTagOut1);
	cacheRegister4Bit R2 (clk, reset, haltTagWrite, sel[2], haltTagIn, haltTagOut2);
	cacheRegister4Bit R3 (clk, reset, haltTagWrite, sel[3], haltTagIn, haltTagOut3);
	cacheRegister4Bit R4 (clk, reset, haltTagWrite, sel[4], haltTagIn, haltTagOut4);
	cacheRegister4Bit R5 (clk, reset, haltTagWrite, sel[5], haltTagIn, haltTagOut5);
	cacheRegister4Bit R6 (clk, reset, haltTagWrite, sel[6], haltTagIn, haltTagOut6);
	cacheRegister4Bit R7 (clk, reset, haltTagWrite, sel[7], haltTagIn, haltTagOut7);
	cacheRegister4Bit R8 (clk, reset, haltTagWrite, sel[8], haltTagIn, haltTagOut8);
	cacheRegister4Bit R9 (clk, reset, haltTagWrite, sel[9], haltTagIn, haltTagOut9);
	cacheRegister4Bit R10 (clk, reset, haltTagWrite, sel[10], haltTagIn, haltTagOut10);
	cacheRegister4Bit R11 (clk, reset, haltTagWrite, sel[11], haltTagIn, haltTagOut11);
	cacheRegister4Bit R12 (clk, reset, haltTagWrite, sel[12], haltTagIn, haltTagOut12);
	cacheRegister4Bit R13 (clk, reset, haltTagWrite, sel[13], haltTagIn, haltTagOut13);
	cacheRegister4Bit R14 (clk, reset, haltTagWrite, sel[14], haltTagIn, haltTagOut14);
	cacheRegister4Bit R15 (clk, reset, haltTagWrite, sel[15], haltTagIn, haltTagOut15);
		
endmodule

module cacheMainTagArray (input clk, input reset, input mainTagWrite, input [15:0] lineNo, input [3:0] index, input [19:0] mainTagIn, output reg [19:0] mainTagOut);

	wire [19:0] mainTagOut0, mainTagOut1, mainTagOut2, mainTagOut3, mainTagOut4, mainTagOut5, mainTagOut6, mainTagOut7, mainTagOut8, mainTagOut9, mainTagOut10, mainTagOut11, mainTagOut12, mainTagOut13, mainTagOut14, mainTagOut15;
	
	cacheRegister20bit R0 (clk, reset, mainTagWrite, lineNo[0], mainTagIn, mainTagOut0);
	cacheRegister20bit R1 (clk, reset, mainTagWrite, lineNo[1], mainTagIn, mainTagOut1);
	cacheRegister20bit R2 (clk, reset, mainTagWrite, lineNo[2], mainTagIn, mainTagOut2);
	cacheRegister20bit R3 (clk, reset, mainTagWrite, lineNo[3], mainTagIn, mainTagOut3);
	cacheRegister20bit R4 (clk, reset, mainTagWrite, lineNo[4], mainTagIn, mainTagOut4);
	cacheRegister20bit R5 (clk, reset, mainTagWrite, lineNo[5], mainTagIn, mainTagOut5);
	cacheRegister20bit R6 (clk, reset, mainTagWrite, lineNo[6], mainTagIn, mainTagOut6);
	cacheRegister20bit R7 (clk, reset, mainTagWrite, lineNo[7], mainTagIn, mainTagOut7);
	cacheRegister20bit R8 (clk, reset, mainTagWrite, lineNo[8], mainTagIn, mainTagOut8);
	cacheRegister20bit R9 (clk, reset, mainTagWrite, lineNo[9], mainTagIn, mainTagOut9);
	cacheRegister20bit R10 (clk, reset, mainTagWrite, lineNo[10], mainTagIn, mainTagOut10);
	cacheRegister20bit R11 (clk, reset, mainTagWrite, lineNo[11], mainTagIn, mainTagOut11);
	cacheRegister20bit R12 (clk, reset, mainTagWrite, lineNo[12], mainTagIn, mainTagOut12);
	cacheRegister20bit R13 (clk, reset, mainTagWrite, lineNo[13], mainTagIn, mainTagOut13);
	cacheRegister20bit R14 (clk, reset, mainTagWrite, lineNo[14], mainTagIn, mainTagOut14);
	cacheRegister20bit R15 (clk, reset, mainTagWrite, lineNo[15], mainTagIn, mainTagOut15);
	
	mux16to1_20bits M0(mainTagOut0, mainTagOut1, mainTagOut2, mainTagOut3, mainTagOut4, mainTagOut5, mainTagOut6, mainTagOut7, mainTagOut8, mainTagOut9, mainTagOut10, mainTagOut11, mainTagOut12, mainTagOut13, mainTagOut14, mainTagOut15, index, mainTagOut);
	
endmodule

module cacheValidInvalidArray(input clk, input reset, input validWrite, input [15:0] lineNo, input [3:0] index, input vIn, output reg vOutput);

	wire [15:0] vOut;

	cacheRegister1Bit V0 (clk, reset, validWrite, lineNo[0], vIn, vOut[0]);
	cacheRegister1Bit V1 (clk, reset, validWrite, lineNo[1], vIn, vOut[1]);
	cacheRegister1Bit V2 (clk, reset, validWrite, lineNo[2], vIn, vOut[2]);
	cacheRegister1Bit V3 (clk, reset, validWrite, lineNo[3], vIn, vOut[3]);
	cacheRegister1Bit V4 (clk, reset, validWrite, lineNo[4], vIn, vOut[4]);
	cacheRegister1Bit V5 (clk, reset, validWrite, lineNo[5], vIn, vOut[5]);
	cacheRegister1Bit V6 (clk, reset, validWrite, lineNo[6], vIn, vOut[6]);
	cacheRegister1Bit V7 (clk, reset, validWrite, lineNo[7], vIn, vOut[7]);
	cacheRegister1Bit V8 (clk, reset, validWrite, lineNo[8], vIn, vOut[8]);
	cacheRegister1Bit V9 (clk, reset, validWrite, lineNo[9], vIn, vOut[9]);
	cacheRegister1Bit V10 (clk, reset, validWrite, lineNo[10], vIn, vOut[10]);
	cacheRegister1Bit V11 (clk, reset, validWrite, lineNo[11], vIn, vOut[11]);
	cacheRegister1Bit V12 (clk, reset, validWrite, lineNo[12], vIn, vOut[12]);
	cacheRegister1Bit V13 (clk, reset, validWrite, lineNo[13], vIn, vOut[13]);
	cacheRegister1Bit V14 (clk, reset, validWrite, lineNo[14], vIn, vOut[14]);
	cacheRegister1Bit V15 (clk, reset, validWrite, lineNo[15], vIn, vOut[15]);
	
	mux16to1_1bit MVI0(vOut[0], vOut[1], vOut[2], vOut[3], vOut[4], vOut[5], vOut[6], vOut[7], vOut[8], vOut[9], vOut[10], vOut[11], vOut[12], vOut[13], vOut[14], vOut[15], index, vOutput);

	
endmodule

module cacheData (input clk, input reset, input dataSel, input mainTagWrite, input [15:0] lineNo, input [3:0] index,
						input [127:0] writeData, output reg [127:0] dataOut);
	
	
	wire [127:0] dataOut0,  dataOut1, dataOut2, dataOut3, dataOut4, dataOut5, dataOut6, dataOut7, dataOut8, dataOut9, dataOut10, dataOut11, dataOut12, dataOut13, dataOut14, dataOut15;
	
	cache16Bytes B0 (clk, reset, mainTagWrite, lineNo[0], writeData, dataOut0);
	cache16Bytes B1 (clk, reset, mainTagWrite, lineNo[1], writeData, dataOut1);
	cache16Bytes B2 (clk, reset, mainTagWrite, lineNo[2], writeData, dataOut2);
	cache16Bytes B3 (clk, reset, mainTagWrite, lineNo[3], writeData, dataOut3);
	cache16Bytes B4 (clk, reset, mainTagWrite, lineNo[4], writeData, dataOut4);
	cache16Bytes B5 (clk, reset, mainTagWrite, lineNo[5], writeData, dataOut5);
	cache16Bytes B6 (clk, reset, mainTagWrite, lineNo[6], writeData, dataOut6);
	cache16Bytes B7 (clk, reset, mainTagWrite, lineNo[7], writeData, dataOut7);
	cache16Bytes B8 (clk, reset, mainTagWrite, lineNo[8], writeData, dataOut8);
	cache16Bytes B9 (clk, reset, mainTagWrite, lineNo[9], writeData, dataOut9);
	cache16Bytes B10 (clk, reset, mainTagWrite, lineNo[10], writeData, dataOut10);
	cache16Bytes B11 (clk, reset, mainTagWrite, lineNo[11], writeData, dataOut11);
	cache16Bytes B12 (clk, reset, mainTagWrite, lineNo[12], writeData, dataOut12);
	cache16Bytes B13 (clk, reset, mainTagWrite, lineNo[13], writeData, dataOut13);
	cache16Bytes B14 (clk, reset, mainTagWrite, lineNo[14], writeData, dataOut14);
	cache16Bytes B15 (clk, reset, mainTagWrite, lineNo[15], writeData, dataOut15);
	
	mux16to1_128bits M0(dataOut0, dataOut1, dataOut2, dataOut3, dataOut4, dataOut5, dataOut6, dataOut7, dataOut8, dataOut9, dataOut10, dataOut11, dataOut12, dataOut13, dataOut14, dataOut15, index, dataOut);	
endmodule

module haltTagCompare(input [3:0] addressTag, input [3:0] haltTagOut0, haltTagOut1, haltTagOut2, haltTagOut3, haltTagOut4, haltTagOut5, haltTagOut6, haltTagOut7, haltTagOut8, haltTagOut9, haltTagOut10, haltTagOut11, haltTagOut12, haltTagOut13, haltTagOut14, haltTagOut15, 
						  input [15:0] decOut, output haltTagHit); 
	wire [15:0] haltCompRes;
	
	cacheCompareHaltTag C0(address, haltTagOut0, haltCompRes[0]);
	cacheCompareHaltTag C1(address, haltTagOut1, haltCompRes[1]);
	cacheCompareHaltTag C2(address, haltTagOut2, haltCompRes[2]);
	cacheCompareHaltTag C3(address, haltTagOut3, haltCompRes[3]);
	cacheCompareHaltTag C4(address, haltTagOut4, haltCompRes[4]);
	cacheCompareHaltTag C5(address, haltTagOut5, haltCompRes[5]);
	cacheCompareHaltTag C6(address, haltTagOut6, haltCompRes[6]);
	cacheCompareHaltTag C7(address, haltTagOut7, haltCompRes[7]);
	cacheCompareHaltTag C8(address, haltTagOut8, haltCompRes[8]);
	cacheCompareHaltTag C9(address, haltTagOut9, haltCompRes[9]);
	cacheCompareHaltTag C10(address, haltTagOut10, haltCompRes[10]);
	cacheCompareHaltTag C11(address, haltTagOut11, haltCompRes[11]);
	cacheCompareHaltTag C12(address, haltTagOut12, haltCompRes[12]);
	cacheCompareHaltTag C13(address, haltTagOut13, haltCompRes[13]);
	cacheCompareHaltTag C14(address, haltTagOut14, haltCompRes[14]);
	cacheCompareHaltTag C15(address, haltTagOut15, haltCompRes[15]);
	
	or(haltTagHit,  haltCompRes[0], haltCompRes[1], haltCompRes[2], haltCompRes[3], haltCompRes[4], haltCompRes[5], haltCompRes[6], haltCompRes[7], haltCompRes[8], haltCompRes[9], haltCompRes[10], haltCompRes[11], haltCompRes[12], haltCompRes[13], haltCompRes[14], haltCompRes[15]);

endmodule


module cacheWriteBuffer(input clk, input reset, input regWrite, input [15:0] sel, input [7:0] writeData, output reg [7:0] bufferOut);

	cache1Byte B0 (clk, reset, regWrite, sel[0], writeData, bufferOut);
	cache1Byte B1 (clk, reset, regWrite, sel[1], writeData, bufferOut);
	cache1Byte B2 (clk, reset, regWrite, sel[2], writeData, bufferOut);
	cache1Byte B3 (clk, reset, regWrite, sel[3], writeData, bufferOut);
	cache1Byte B4 (clk, reset, regWrite, sel[4], writeData, bufferOut);
	cache1Byte B5 (clk, reset, regWrite, sel[5], writeData, bufferOut);
	cache1Byte B6 (clk, reset, regWrite, sel[6], writeData, bufferOut);
	cache1Byte B7 (clk, reset, regWrite, sel[7], writeData, bufferOut);
	cache1Byte B8 (clk, reset, regWrite, sel[8], writeData, bufferOut);
	cache1Byte B9 (clk, reset, regWrite, sel[9], writeData, bufferOut);
	cache1Byte B10 (clk, reset, regWrite, sel[10], writeData, bufferOut);
	cache1Byte B11 (clk, reset, regWrite, sel[11], writeData, bufferOut);
	cache1Byte B12 (clk, reset, regWrite, sel[12], writeData, bufferOut);
	cache1Byte B13 (clk, reset, regWrite, sel[13], writeData, bufferOut);
	cache1Byte B14 (clk, reset, regWrite, sel[14], writeData, bufferOut);
	cache1Byte B15 (clk, reset, regWrite, sel[15], writeData, bufferOut);

endmodule

module randomGen(input miss, output reg [3:0] randWay);
	reg [15:0] rand;
	always @(miss)
	begin
		if (miss==1'b0)
			randWay = 4'b0000;
		else
		begin
			rand = $urandom%4;
			case (rand[1:0])
				2'b00: randWay = 4'b0001;
				2'b01: randWay = 4'b0010;
				2'b10: randWay = 4'b0100;
				2'b11: randWay = 4'b1000;
			endcase
		end
	end
endmodule

module way(input clk, input reset, input [31:0] address, input [15:0]decOut, input memWr, input [24:0] tagIn, input validWrite, input [127:0] writeData, output dataSel, output reg [7:0] finalDataOut);
	
	wire dataWrite, memSel, mainTagHit, haltTagHit, vOut, vIn;
	wire [3:0] haltTagOut0, haltTagOut1, haltTagOut2, haltTagOut3, haltTagOut4, haltTagOut5, haltTagOut6, haltTagOut7, haltTagOut8, haltTagOut9, haltTagOut10, haltTagOut11, haltTagOut12, haltTagOut13, haltTagOut14, haltTagOut15, viSelected;
	wire [19:0] mainTagOut;
	wire [127:0] dataOut;
	
	cacheHaltTagArray HT0(clk, reset, randWay, decOut, haltTagIn, haltTagOut0, haltTagOut1, haltTagOut2, haltTagOut3, haltTagOut4, haltTagOut5, haltTagOut6, haltTagOut7, haltTagOut8, haltTagOut9, haltTagOut10, haltTagOut11, haltTagOut12, haltTagOut13, haltTagOut14, haltTagOut15); 	
	
	haltTagCompare CC0(address[11:8], haltTagOut0, haltTagOut1, haltTagOut2, haltTagOut3, haltTagOut4, haltTagOut5, haltTagOut6, haltTagOut7, haltTagOut8, haltTagOut9, haltTagOut10, haltTagOut11, haltTagOut12, haltTagOut13, haltTagOut14, haltTagOut15, decOut, haltTagHit);
	
	cacheMainTagArray MT0(clk, reset, randWay, decOut, address [7:4], tagIn[23:4] , mainTagOut);
	
	cacheCompareMainTag CM0(haltTagHit, address[31:12], mainTagOut, mainTagHit);	
	
	cacheValidInvalidArray VI0(clk, reset, validWrite, decOut, address[7:4], vIn, vOut);
		
	and(dataSel, vOut, mainTagHit, haltTagHit);
	
	and(memSel,dataSel,memWr);
	
	or(dataWrite, randWay, memSel);
	
	cacheData CD0(clk, reset, dataSel, dataWrite, decOut, address[7:4], writeData, dataOut);
	
	mux16to1_8bits M0(dataOut[7:0], dataOut[15:8], dataOut[23:16], dataOut[31:24], dataOut[39:32], dataOut[47:40], dataOut[55:48], dataOut[63:56], dataOut[71:64], dataOut[79:72], dataOut[87:80], dataOut[95:88], dataOut[103:96], dataOut[111:104], dataOut[119:112], dataOut[127:120], address[3:0], finalDataOut); 
	
endmodule

module cacheComplete(input clk, input reset, input [31:0] address, input memRd, input memWr, input[7:0] userData, output reg [7:0] bufferOut, output reg [7:0] finalDataOut, output hit);

	wire validWrite, enable, miss;
	wire [1:0] encOut;
	wire [3:0] randWay, dataSel;
	wire [7:0] finalDataOut0, finalDataOut1, finalDataOut2, finalDataOut3;
	wire [15:0] decOut, bufferSel; 
	wire [24:0] tagIn;
	wire [127:0] writeData;
	
	
	decoder4to16 D0(address[7:4], decOut);//address index = address [7:4]

	// Way 1
	way Way0(clk, reset, address, decOut, memWr, tagIn, validWrite, writeData, dataSel[0], finalDataOut0);
	
	//Way 2
	way Way1(clk, reset, address, decOut, memWr, tagIn, validWrite, writeData, dataSel[1], finalDataOut1);
	
	//Way 3
	way Way2(clk, reset, address, decOut, memWr, tagIn, validWrite, writeData, dataSel[2], finalDataOut2);

	// Way 4	
	way Way3(clk, reset, address, decOut, memWr, tagIn, validWrite, writeData, dataSel[1], finalDataOut1);

	or(hit, dataSel[0], dataSel[1], dataSel[2], dataSel[3]);
	and(enable, hit, memRd);
	
	cacheEncoder CE0(dataSel, encOut);

	mux4to1_8bits mux_final(enable, finalDataOut0, finalDataOut1, finalDataOut2, finalDataOut3, encOut, finalDataOut);

	not(miss, hit);
	randomGen randGen(miss, randWay);
	
	cacheWriteBuffer writeBuffer(clk, reset, memWr, bufferSel, userData, bufferOut);
endmodule
	
module cacheTestBench;
endmodule

