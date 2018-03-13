module SEG7_LUT	(
    segment,
    iDIG
);

    input	[3:0]	iDIG;
    output	[6:0]	segment;
    reg		[6:0]	segment;

    always @(iDIG)
    begin
    	case(iDIG)
    	4'h1: segment = 7'b1111001;	// ---t----
    	4'h2: segment = 7'b0100100; 	// |	  |
    	4'h3: segment = 7'b0110000; 	// lt	 rt
    	4'h4: segment = 7'b0011001; 	// |	  |
    	4'h5: segment = 7'b0010010; 	// ---m----
    	4'h6: segment = 7'b0000010; 	// |	  |
    	4'h7: segment = 7'b1111000; 	// lb	 rb
    	4'h8: segment = 7'b0000000; 	// |	  |
    	4'h9: segment = 7'b0011000; 	// ---b----
    	4'ha: segment = 7'b0001000;
    	4'hb: segment = 7'b0000011;
    	4'hc: segment = 7'b1000110;
    	4'hd: segment = 7'b0100001;
    	4'he: segment = 7'b0000110;
    	4'hf: segment = 7'b0001110;
    	4'h0: segment = 7'b1000000;
    	endcase
    end

endmodule

module segment7 (
    segment0,
    segment1,
    segment2,
    segment3,
    segment4,
    segment5,
    digits
);
    input	[23:0]	digits;
    output	[6:0]	segment0, segment1, segment2, segment3, segment4, segment5;

    SEG7_LUT	u0	(	segment0, digits[3:0]		);
    SEG7_LUT	u1	(	segment1, digits[7:4]		);
    SEG7_LUT	u2	(	segment2, digits[11:8]	);
    SEG7_LUT	u3	(	segment3, digits[15:12]	);
    SEG7_LUT	u4	(	segment4, digits[19:16]	);
    SEG7_LUT	u5	(	segment5, digits[23:20]	);


endmodule
