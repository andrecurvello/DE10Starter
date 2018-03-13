module clk_div(
    input             clk,
    input             rst,
    output reg [31:0] clk_div
    );

    initial begin
        clk_div = 32'b0;
    end

    always @ ( posedge clk, posedge rst) begin
        if (rst) begin
            clk_div <= 32'b0;
        end
        else begin
            clk_div <= clk_div + 32'b1;
        end
    end


endmodule
