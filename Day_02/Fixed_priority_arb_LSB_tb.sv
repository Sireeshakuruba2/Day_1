module tb();
  logic [2:0] req;
  logic [2:0] grant;
  logic clk,reset;
  
  priority_arb_LSB DUT(req, reset, clk, grant);
   initial 
  begin
    // Required to dump signals to EPWave
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end
  
  initial begin
    req =3'b010;
    clk=1;
    reset =1;
    #2 reset = 0;
    #8 req = 3'b011;
    #10 req = 3'b110;
    #5 req =3'b100;
  end
  initial 
    forever  #3 clk =~ clk;
  
  initial begin
    $monitor("time=%0t , clk=%b, reset=%b, req =%b, grant =%b", $time,clk, reset, req, grant);
  
    #50 $finish;
  end
endmodule
