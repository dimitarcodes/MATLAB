% freq = 20hz

% a

% nr of samples:
% n = 100:
% steps: 20/100 = 0.2hz -> we will get a leak because 2.5hz won't 
% be covered - closest values we can cover are 2.4hz and 2.6hz
% n = 160
% steps: 20/160 = 0.125hz -> we won't get a leak because 2.5hz is covered
% (20x 0.125hz = 2.5hz)
% n = 250
% steps: 20/250 = 0.08 -> we will get a leak because 2.5hz won't 
% be covered - closest values we can cover are 2.48 and 2.56

% measurement time:
% T = 1s
% n = 1s * 20hz = 20 samples
% steps: 20/20 = 1hz -> we will get a leak because 2.5hz won't be covered -
% closest values we can cover are 2hz and 3hz
% T = 2.4s
% n= 2.4s * 20hz = 48 samples
% steps = 20/48 = 0.417hz -> we will get a leak because 2.5hz won't be
% covered - closest values we can cover are 2.502 and  2.085
% T = 5s
% n = 5 * 20hz = 100 samples
% steps = 20/100 = 0.2 -> we will get a leak because 2.5hz won't 
% be covered - closest values we can cover are 2.4hz and 2.6hz

% fs = 50hz, T =2s, n = 50*2 = 100 samples, step size = 50/100 = 0.5 hz
% fs = 50hz, T =5s, n = 50*5 = 250 samples, step size = 50/250 = 0.2 hz
% fs = 50hz, T =20s, n = 50*20 = 1000 samples, step size = 50/1000 = 0.05 hz