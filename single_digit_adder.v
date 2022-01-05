module single_digit_adder (D1, D2, Cin, Cout, Out);

    input D1, D2, Cin; // input 1, 2, and carry in
    output Cout, Out; // output and carry out

    wire D12, D1C, D2C; // for calculating carry out

    xor(Out, D1, D2, Cin); // calculate output
    and(D12, D1, D2);
    and(D1C, D1, Cin);
    and(D2C, D2, Cin);
    or(Cout, D12, D1C, D2C);

endmodule