function [amplitudes] = get_amplitude(data, fs, window_size, foi)
% function [amplitudes] = get_amplitude(data, fs, window_size, foi)
% function takes data, sampling frequency, size of sample window and
% frequency of interest and returns vector of the amplitudes of that 
% frequency for each window, having as many windows as data points per
% sensor in the data

amplitudes = zeros(1,size(data,2));

for t=1:size(data,2)
    s_begin = t-floor(window_size/2);
    s_end = t+ceil(window_size/2)-1;
    amplitudes(t) = get_single_amplitude(data, fs, s_begin, s_end, foi);
end