`timescale 1ns / 1ps
// ram_data.txt: 5, 10, 15, 20, 25, 30, 35, 40
module tb_RAM_File();

reg clk, rst, we;
reg [2:0] addr;
reg [7:0] din;
wire [7:0] dout;

integer i;
integer errors = 0;

RAM_File uut(.i_clk(clk), .i_rst(rst), .i_write_en(we), .i_addr(addr),
             .i_write_data(din), .o_read_data(dout));

initial clk = 0;
always #5 clk = ~clk;

initial begin
    we = 0;
    addr = 0;
    din = 0;

    // reset
    rst = 1;
    #20;
    rst = 0;
    #10;

    // read the data from the text file
    for (i = 0; i < 8; i = i + 1) begin
        addr = i;
        #10;
        $display("RAM[%0d] = %0d (should be %0d)", i, dout, (i + 1) * 5);
        if (dout !== (i + 1) * 5)
            errors = errors + 1;
    end

    // write 99 into RAM[2] and read it back
    addr = 2; din = 99; we = 1; #10;
    we = 0; #10;
    $display("RAM[2] = %0d (should be 99)", dout);
    if (dout !== 99)
        errors = errors + 1;

    // save the RAM to a text file
    $writememb("ram_out.txt", uut.mem);

    $display("done, %0d errors", errors);
    $finish;
end

endmodule
