%% 8.4 
load('tfr-data.mat');
freq = 1/(time(2)-time(1));
%% 8.4 - 1
s_begin = 1;
s_end = 100;
%% 8.4 - 2
slice = data(:,s_begin:s_end);
%% 8.4 - 3
[range, amplitude] = fourier_transform(freq, slice);
%% 8.4 - 4
subplot(121);
amp_mean = mean(amplitude);
denoised = amp_mean.*range;
plot(range, denoised);
xlabel('Frequency (Hz)');
ylabel('Amplitude (1/f corrected)');
title([{'frequency-content average accross'},
    {'slices (1:100) from all trials'}]);
set(gcf, 'Position', [10,10,1100,400]);
%% 8.4 - 5
subplot(122)
s_begin = 801;
s_end = 900;
slice = data(:,s_begin:s_end);
[range, amplitude] = fourier_transform(freq, slice);
amp_mean = mean(amplitude);
denoised = amp_mean.*range;
plot(range, denoised);
xlabel('Frequency (Hz)');
ylabel('Amplitude (1/f corrected)');
title([{'frequency-content average accross'},
    {'slices (801:900) from all trials'}]);
set(gcf, 'Position', [10,10,1100,400]);
%% 8.4 - 5 ANSWER
% it belongs to timeslot starting at 1.667 seconds and ending at 1.9967 seconds
%% 8.4 - 6 
% the shape is generally the same, the (801-900) slice exhibits slightly
% higher amplitude values
%% 8.4 - 7
[v, idx] = nearest_value(range, 29);
amp_twni = amp_mean(idx);
%% 8.4 - 7 ANSWER
% the mean amplitude at frequency of 29Hz is 4.1526e-14