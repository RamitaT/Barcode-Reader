clc
clear all
close all


%Fwd Kinematics of 1 DOF

%Given 
L1 = 10e-2; %m
L2 = 7*10e-3;
theta2 = 90;
x = 5;

for theta1 = 0:1:360
    %theta2 = 90;

x1= L1* cosd(theta1)
y1= L1* sind(theta1)
x2= L1* cosd(theta1) + L2*cosd(theta1 + theta2)
y2= L1 * sind(theta1) + L2*sind(theta1 + theta2)

LineX1= [0 x1];
LineY1= [0 y1];
LineX2= [x1 x2];
LineY2= [y1 y2];

line(LineX1,LineY1,'LineWidth',3)
line(LineX2,LineY2,'LineWidth',3)
xlim([-(L1+L2) (L1+L2)])
ylim([-(L1+L2) (L1+L2)])
grid on

if theta2 == -90 | theta2 == 90
    x = x*-1;
end

theta2 = theta2 + x;
pause(0.1)
clf
end
