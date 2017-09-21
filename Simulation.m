clc
clear
close all

L1 = 19.7;
L2 = 10;

%inverse kinematic
x = -14:0.1:14;
y = 10.8 + 12; %Put robot 12 cm away from paper

theta2_y = sqrt(1-((x.^2+y.^2-L1.^2-L2.^2)/(2*L1*L2)).^2);
%theta = radtodeg(theta2_y);
theta2_x = (x.^2+y.^2-L1.^2-L2.^2)/(2*L1*L2);
theta2 = atan2(-theta2_y,theta2_x);

k1 = L1+L2*cos(theta2);
k2 = L2*sin(theta2);
theta1 = atan2(y,x)-atan2(k2,k1);
theta = radtodeg(theta1);

%forward kinematic and plot

for i = 1:1:size(theta1,2)
    x1= L1* cos(theta1(i));
    y1= L1* sin(theta1(i));
    x2= L1* cos(theta1(i)) + L2*cos(theta1(i) + theta2(i));
    y2= L1 * sin(theta1(i)) + L2*sin(theta1(i) + theta2(i));
    LineX1= [0 x1];
    LineY1= [0 y1];
    LineX2= [x1 x2];
    LineY2= [y1 y2];
    line(LineX1,LineY1,'LineWidth',3)
    line(LineX2,LineY2,'LineWidth',3,'Color',[1 0 0])
    xlim([-(L1+L2) (L1+L2)])
    ylim([-(L1+L2) (L1+L2)])
    grid on
    pause(0.1)
    %clf
    
end

