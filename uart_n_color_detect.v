module uart_n_color_detect(
	input clk_color,
	input color_input,
	input [1:0] Unit_at,
	output S0,
	output S1,
	output S2,
	output S3,
	output led_R,
	output led_G,
	output led_B, 
	
	input clk_uart,
	output tx_serial
);

	wire [2:0] w_color_in;
	wire [7:0] w_tx_byte;
	wire w_tx_data_valid;
	wire w_tx_done;

	
	
	sm_0535_colour_sensor_detection c_sd_1(
	 .clk (clk_color),
	 .color_input (color_input),
	 .S0 (S0),
	 .S1 (S1),
	 .S2 (S2),
	 .S3 (S3),
	 .color (w_color_in),
	 .led_R (led_R),
	 .led_G (led_G),
	 .led_B (led_B)
	);

	
	sm_0535_uart_controller cont_1(
	 .clk (clk_uart),
	 .o_tx_done (w_tx_done),
	 .color_in (w_color_in),
	 .Unit_at (Unit_at),
	 .tx_data_valid (w_tx_data_valid),
	 .tx_byte (w_tx_byte)
	);
		
	sm_0535UART_TRANSMITTER trans_1(
		 .CLOCK (clk_uart),	          //Clock input
		 .TX_DATA_VALID (w_tx_data_valid),		//Input Bitstream  	
		 .TX_BYTE (w_tx_byte),
		 .O_TX_SERIAL (tx_serial),		
	    .O_TX_DONE (w_tx_done)	
	
	);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
endmodule 