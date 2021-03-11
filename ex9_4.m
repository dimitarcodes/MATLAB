%% 9.4
load('FinalAssignment_fMRI_data.mat')
[x,y,z,nr_scans] = size(Y);
X = generateDesignMatrix(fix, stat, natt, att, hrf, nr_scans);
[betas, Yhat, residuals] = computeBetaYhatResiduals(X,Y);
%% 9.4 - a)
c1 = applyContrast(betas(:,:,:,3), betas(:,:,:,2), residuals); 
c2 = applyContrast(betas(:,:,:,4), betas(:,:,:,3), residuals);
c3 = applyContrast(betas(:,:,:,5), betas(:,:,:,4), residuals);
%% 9.4 - b)
view_scan(ana, c1)
%% 9.4 - b) ANSWER
% * Stat - Fix  - coordinates (in mm): (-6.0,-93.0,0.0)
% * Natt - Stat - coordinates (in mm): (-3.0,-93.0,0.0)
% * Att - Natt  - coordinates (in mm): (33.0,-66.0,-18.0)