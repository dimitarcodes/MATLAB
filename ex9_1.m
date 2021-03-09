%% 9.1
%% 9.1 - a)
load('FinalAssignment_fMRI_data.mat')
%% 9.1 - b)
%view_scan(Y);
%% 9.3
%% 9.3 - b)
[x,y,z,nr_scans] = size(Y);
X = generateDesignMatrix(fix, stat, natt, att, hrf, nr_scans);
[betas, Yhat, residuals] = computeBetaYhatResiduals(X,Y);

