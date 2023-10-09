// Fsm design of divisible by 3 logic for serial input.
//Assune i/p goes to the LSB of previously seen number.

module div_by_3 (input logic x, logic clk, logic reset, output logic y);
  logic [1:0] state;
  logic [1:0] nxt_state;
 // parameter prev_val = 32'h0;
  
  always_ff @(posedge clk)
    if(reset) 
      state <= 3'b000;
    else
      state <= nxt_state;
  
  always_comb begin
    
    case(state) 
      3'b000:if(x) nxt_state = 3'b001;
             else nxt_state = 3'b000;
      3'b001:if(x) nxt_state = 3'b000;
             else nxt_state = 3'b010;
      3'b010:if(x) nxt_state = 3'b010;
             else nxt_state = 3'b001;
      default: nxt_state = 3'b000;
      endcase
    end
  
//moore_fsm
  //assign p = (state == 3'b000);
  //mealy fsm
  assign y = (nxt_state == 3'b000 && ~x) || (nxt_state == 3'b001 && x);
endmodule
  
