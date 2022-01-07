`timescale 1ns / 1ns
`include "BCD_divisible_by_11.v"

module BCD_divisible_by_11_tb;

    reg [15:0] D; // data
    wire Q; // output

BCD_divisible_by_11 uut(D, Q);

initial begin
    
    $dumpfile("test_tb.vcd");
    $dumpvars(0, BCD_divisible_by_11_tb);

    // not divisible
    D = 16'h2121;
    #20;

    // not divisible
    D = 16'h2122;
    #20;

    // not divisible
    D = 16'h3111;
    #20;

    // not divisible
    D = 16'h5000;
    #20;

        // not divisible
    D = 16'h0500;
    #20;

        // not divisible
    D = 16'h0050;
    #20;


    // not divisible
    D = 16'h0005;
    #20;

    // not divisible
    D = 16'h9090;
    #20;

    // not divisible
    D = 16'h0909;
    #20;

    // divisible
    D = 16'h7777;
    #20;

    // divisible
    D = 16'h0000;
    #20;

        // divisible
    D = 16'h9999;
    #20;

    // divisible
    D = 16'h9119;
    #20;

    // divisible
    D = 16'h9240;
    #20;

    // divisible
    D = 16'h8272;
    #20;

    // divisible
    D = 16'h0704;
    #20;

    $display("test complete");

end

endmodule