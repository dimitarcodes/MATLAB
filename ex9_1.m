%% 9.1
%% 9.1 - a)
load('FinalAssignment_fMRI_data.mat')
%% 9.1 - b)
view_scan(Y);
%% 9.1 = c)
%% 9.3
%% 9.3 - a)
%% 9.3 - b)
[~,~,~,nr_scans] = size(Y);
X = generateDesignMatrix(fix, stat, natt, att, hrf, nr_scans);
[betas, Yhat, residuals] = computeBetaYhatResiduals(X,Y);

c1 = applyContrast(betas(:,:,:,3), betas(:,:,:,2)); 
c2 = applyContrast(betas(:,:,:,4), betas(:,:,:,3));
c3 = applyContrast(betas(:,:,:,5), betas(:,:,:,4));

view_scan(c1);
view_scan(c2);
view_scan(c3);
%% 9.3 - b) ANSWER
% * Stat - Fix  - coordinates (in mm): (0.0,-93.0,0.0) 
% * Natt - Stat - coordinates (in mm): (0.0,-96.0,0.0)
% * Att - Natt  - coordinates (in mm): (3.0,12.0,69.0)