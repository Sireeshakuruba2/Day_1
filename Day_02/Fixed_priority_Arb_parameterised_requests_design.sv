module single_cycle_arbiter #(
  parameter N = 32
) (
  input   logic          clk,
  input   logic          reset,
  input   logic [N-1:0]  req,
  output  logic [N-1:0]  grant
);
  logic [N-1:0] grant_next;
  // Write your logic here...
  always @(posedge clk) begin
    if(reset) grant <= 32'b0;
    else grant <= grant_next;
  end
  
  
  genvar i;
  assign grant_next[0] = req[0];
  for(i=1;i<N;i=i+1) begin
    assign grant_next[i] = (~| grant_next[i-1:0]) && req[i] ;
  end
endmodule
