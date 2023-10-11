// Code your testbench here
// or browse Examples
module test;
  logic clk,reset;
  logic [31:0] in;
  logic [5:0] out;
  initial begin
    $dumpfile("dump1.vcd");
    $dumpvars;
  end
  set_bit_index DUT(in,out,clk,reset);
  initial begin
    clk=0;
    reset=0;
    in=32'b0000000000000001;
    @(negedge clk) reset =1;
    @(negedge clk) in = 32'b10000000000000000000000000000000;
    @(negedge clk) in=  32'b11111111111111111110000000000000;
    
    
#5 $finish;
  end
  always #1 clk=~clk;
   initial begin 
   
   
     $monitor("time=%0t , reset=%b,clk=%b, in =%b, out=%b" ,$time, reset,clk, in, out);
  
  end
endmodule
