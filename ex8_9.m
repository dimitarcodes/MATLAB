%% 8.9
load('tfr-data.mat');
fs = 1/(time(2)-time(1));
tfr = [];
for freq = 1:60
    window_size = ( (1/freq)*fs) * 7;
    tfr = [tfr; get_amplitude(data, fs, window_size, freq)];
end
%% 8.9 - a)
baseline_tfr = tfr(:,time<0);
baseline_mean = nanmean(baseline_tfr,2);
tfr_corrected = tfr - repmat(baseline_mean, 1, size(tfr,2));
%% 8.9 - b)
image(128 + 128* tfr_corrected./max( max( abs(tfr_corrected) ) ) ); 
set(gca, 'YDIR', 'normal');
set(gca, 'XTick', linspace(1,size(data,2), 10));
tf = time(1); tl = time(end);
set(gca, 'XTickLabel', round(10*(linspace(tf,tl,10)))/10);
colormap jet;
xlabel('Time (s)');
ylabel('Frequency (Hz)');
title('Baseline Corrected Time-frequency plot');