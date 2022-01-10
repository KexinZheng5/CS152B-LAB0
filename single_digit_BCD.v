module single_digit_BCD (CLK, ENABLE, LOAD, UP, CLR, D, Q, CO);

    input [3:0] D; // input D
    input CLK, ENABLE, LOAD, UP, CLR; // other input
    output reg [3:0] Q; // output Q
    output reg CO; // carry out

    // changing states
    always @ (posedge CLK or CLR) begin

        // reset if CLR is 0
        if (CLR == 0) begin
            Q = 4'b0;
            CO = 0;
        end
        else if (CLK) begin
            if (ENABLE && LOAD) begin // simple load
                Q = D; 
                CO = 0;
            end
            else if (ENABLE && !LOAD && UP) begin // increment
                if (Q == 9) begin
                    Q = 0;
                    CO = 1;
                end
                else begin
                    Q = Q + 1;
                    CO = 0; 
                end
            end
            else if (ENABLE && !LOAD && !UP) begin // decrement
                if (Q == 0) begin
                    Q = 9;
                    CO = 1;
                end
                else begin
                    Q = Q - 1;
                    CO = 0; 
                end
            end
        end

    end

endmodule