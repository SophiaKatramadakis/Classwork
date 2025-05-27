%% BMEG 330 Lab 3
% Code for lab 3
clear;close all;clc;
%% Setting Variables
Fs = 1000; % sampling frequency
Weight.P1 = load("LAB3_G10_00001.txt");
Weight.P2 = load("LAB3_G10_00004.txt");
Weight.P3 = load("LAB3_G10_00007.txt");
Weight.P4 = load("LAB3_G10_00010.txt");
Lab3data.Raw.Trial_1.P1 = load("LAB3_G10_00002.txt");
%Lab3data.Raw.Trial_1.P1 = Lab3data.Raw.Trial_1.P1 - Weight.P1;
Lab3data.Raw.Trial_1.P2 = load("LAB3_G10_00005.txt");
%Lab3data.Raw.Trial_1.P2 = Lab3data.Raw.Trial_1.P2 - Weight.P2;
Lab3data.Raw.Trial_1.P3 = load("LAB3_G10_00008.txt");
%Lab3data.Raw.Trial_1.P3 = Lab3data.Raw.Trial_1.P3 - Weight.P3;
Lab3data.Raw.Trial_1.P4 = load("LAB3_G10_00011.txt");
%Lab3data.Raw.Trial_1.P4 = Lab3data.Raw.Trial_1.P4 - Weight.P4;
Lab3data.Raw.Trial_2.P1 = load("LAB3_G10_00003.txt");
%Lab3data.Raw.Trial_2.P1 = Lab3data.Raw.Trial_2.P1 - Weight.P1;
Lab3data.Raw.Trial_2.P2 = load("LAB3_G10_00006.txt");
%Lab3data.Raw.Trial_2.P2 = Lab3data.Raw.Trial_2.P2 - Weight.P2;
Lab3data.Raw.Trial_2.P3 = load("LAB3_G10_00009.txt");
%Lab3data.Raw.Trial_2.P3 = Lab3data.Raw.Trial_2.P3 - Weight.P3;
Lab3data.Raw.Trial_2.P4 = load("LAB3_G10_00012.txt");
%Lab3data.Raw.Trial_2.P4 = Lab3data.Raw.Trial_2.P4 - Weight.P4;
%% Filtering Data
Samplefreq = Fs;
time = inv(Samplefreq):inv(Samplefreq): (height(Lab3data.Raw.Trial_1.P1) / Fs);
% filtering P1
[b,a] = butter(2, 25*2/Samplefreq); % low pass
Lab3data.Filtered.Trial_1.P1 = filtfilt(b,a,Lab3data.Raw.Trial_1.P1);
% filtering P2
[b,a] = butter(2, 25*2/Samplefreq); % low pass
Lab3data.Filtered.Trial_1.P2 = filtfilt(b,a,Lab3data.Raw.Trial_1.P2);
% filtering P3
[b,a] = butter(2, 25*2/Samplefreq); % low pass
Lab3data.Filtered.Trial_1.P3 = filtfilt(b,a,Lab3data.Raw.Trial_1.P3);
% filtering P4
[b,a] = butter(2, 25*2/Samplefreq); % low pass
Lab3data.Filtered.Trial_1.P4 = filtfilt(b,a,Lab3data.Raw.Trial_1.P4);
%% Part 2 of Lab manual
%% Plotting X axis results for each participant
% interval of 1120 ms
figure()
plot(Lab3data.Filtered.Trial_1.P1(2530 : 3650,1), 'Color', 'blue');
hold on
plot(Lab3data.Filtered.Trial_1.P2(2260 : 3380,1), 'Color', 'red');
hold on
plot(Lab3data.Filtered.Trial_1.P3(1890 : 3010,1), 'Color', 'green');
hold on
plot(Lab3data.Filtered.Trial_1.P4(2010 : 3130,1), 'Color', 'black');
xlabel('Time (ms)')
ylabel('Force (N)')
title('GRF Leading Step in the X axis ')
legend('Participant 1','Participant 2','Participant 3','Participant 4')
%% Plotting Y axis results for each participant
% interval of 1400 ms
figure()
plot(Lab3data.Filtered.Trial_1.P1(2360 : 3760,2),'b');
hold on
plot(Lab3data.Filtered.Trial_1.P2(2020 : 3420,2),'r');
hold on
plot(Lab3data.Filtered.Trial_1.P3(1650 : 3050,2),'g');
hold on
plot(Lab3data.Filtered.Trial_1.P4(1770 : 3170,2),'black');
hold on
xlabel('Time (ms)')
ylabel('Force (N)')
title('GRF Leading Step in the Y axis ')
legend('Participant 1','Participant 2','Participant 3','Participant 4')
%% Plotting Z axis results for each participant
% interval of 1160 ms
figure()
plot(Lab3data.Filtered.Trial_1.P1(2470 : 3630,3),'b');
hold on
plot(Lab3data.Filtered.Trial_1.P2(2260 : 3420,3),'r');
hold on
plot(Lab3data.Filtered.Trial_1.P3(1810 : 2970,3),'g');
hold on
plot(Lab3data.Filtered.Trial_1.P4(1980 : 3140,3),'black');
hold on
xlabel('Time (ms)')
ylabel('Force (N)')
title('GRF Leading Step in the Y axis ')
legend('Participant 1','Participant 2','Participant 3','Participant 4')
%% Part 3 - estimating breaking and propulsion impulses
% Participant 1
P1.x(:,1) = 1:15000;
P1.x(:,2) = Lab3data.Filtered.Trial_1.P1(:,1);
P1.x(:,3) = Lab3data.Filtered.Trial_1.P1(:,7);
P1.y(:,1) = 1:15000;
P1.y(:,2) = Lab3data.Filtered.Trial_1.P1(:,2);
P1.y(:,3) = Lab3data.Filtered.Trial_1.P1(:,8);
P1.z(:,1) = 1:15000;
P1.z(:,2) = Lab3data.Filtered.Trial_1.P1(:,3);
P1.z(:,3) = Lab3data.Filtered.Trial_1.P1(:,9);
% Participant 2
P2.x(:,1) = 1:15000;
P2.x(:,2) = Lab3data.Filtered.Trial_1.P2(:,1);
P2.x(:,3) = Lab3data.Filtered.Trial_1.P2(:,7);
P2.y(:,1) = 1:15000;
P2.y(:,2) = Lab3data.Filtered.Trial_1.P2(:,2);
P2.y(:,3) = Lab3data.Filtered.Trial_1.P2(:,8);
P2.z(:,1) = 1:15000;
P2.z(:,2) = Lab3data.Filtered.Trial_1.P2(:,3);
P2.z(:,3) = Lab3data.Filtered.Trial_1.P2(:,9);
% Participant 3
P3.x(:,1) = 1:15000;
P3.x(:,2) = Lab3data.Filtered.Trial_1.P3(:,1);
P3.x(:,3) = Lab3data.Filtered.Trial_1.P3(:,7);
P3.y(:,1) = 1:15000;
P3.y(:,2) = Lab3data.Filtered.Trial_1.P3(:,2);
P3.y(:,3) = Lab3data.Filtered.Trial_1.P3(:,8);
P3.z(:,1) = 1:15000;
P3.z(:,2) = Lab3data.Filtered.Trial_1.P3(:,3);
P3.z(:,3) = Lab3data.Filtered.Trial_1.P3(:,9);
% Participant 4
P4.x(:,1) = 1:15000;
P4.x(:,2) = Lab3data.Filtered.Trial_1.P4(:,1);
P4.x(:,3) = Lab3data.Filtered.Trial_1.P4(:,7);
P4.y(:,1) = 1:15000;
P4.y(:,2) = Lab3data.Filtered.Trial_1.P4(:,2);
P4.y(:,3) = Lab3data.Filtered.Trial_1.P4(:,8);
P4.z(:,1) = 1:15000;
P4.z(:,2) = Lab3data.Filtered.Trial_1.P4(:,3);
P4.z(:,3) = Lab3data.Filtered.Trial_1.P4(:,9);
%%  Ipsilateral foot
%% Propulsion and Braking in the X axis for participant 1
figure()
plot(P1.x(:,2))
P1.bounds.Prop.xp1 = 2719;
P1.bounds.Prop.xp2 = 3405;
P1.bounds.Prop.idx1 = find(P1.x(:,1) >= P1.bounds.Prop.xp1, 1);
P1.bounds.Prop.idx2 = find(P1.x(:,1) >= P1.bounds.Prop.xp2, 1);
area(P1.x(:,1), P1.x(:,2));
hold on;
area(P1.x(P1.bounds.Prop.idx1:P1.bounds.Prop.idx2,1), P1.x(P1.bounds.Prop.idx1:P1.bounds.Prop.idx2,2), 'facecolor', [.7 .7 .9]);
grid on
title('Participant 1')
xlabel('Time (ms)')
ylabel('Force (N)')
P1.area.ax1 = trapz(P1.x(P1.bounds.Prop.idx1:P1.bounds.Prop.idx2, 1), P1.x(P1.bounds.Prop.idx1:P1.bounds.Prop.idx2, 2));
P1.Ips.xPropulsion = P1.area.ax1;
ax = gca;
xt = (P1.bounds.Prop.xp2 + P1.bounds.Prop.xp1) / 2.2;
yt = 0.8 * mean(ax.YLim);
s = sprintf('Propulsion = %.2f', P1.area.ax1);
text(xt, yt, s);
xlim([2000 4000]); ylim([-20 30]);
% Braking section
P1.bounds.Brake.xb11 = 2559;
P1.bounds.Brake.xb12 = 2719;
P1.bounds.Brake.xb21 = 3405;
P1.bounds.Brake.xb22 = 3599;
P1.bounds.Brake.idx11 = find(P1.x(:,1) >= P1.bounds.Brake.xb11, 1);
P1.bounds.Brake.idx12 = find(P1.x(:,1) >= P1.bounds.Brake.xb12, 1);
P1.bounds.Brake.idx21 = find(P1.x(:,1) >= P1.bounds.Brake.xb21, 1);
P1.bounds.Brake.idx22 = find(P1.x(:,1) >= P1.bounds.Brake.xb22, 1);
hold on;
area(P1.x(P1.bounds.Brake.idx11: P1.bounds.Brake.idx12,1), P1.x(P1.bounds.Brake.idx11 : P1.bounds.Brake.idx12,2), 'facecolor', [.7 .8 .9]);
hold on;
area(P1.x(P1.bounds.Brake.idx21: P1.bounds.Brake.idx22,1), P1.x(P1.bounds.Brake.idx21 : P1.bounds.Brake.idx22,2), 'facecolor', [.7 .8 .9]);
grid on
title('Participant 1 X axis Propulsion and Braking')
xlabel('Time (ms)')
ylabel('Force (N)')
P1.area.braking.ax1 = trapz(P1.x(P1.bounds.Brake.idx11: P1.bounds.Brake.idx12, 1), P1.x(P1.bounds.Brake.idx11 : P1.bounds.Brake.idx12, 2));
P1.area.braking.ax2 = trapz(P1.x(P1.bounds.Brake.idx21: P1.bounds.Brake.idx22, 1), P1.x(P1.bounds.Brake.idx21 : P1.bounds.Brake.idx22, 2));
P1.Ips.xBraking = P1.area.braking.ax1 + P1.area.braking.ax2;
ax = gca;
xt = (P1.bounds.Brake.xb12 + P1.bounds.Brake.xb11) / 2.1;
xt2 = (P1.bounds.Brake.xb22 + P1.bounds.Brake.xb21) / 2.1;
yt = -0.8 * mean(ax.YLim);
s = sprintf('Braking = %.2f', P1.area.braking.ax1);
s2 = sprintf('Braking = %.2f', P1.area.braking.ax2);
text(xt, yt, s);
text(xt2, yt, s2);
xlim([2000 4000]); ylim([-20 30]);
%% Propulsion and Braking in the Y axis for participant 1
figure()
plot(P1.y(:,2))
P1.bounds.Prop.yp1 = 3031;
P1.bounds.Prop.yp2 = 3590;
P1.bounds.Prop.id p1 = find(P1.y(:,1) >= P1.bounds.Prop.yp1, 1);
P1.bounds.Prop.idp2 = find(P1.y(:,1) >= P1.bounds.Prop.yp2, 1);
area(P1.y(:,1), P1.y(:,2));
hold on;
area(P1.y(P1.bounds.Prop.idyp1:P1.bounds.Prop.idyp2,1), P1.y(P1.bounds.Prop.idyp1:P1.bounds.Prop.idyp2,2), 'facecolor', [.7 .7 .9]);
grid on
xlabel('Time (ms)')
ylabel('Force (N)')
P1.area.ay1 = trapz(P1.y(P1.bounds.Prop.idyp1:P1.bounds.Prop.idyp2, 1), P1.y(P1.bounds.Prop.idyp1:P1.bounds.Prop.idyp2, 2));
P1.Ips.yPropulsion = P1.area.ay1;
ax = gca;
xt = (P1.bounds.Prop.yp2 + P1.bounds.Prop.yp1) / 2.2;
yt = 0.8 * mean(ax.YLim);
s = sprintf('Propulsion = %.2f', P1.area.ay1);
text(xt, yt, s);
xlim([2000 4000]); ylim([-60 100]);
% Braking section
P1.bounds.Brake.yb11 = 2540;
P1.bounds.Brake.yb12 = 3031;
P1.bounds.Brake.idy11 = find(P1.y(:,1) >= P1.bounds.Brake.yb11, 1);
P1.bounds.Brake.idy12 = find(P1.y(:,1) >= P1.bounds.Brake.yb12, 1);
hold on;
area(P1.y(P1.bounds.Brake.idy11: P1.bounds.Brake.idy12,1), P1.y(P1.bounds.Brake.idy11 : P1.bounds.Brake.idy12,2), 'facecolor', [.7 .8 .9]);
hold on;
grid on
title('Participant 1 Y axis Propulsion and Braking')
xlabel('Time (ms)')
ylabel('Force (N)')
P1.area.braking.ay1 = trapz(P1.y(P1.bounds.Brake.idy11: P1.bounds.Brake.idy12, 1), P1.y(P1.bounds.Brake.idy11 : P1.bounds.Brake.idy12, 2));
P1.Ips.yBraking = P1.area.braking.ay1;
ax = gca;
xt = (P1.bounds.Brake.yb12 + P1.bounds.Brake.yb11) / 2.1;
yt = -0.8 * mean(ax.YLim);
s = sprintf('Braking = %.2f', P1.area.braking.ay1);
text(xt, yt, s);
xlim([2000 4000]); ylim([-60 100]);
%% Propulsion and Braking in the X axis for participant 2
figure()
plot(P2.x(:,2))
P2.bounds.Prop.xp1 = 2489;
P2.bounds.Prop.xp2 = 3092;
P2.bounds.Prop.idx1 = find(P2.x(:,1) >= P2.bounds.Prop.xp1, 1);
P2.bounds.Prop.idx2 = find(P2.x(:,1) >= P2.bounds.Prop.xp2, 1);
area(P2.x(:,1), P2.x(:,2));
hold on;
area(P2.x(P2.bounds.Prop.idx1:P2.bounds.Prop.idx2,1), P2.x(P2.bounds.Prop.idx1:P2.bounds.Prop.idx2,2), 'facecolor', [.7 .7 .9]);
grid on
xlabel('Time (ms)')
ylabel('Force (N)')
P2.area.ax1 = trapz(P2.x(P2.bounds.Prop.idx1:P2.bounds.Prop.idx2, 1), P2.x(P2.bounds.Prop.idx1:P2.bounds.Prop.idx2, 2));
P2.Ips.xPropulsion = P2.area.ax1;
ax = gca;
xt = (P2.bounds.Prop.xp2 + P2.bounds.Prop.xp1) / 2.2;
yt = -0.99 * mean(ax.YLim);
s = sprintf('Propulsion = %.2f', P2.area.ax1);
text(xt, yt, s);
xlim([2000 4000]); ylim([-20 30]);
% Braking section
P2.bounds.Brake.xb11 = 2312;
P2.bounds.Brake.xb12 = 2489;
P2.bounds.Brake.xb21 = 3092;
P2.bounds.Brake.xb22 = 3308;
P2.bounds.Brake.idx11 = find(P2.x(:,1) >= P2.bounds.Brake.xb11, 1);
P2.bounds.Brake.idx12 = find(P2.x(:,1) >= P2.bounds.Brake.xb12, 1);
P2.bounds.Brake.idx21 = find(P2.x(:,1) >= P2.bounds.Brake.xb21, 1);
P2.bounds.Brake.idx22 = find(P2.x(:,1) >= P2.bounds.Brake.xb22, 1);
hold on;
area(P2.x(P2.bounds.Brake.idx11: P2.bounds.Brake.idx12,1), P2.x(P2.bounds.Brake.idx11 : P2.bounds.Brake.idx12,2), 'facecolor', [.7 .8 .9]);
hold on;
area(P2.x(P2.bounds.Brake.idx21: P2.bounds.Brake.idx22,1), P2.x(P2.bounds.Brake.idx21 : P2.bounds.Brake.idx22,2), 'facecolor', [.7 .8 .9]);
grid on
title('Participant 2 X axis Propulsion and Braking')
xlabel('Time (ms)')
ylabel('Force (N)')
P2.area.braking.ax1 = trapz(P2.x(P2.bounds.Brake.idx11: P2.bounds.Brake.idx12, 1), P2.x(P2.bounds.Brake.idx11 : P2.bounds.Brake.idx12, 2));
P2.area.braking.ax2 = trapz(P2.x(P2.bounds.Brake.idx21: P2.bounds.Brake.idx22, 1), P2.x(P2.bounds.Brake.idx21 : P2.bounds.Brake.idx22, 2));
P2.Ips.xBraking = P2.area.braking.ax1 + P2.area.braking.ax2;
ax = gca;
xt = (P2.bounds.Brake.xb12 + P2.bounds.Brake.xb11) / 2.1;
xt2 = (P2.bounds.Brake.xb22 + P2.bounds.Brake.xb21) / 2.1;
yt = -0.8 * mean(ax.YLim);
s = sprintf('Braking = %.2f', P2.area.braking.ax1);
s2 = sprintf('Braking = %.2f', P2.area.braking.ax2);
text(xt, yt, s);
text(xt2, yt, s2);
xlim([2000 4000]); ylim([-30 30]);
%% Propulsion and Braking in the Y axis for participant 2
figure()
plot(P2.y(:,2))
P2.bounds.Prop.yp1 = 2718;
P2.bounds.Prop.yp2 = 3298;
P2.bounds.Prop.idyp1 = find(P2.y(:,1) >= P2.bounds.Prop.yp1, 1);
P2.bounds.Prop.idyp2 = find(P2.y(:,1) >= P2.bounds.Prop.yp2, 1);
area(P2.y(:,1), P2.y(:,2));
hold on;
area(P2.y(P2.bounds.Prop.idyp1:P2.bounds.Prop.idyp2,1), P2.y(P2.bounds.Prop.idyp1:P2.bounds.Prop.idyp2,2), 'facecolor', [.7 .7 .9]);
grid on
xlabel('Time (ms)')
ylabel('Force (N)')
P2.area.ay1 = trapz(P2.y(P2.bounds.Prop.idyp1:P2.bounds.Prop.idyp2, 1), P2.y(P2.bounds.Prop.idyp1:P2.bounds.Prop.idyp2, 2));
P2.Ips.yPropulsion = P2.area.ay1;
ax = gca;
xt = (P2.bounds.Prop.yp2 + P2.bounds.Prop.yp1) / 2;
yt = 0.8 * mean(ax.YLim);
s = sprintf('Propulsion = %.2f', P2.area.ay1);
text(xt, yt, s);
xlim([2000 4000]); ylim([-60 180]);
% Braking section
P2.bounds.Brake.yb11 = 2328;
P2.bounds.Brake.yb12 = 2718;
P2.bounds.Brake.idy11 = find(P2.y(:,1) >= P2.bounds.Brake.yb11, 1);
P2.bounds.Brake.idy12 = find(P2.y(:,1) >= P2.bounds.Brake.yb12, 1);
hold on;
area(P2.y(P2.bounds.Brake.idy11: P2.bounds.Brake.idy12,1), P2.y(P2.bounds.Brake.idy11 : P2.bounds.Brake.idy12,2), 'facecolor', [.7 .8 .9]);
hold on;
grid on
title('Participant 2 Y axis Propulsion and Braking')
xlabel('Time (ms)')
ylabel('Force (N)')
P2.area.braking.ay1 = trapz(P2.y(P2.bounds.Brake.idy11: P2.bounds.Brake.idy12, 1), P2.y(P2.bounds.Brake.idy11 : P2.bounds.Brake.idy12, 2));
P2.Ips.yBraking = P2.area.braking.ay1;
ax = gca;
xt = (P2.bounds.Brake.yb12 + P2.bounds.Brake.yb11) / 2.1;
yt = -0.8 * mean(ax.YLim);
s = sprintf('Braking = %.2f', P2.area.braking.ay1);
text(xt, yt, s);
xlim([2000 4000]); ylim([-60 180]);
%% Propulsion and Braking in the X axis for participant 3
figure()
plot(P3.x(:,2))
P3.bounds.Prop.xp1 = 2017;
P3.bounds.Prop.xp2 = 2566;
P3.bounds.Prop.idx1 = find(P3.x(:,1) >= P3.bounds.Prop.xp1, 1);
P3.bounds.Prop.idx2 = find(P3.x(:,1) >= P3.bounds.Prop.xp2, 1);
area(P3.x(:,1), P3.x(:,2));
hold on;
area(P3.x(P3.bounds.Prop.idx1:P3.bounds.Prop.idx2,1), P3.x(P3.bounds.Prop.idx1:P3.bounds.Prop.idx2,2), 'facecolor', [.7 .7 .9]);
grid on
title('Participant 1')
xlabel('Time (ms)')
ylabel('Force (N)')
P3.area.ax1 = trapz(P3.x(P3.bounds.Prop.idx1:P3.bounds.Prop.idx2, 1), P3.x(P3.bounds.Prop.idx1:P3.bounds.Prop.idx2, 2));
P3.Ips.xPropulsion = P3.area.ax1;
ax = gca;
xt = (P3.bounds.Prop.xp2 + P3.bounds.Prop.xp1) / 2.2;
yt = -0.7 * mean(ax.YLim);
s = sprintf('Propulsion = %.2f', P3.area.ax1);
text(xt, yt, s);
xlim([2000 4000]); ylim([-20 30]);
% Braking section
P3.bounds.Brake.xb11 = 1911;
P3.bounds.Brake.xb12 = 2017;
P3.bounds.Brake.xb21 = 2566;
P3.bounds.Brake.xb22 = 2735;
P3.bounds.Brake.idx11 = find(P3.x(:,1) >= P3.bounds.Brake.xb11, 1);
P3.bounds.Brake.idx12 = find(P3.x(:,1) >= P3.bounds.Brake.xb12, 1);
P3.bounds.Brake.idx21 = find(P3.x(:,1) >= P3.bounds.Brake.xb21, 1);
P3.bounds.Brake.idx22 = find(P3.x(:,1) >= P3.bounds.Brake.xb22, 1);
hold on;
area(P3.x(P3.bounds.Brake.idx11: P3.bounds.Brake.idx12,1), P3.x(P3.bounds.Brake.idx11 : P3.bounds.Brake.idx12,2), 'facecolor', [.7 .8 .9]);
hold on;
area(P3.x(P3.bounds.Brake.idx21: P3.bounds.Brake.idx22,1), P3.x(P3.bounds.Brake.idx21 : P3.bounds.Brake.idx22,2), 'facecolor', [.7 .8 .9]);
grid on
title('Participant 3 X axis Propulsion and Braking')
xlabel('Time (ms)')
ylabel('Force (N)')
P3.area.braking.ax1 = trapz(P3.x(P3.bounds.Brake.idx11: P3.bounds.Brake.idx12, 1), P3.x(P3.bounds.Brake.idx11 : P3.bounds.Brake.idx12, 2));
P3.area.braking.ax2 = trapz(P3.x(P3.bounds.Brake.idx21: P3.bounds.Brake.idx22, 1), P3.x(P3.bounds.Brake.idx21 : P3.bounds.Brake.idx22, 2));
P3.Ips.xBraking = P3.area.braking.ax1 + P3.area.braking.ax2;
ax = gca;
xt = (P3.bounds.Brake.xb12 + P3.bounds.Brake.xb11) / 2.1;
xt2 = (P3.bounds.Brake.xb22 + P3.bounds.Brake.xb21) / 2.1;
yt = -0.8 * mean(ax.YLim);
s = sprintf('Braking = %.2f', P3.area.braking.ax1);
s2 = sprintf('Braking = %.2f', P3.area.braking.ax2);
text(xt, yt, s);
text(xt2, yt, s2);
xlim([1500 3000]); ylim([-40 30]);
%% Propulsion and Braking in the Y axis for participant 3
figure()
plot(P3.y(:,2))
P3.bounds.Prop.yp1 = 2305;
P3.bounds.Prop.yp2 = 2719;
P3.bounds.Prop.idyp1 = find(P3.y(:,1) >= P3.bounds.Prop.yp1, 1);
P3.bounds.Prop.idyp2 = find(P3.y(:,1) >= P3.bounds.Prop.yp2, 1);
area(P3.y(:,1), P3.y(:,2));
hold on;
area(P3.y(P3.bounds.Prop.idyp1:P3.bounds.Prop.idyp2,1), P3.y(P3.bounds.Prop.idyp1:P3.bounds.Prop.idyp2,2), 'facecolor', [.7 .7 .9]);
grid on
xlabel('Time (ms)')
ylabel('Force (N)')
P3.area.ay1 = trapz(P3.y(P3.bounds.Prop.idyp1:P3.bounds.Prop.idyp2, 1), P3.y(P3.bounds.Prop.idyp1:P3.bounds.Prop.idyp2, 2));
P3.Ips.yPropulsion = P3.area.ay1;
ax = gca;
xt = (P3.bounds.Prop.yp2 + P3.bounds.Prop.yp1) / 2.2;
yt = 0.8 * mean(ax.YLim);
s = sprintf('Propulsion = %.2f', P3.area.ay1);
text(xt, yt, s);
xlim([2000 4000]); ylim([-60 100]);
% Braking section
P3.bounds.Brake.yb11 = 1881;
P3.bounds.Brake.yb12 = 2305;
P3.bounds.Brake.idy11 = find(P3.y(:,1) >= P3.bounds.Brake.yb11, 1);
P3.bounds.Brake.idy12 = find(P3.y(:,1) >= P3.bounds.Brake.yb12, 1);
hold on;
area(P3.y(P3.bounds.Brake.idy11: P3.bounds.Brake.idy12,1), P3.y(P3.bounds.Brake.idy11 : P3.bounds.Brake.idy12,2), 'facecolor', [.7 .8 .9]);
hold on;
grid on
title('Participant 3 Y axis Propulsion and Braking')
xlabel('Time (ms)')
ylabel('Force (N)')
P3.area.braking.ay1 = trapz(P3.y(P3.bounds.Brake.idy11: P3.bounds.Brake.idy12, 1), P3.y(P3.bounds.Brake.idy11 : P3.bounds.Brake.idy12, 2));
P3.Ips.yBraking = P3.area.braking.ay1;
ax = gca;
xt = (P3.bounds.Brake.yb12 + P3.bounds.Brake.yb11) / 2.1;
yt = -0.8 * mean(ax.YLim);
s = sprintf('Braking = %.2f', P3.area.braking.ay1);
text(xt, yt, s);
xlim([1500 3000]); ylim([-60 150]);
%% Propulsion and Braking in the X axis for participant 4
figure()
plot(P4.x(:,2))
P4.bounds.Prop.xp1 = 2267;
P4.bounds.Prop.xp2 = 2849;
P4.bounds.Prop.idx1 = find(P4.x(:,1) >= P4.bounds.Prop.xp1, 1);
P4.bounds.Prop.idx2 = find(P4.x(:,1) >= P4.bounds.Prop.xp2, 1);
area(P4.x(:,1), P4.x(:,2));
hold on;
area(P4.x(P4.bounds.Prop.idx1:P4.bounds.Prop.idx2,1), P4.x(P4.bounds.Prop.idx1:P4.bounds.Prop.idx2,2), 'facecolor', [.7 .7 .9]);
grid on
title('Participant 1')
xlabel('Time (ms)')
ylabel('Force (N)')
P4.area.ax1 = trapz(P4.x(P4.bounds.Prop.idx1:P4.bounds.Prop.idx2, 1), P4.x(P4.bounds.Prop.idx1:P4.bounds.Prop.idx2, 2));
P4.Ips.xPropulsion = P4.area.ax1;
ax = gca;
xt = (P4.bounds.Prop.xp2 + P4.bounds.Prop.xp1) / 2.25;
yt = -0.7 * mean(ax.YLim);
s = sprintf('Propulsion = %.2f', P4.area.ax1);
text(xt, yt, s);
xlim([2000 4000]); ylim([-20 30]);
% Braking section
P4.bounds.Brake.xb11 = 2014;
P4.bounds.Brake.xb12 = 2267;
P4.bounds.Brake.xb21 = 2849;
P4.bounds.Brake.xb22 = 2989;
P4.bounds.Brake.idx11 = find(P4.x(:,1) >= P4.bounds.Brake.xb11, 1);
P4.bounds.Brake.idx12 = find(P4.x(:,1) >= P4.bounds.Brake.xb12, 1);
P4.bounds.Brake.idx21 = find(P4.x(:,1) >= P4.bounds.Brake.xb21, 1);
P4.bounds.Brake.idx22 = find(P4.x(:,1) >= P4.bounds.Brake.xb22, 1);
hold on;
area(P4.x(P4.bounds.Brake.idx11: P4.bounds.Brake.idx12,1), P4.x(P4.bounds.Brake.idx11 : P4.bounds.Brake.idx12,2), 'facecolor', [.7 .8 .9]);
hold on;
area(P4.x(P4.bounds.Brake.idx21: P4.bounds.Brake.idx22,1), P4.x(P4.bounds.Brake.idx21 : P4.bounds.Brake.idx22,2), 'facecolor', [.7 .8 .9]);
grid on
title('Participant 4 X axis Propulsion and Braking')
xlabel('Time (ms)')
ylabel('Force (N)')
P4.area.braking.ax1 = trapz(P4.x(P4.bounds.Brake.idx11: P4.bounds.Brake.idx12, 1), P4.x(P4.bounds.Brake.idx11 : P4.bounds.Brake.idx12, 2));
P4.area.braking.ax2 = trapz(P4.x(P4.bounds.Brake.idx21: P4.bounds.Brake.idx22, 1), P4.x(P4.bounds.Brake.idx21 : P4.bounds.Brake.idx22, 2));
P4.Ips.xBraking = P4.area.braking.ax1 + P4.area.braking.ax2;
ax = gca;
xt = (P4.bounds.Brake.xb12 + P4.bounds.Brake.xb11) / 2.1;
xt2 = (P4.bounds.Brake.xb22 + P4.bounds.Brake.xb21) / 2.1;
yt = -0.8 * mean(ax.YLim);
s = sprintf('Braking = %.2f', P4.area.braking.ax1);
s2 = sprintf('Braking = %.2f', P4.area.braking.ax2);
text(xt, yt, s);
text(xt2, yt, s2);
xlim([1500 3500]); ylim([-20 30]);
%% Propulsion and Braking in the Y axis for participant 4
figure()
plot(P4.y(:,2))
P4.bounds.Prop.yp1 = 2516;
P4.bounds.Prop.yp2 = 2980;
P4.bounds.Prop.idyp1 = find(P4.y(:,1) >= P4.bounds.Prop.yp1, 1);
P4.bounds.Prop.idyp2 = find(P4.y(:,1) >= P4.bounds.Prop.yp2, 1);
area(P4.y(:,1), P4.y(:,2));
hold on;
area(P4.y(P4.bounds.Prop.idyp1:P4.bounds.Prop.idyp2,1), P4.y(P4.bounds.Prop.idyp1:P4.bounds.Prop.idyp2,2), 'facecolor', [.7 .7 .9]);
grid on
xlabel('Time (ms)')
ylabel('Force (N)')
P4.area.ay1 = trapz(P4.y(P4.bounds.Prop.idyp1:P4.bounds.Prop.idyp2, 1), P4.y(P4.bounds.Prop.idyp1:P4.bounds.Prop.idyp2, 2));
P4.Ips.yPropulsion = P4.area.ay1;
ax = gca;
xt = (P4.bounds.Prop.yp2 + P4.bounds.Prop.yp1) / 2.2;
yt = 0.8 * mean(ax.YLim);
s = sprintf('Propulsion = %.2f', P4.area.ay1);
text(xt, yt, s);
xlim([2000 4000]); ylim([-60 100]);
% Braking section
P4.bounds.Brake.yb11 = 2015;
P4.bounds.Brake.yb12 = 2516;
P4.bounds.Brake.idy11 = find(P4.y(:,1) >= P4.bounds.Brake.yb11, 1);
P4.bounds.Brake.idy12 = find(P4.y(:,1) >= P4.bounds.Brake.yb12, 1);
hold on;
area(P4.y(P4.bounds.Brake.idy11: P4.bounds.Brake.idy12,1), P4.y(P4.bounds.Brake.idy11 : P4.bounds.Brake.idy12,2), 'facecolor', [.7 .8 .9]);
hold on;
grid on
title('Participant 4 Y axis Propulsion and Braking')
xlabel('Time (ms)')
ylabel('Force (N)')
P4.area.braking.ay1 = trapz(P4.y(P4.bounds.Brake.idy11: P4.bounds.Brake.idy12, 1), P4.y(P4.bounds.Brake.idy11 : P4.bounds.Brake.idy12, 2));
P4.Ips.yBraking = P4.area.braking.ay1;
ax = gca;
xt = (P4.bounds.Brake.yb12 + P4.bounds.Brake.yb11) / 2.1;
yt = -0.8 * mean(ax.YLim);
s = sprintf('Braking = %.2f', P4.area.braking.ay1);
text(xt, yt, s);
xlim([1500 3500]); ylim([-30 120]);
%% Propulsion and Braking Data for contralateral foot
%% Participant 1 X axis
% Braking Section
P1.bounds.Brake.xp1 = 3489;
P1.bounds.Brake.xp2 = 4197;
P1.bounds.Brake.idx1 = find(P1.x(:,1) >= P1.bounds.Brake.xp1, 1);
P1.bounds.Brake.idx2 = find(P1.x(:,1) >= P1.bounds.Brake.xp2, 1);
P1.area.ax1 = trapz(P1.x(P1.bounds.Brake.idx1:P1.bounds.Brake.idx2, 1), P1.x(P1.bounds.Brake.idx1:P1.bounds.Brake.idx2, 3));
P1.Cont.xBraking = P1.area.ax1;
% Propulsion Section
P1.bounds.Prop.xb11 = 3362;
P1.bounds.Prop.xb12 = 3489;
P1.bounds.Prop.xb21 = 4197;
P1.bounds.Prop.xb22 = 4290;
P1.bounds.Prop.idx11 = find(P1.x(:,1) >= P1.bounds.Prop.xb11, 1);
P1.bounds.Prop.idx12 = find(P1.x(:,1) >= P1.bounds.Prop.xb12, 1);
P1.bounds.Prop.idx21 = find(P1.x(:,1) >= P1.bounds.Prop.xb21, 1);
P1.bounds.Prop.idx22 = find(P1.x(:,1) >= P1.bounds.Prop.xb22, 1);
P1.area.braking.ax1 = trapz(P1.x(P1.bounds.Prop.idx11: P1.bounds.Prop.idx12, 1), P1.x(P1.bounds.Prop.idx11 : P1.bounds.Prop.idx12, 3));
P1.area.braking.ax2 = trapz(P1.x(P1.bounds.Prop.idx21: P1.bounds.Prop.idx22, 1), P1.x(P1.bounds.Prop.idx21 : P1.bounds.Prop.idx22, 3));
P1.Cont.xPropulsion = P1.area.braking.ax1 + P1.area.braking.ax2;
%% Participant 1 Y axis
% Propulsion Section
P1.bounds.Prop.yp1 = 3871;
P1.bounds.Prop.yp2 = 4361;
P1.bounds.Prop.idyp1 = find(P1.y(:,1) >= P1.bounds.Prop.yp1, 1);
P1.bounds.Prop.idyp2 = find(P1.y(:,1) >= P1.bounds.Prop.yp2, 1);
P1.area.ay1 = trapz(P1.y(P1.bounds.Prop.idyp1:P1.bounds.Prop.idyp2, 1), P1.y(P1.bounds.Prop.idyp1:P1.bounds.Prop.idyp2, 2));
P1.Cont.yPropulsion = P1.area.ay1;
% Braking Section
P1.bounds.Brake.yb11 = 3348;
P1.bounds.Brake.yb12 = 3871;
P1.bounds.Brake.idy11 = find(P1.y(:,1) >= P1.bounds.Brake.yb11, 1);
P1.bounds.Brake.idy12 = find(P1.y(:,1) >= P1.bounds.Brake.yb12, 1);
P1.area.braking.ay1 = trapz(P1.y(P1.bounds.Brake.idy11: P1.bounds.Brake.idy12, 1), P1.y(P1.bounds.Brake.idy11 : P1.bounds.Brake.idy12, 2));
P1.Cont.yBraking = P1.area.braking.ay1;
%% Participant 2 X axis
% Braking Section
P2.bounds.Brake.xp1 = 3228;
P2.bounds.Brake.xp2 = 3886;
P2.bounds.Brake.idx1 = find(P2.x(:,1) >= P2.bounds.Brake.xp1, 1);
P2.bounds.Brake.idx2 = find(P2.x(:,1) >= P2.bounds.Brake.xp2, 1);
P2.area.ax1 = trapz(P2.x(P2.bounds.Brake.idx1:P2.bounds.Brake.idx2, 1), P2.x(P2.bounds.Brake.idx1:P2.bounds.Brake.idx2, 3));
P2.Cont.xBraking = P2.area.ax1;
% Propulsion Section
P2.bounds.Prop.xb11 = 3082;
P2.bounds.Prop.xb12 = 3226;
P2.bounds.Prop.xb21 = 3886;
P2.bounds.Prop.xb22 = 3970;
P2.bounds.Prop.idx11 = find(P2.x(:,1) >= P2.bounds.Prop.xb11, 1);
P2.bounds.Prop.idx12 = find(P2.x(:,1) >= P2.bounds.Prop.xb12, 1);
P2.bounds.Prop.idx21 = find(P2.x(:,1) >= P2.bounds.Prop.xb21, 1);
P2.bounds.Prop.idx22 = find(P2.x(:,1) >= P2.bounds.Prop.xb22, 1);
P2.area.braking.ax1 = trapz(P2.x(P2.bounds.Prop.idx11: P2.bounds.Prop.idx12, 1), P2.x(P2.bounds.Prop.idx11 : P2.bounds.Prop.idx12, 3));
P2.area.braking.ax2 = trapz(P2.x(P2.bounds.Prop.idx21: P2.bounds.Prop.idx22, 1), P2.x(P2.bounds.Prop.idx21 : P2.bounds.Prop.idx22, 3));
P2.Cont.xPropulsion = P2.area.braking.ax1 + P2.area.braking.ax2;
%% Participant 2 Y axis
% Propulsion Section
P2.bounds.Prop.yp1 = 3630;
P2.bounds.Prop.yp2 = 3976;
P2.bounds.Prop.idyp1 = find(P2.y(:,1) >= P2.bounds.Prop.yp1, 1);
P2.bounds.Prop.idyp2 = find(P2.y(:,1) >= P2.bounds.Prop.yp2, 1);
P2.area.ay1 = trapz(P2.y(P2.bounds.Prop.idyp1:P2.bounds.Prop.idyp2, 1), P2.y(P2.bounds.Prop.idyp1:P2.bounds.Prop.idyp2, 2));
P2.Cont.yPropulsion = P2.area.ay1;
% Braking Section
P2.bounds.Brake.yb11 = 3083;
P2.bounds.Brake.yb12 = 3630;
P2.bounds.Brake.idy11 = find(P2.y(:,1) >= P2.bounds.Brake.yb11, 1);
P2.bounds.Brake.idy12 = find(P2.y(:,1) >= P2.bounds.Brake.yb12, 1);
P2.area.braking.ay1 = trapz(P2.y(P2.bounds.Brake.idy11: P2.bounds.Brake.idy12, 1), P2.y(P2.bounds.Brake.idy11 : P2.bounds.Brake.idy12, 2));
P2.Cont.yBraking = P2.area.braking.ay1;
%% Participant 3 X axis
% Braking Section
P3.bounds.Brake.xp1 = 2674;
P3.bounds.Brake.xp2 = 3206;
P3.bounds.Brake.idx1 = find(P3.x(:,1) >= P3.bounds.Brake.xp1, 1);
P3.bounds.Brake.idx2 = find(P3.x(:,1) >= P3.bounds.Brake.xp2, 1);
P3.area.ax1 = trapz(P3.x(P3.bounds.Brake.idx1:P3.bounds.Brake.idx2, 1), P3.x(P3.bounds.Brake.idx1:P3.bounds.Brake.idx2, 3));
P3.Cont.xBraking = P3.area.ax1;
% Propulsion Section
P3.bounds.Prop.xb11 = 2544;
P3.bounds.Prop.xb12 = 2674;
P3.bounds.Prop.xb21 = 3206;
P3.bounds.Prop.xb22 = 3330;
P3.bounds.Prop.idx11 = find(P3.x(:,1) >= P3.bounds.Prop.xb11, 1);
P3.bounds.Prop.idx12 = find(P3.x(:,1) >= P3.bounds.Prop.xb12, 1);
P3.bounds.Prop.idx21 = find(P3.x(:,1) >= P3.bounds.Prop.xb21, 1);
P3.bounds.Prop.idx22 = find(P3.x(:,1) >= P3.bounds.Prop.xb22, 1);
P3.area.braking.ax1 = trapz(P3.x(P3.bounds.Prop.idx11: P3.bounds.Prop.idx12, 1), P3.x(P3.bounds.Prop.idx11 : P3.bounds.Prop.idx12, 3));
P3.area.braking.ax2 = trapz(P3.x(P3.bounds.Prop.idx21: P3.bounds.Prop.idx22, 1), P3.x(P3.bounds.Prop.idx21 : P3.bounds.Prop.idx22, 3));
P3.Cont.xPropulsion = P3.area.braking.ax1 + P3.area.braking.ax2;
%% Participant 3 Y axis
% Propulsion Section
P3.bounds.Prop.yp1 = 2988;
P3.bounds.Prop.yp2 = 3334;
P3.bounds.Prop.idyp1 = find(P3.y(:,1) >= P3.bounds.Prop.yp1, 1);
P3.bounds.Prop.idyp2 = find(P3.y(:,1) >= P3.bounds.Prop.yp2, 1);
P3.area.ay1 = trapz(P3.y(P3.bounds.Prop.idyp1:P3.bounds.Prop.idyp2, 1), P3.y(P3.bounds.Prop.idyp1:P3.bounds.Prop.idyp2, 2));
P3.Cont.yPropulsion = P3.area.ay1;
% Braking Section
P3.bounds.Brake.yb11 = 2545;
P3.bounds.Brake.yb12 = 2988;
P3.bounds.Brake.idy11 = find(P3.y(:,1) >= P3.bounds.Brake.yb11, 1);
P3.bounds.Brake.idy12 = find(P3.y(:,1) >= P3.bounds.Brake.yb12, 1);
P3.area.braking.ay1 = trapz(P3.y(P3.bounds.Brake.idy11: P3.bounds.Brake.idy12, 1), P3.y(P3.bounds.Brake.idy11 : P3.bounds.Brake.idy12, 2));
P3.Cont.yBraking = P3.area.braking.ay1;
%% Participant 4 X axis
% Braking Section
P4.bounds.Brake.xp1 = 2909;
P4.bounds.Brake.xp2 = 3655;
P4.bounds.Brake.idx1 = find(P4.x(:,1) >= P4.bounds.Brake.xp1, 1);
P4.bounds.Brake.idx2 = find(P4.x(:,1) >= P4.bounds.Brake.xp2, 1);
P4.area.ax1 = trapz(P4.x(P4.bounds.Brake.idx1:P4.bounds.Brake.idx2, 1), P4.x(P4.bounds.Brake.idx1:P4.bounds.Brake.idx2, 3));
P4.Cont.xBraking = P4.area.ax1;
% Propulsion Section
P4.bounds.Prop.xb11 = 2799;
P4.bounds.Prop.xb12 = 2909;
P4.bounds.Prop.idx11 = find(P4.x(:,1) >= P4.bounds.Prop.xb11, 1);
P4.bounds.Prop.idx12 = find(P4.x(:,1) >= P4.bounds.Prop.xb12, 1);
P4.area.braking.ax1 = trapz(P4.x(P4.bounds.Prop.idx11: P4.bounds.Prop.idx12, 1), P4.x(P4.bounds.Prop.idx11 : P4.bounds.Prop.idx12, 3));
P4.Cont.xPropulsion = P4.area.braking.ax1;
%% Participant 4 Y axis
% Propulsion Section
P4.bounds.Prop.yp1 = 3315;
P4.bounds.Prop.yp2 = 3656;
P4.bounds.Prop.idyp1 = find(P4.y(:,1) >= P4.bounds.Prop.yp1, 1);
P4.bounds.Prop.idyp2 = find(P4.y(:,1) >= P4.bounds.Prop.yp2, 1);
P4.area.ay1 = trapz(P4.y(P4.bounds.Prop.idyp1:P4.bounds.Prop.idyp2, 1), P4.y(P4.bounds.Prop.idyp1:P4.bounds.Prop.idyp2, 2));
P4.Cont.yPropulsion = P4.area.ay1;
% Braking Section
P4.bounds.Brake.yb11 = 2781;
P4.bounds.Brake.yb12 = 3315;
P4.bounds.Brake.idy11 = find(P4.y(:,1) >= P4.bounds.Brake.yb11, 1);
P4.bounds.Brake.idy12 = find(P4.y(:,1) >= P4.bounds.Brake.yb12, 1);
P4.area.braking.ay1 = trapz(P4.y(P4.bounds.Brake.idy11: P4.bounds.Brake.idy12, 1), P4.y(P4.bounds.Brake.idy11 : P4.bounds.Brake.idy12, 2));
P4.Cont.yBraking = P4.area.braking.ay1;
%% Deliverable Portion of Part 3
% Participant 1
P1.IpsPropulsion = sqrt( (P1.Ips.xPropulsion)^2 + (P1.Ips.yPropulsion)^2 );
P1.IpsBraking = sqrt( (P1.Ips.xBraking)^2 + (P1.Ips.yBraking)^2 );
P1.ContPropulsion = sqrt( (P1.Cont.xPropulsion)^2 + (P1.Cont.yPropulsion)^2 );
P1.ContBraking = sqrt( (P1.Cont.xBraking)^2 + (P1.Cont.yBraking)^2 );
% Participant 2
P2.IpsPropulsion = sqrt( (P2.Ips.xPropulsion)^2 + (P2.Ips.yPropulsion)^2 );
P2.IpsBraking = sqrt( (P2.Ips.xBraking)^2 + (P2.Ips.yBraking)^2 );
P2.ContPropulsion = sqrt( (P2.Cont.xPropulsion)^2 + (P2.Cont.yPropulsion)^2 );
P2.ContBraking = sqrt( (P2.Cont.xBraking)^2 + (P2.Cont.yBraking)^2 );
% Participant 3
P3.IpsPropulsion = sqrt( (P3.Ips.xPropulsion)^2 + (P3.Ips.yPropulsion)^2 );
P3.IpsBraking = sqrt( (P3.Ips.xBraking)^2 + (P3.Ips.yBraking)^2 );
P3.ContPropulsion = sqrt( (P3.Cont.xPropulsion)^2 + (P3.Cont.yPropulsion)^2 );
P3.ContBraking = sqrt( (P3.Cont.xBraking)^2 + (P3.Cont.yBraking)^2 );
% Participant 4
P4.IpsPropulsion = sqrt( (P4.Ips.xPropulsion)^2 + (P4.Ips.yPropulsion)^2 );
P4.IpsBraking = sqrt( (P4.Ips.xBraking)^2 + (P4.Ips.yBraking)^2 );
P4.ContPropulsion = sqrt( (P4.Cont.xPropulsion)^2 + (P4.Cont.yPropulsion)^2 );
P4.ContBraking = sqrt( (P4.Cont.xBraking)^2 + (P4.Cont.yBraking)^2 );
% Plot of Ipsilateral Foot
scatter(P1.IpsBraking ,P1.IpsPropulsion, 'X','blue');
hold on
scatter(P2.IpsBraking ,P2.IpsPropulsion, 'X', 'red');
hold on
scatter(P3.IpsBraking ,P3.IpsPropulsion, 'X', 'green');
hold on
scatter(P4.IpsBraking ,P4.IpsPropulsion, 'X', 'black');
hold on
% Plot of Contralateral Foot
scatter(P1.ContBraking ,P1.ContPropulsion, 'O','blue');
hold on
scatter(P2.ContBraking ,P2.ContPropulsion, 'O', 'red');
hold on
scatter(P3.ContBraking ,P3.ContPropulsion, 'O', 'green');
hold on
scatter(P4.ContBraking ,P4.ContPropulsion, 'O', 'black');
hold on
legend('Participant 1','Participant 2','Participant 3','Participant 4', 'Location','northeastoutside');
%legend([h14,h24], 'Location','southeastoutside');
title('Braking vs Propulsive Impulses')
xlabel('Braking Impulse (Ns)')
ylabel('Propulsive Impulse (Ns)')
xlim([0 30000]); ylim([-10000 40000]);
%% Part 4 - Full Gait Cycle plot
%% Participant 1
% 2100 ms total
figure()
plot(Lab3data.Filtered.Trial_1.P1(2280 : 4380 ,1), 'Color', 'blue');
hold on
plot(Lab3data.Filtered.Trial_1.P1(2280 : 4380 ,7), 'Color', 'blue');
hold on
plot(Lab3data.Filtered.Trial_1.P1(2280 : 4380 ,2), 'Color', 'red');
hold on
plot(Lab3data.Filtered.Trial_1.P1(2280 : 4380 ,8), 'Color', 'red');
hold on
plot(Lab3data.Filtered.Trial_1.P1(2280 : 4380 ,3), 'Color', 'green');
hold on
plot(Lab3data.Filtered.Trial_1.P1(2280 : 4380 ,9), 'Color', 'green');
xlabel('Time (ms)')
ylabel('Force (N)')
title('GRF full gait cycle - Participant 1')
%% Participant 2
% 2230 ms total
figure()
plot(Lab3data.Filtered.Trial_1.P2(1970 : 4200 ,1), 'Color', 'blue');
hold on
plot(Lab3data.Filtered.Trial_1.P2(1970 : 4200 ,7), 'Color', 'blue');
hold on
plot(Lab3data.Filtered.Trial_1.P2(1970 : 4200 ,2), 'Color', 'red');
hold on
plot(Lab3data.Filtered.Trial_1.P2(1970 : 4200 ,8), 'Color', 'red');
hold on
plot(Lab3data.Filtered.Trial_1.P2(1970 : 4200 ,3), 'Color', 'green');
hold on
plot(Lab3data.Filtered.Trial_1.P2(1970 : 4200 ,9), 'Color', 'green');
xlabel('Time (ms)')
ylabel('Force (N)')
title('GRF full gait cycle - Participant 2')
%legend('X','Y','Z')
%% Participant 3
% 1690 ms total
figure()
plot(Lab3data.Filtered.Trial_1.P3(1800 : 3490 ,1), 'Color', 'blue');
hold on
plot(Lab3data.Filtered.Trial_1.P3(1800 : 3490 ,7), 'Color', 'blue');
hold on
plot(Lab3data.Filtered.Trial_1.P3(1800 : 3490 ,2), 'Color', 'red');
hold on
plot(Lab3data.Filtered.Trial_1.P3(1800 : 3490 ,8), 'Color', 'red');
hold on
plot(Lab3data.Filtered.Trial_1.P3(1800 : 3490 ,3), 'Color', 'green');
hold on
plot(Lab3data.Filtered.Trial_1.P3(1800 : 3490 ,9), 'Color', 'green');
xlabel('Time (ms)')
ylabel('Force (N)')
title('GRF full gait cycle - Participant 3')
%legend('X','Y','Z')
%% Participant 4
% 1910 ms total
figure()
plot(Lab3data.Filtered.Trial_1.P4(1910 : 3820 ,1), 'Color', 'blue');
hold on
plot(Lab3data.Filtered.Trial_1.P4(1910 : 3820 ,7), 'Color', 'blue');
hold on
plot(Lab3data.Filtered.Trial_1.P4(1910 : 3820 ,2), 'Color', 'red');
hold on
plot(Lab3data.Filtered.Trial_1.P4(1910 : 3820 ,8), 'Color', 'red');
hold on
plot(Lab3data.Filtered.Trial_1.P4(1910 : 3820 ,3), 'Color', 'green');
hold on
plot(Lab3data.Filtered.Trial_1.P4(1910 : 3820 ,9), 'Color', 'green');
xlabel('Time (ms)')
ylabel('Force (N)')
title('GRF full gait cycle - Participant 4')
%legend('X','Y','Z')
