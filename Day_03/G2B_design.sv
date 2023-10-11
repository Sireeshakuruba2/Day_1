// Code your design here
module G2B (input [3:0] a, output [3:0] b);
  reg [3:0] b;
  always @(a)
    begin
      for (int i=0; i<=3; i++) begin
        b[i] = ^ (a >> i);
        end  
    end
endmodule
