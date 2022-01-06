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
	
	localparam t = 10;

	initial begin
		// Initialize Inputs
		D = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		D = 16'b0000_0000_0000_0000;	//0
		#t
		$display("BCD = 0 | Result: %b", Q);
		#t
		
		D = 16'b0000_0000_0000_0001;	//1
		#t
		$display("BCD = 1 | Result: %b", Q);
		#t
		
		D = 16'b0000_0000_0000_0011;	//3
		#t
		$display("BCD = 3 | Result: %b", Q);
		#t
		
		D = 16'b1001_1001_1001_1001;	// 9999
		#t
		$display("BCD = 9999 | Result: %b", Q);
		#t
		
		D = 16'b1001_1001_0000_1001;	// 9909
		#t
		$display("BCD = 9909 | Result: %b", Q);
		#t
		
		D = 16'b1001_0000_1001_0000;	// 9090
		#t
		$display("BCD = 9090 | Result: %b", Q);
		#t
		
		D = 16'b0001_0010_0011_0100;   // 1234
		#t
		$display("BCD = 1234 | Result: %b", Q);
		#t
		
		
		D = 16'b0010_0010_0001_0100;	// 2214
		#t
		$display("BCD = 2214 | Result: %b", Q);
		#t
		
		
		D = 16'b1000_0011_0001_0100;	// 8314
		#t
		$display("BCD = 8314 | Result: %b", Q);
		#t

		D = 16'b0011_0011_0011_0011;	// 3333
		#t
		$display("BCD = 3333 | Result: %b", Q);
		#t	
		
		$finish;
  
	end
      
endmodule