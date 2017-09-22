# Barcode-Reader

"simulation.m" use for running the simulation of robotic arm.
"barcode.txt" use for controlling the robotic arm for scanning.

To run the program for scanning, the robot-c code (barcode.txt) needs to be download to the Lego EV3 mindstroms.
The program is compatible for 2 degree-of-fredom RR planar robotic arm. 
The light sensor must be attached to the end of the robotic arm for scanning purpose. 
Please refer to the motor declaration of the program for the connection of two motors and a sensors.
The gear ratio can be adjusted depending on the size of gear used in robot.
There is no arguement required for this program. 

"Data_Acquisition.m" use for reading the barcode
To run the reading program on MATLAB, Data_Acquisition.m, datalog-2.csv, and code39database.xlsx should be located in same directory.
