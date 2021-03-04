function [amplitude] = get_single_amplitude(data, fs, s_begin, s_end, foi)
% function [amplitude] = get_single_amplitude(data, fs, s_begin, s_end, foi)
% takes signal data matrix, frequency, beginning index of slice, end index
% of slice and a frequency of interest and returns the amplitude of the
% frequency 
if (s_begin < 1 || s_end > size(data,2))
    amplitude = NaN;
else
    slice = data(:,s_begin:s_end);
    [range, amplitudes] = fourier_transform(fs, slice);
    amp_mean = mean(amplitudes);
    [~, idx] = nearest_value(range, foi);
    amplitude = amp_mean(idx);
end
end