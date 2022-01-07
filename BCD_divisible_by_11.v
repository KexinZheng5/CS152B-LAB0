`include "six_digit_adder.v"

module BCD_divisible_by_11 (D, Q);

    input [15:0] D; // input 1, 2, and carry in
    output Q; // output and carry out

    wire [5:0] a, b1, b2, b3, c, d1, d2, d3; // extend each number to 6 bits
    wire c1, c2, c3, c4, c5; // carry

    wire [5:0] sum1, sum2, sum3; // sums

    // load each digit as a 6 digit binary number
    assign a = {2'b00, D[15:12]};
    assign b1 = {2'b00, D[11:8]};
    assign c = {2'b00, D[7:4]};
    assign d1 = {2'b00, D[3:0]};

    // perform 2's complement on the second and last digit
    not(b2[0], b1[0]);
    not(b2[1], b1[1]);
    not(b2[2], b1[2]);
    not(b2[3], b1[3]);
    not(b2[4], b1[4]);
    not(b2[5], b1[5]);
    six_digit_adder add0 (b2, 6'b000001, c1, b3);
    not(d2[0], d1[0]);
    not(d2[1], d1[1]);
    not(d2[2], d1[2]);
    not(d2[3], d1[3]);
    not(d2[4], d1[4]);
    not(d2[5], d1[5]);
    six_digit_adder add1 (d2, 6'b000001, c2, d3);

    // add all 4 numbers
    six_digit_adder add2 (a, b3, c3, sum1);
    six_digit_adder add3 (sum1, c, c4, sum2);
    six_digit_adder add4 (sum2, d3, c5, sum3);

    // set output to true if all bits in sum3 are zero
    nor(Q, sum3[0], sum3[1], sum3[2], sum3[3], sum3[4], sum3[5]);

endmodule