module BCD_division_by_3_tb;

	// Inputs
	reg [15:0] D;

	// Outputs
	wire Q;

	// Instantiate the Unit Under Test (UUT)
	BCD_divisible_by_3 uut (
		.D(D), 
		.Q(Q)
	);
	

	initial begin
		// Initialize Inputs
		D = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		// not divisible
		D = 16'h0001;	//1
		#10;

		D = 16'h1234;   // 1234
		#10;
		
		D = 16'h8314;	// 8314
		#10;
		
		D = 16'h1111;	// 1111
		#10;
		
		D = 16'h2222;	// 2222
		#10;
		
		D = 16'h5248;	// 5248
		#10;
		
		D = 16'h9998;	// 9998
		#10;
		
		D = 16'h9002;	// 9002
		#10;
		
		D = 16'h5041;	// 5041
		#10;
			
		D = 16'h1337;	// 1337
		#10;
				
				
				
		// divisible
		D = 16'h0000;	//0
		#10;
				
		D = 16'h0003;	//3
		#10;
		
		D = 16'h9999;	// 9999
		#10;
		
		D = 16'h9909;	// 9909
		#10;
		
		D = 16'h9090;	// 9090
		#10;
		
		D = 16'h1521;   // 1521
		#10;
		
		D = 16'h2214;	// 2214
		#10;

		D = 16'h3333;	// 3333
		#10;	
		
		D = 16'h8316;	// 8316
		#10;
		
		D = 16'h5043;	// 5043
		#1000;
		
		$finish;
  
	end
      
endmodule