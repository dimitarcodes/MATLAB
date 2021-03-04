function[range, amplitude] = fourier_transform(fs, signal)
% function[range, amplitude] = fourier_transform(time, signal)
% takes a frequency scalar and data matrix, returns the range and amplitude
% of the fourier transform of that signal.

% convert signal from time to frequency domain
Y = fft(signal,[], 2);
n = size(signal, 2);

% get the amplitude
amplitude = abs(Y)/n;

% construct the associated frequency vector: 
T=n/fs; 
df=1/T;
f=0:df:(fs-df); 

% take Nyquist into account 
n = size(Y,2); 
n_cutoff = floor(n/2); 
range = f(1:n_cutoff); 
amplitude = 2 * amplitude(:,1:n_cutoff);
amplitude(:,1) = amplitude(:,1)/2;
end