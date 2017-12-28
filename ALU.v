module ALU(input [1:0] op,input [31:0] in1,input [31:0] in2,output reg ZFlag,output reg [31:0]  ans);
always @(op or in1 or in2)
begin
    case(op)
        2'd0:begin
                    ans=in1 + in2;                    
                end
        2'd1:begin
                    ans=in1 & in2;
                end
        2'd2:begin
                    ans=in1>>>in2;
                end
        2'd3:begin
                ans=32'd0;
                end
    endcase
    if(ans==32'b0)
    begin 
        ZFlag=1'b1;
    end
end
endmodule