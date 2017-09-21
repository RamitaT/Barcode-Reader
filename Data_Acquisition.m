clc
clear all
close all

ws = 3;


%read the file
L = csvread('datalog-2.csv');

%Moving Average
for i = 1:1:length(L)-(ws-1)
    Lavg(i) = sum(L(i:i+(ws-1)))/ws;
end
% plot(L)
% hold on
% plot(Lavg)
% title('Moving Average')
% ylabel('Light Sensor Value')
% hold on
% legend('Before Filtering','After Filtering')

%Derivative
for i = 1:length(Lavg)-1
    Lavg_der(i) = abs(Lavg(i+1)-Lavg(i));
end
subplot(2,1,1)
title('Obtained Data after Filtering')
hold on
plot(L)
hold on
plot(Lavg,'k')
legend('Before Filtering','After Filtering')


%Find peaks
threshold = 10;
[PKS,LOCS] = findpeaks(Lavg_der);
j = 1;
for i = 1:length(PKS)
    if PKS(i) > 10
        peak(j) = PKS(i);
        loc(j) = LOCS(i);
        j = j + 1;
    end
end
subplot(2,1,2)
title('Derivatives and Eages Detection')
hold on
plot(Lavg_der,'k')
hold on
plot(loc,peak,'o')

%Find widths
for i = 1:length(loc)-1
    width(i) = loc(i+1)-loc(i);
end

colour_threshold = round((max(L)+min(L))/2);
width_threshold = 15;

%Find colour
for i = 1:length(loc)-1
    index(i) = round((loc(i)+loc(i+1))/2);
    %cValue = L(index)';
end

cValue = L(index)';

for i = 1:length(width)
    if cValue(i) < colour_threshold & width(i) > width_threshold
        colour(i) = 'B';
    elseif cValue(i) < colour_threshold & width(i) < width_threshold
        colour(i) = 'b';
    elseif cValue(i) > colour_threshold & width(i) > width_threshold
        colour(i) = 'W';
    elseif cValue(i) > colour_threshold & width(i) < width_threshold
        colour(i) = 'w';
    end
end

%Check for character
[num,txt,raw] = xlsread('code39database.xlsx');
for i = 1:length(raw)
    TXT(i,1) = raw(i,2);
    CODE(i,1) = raw(i,3);
end

for i = 1:length(CODE)
    if strcmp(colour,CODE(i,1))
        char = txt(i,1);
    end
end
char




    


          
           
            

    









