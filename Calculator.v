module Calculator #(parameter N=8)(
  input clk,
  input rst,
  input [N-1:0] A,
  input [N-1:0] B,
  input [1:0] Operation,
  output reg [(N*2)-1:0] Result
);
 
  always @ (posedge clk or posedge rst) begin
    if (!rst) begin
      Result<=0;
    end
    else begin
      case(Operation)
        2'b00: Result<=A+B;
        2'b01: Result<=A-B;
        2'b10: Result<=A*B;
        2'b11: Result<=A/B;
        default: Result=0;
      endcase
  end
  end
endmodule
