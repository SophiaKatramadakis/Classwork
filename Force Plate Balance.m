
%%%%%%%%% BMEG 330 Lab 1 %%%%%%%%%%%
% Author: Sophia Katramadakis, Adapted from Pawel Kudzia, Ph.D
clear;
close all;
clc;
%% Set figure Parameters
parms.width = 10;
parms.height = 2;
parms.alw = 0.75;
parms.fsz = 11;
parms.lw = 12.5;
parms.msz = 8;
parms.print = 1;
parms.figWidth = 1200;
parms.figHeight = 300;
%% load experimental data
temp1 = readtable('eyes_closed_normal.txt', 'Delimiter', ',', 'Format', '%f%f%f%f%f%f');
temp2 = readtable('eyes_open_normal.txt', 'Delimiter', ',', 'Format', '%f%f%f%f%f%f');
temp3 = readtable('eyes_closed_tandem_no_touching.txt', 'Delimiter', ',', 'Format', '%f%f%f%f%f%f');
temp4 = readtable('eyes_closed_tandem_touching.txt', 'Delimiter', ',', 'Format', '%f%f%f%f%f%f');
temp5 = readtable('eyes_open_tandem_no_touching.txt', 'Delimiter', ',', 'Format', '%f%f%f%f%f%f');
temp6 = readtable('eyes_open_tandem_touching.txt', 'Delimiter', ',', 'Format', '%f%f%f%f%f%f');
temp7 = readtable('sway_back_and_forth.txt', 'Delimiter', ',', 'Format', '%f%f%f%f%f%f');
temp8 = readtable('sway_side.txt', 'Delimiter', ',', 'Format', '%f%f%f%f%f%f');
ExpData.Raw.Normal_EC_NoTouch = table2array(temp1);
ExpData.Raw.Normal_EO_NoTouch = table2array(temp2);
ExpData.Raw.Tandem_EC_NoTouch = table2array(temp3);
ExpData.Raw.Tandem_EC_Touch = table2array(temp4);
ExpData.Raw.Tandem_EO_NoTouch = table2array(temp5);
ExpData.Raw.Tandem_EO_Touch = table2array(temp6);
ExpData.Raw.Sway_Front = table2array(temp7);
ExpData.Raw.Sway_Side = table2array(temp8);
%% Calibration %%
trialnames = fieldnames(ExpData);
order = {'Normal_EC_NoTouch', 'Normal_EO_NoTouch', 'Tandem_EC_NoTouch'...
  'Tandem_EC_Touch','Tandem_EO_NoTouch','Tandem_EO_Touch', 'Sway_Front', 'Sway_Side'};
ExpData.Calibration.Control = load('control.txt');
%% Process Data %%
for i = 1:numel(order)
   Samplefreq = 1000;
   clear ac; clear v; clear p; clear zeros; clear Forces2; clear time; clear CoP;
RawData = ExpData.Raw.(char(order(i))) ;
%% calculate %%
Forces2 = RawData;
zeros = all(Forces2 == 0,2);
Forces2(zeros,:) = [];
h =0;
CoP(:,1) = (-h*Forces2(:,1)-Forces2(:,5))./Forces2(:,3);
CoP(:,2) = (-h*Forces2(:,2)-Forces2(:,4))./Forces2(:,3);
Wn = [0.3 50]*2/Samplefreq;
[b,a] = butter(4, Wn,'bandpass');
ExpData.(char(order(i))).COPFilt =filtfilt(b,a,CoP);
time = linspace(0,size(CoP,1)/Samplefreq,size(CoP,1));
g = 9.81;
mass = mean(Forces2(:,3))/g;
ac(:,1) = Forces2(:,1)./mass;
ac(:,2) = Forces2(:,2)./mass;
ac(:,3) = Forces2(:,3)./mass-g;
ac =  filtfilt(b,a,ac);
ac =  detrend(ac);
v(:,1) = cumtrapz(time, ac(:,1));
v(:,2) = cumtrapz(time, ac(:,2));
v(:,3) = cumtrapz(time, ac(:,3));
v =  filtfilt(b,a,v);
v = detrend(v);
p(:,1) = cumtrapz(time, v(:,1));
p(:,2) = cumtrapz(time, v(:,2));
p(:,3) = cumtrapz(time, v(:,3));
ExpData.(char(order(i))).Postion = detrend(p) ;

  %% Magnitude and Variability Analysis %%
   % mean (magnitude) of each force component
   meanFx = mean(Forces2(:,1));
   meanFy = mean(Forces2(:,2));
   meanFz = mean(Forces2(:,3));
   % standard deviation (variability) of each force component
   stdFx = std(Forces2(:,1));
   stdFy = std(Forces2(:,2));
   stdFz = std(Forces2(:,3));
  
   ExpData.(char(order(i))).ForceMagnitude.MeanFx = meanFx;
   ExpData.(char(order(i))).ForceMagnitude.MeanFy = meanFy;
   ExpData.(char(order(i))).ForceMagnitude.MeanFz = meanFz;
 
   ExpData.(char(order(i))).ForceVariability.StdFx = stdFx;
   ExpData.(char(order(i))).ForceVariability.StdFy = stdFy;
   ExpData.(char(order(i))).ForceVariability.StdFz = stdFz;
 
   % Display the results
   fprintf('\nTrial: %s\n', char(order(i)));
   fprintf('Mean Fx: %f N\n', meanFx);
   fprintf('Mean Fy: %f N\n', meanFy);
   fprintf('Mean Fz: %f N\n', meanFz);
   fprintf('Standard Deviation Fx: %f N\n', stdFx);
   fprintf('Standard Deviation Fy: %f N\n', stdFy);
   fprintf('Standard Deviation Fz: %f N\n', stdFz);
    
%% Plot %%
figure(55)
subplot(1,8,i)
set(gcf, 'Position', [100, 100, parms.figWidth, parms.figHeight]);
plot(ExpData.(char(order(i))).COPFilt(:,1),ExpData.(char(order(i))).COPFilt(:,2),'k')
b = regexprep(order{1,i},'_',' ','emptymatch');
title(b)
hold on
plot(ExpData.(char(order(i))).Postion(:,1),ExpData.(char(order(i))).Postion(:,2),'r')
ylim([-0.08 0.08])
xlim([-0.06 0.06])
if i ==1
  ylabel('Y Position(m)')
end
xlabel('X Position(m)')
line([ 0 0] ,[-0.03 0.03],'Color','black','LineStyle','--')
line([-0.02 0.02] ,[0 0],'Color','black','LineStyle','--')
set(gca, 'FontSize', parms.fsz, 'LineWidth', parms.alw);
end
if parms.print
print('EXAMPLE_Lab1_BMEG300','-dpng','-r300');
end
return
