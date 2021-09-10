// fifo.sv
// Implements delay buffer (fifo)
// On reset all entries are set to 0
// Shift causes fifo to shift out oldest entry to q, shift in d

module fifo
  #(
  parameter DEPTH=8,
  parameter BITS=64
  )
  (
  input clk,rst_n,en,
  input [BITS-1:0] d,
  output [BITS-1:0] q
  );
  // your RTL code here
	logic[BITS-1:0] fifo[DEPTH-1:0];
	logic [$clog2(DEPTH)-1:0] index;

  always_ff @(posedge clk, negedge rst_n) begin
    if (~rst_n) begin
			for (int i = 0; i < DEPTH; i++) begin
        fifo[i] <= 0;
			end
			index <= 0;
    end else begin
    	if (en) begin
				fifo[index] <= d;
				index <= index + 1;
    	end
		end


  end

	assign q = fifo[index];

endmodule // fifo
