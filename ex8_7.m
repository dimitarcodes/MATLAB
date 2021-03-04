%% 8.7
load('tfr-data.mat');
window_size = 100;
foi = 29;
fs = 1/(time(2)-time(1));
%% 8.7 a)
plot(time, get_amplitude(data, fs, window_size, foi));
xlabel('Time(s)');
ylabel('Amplitude');
title('amplitude of the 29-Hz component over time');
set(gcf, 'Position', [10,10,600,600]);