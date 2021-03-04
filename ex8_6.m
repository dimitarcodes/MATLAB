%% 8.6
load('tfr-data.mat');
window_size = 100;
foi = 29;
fs = 1/(time(2)-time(1));
%% 8.6 - a) 
amps = zeros(1,size(data,2));
%% 8.6 - b) + c)
for t=1:size(data,2)
    s_begin = t-floor(window_size/2);
    s_end = t+ceil(window_size/2)-1;
    amps(t) = get_single_amplitude(data, fs, s_begin, s_end, foi);
end