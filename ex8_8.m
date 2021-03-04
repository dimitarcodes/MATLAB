%% 8.8
load('tfr-data.mat');
fs = 1/(time(2)-time(1));
tfr = [];
%% 8.8 a)
for freq = 1:60
    window_size = ( (1/freq)*fs) * 7;
    tfr = [tfr; get_amplitude(data, fs, window_size, freq)];
end
%% 8.8 b)
image(128 + 128* tfr./max( max( abs(tfr) ) ) ); 
set(gca, 'YDIR', 'normal');
set(gca, 'XTick', linspace(1,size(data,2), 10));
tf = time(1); tl = time(end);
set(gca, 'XTickLabel', round(10*(linspace(tf,tl,10)))/10);
colormap jet;
xlabel('Time (s)');
ylabel('Frequency (Hz)');
title('Time-frequency plot');