%% Data Processing Code
clear all; clc; close all;
%% Load data
accelData = readtable("LaurynTrial1.csv"); % replace for each trial
acx_raw = table2array(accelData(:,"AccelerationX_m_s_2_"));
acy_raw = table2array(accelData(:,"AccelerationY_m_s_2_"));
acz_raw = table2array(accelData(:,"AccelerationZ_m_s_2_"));
t = table2array(accelData(:,'Time_s_'));
accelTable = [acx_raw, acy_raw, acz_raw];
Data.Raw.Acc = accelTable;
%% Filtering Data
Fs = 100; % Sampling frequency in Hz
fcutlow = 35; % low cut frequency in Hz 
[b,a] = butter(4,fcutlow/(Fs/2), 'low');   % Get filter coeff of butter filter
acx = filtfilt(b,a, accelTable(:,1)); % zero phase delay low-pass filtering
acy = filtfilt(b,a, accelTable(:,2));
acz = filtfilt(b,a, accelTable(:,3));
Data.Filt.Acc = [acx, acy,acz];
figure()
subplot(1,2,1)
plot(t, acx_raw)
xlabel('Time (s)')
ylabel('Acceleration (m/s^2)')
title('Acceleration in X')
hold on
plot(t, acx)
legend('Raw', 'Filtered')
subplot(1,2,2)
plot(t, acz_raw)
xlabel('Time (s)')
ylabel('Acceleration (m/s^2)')
title('Acceleration in Z')
hold on
plot(t, acz)
legend('Raw', 'Filtered')
%% calculating angle of rotation for x and y (Raw)
% normalizing acceleration
Data.Raw.ac_norm = [acx_raw/norm(Data.Raw.Acc), acy_raw/norm(Data.Raw.Acc), acz_raw/norm(Data.Raw.Acc)];
% pitch defined angles
Data.Raw.angled = atan2d(Data.Raw.ac_norm(:,2), sqrt(Data.Raw.ac_norm(:,1).^2 + Data.Raw.ac_norm(:,3).^2));
%% calculating angle of rotation for x and y (FILTERED)
% calculations are based on the assumption that the iPhone rotates
% perfectly around the z axis
% normalizing acceleration
Data.Filt.ac_norm = [acx, acy, acz];
% pitch defined angles
Data.Filt.angled = atan2d(Data.Filt.ac_norm(:,2), sqrt(Data.Filt.ac_norm(:,1).^2 + Data.Filt.ac_norm(:,3).^2));
%% plotting
figure('Position', [0 0 800 300],'units','normalized');
box on;
title('Pitch')
plot(t,Data.Raw.angled,'k')
plot(t,Data.Filt.angled,'r')
title('Change in Angle')
xlabel('Time(s)')
ylabel('Degree')
ylim([-130, 130])
%% finding max angle
max_pitch = max(Data.Filt.angled );
disp('maximum pitch (x) angle: ');
disp(max_pitch);
min_pitch = min(Data.Filt.angled );
disp('minimum pitch (x) angle: ');
disp(min_pitch);
