module priority_arb_MSB (input logic [2:0] req, logic reset, logic clk, output logic [2:0] grant);
  
  logic [2:0] grant_next;
  
  always @(posedge clk)
    if(reset) grant <= 3'b000;
    else grant <= grant_next;
  
  
  assign grant_next[2] = req[2];
  assign grant_next[1]= ~req[2] & req[1];
  assign grant_next[0]= ~req[2] & ~req[1] & req[0];
  
endmodule
