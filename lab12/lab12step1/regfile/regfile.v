module regfile(DATAP3, DATAP2, DATAP1, DATAP0, DATAQ3, DATAQ2, DATAQ1, DATAQ0, RP2, RP1, RP0, RQ2, RQ1, RQ0, WA2, WA1, WA0, LD_DATA, WR, CLRN, CLK);

	input RP2, RP1, RP0, RQ2, RQ1, RQ0, WA2, WA1, WA0, WR, CLRN, CLK;

	input [3:0] LD_DATA;

	output DATAP3, DATAP2, DATAP1, DATAP0, DATAQ3, DATAQ2, DATAQ1, DATAQ0;

	Decoder3to8 my_decoder(.en(WR), .x2(x2), .x1(x1), .x0(x0), .w0(w0), .w1(w1), .w2(w2), .w3(w3), .w4(w4), .w5(w5), .w6(w6), .w7(w7));

	reg4 my_reg0(.IN(LD_DATA), .LOAD(Y0), .clock(clock), .OUT(R0), .CLRN(CLRN));

	Mux8_4b my_muxP(.s2(RP2), .s1(RP1), .s0(RP0), .w0(VALUE0), .w1(VALUE1), .w2(VALUE2), .w3(VALUE3), .w4(VALUE4), .w5(VALUE5), .w6(VALUE6), .w7(VALUE7), .f(DATAP));

	assign DATAP3 = DATAP[3];
	assign DATAP2 = DATAP[2];
	assign DATAP1 = DATAP[1];
	assign DATAP0 = DATAP[0];

	wire [3:0] DATAP, DATAQ;
	wire [3:0] VALUE0, VALUE1, VALUE2, VALUE3, VALUE4, VALUE5, VALUE6, VALUE7;

endmodule
