module Start (input st_clk, st_button, PC_start, st_ellight,
				  end_flg1, 
				  end_flg2,
				  end_flg3,
				  end_flg4,
				  end_flg5,
				  end_flg6,
				  end_flg7,
				  end_flg8,
				  end_flg9,
				  end_flg10,
				  end_flg11,
				  end_flg12,
				  end_flg13,
				  end_flg14,
				  end_flg15,
				  end_flg16,
			  	  output reg st_o
				  
				  );


initial st_o <= 1'b0;

reg [28:0] cnt;
initial cnt <= 1'b0;


always @(posedge st_clk) begin
	
			if (st_ellight == 1'b1) begin
				st_o <= 1'b1;
			end
			
			if (PC_start == 1'b1) begin
				st_o <= 1'b1;
			end
 
			if (st_button <= 1'b0) begin
				st_o <= 1'b1;
			end
	
		
			if (end_flg1 == 1'b1 && end_flg2 == 1'b1 && end_flg3 == 1'b1 && end_flg4 == 1'b1 && 
				 end_flg5 == 1'b1 && end_flg6 == 1'b1 && end_flg7 == 1'b1 && end_flg8 == 1'b1 && 
				 end_flg9 == 1'b1 && end_flg10 == 1'b1 && end_flg11 == 1'b1 && end_flg12 == 1'b1 &&
				 end_flg13 == 1'b1 && end_flg14 == 1'b1 && end_flg15 == 1'b1 && end_flg16 == 1'b1) begin
			
				cnt <= cnt + 1'b1;			
						
			end
			
			if (cnt == 28'd100000000) begin
				cnt <= 1'b0;
				st_o <= 1'b0;
			end

end

endmodule					
