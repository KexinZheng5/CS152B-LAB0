`timescale 1ns / 1ns
`include "single_digit_BCD.v"

module sdbcd_tb;

    reg [3:0] D; // input D
    reg CLK, ENABLE, LOAD, UP, CLR; // other input
    wire [3:0] Q; // output Q
    wire CO; // carry out

single_digit_BCD uut(CLK, ENABLE, LOAD, UP, CLR, D, Q, CO);

initial begin
    
    $dumpfile("test_tb.vcd");
    $dumpvars(0, sdbcd_tb);

    CLK = 1;
    CLR = 1;
    ENABLE = 1;
    LOAD = 0;
    UP = 0;
    D = 4'h9;

    // decrement
    CLK = 1;
    #20;
    CLK = 0;
    #20;

    // decrement
    CLK = 1;
    #20;
    CLK = 0;
    #20;

    // load
    LOAD = 1;
    CLK = 1;
    #20;
    CLK = 0;
    LOAD = 0;
    #20;

    // increment
    UP = 1;
    CLK = 1; 
    #20;
    CLK = 0; 
    #20;

    // increment
    CLK = 1; 
    #20;
    CLK = 0; 
    #20;

    // clear
    CLR = 0;
    #20;
    
    $display("test complete");

end

endmodule