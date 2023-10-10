// Code your testbench here
// or browse Examples
module tb();
  logic [31:0] req;
  logic [31:0] grant;
  logic clk,reset;
  
  single_cycle_arbiter #(32) DUT(clk, reset, req, grant);
   initial 
  begin
    // Required to dump signals to EPWave
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end
  
  initial begin
    req =32'b00000000000000000000000000000010;
    clk=1;
    reset =1;
    #2 reset = 0;
    #8 req = 32'b011;
    #10 req = 32'b110;
    #5 req =32'b001;
  end
  initial 
    forever  #3 clk =~ clk;
  
  initial begin
    $monitor("time=%0t , clk=%b, reset=%b, req =%b, grant =%b", $time,clk, reset, req, grant);
  
    #50 $finish;
  end
endmodule
