`timescale 1ns / 1ns
`include "five_digit_adder.v"

module fda_tb;

    reg [4:0] D1, D2; // data
    wire [4:0] Out; // sum
    wire Cout; // carry out

five_digit_adder t(D1, D2, Cout, Out);

initial begin
    
    $dumpfile("test_tb.vcd");
    $dumpvars(0, fda_tb);

    // -2 + 2
    D1 = 5'b11110;
    D2 = 5'b10;
    #20;

    // -7 + 2
    D1 = 5'b11001;
    D2 = 5'b10;
    #20;

    // -2 + -2
    D1 = 5'b11001;
    D2 = 5'b11110;
    #20;

    // 2 + 7
    D1 = 5'b10;
    D2 = 5'b111;
    #20;
   
    $display("test complete");

end

endmodule