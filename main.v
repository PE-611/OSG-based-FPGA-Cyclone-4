///////////////////////////////////////////////////////////
// Name File : main.v 												//
// Autor : Dyomkin Pavel Mikhailovich 							//
// Company : GSC RF TRINITI										//
// Description : The generator of optical clock pulses  	//
// Start design : 20.10.2020 										//
// Last revision : 28.10.2020 									//
///////////////////////////////////////////////////////////
module main (input clk, Rx, button, ellight,
				 output o,						// STUFF 
				 output ex_1,
				 output ex_2,
				 output ex_3,
				 output ex_4,
				 output ex_5,
				 output ex_6,
				 output ex_7, 
				 output ex_8,
				 output ex_9,
				 output ex_10,
				 output ex_11,
				 output ex_12,
				 output ex_13,
				 output ex_14,
				 output ex_15,
				 output ex_16,
				 output control_UART_clk
				 //output clk, DIV_clk//
				 );



				 
wire PC_START;

wire END_FLG1;		
wire END_FLG2;	
wire END_FLG3;	
wire END_FLG4;	
wire END_FLG5;	
wire END_FLG6;	
wire END_FLG7;	
wire END_FLG8;	
wire END_FLG9;	
wire END_FLG10;	
wire END_FLG11;	
wire END_FLG12;	
wire END_FLG13;	
wire END_FLG14;	
wire END_FLG15;	
wire END_FLG16;	

wire DIN;
wire [7:0] WR_ADDR;								// address for WRITE in RAM
wire WRITE;											// Write flag readiness byte to write on memory 	
wire READ;
			 
wire [15:0] PL1_DRT;								
wire PL1_LAUNCH_DL1;
wire [15:0] DL1_DEL;
wire DL1_LAUNCH_PL2;
wire [3:0] CH1TS;
wire [4:0] MULT_PL1;
wire [4:0] MULT_DL1;

wire [15:0] PL2_DRT;									
wire PL2_LAUNCH_DL2;
wire [15:0] DL2_DEL;
wire DL2_LAUNCH_PL3;
wire [3:0]CH2TS;
wire [4:0] MULT_PL2;
wire [4:0] MULT_DL2;

wire [15:0] PL3_DRT;								
wire PL3_LAUNCH_DL3;
wire [15:0] DL3_DEL;
wire DL3_LAUNCH_PL4;
wire [3:0]CH3TS;
wire [4:0] MULT_PL3;
wire [4:0] MULT_DL3;

wire [15:0] PL4_DRT;								
wire PL4_LAUNCH_DL4;
wire [15:0] DL4_DEL;
wire DL4_LAUNCH_PL5;
wire [3:0]CH4TS;
wire [4:0] MULT_PL4;
wire [4:0] MULT_DL4;

wire [15:0] PL5_DRT;								
wire PL5_LAUNCH_DL5;
wire [15:0] DL5_DEL;
wire DL5_LAUNCH_PL6;
wire [3:0]CH5TS;
wire [4:0] MULT_PL5;
wire [4:0] MULT_DL5;

wire [15:0] PL6_DRT;								
wire PL6_LAUNCH_DL6;
wire [15:0] DL6_DEL;
wire DL6_LAUNCH_PL7;
wire [3:0]CH6TS;
wire [4:0] MULT_PL6;
wire [4:0] MULT_DL6;

wire [15:0] PL7_DRT;								
wire PL7_LAUNCH_DL7;
wire [15:0] DL7_DEL;
wire DL7_LAUNCH_PL8;
wire [3:0]CH7TS;
wire [4:0] MULT_PL7;
wire [4:0] MULT_DL7;

wire [15:0] PL8_DRT;								
wire PL8_LAUNCH_DL8;
wire [15:0] DL8_DEL;
wire DL8_LAUNCH_PL9;
wire [3:0]CH8TS;
wire [4:0] MULT_PL8;
wire [4:0] MULT_DL8;

wire [15:0] PL9_DRT;								
wire PL9_LAUNCH_DL9;
wire [15:0] DL9_DEL;
wire DL9_LAUNCH_PL10;
wire [3:0]CH9TS;
wire [4:0] MULT_PL9;
wire [4:0] MULT_DL9;

wire [15:0] PL10_DRT;									
wire PL10_LAUNCH_DL10;
wire [15:0] DL10_DEL;
wire DL10_LAUNCH_PL11;
wire [3:0]CH10TS;
wire [4:0] MULT_PL10;
wire [4:0] MULT_DL10;

wire [15:0] PL11_DRT;								
wire PL11_LAUNCH_DL11;
wire [15:0] DL11_DEL;
wire DL11_LAUNCH_PL12;
wire [3:0]CH11TS;
wire [4:0] MULT_PL11;
wire [4:0] MULT_DL11;

wire [15:0] PL12_DRT;								
wire PL12_LAUNCH_DL12;
wire [15:0] DL12_DEL;
wire DL12_LAUNCH_PL13;
wire [3:0]CH12TS;
wire [4:0] MULT_PL12;
wire [4:0] MULT_DL12;

wire [15:0] PL13_DRT;								
wire PL13_LAUNCH_DL13;
wire [15:0] DL13_DEL;
wire DL13_LAUNCH_PL14;
wire [3:0]CH13TS;
wire [4:0] MULT_PL13;
wire [4:0] MULT_DL13;

wire [15:0] PL14_DRT;								
wire PL14_LAUNCH_DL14;
wire [15:0] DL14_DEL;
wire DL14_LAUNCH_PL15;
wire [3:0]CH14TS;
wire [4:0] MULT_PL14;
wire [4:0] MULT_DL14;

wire [15:0] PL15_DRT;								
wire PL15_LAUNCH_DL15;
wire [15:0] DL15_DEL;
wire DL15_LAUNCH_PL16;
wire [3:0]CH15TS;
wire [4:0] MULT_PL15;
wire [4:0] MULT_DL15;

wire [15:0] PL16_DRT;								
wire PL16_LAUNCH_DL16;
wire [15:0] DL16_DEL;
wire DL16_LAUNCH_PL17;
wire [3:0]CH16TS;
wire [4:0] MULT_PL16;
wire [4:0] MULT_DL16;


//wire [7:0] data_from_RAM;

wire [7:0] d;										// Data from UART Rx		 
wire [7:0] d_src;									// Buff reg for nversion of bits in a receive byte
assign d_src = {d[0], d[1], d[2], d[3], d[4], d[5], d[6], d[7]}; //for inversion of bits in a byte (concatenation)



Start (.st_clk(clk), .st_button(button), .st_o(o), .PC_start(PC_START), .st_ellight(ellight), .end_flg1(END_FLG1),
.end_flg2(END_FLG2), .end_flg3(END_FLG3), .end_flg4(END_FLG4), .end_flg5(END_FLG5), .end_flg6(END_FLG6), .end_flg7(END_FLG7),
.end_flg8(END_FLG8), .end_flg9(END_FLG9), .end_flg10(END_FLG10), .end_flg11(END_FLG11), .end_flg12(END_FLG12), .end_flg13(END_FLG13),
.end_flg14(END_FLG14), .end_flg15(END_FLG15), .end_flg16(END_FLG16)); //.ready_to_start(READY_TO_START),


UART_Rx (.clk_Rx(clk), .Rx_in(Rx), .data_out(d), .UART_clk(control_UART_clk), .wr(WRITE), .wr_addr(WR_ADDR), .re(READ));//, .PC_start(PC_START));


RAM (.in(d_src), .clk_RAM(clk), .write(WRITE), .w_addr(WR_ADDR), .pc_start(PC_START), .read(READ), //.out(data_from_RAM), 

.PL1_drt(PL1_DRT), .DL1_del(DL1_DEL), .ch1_type_start(CH1TS), .Mult_PL1(MULT_PL1), .Mult_DL1(MULT_DL1), 
.PL2_drt(PL2_DRT), .DL2_del(DL2_DEL), .ch2_type_start(CH2TS), .Mult_PL2(MULT_PL2), .Mult_DL2(MULT_DL2),

.PL3_drt(PL3_DRT), .DL3_del(DL3_DEL), .ch3_type_start(CH3TS), .Mult_PL3(MULT_PL3), .Mult_DL3(MULT_DL3),
.PL4_drt(PL4_DRT), .DL4_del(DL4_DEL), .ch4_type_start(CH4TS), .Mult_PL4(MULT_PL4), .Mult_DL4(MULT_DL4),

.PL5_drt(PL5_DRT), .DL5_del(DL5_DEL), .ch5_type_start(CH5TS), .Mult_PL5(MULT_PL5), .Mult_DL5(MULT_DL5),
.PL6_drt(PL6_DRT), .DL6_del(DL6_DEL), .ch6_type_start(CH6TS), .Mult_PL6(MULT_PL6), .Mult_DL6(MULT_DL6),

.PL7_drt(PL7_DRT), .DL7_del(DL7_DEL), .ch7_type_start(CH7TS), .Mult_PL7(MULT_PL7), .Mult_DL7(MULT_DL7),
.PL8_drt(PL8_DRT), .DL8_del(DL8_DEL), .ch8_type_start(CH8TS), .Mult_PL8(MULT_PL8), .Mult_DL8(MULT_DL8),

.PL9_drt(PL9_DRT), .DL9_del(DL9_DEL), .ch9_type_start(CH9TS), .Mult_PL9(MULT_PL9), .Mult_DL9(MULT_DL9),
.PL10_drt(PL10_DRT), .DL10_del(DL10_DEL), .ch10_type_start(CH10TS), .Mult_PL10(MULT_PL10), .Mult_DL10(MULT_DL10),

.PL11_drt(PL11_DRT), .DL11_del(DL11_DEL), .ch11_type_start(CH11TS), .Mult_PL11(MULT_PL11), .Mult_DL11(MULT_DL11),
.PL12_drt(PL12_DRT), .DL12_del(DL12_DEL), .ch12_type_start(CH12TS), .Mult_PL12(MULT_PL12), .Mult_DL12(MULT_DL12),

.PL13_drt(PL13_DRT), .DL13_del(DL13_DEL), .ch13_type_start(CH13TS), .Mult_PL13(MULT_PL13), .Mult_DL13(MULT_DL13),
.PL14_drt(PL14_DRT), .DL14_del(DL14_DEL), .ch14_type_start(CH14TS), .Mult_PL14(MULT_PL14), .Mult_DL14(MULT_DL14),

.PL15_drt(PL15_DRT), .DL15_del(DL15_DEL), .ch15_type_start(CH15TS), .Mult_PL15(MULT_PL15), .Mult_DL15(MULT_DL15),
.PL16_drt(PL16_DRT), .DL16_del(DL16_DEL), .ch16_type_start(CH16TS), .Mult_PL16(MULT_PL16), .Mult_DL16(MULT_DL16)
);





Pulse PL1 (.clk_Pulse(clk), .duration(PL1_DRT),  .PL_start(o), .launch_DL(PL1_LAUNCH_DL1), .CHTS(CH1TS), .pl_mlt(MULT_PL1));// .PL_out(ex_1),
Delay DL1 (.clk_Delay(clk), .delay(DL1_DEL), .DL_launch(PL1_LAUNCH_DL1), .launch_PL(DL1_LAUNCH_PL2), .DL_out(ex_1),  .dl_mlt(MULT_DL1), .End_Flg (END_FLG1));  // 



Pulse PL2 (.clk_Pulse(clk), .duration(PL2_DRT),  .PL_start(o), .PL_launch(DL1_LAUNCH_PL2),  .launch_DL(PL2_LAUNCH_DL2), .CHTS(CH2TS), .pl_mlt(MULT_PL2));// .PL_out(ex_2),
Delay DL2 (.clk_Delay(clk), .delay(DL2_DEL), .DL_launch(PL2_LAUNCH_DL2),  .launch_PL(DL2_LAUNCH_PL3), .DL_out(ex_2), .dl_mlt(MULT_DL2), .End_Flg (END_FLG2)); // 



Pulse PL3 (.clk_Pulse(clk), .duration(PL3_DRT), .PL_start(o), .PL_launch(DL2_LAUNCH_PL3),  .launch_DL(PL3_LAUNCH_DL3), .CHTS(CH3TS), .pl_mlt(MULT_PL3));// .PL_out(ex_3)
Delay DL3 (.clk_Delay(clk), .delay(DL3_DEL), .DL_launch(PL3_LAUNCH_DL3),  .launch_PL(DL3_LAUNCH_PL4), .DL_out(ex_3), .dl_mlt(MULT_DL3), .End_Flg (END_FLG3)); // 


Pulse PL4 (.clk_Pulse(clk), .duration(PL4_DRT),  .PL_start(o), .PL_launch(DL3_LAUNCH_PL4),  .launch_DL(PL4_LAUNCH_DL4), .CHTS(CH4TS), .pl_mlt(MULT_PL4));// .PL_out(ex_4),
Delay DL4 (.clk_Delay(clk), .delay(DL4_DEL), .DL_launch(PL4_LAUNCH_DL4),  .launch_PL(DL4_LAUNCH_PL5), .DL_out(ex_4), .dl_mlt(MULT_DL4), .End_Flg (END_FLG4)); // 



Pulse PL5 (.clk_Pulse(clk), .duration(PL5_DRT),  .PL_start(o), .PL_launch(DL4_LAUNCH_PL5),  .launch_DL(PL5_LAUNCH_DL5), .CHTS(CH5TS), .pl_mlt(MULT_PL5));// .PL_out(ex_5),
Delay DL5 (.clk_Delay(clk), .delay(DL5_DEL), .DL_launch(PL5_LAUNCH_DL5),  .launch_PL(DL5_LAUNCH_PL6), .DL_out(ex_5), .dl_mlt(MULT_DL5), .End_Flg (END_FLG5)); // 



Pulse PL6 (.clk_Pulse(clk), .duration(PL6_DRT),  .PL_start(o), .PL_launch(DL5_LAUNCH_PL6),  .launch_DL(PL6_LAUNCH_DL6), .CHTS(CH6TS), .pl_mlt(MULT_PL6));// .PL_out(ex_6),
Delay DL6 (.clk_Delay(clk), .delay(DL6_DEL), .DL_launch(PL6_LAUNCH_DL6),  .launch_PL(DL6_LAUNCH_PL7), .DL_out(ex_6), .dl_mlt(MULT_DL6), .End_Flg (END_FLG6)); // 



Pulse PL7 (.clk_Pulse(clk), .duration(PL7_DRT),  .PL_start(o), .PL_launch(DL6_LAUNCH_PL7),  .launch_DL(PL7_LAUNCH_DL7), .CHTS(CH7TS), .pl_mlt(MULT_PL7));// .PL_out(ex_7),
Delay DL7 (.clk_Delay(clk), .delay(DL7_DEL), .DL_launch(PL7_LAUNCH_DL7),  .launch_PL(DL7_LAUNCH_PL8), .DL_out(ex_7), .dl_mlt(MULT_DL7), .End_Flg (END_FLG7)); // 



Pulse PL8 (.clk_Pulse(clk), .duration(PL8_DRT),  .PL_start(o), .PL_launch(DL7_LAUNCH_PL8),  .launch_DL(PL8_LAUNCH_DL8), .CHTS(CH8TS), .pl_mlt(MULT_PL8));// .PL_out(ex_8),
Delay DL8 (.clk_Delay(clk), .delay(DL8_DEL), .DL_launch(PL8_LAUNCH_DL8),  .launch_PL(DL8_LAUNCH_PL9), .DL_out(ex_8), .dl_mlt(MULT_DL8), .End_Flg (END_FLG8)); // 


Pulse PL9 (.clk_Pulse(clk), .duration(PL9_DRT),  .PL_start(o), .PL_launch(DL8_LAUNCH_PL9),  .launch_DL(PL9_LAUNCH_DL9), .CHTS(CH9TS), .pl_mlt(MULT_PL9));// .PL_out(ex_9),
Delay DL9 (.clk_Delay(clk), .delay(DL9_DEL), .DL_launch(PL9_LAUNCH_DL9),  .launch_PL(DL9_LAUNCH_PL10), .DL_out(ex_9), .dl_mlt(MULT_DL9), .End_Flg (END_FLG9)); // 


Pulse PL10 (.clk_Pulse(clk), .duration(PL10_DRT),  .PL_start(o), .PL_launch(DL9_LAUNCH_PL10),  .launch_DL(PL10_LAUNCH_DL10), .CHTS(CH10TS), .pl_mlt(MULT_PL10));// .PL_out(ex_10),
Delay DL10 (.clk_Delay(clk), .delay(DL10_DEL), .DL_launch(PL10_LAUNCH_DL10),  .launch_PL(DL10_LAUNCH_PL11), .DL_out(ex_10), .dl_mlt(MULT_DL10), .End_Flg (END_FLG10)); // 


Pulse PL11 (.clk_Pulse(clk), .duration(PL11_DRT),  .PL_start(o), .PL_launch(DL10_LAUNCH_PL11),  .launch_DL(PL11_LAUNCH_DL11), .CHTS(CH11TS), .pl_mlt(MULT_PL11));// .PL_out(ex_11),
Delay DL11 (.clk_Delay(clk), .delay(DL11_DEL), .DL_launch(PL11_LAUNCH_DL11),  .launch_PL(DL11_LAUNCH_PL12), .DL_out(ex_11), .dl_mlt(MULT_DL11), .End_Flg (END_FLG11)); // 


Pulse PL12 (.clk_Pulse(clk), .duration(PL12_DRT), .PL_start(o), .PL_launch(DL11_LAUNCH_PL12),  .launch_DL(PL12_LAUNCH_DL12), .CHTS(CH12TS), .pl_mlt(MULT_PL12));// .PL_out(ex_12), 
Delay DL12 (.clk_Delay(clk), .delay(DL12_DEL), .DL_launch(PL12_LAUNCH_DL12),  .launch_PL(DL12_LAUNCH_PL13), .DL_out(ex_12), .dl_mlt(MULT_DL12), .End_Flg (END_FLG12)); // 

Pulse PL13 (.clk_Pulse(clk), .duration(PL13_DRT),  .PL_start(o), .PL_launch(DL12_LAUNCH_PL13),  .launch_DL(PL13_LAUNCH_DL13), .CHTS(CH13TS), .pl_mlt(MULT_PL13));// .PL_out(ex_13),
Delay DL13 (.clk_Delay(clk), .delay(DL13_DEL), .DL_launch(PL13_LAUNCH_DL13),  .launch_PL(DL13_LAUNCH_PL14), .DL_out(ex_13), .dl_mlt(MULT_DL13), .End_Flg (END_FLG13)); // 


Pulse PL14 (.clk_Pulse(clk), .duration(PL14_DRT),  .PL_start(o), .PL_launch(DL13_LAUNCH_PL14),  .launch_DL(PL14_LAUNCH_DL14), .CHTS(CH14TS), .pl_mlt(MULT_PL14));// .PL_out(ex_14),
Delay DL14 (.clk_Delay(clk), .delay(DL14_DEL), .DL_launch(PL14_LAUNCH_DL14),  .launch_PL(DL14_LAUNCH_PL15), .DL_out(ex_14), .dl_mlt(MULT_DL14), .End_Flg (END_FLG14)); // 


Pulse PL15 (.clk_Pulse(clk), .duration(PL15_DRT),  .PL_start(o), .PL_launch(DL14_LAUNCH_PL15),  .launch_DL(PL15_LAUNCH_DL15), .CHTS(CH15TS), .pl_mlt(MULT_PL15));// .PL_out(ex_15),
Delay DL15 (.clk_Delay(clk), .delay(DL15_DEL), .DL_launch(PL15_LAUNCH_DL15), .launch_PL(DL15_LAUNCH_PL16), .DL_out(ex_15), .dl_mlt(MULT_DL15), .End_Flg (END_FLG15)); // 


Pulse PL16 (.clk_Pulse(clk), .duration(PL16_DRT), .PL_start(o), .PL_launch(DL15_LAUNCH_PL16),  .launch_DL(PL16_LAUNCH_DL16), .CHTS(CH16TS), .pl_mlt(MULT_PL16));// .PL_out(ex_16), 
Delay DL16 (.clk_Delay(clk), .delay(DL16_DEL), .DL_launch(PL16_LAUNCH_DL16),  .launch_PL(DL16_LAUNCH_PL17), .dl_mlt(MULT_DL16), .DL_out(ex_16), .End_Flg (END_FLG16)); //  






//DLST ST1(.clk_dlst(clk), .din(DIN), .dout(END_FLG));



endmodule					

