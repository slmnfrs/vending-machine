module vending_machine(
    input clk,
    input rst,
    input [1:0]in,
    output reg out,
    output reg [1:0]change
);

   parameter s0 = 2'b00; // 0rs
   parameter s1 = 2'b01; // 5rs
   parameter s2 = 2'b10; // 10rs
   
   reg [1:0]p_state,n_state;

   always @(posedge clk ) begin
      if (rst) begin
        p_state = 0;
        n_state = 0;
        change = 2'b00;
      end
      else begin
        p_state = n_state;
      end
      case (p_state)
        s0 :
        if (in == 2'b00) begin
            n_state = s0;
            out = 0;
            change = 2'b00;
        end
        else if (in == 2'b01) begin
            n_state = s1;
            out = 0;
            change = 2'b00;
        end
        else if (in == 2'b10) begin
            n_state = s2;
            out = 0;
            change = 2'b00;
        end
        s1 :
        if (in == 2'b00) begin
            n_state = s0;
            out = 0;
            change = 2'b01;
        end
        else if (in == 2'b01) begin
            n_state = s2;
            out = 0;
            change = 2'b00;
        end
        else if (in == 2'b10) begin
            n_state = s0;
            out = 1;
            change = 2'b00;
        end
        s2 :
        if (in == 2'b00) begin
            n_state = s0;
            out = 0;
            change = 2'b10;
        end
        else if (in == 2'b01) begin
            n_state = s0;
            out = 1;
            change = 2'b00;
        end
        else if (in == 2'b10) begin
            n_state = s0;
            out = 1;
            change = 2'b01;
        end 
      endcase
   end

endmodule