`include "single_digit_adder.v"

module five_digit_adder (D1, D2, Cout, Out);

    input [4:0] D1, D2; // input 1, 2, and carry in
    output [4:0] Out; // output and carry out
    output Cout; 
    wire carry[3:0]; 

    single_digit_adder dig0 (D1[0], D2[0], 1'b0, carry[0], Out[0]);
    single_digit_adder dig1 (D1[1], D2[1], carry[0], carry[1], Out[1]);
    single_digit_adder dig2 (D1[2], D2[2], carry[1], carry[2], Out[2]);
    single_digit_adder dig3 (D1[3], D2[3], carry[2], carry[3], Out[3]);
    single_digit_adder dig4 (D1[4], D2[4], carry[3], Cout, Out[4]);

endmodule