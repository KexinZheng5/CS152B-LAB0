`timescale 1ns / 1ns
`include "six_digit_adder.v"

module sda_tb;

    reg [5:0] D1, D2; // data
    wire [5:0] Out; // sum
    wire Cout; // carry out

six_digit_adder t(D1, D2, Cout, Out);

initial begin
    
    $dumpfile("test_tb.vcd");
    $dumpvars(0, sda_tb);

    // -2 + 2
    D1 = 6'b11110;
    D2 = 6'b10;
    #20;

    // -7 + 2
    D1 = 6'b11001;
    D2 = 6'b10;
    #20;

    // -2 + -2
    D1 = 6'b11001;
    D2 = 6'b11110;
    #20;

    // 2 + 7
    D1 = 6'b10;
    D2 = 6'b111;
    #20;
   
    $display("test complete");

end

endmodule