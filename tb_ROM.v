`timescale 1ns / 1ps
// ROM: 0, 12, 6, 7, 8, 1, 13, 14
module tb_ROM();

reg [2:0] addr;
wire [3:0] data;

ROM uut(.ROM_data(data), .ROM_addr(addr));

initial begin
    addr = 3'd0; #10; $display("ROM[0] = %0d (should be 0)", data);
    addr = 3'd1; #10; $display("ROM[1] = %0d (should be 12)", data);
    addr = 3'd2; #10; $display("ROM[2] = %0d (should be 6)", data);
    addr = 3'd3; #10; $display("ROM[3] = %0d (should be 7)", data);
    addr = 3'd4; #10; $display("ROM[4] = %0d (should be 8)", data);
    addr = 3'd5; #10; $display("ROM[5] = %0d (should be 1)", data);
    addr = 3'd6; #10; $display("ROM[6] = %0d (should be 13)", data);
    addr = 3'd7; #10; $display("ROM[7] = %0d (should be 14)", data);

    $finish;
end

endmodule
