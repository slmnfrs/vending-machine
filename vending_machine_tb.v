module vending_machine_tb;

    reg clk;
    reg rst;
    reg [1:0] in;
    wire out;
    wire [1:0] change;

    vending_machine dut(
        .clk(clk),      // fix 1: added commas between port connections
        .rst(rst),
        .in(in),
        .out(out),
        .change(change)
    );

    // fix 2: wrapped all procedural statements in initial block
    initial begin
        $dumpfile("vending_machine.v");  // fix 3: S → $
        $dumpvars(0, vending_machine_tb);           // fix 4: S → $
        rst = 1;
        clk = 0;
        #6  rst = 0;
        in = 1;         // fix 5: ] → nothing (removed wrong bracket)
        #11 in = 1;     // fix 6: t11 → #11
        #16 in = 1;     // fix 7: added space after #16
        #25 $finish;    // fix 8: S → $
    end

    always #5 clk = ~clk;  // fix 9: c1k → clk, fix 10: colon → semicolon

endmodule