ECE 128 Lab 9 - ROM and RAM
For this lab we made an 8x4 ROM and an 8x8 RAM in Verilog and tested them with testbenches. ROM.v and RAM.v have their data in the code, and ROM_File.v and RAM_File.v load their data from rom_data.txt and ram_data.txt instead.

How to run
Make a new Vivado project for the Basys 3.
Add ROM.v, ROM_File.v, RAM.v, RAM_File.v, rom_data.txt, and ram_data.txt as design sources.
Add the tb_ files as simulation sources.
Set the testbench you want as top and click Run Behavioral Simulation.
For area, set a module as top under Design Sources, run synthesis, and open the utilization report.
