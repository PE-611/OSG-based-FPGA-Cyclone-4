/////////////////////////////////////////////////////////////////
// Name File : Delay.v 														//
// Autor : Dyomkin Pavel Mikhailovich 									//
// Company : GSC RF TRINITI												//
// Description : The generator of a delay between light pulses	//
// Start design : 28.10.2020 												//
// Last revision : 28.10.2020 											//
/////////////////////////////////////////////////////////////////

module Delay (input clk_Delay, DL_launch,
				  input [16:0] delay,
				  input [4:0] dl_mlt, 
				  output reg DL_out, launch_PL, End_Flg 
				 );
				
reg [34:0] cnt1;
reg [20:0] cnt2;
initial cnt1 <= 1'b0;
initial cnt2 <= 1'b0;
initial DL_out <= 1'b0;
initial launch_PL <= 1'b0;

initial End_Flg <= 1'b0;      


always @(posedge clk_Delay) begin




if (dl_mlt == 4'd1) begin		
		
		if (DL_launch == 1'b1) begin
			cnt1 <= cnt1 + 1'b1;
			DL_out <= 1'b1;
		end
		
		if (cnt1 >= delay - 1) begin
			DL_out <= 1'b0;
			launch_PL <= 1'b1;
			End_Flg <= 1'b1;
		end	
		
		if (End_Flg == 1'b1) begin
			End_Flg <= 1'b0;
		end
		
		if (DL_launch == 1'b0) begin
			cnt1 <= 1'b0;
		   launch_PL <= 1'b0;	
		end
end


else if (dl_mlt == 4'd2) begin		
		
		if (DL_launch == 1'b1) begin
			cnt1 <= cnt1 + 1'b1;
			DL_out <= 1'b1;
		end
		
		if (cnt1 >= delay - 1) begin
			cnt2 <= cnt2 + 1'b1;
			cnt1 <= 1'b0;		
		end
		
		if (cnt2 >= 99) begin

			DL_out <= 1'b0;
			launch_PL <= 1'b1;
			End_Flg <= 1'b1;
		end	
		
		if (End_Flg == 1'b1) begin
			End_Flg <= 1'b0;
		end
		
		if (DL_launch == 1'b0) begin
			cnt1 <= 1'b0;
			cnt2 <= 1'b0;
		   launch_PL <= 1'b0;	
		end
end
		

else begin		
		
		if (DL_launch == 1'b1) begin
			cnt1 <= cnt1 + 1'b1;
			DL_out <= 1'b1;
		end
		
		if (cnt1 >= delay - 1) begin
			cnt2 <= cnt2 + 1'b1;
			cnt1 <= 1'b0;		
		end
		
		if (cnt2 >= 99999) begin
			DL_out <= 1'b0;
			launch_PL <= 1'b1;
			End_Flg <= 1'b1;
		end	
		
		if (End_Flg == 1'b1) begin
			End_Flg <= 1'b0;
		end
		
		if (DL_launch == 1'b0) begin
			cnt1 <= 1'b0;
			cnt2 <= 1'b0;
		   launch_PL <= 1'b0;	
		end
end



		
	
end




endmodule





