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
      2'b00:if(x) nxt_state = 2'001;
             else nxt_state = 2'b00;
      2'b01:if(x) nxt_state = 2'b00;
             else nxt_state = 2'b10;
      2'b10:if(x) nxt_state = 2'b10;
             else nxt_state = 2'b01;
      default: nxt_state = 2'b00;
      endcase
    end
  
//moore_fsm
  //assign p = (state == 2'b00);
  //mealy fsm
  assign y = (nxt_state == 2'b00 && ~x) || (nxt_state == 2'b01 && x);
endmodule
  
