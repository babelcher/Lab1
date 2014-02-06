Lab1
====

## Lab1-VGA Driver

### Introduction

The purpose of this lab was to create a VGA driver to display a test pattern on a monitor. It could be done using either a Moore Machine or a Mealy Machine. For my code implementation, I chose to use a Moore Machine.



### Implementation

![Intricate shematic](schematic.jpg)

### Test/Debug

I originally began coding with previous coding methods in mind. This proved to be detrimental to my success. I then went back and began looking in the textbook for example code on how to create flip flops and the different states for a Moore Machine. Once I began following the examples in the textbook, most of the coding went really well from there on out. I also decided to use a test bench to test my two lowest level modules, h_sync_gen.vhd and v_sync_gen.vhd. I was able to iron out several syntax issues that were not apparent when using the "check syntax" button in ISE. Once these two modules worked well according to my testbenches, I implemented the vga_sync.vhd module. This module uses the two stated above within it in order to function properly. Since I knew both of the lower level modules worked correctly, it was easy to debug signal assignment issues between the two modules by creating a testbench for vga_sync.vhd. Upon completion of the testbench I determined that everything worked correctly thus far, I created and implemented the pixel_gen.vhd and atlys_lab_video.vhd modules. I did not create a test bench for these files but instead just tested them on the monitor screen. I started by just trying to make the entire monitor turn red. Once this worked I changed the colors and implemented the test pattern.

### Conclusion

An important thing I learned in this lab is that VHDL is creating hardware and traditional programming logic will lead to lots of errors. I also learned the importance of creating testbenches to test the lower level modules for errors before implementing them within larger modules. This makes debugging at the higher level modules much easier and narrows down where the problems may exist. 


