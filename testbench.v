module testbench;

  // Inputs
  reg [3:0] xi;
  reg [3:0] yi;

  // Outputs
  wire co;
  wire [3:0] zi;
  

  // Instantiate the Unit Under Test (UUT)
  sum4bcc uut (
    .xi(xi), 
    .yi(yi), 
    .co(co), 
    .zi(zi)
  );

  initial begin
    xi=0;
    for (yi = 0; yi < 16; yi = yi + 1) begin
      if (yi==0)
		xi=xi+1;
		#5;
    end
  end     
  
  
  
  
  initial begin: TEST_CASE
  
	$dumpfile("testbench.vcd");
	
	$dumpvars(-1,uut);
	
	#(1200)$finish;
	
	end
  
  

endmodule 