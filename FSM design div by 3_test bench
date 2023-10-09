module tb;
  logic x,y, clk, reset;
  logic [500:0] temp;
  div_by_3 DUT(.x(x),.clk(clk),.reset(reset), .y(y));
  initial begin
    reset = 1'b1;
    clk = 1;
    temp = 0;
    @(negedge clk) reset = 0;
    
  end
  
  initial 
    forever #5 clk= ~clk ;

  initial begin
   forever begin
    @(negedge clk);
    @(negedge clk) x = $random;
   temp = x ? (temp * 2'b10 + 1) : temp *2'b10;
   end
  end
   initial begin
    $dumpfile("dump1.vcd");
    $dumpvars;
  end
  initial begin
    $monitor("time=%0t , reset=%b,clk=%b, x =%b, y=%b" ,$time, reset,clk, x, y);
  
    #500 $finish;
  end
endmodule
  
    
    
