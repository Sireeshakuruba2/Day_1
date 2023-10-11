// Code your testbench here
// or browse Examples
module tb;
  reg [3:0] a;
  wire [3:0] b;
  G2B DUT(.a(a), .b(b));
  initial begin
    $dumpvars;
    $dumpfile("DUT.vcd");
  end
  initial begin
    forever
   #5 a=$random;
  end
  initial begin
    $monitor("time=%0t ,a=%b, b=%b" ,$time,a,b);
    #200 $finish;
              end
              endmodule
    
