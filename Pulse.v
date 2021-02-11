///////////////////////////////////////////////////////////
// Name File : Pulse.v 												//
// Autor : Dyomkin Pavel Mikhailovich 							//
// Company : GSC RF TRINITI										//
// Description : The generator of a single pulse		  	//
// Start design : 28.10.2020 										//
// Last revision : 28.10.2020 									//
///////////////////////////////////////////////////////////
module Pulse (input clk_Pulse, PL_start, PL_launch,
				  input [3:0] CHTS, 
				  input [4:0] pl_mlt,
				  input [16:0] duration, 
				  output reg PL_out, launch_DL
				 );
				
reg [36:0] cnt1;
reg [20:0] cnt2;
initial cnt1 <= 1'b0;
initial cnt2 <= 1'b0;
initial PL_out <= 1'b0;
initial launch_DL <= 1'b0;


always @(posedge clk_Pulse) begin
	
	
	if (pl_mlt == 4'd1) begin				
				
			if (CHTS == 3'd1) begin
				
					if (PL_start == 7'd1) begin
						cnt1 <= cnt1 + 1'b1;
						PL_out <= 1'b1;
					end
					
					if (cnt1 >= duration) begin
						PL_out <= 1'b0;
						launch_DL <= 1'b1;     
					end	
					
					if (PL_start == 1'b0) begin
						cnt1 <= 1'b0;
						launch_DL <= 1'b0;		
					end
				
			end

				
			else if (CHTS == 3'd2) begin 
					
					if (PL_launch == 1'b1) begin
						cnt1 <= cnt1 + 1'b1;
						PL_out <= 1'b1;
					end
					
					if (cnt1 >= duration) begin
						PL_out <= 1'b0;
						launch_DL <= 1'b1;     
					end	
					
					if (PL_launch == 1'b0) begin
						cnt1 <= 1'b0;
						launch_DL <= 1'b0;		
					end
			end
				
	end
		
		
		
		
	
	else if (pl_mlt == 4'd2) begin				
		
		if (CHTS == 3'd1) begin
		
			if (PL_start == 1'b1) begin
				cnt1 <= cnt1 + 1'b1;
				PL_out <= 1'b1;
			end
			
			if (cnt1 >= duration - 1) begin
				cnt2 <= cnt2 + 1'b1;
				cnt1 <= 1'b0;		
			end
			
			if (cnt2 >= 99) begin
				PL_out <= 1'b0;
				launch_DL <= 1'b1;
				cnt2 <= 101;
			end	
					
			if (PL_start == 1'b0) begin
				cnt1 <= 1'b0;
				cnt2 <= 1'b0;
				launch_DL <= 1'b0;
			end	
		end
	
		
		if (CHTS == 3'd2) begin
		
			if (PL_launch == 1'b1) begin
				cnt1 <= cnt1 + 1'b1;
				PL_out <= 1'b1;
			end
			
			if (cnt1 >= duration - 1) begin
				cnt2 <= cnt2 + 1'b1;
				cnt1 <= 1'b0;		
			end
			
			if (cnt2 >= 99) begin
				PL_out <= 1'b0;
				launch_DL <= 1'b1;
				cnt2 <= 101;
			end	
			
		
			if (PL_launch == 1'b0) begin
				cnt1 <= 1'b0;
				cnt2 <= 1'b0;
				launch_DL <= 1'b0;	
			end
		end
	end
	
	
	else begin				
		
		if (CHTS == 3'd1) begin
		
			if (PL_start == 1'b1) begin
				cnt1 <= cnt1 + 1'b1;
				PL_out <= 1'b1;
			end
			
			if (cnt1 >= duration - 1) begin
				cnt2 <= cnt2 + 1'b1;
				cnt1 <= 1'b0;		
			end
			
			if (cnt2 >= 99999) begin
				PL_out <= 1'b0;
				launch_DL <= 1'b1;
				cnt2 <= 100001;
			end	
			
		
			if (PL_start == 1'b0) begin
				cnt1 <= 1'b0;
				cnt2 <= 1'b0;
				launch_DL <= 1'b0;	
			end
		end
		
		if (CHTS == 3'd2) begin
		
			if (PL_launch == 1'b1) begin
				cnt1 <= cnt1 + 1'b1;
				PL_out <= 1'b1;
			end
			
			if (cnt1 >= duration - 1) begin
				cnt2 <= cnt2 + 1'b1;
				cnt1 <= 1'b0;		
			end
			
			if (cnt2 >= 99999) begin
				PL_out <= 1'b0;
				launch_DL <= 1'b1;
				cnt2 <= 100001;
			end	
			
		
			if (PL_launch == 1'b0) begin
				cnt1 <= 1'b0;
				cnt2 <= 1'b0;
				launch_DL <= 1'b0;	
			end
		end

	end
	
			
end		
endmodule





