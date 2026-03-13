module Calc_tb;
  parameter Width=8;
  reg clk,rst;
  reg [Width-1:0] A,B;
  reg [1:0] Operation;
  wire [(Width*2)-1:0] Result;
 
  Calculator #(.N(Width)) dut(.clk(clk), .rst(rst), .A(A), .B(B), .Operation(Operation), .Result(Result));
 
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
 
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,Calc_tb);
   
    A=8'b10100011;
    B=8'b00011101;
    rst=0;#10;
    rst=1;#10;
  Operation=2'b00;#10;
    Operation=2'b01;#10;
    Operation=2'b10;#10;
    Operation=2'b11;#10;
    rst=0;#30;
    rst=1;#10;
    repeat(5) begin
      A = $random;
      B = $random;
      Operation = $random % 4;
      #10;
    end
   
    $finish;
  end
endmodule
