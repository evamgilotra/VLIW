//comparator for branch 
module comparator32bits(input clk, input [31:0] in1, input [31:0] in2, output reg out);
	always@(in1, in2)
		begin
			out <= (in1<in2)? 1'b0 : 1'b1; 
		end
endmodule

//adder for compressed instructions
module adder(input [31:0] in1, input [31:0] in2, output reg [31:0] adder_out);
	always@(in1 or in2)
		adder_out = in1 +in2;
endmodule
////