module B2G (input [3:0] a, output [3:0] b);
  
  assign b = a ^ ( a>>1);
  
endmodule
