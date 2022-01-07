module BCD_divisible_by_3(D, Q);
	input wire [15:0] D;	// 4 digit BCD number (fourth_digit, third_digit, second_digit, first_digit)
	
	output Q;			// 1 bit output
	reg result;
	
	reg [3:0] first_digit;	// store each BCD digit
	reg [3:0] second_digit;
	reg [3:0] third_digit;
	reg [3:0] fourth_digit;	
	
	reg [4:0] sum_first_second; // two 5-bit variables to store intermediate sums
	reg [4:0] sum_third_fourth;
	reg [5:0] sum_final; // 6-bit final sum: (first_digit + second_digit) + (third_digit + fourth_digit)
	
	// sum bits
	reg s1, s2, s3, s4;	// for sum_first_second
	reg s5, s6, s7, s8;	// for sum_third_fourth
	reg s9, s10, s11, s12, s13;	// for sum_final
		
	// carry bits
	reg c1, c2, c3, c4;	// for sum_first_second
	reg c5, c6, c7, c8;	// for sum_third_fourth
	reg c9, c10, c11, c12, c13;	// for sum_final
	

	always @ (D)
	begin
		first_digit = D[3:0];	// get each digit
		second_digit = D[7:4];
		third_digit = D[11:8];
		fourth_digit = D[15:12];
		
		// calculate first_digit + second_digit
		s1 = first_digit[0] ^ second_digit[0];
		c1 = first_digit[0] & second_digit[0];	
		
		s2 = first_digit[1] ^ second_digit[1] ^ c1;
		c2 = (first_digit[1] & second_digit[1]) || (first_digit[1] & c1) || (c1 & second_digit[1]);
		
		s3 = first_digit[2] ^ second_digit[2] ^ c2;
		c3 = (first_digit[2] & second_digit[2]) || (first_digit[2] & c2) || (c2 & second_digit[2]);
		
		s4 = first_digit[3] ^ second_digit[3] ^ c3;
		c4 = (first_digit[3] & second_digit[3]) || (first_digit[3] & c3) || (c3 & second_digit[3]);
		
		sum_first_second = {c4, s4, s3, s2, s1};

																	
		// calculate third_digit + fourth_digit
		
		s5 = third_digit[0] ^ fourth_digit[0];	
		c5 = third_digit[0] & fourth_digit[0];	
		
		s6 = third_digit[1] ^ fourth_digit[1] ^ c5;
		c6 = (third_digit[1] & fourth_digit[1]) || (third_digit[1] & c5) || (c5 & fourth_digit[1]);
				
		s7 = third_digit[2] ^ fourth_digit[2] ^ c6;
		c7 = (third_digit[2] & fourth_digit[2]) || (third_digit[2] & c6) || (c6 & fourth_digit[2]);
		
		s8 = third_digit[3] ^ fourth_digit[3] ^ c7;
		c8 = (third_digit[3] & fourth_digit[3]) || (third_digit[3] & c7) || (c7 & fourth_digit[3]);
		
		sum_third_fourth = {c8, s8, s7, s6, s5};
		
		
		// calculate sum_final
		
		s9 = sum_first_second[0] ^ sum_third_fourth[0];
		c9 = sum_first_second[0] & sum_third_fourth[0];
		
		s10 = sum_first_second[1] ^ sum_third_fourth[1] ^ c9;
		c10 = (sum_first_second[1] & sum_third_fourth[1]) || (sum_first_second[1] & c9) || (c9 & sum_third_fourth[1]);
		
		s11 = sum_first_second[2] ^ sum_third_fourth[2] ^ c10;
		c11 = (sum_first_second[2] & sum_third_fourth[2]) || (sum_first_second[2] & c10) || (c10 & sum_third_fourth[2]);
		
		s12 = sum_first_second[3] ^ sum_third_fourth[3] ^ c11;
		c12 = (sum_first_second[3] & sum_third_fourth[3]) || (sum_first_second[3] & c11) || (c11 & sum_third_fourth[3]);
		
		s13 = sum_first_second[4] ^ sum_third_fourth[4] ^ c12;
		c13 = (sum_first_second[4] & sum_third_fourth[4]) || (sum_first_second[4] & c12) || (c12 & sum_third_fourth[4]);
		
		sum_final = {c13, s13, s12, s11, s10, s9};	
		// final sum of all 4 BCD digits
		// max value = (9 + 9 + 9 + 9) = 36 = 6'b100100												
		// multiples of 3 between 0 and 36:
		// 0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36
		
		result = (sum_final == 6'b000000) || (sum_final == 6'b000011) || (sum_final == 6'b000110) || (sum_final == 6'b001001) || (sum_final == 6'b001100) || (sum_final == 6'b001111) || (sum_final == 6'b010010) || (sum_final == 6'b010101) ||  (sum_final == 6'b011000) || (sum_final == 6'b011011) || (sum_final == 6'b011110) || (sum_final == 6'b100001) || (sum_final == 6'b100100);
		
	end
	
	assign Q = result;
	
endmodule