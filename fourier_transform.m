function[range, amplitude, nyq] = fourier_transform(time, signal)
% function[range, amplitude] = fourier_transform(time, signal)
% takes time array and signal array, returns the range and amplitude of the
% fourier transform of that signal.

fs = 1/(time(2)-time(1));

% convert signal from time to frequency domain
Y = fft(signal);
n = length(signal);

% get the amplitude
amplitude = abs(Y)/n;

% construct the associated frequency vector: 
T=n/fs; 
df=1/T;
f=0:df:(fs-df); 

% take Nyquist into account 
n = length(Y); 
nyq = fs/2;
n_cutoff = floor(n/2); 
range = f(1:n_cutoff); 
amplitude = 2*amplitude(1:n_cutoff);  
amplitude(1)= amplitude(1)/2;