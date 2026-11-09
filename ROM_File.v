`timescale 1ns / 1ps
module ROM_File(ROM_data, ROM_addr);
output [3:0] ROM_data;
input [2:0] ROM_addr;

reg [3:0] memory [0:7]; // 8 words, 4 bits each

initial begin
    $readmemb("rom_data.txt", memory); // read the ROM data from the text file
end

assign ROM_data = memory[ROM_addr];

endmodule
