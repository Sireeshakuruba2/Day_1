// Code your design here
module set_bit_index (in,out,clk,reset);
  input  logic [31:0] in;
  output logic [5:0] out;
  input logic clk,reset;
  logic [5:0] count;
  integer j;
  integer done;
  always_comb
    begin
       count=6'h0;
      done=1'b0;
      for (j=0;j<32;j=j+1) begin
        if((in[j]==1) && !done)
            begin
            count=j;
              done=1;
            end
        end
    end
  always_ff @(posedge clk or negedge reset)
    begin
      if(!reset)
        out <= 6'h0;
      else
        out <= count;
    end
endmodule
