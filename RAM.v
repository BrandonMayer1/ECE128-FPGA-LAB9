`timescale 1ns / 1ps
module RAM(i_clk, i_rst, i_write_en, i_addr, i_write_data, o_read_data);

input i_clk, i_rst, i_write_en;
input [2:0] i_addr;
input [7:0] i_write_data;
output reg [7:0] o_read_data;

reg [7:0] mem [0:7]; // 8 words, 8 bits each

integer i;

always @(posedge i_clk) begin
    if (i_rst) begin
        for (i = 0; i < 8; i = i + 1) begin //reset sets everything zero
            mem[i] <= 0;
        end
        o_read_data <= 0;
    end
    else begin
        if (i_write_en) begin
            // write first, read the new data
            mem[i_addr] <= i_write_data;
            o_read_data <= i_write_data;
        end
        else
            o_read_data <= mem[i_addr];
    end
end

endmodule
