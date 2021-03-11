function [] = analysefMRIData(file_name)
%function [] = analysefMRIData(file_name)
% Opens a .mat file with fMRI data and analyses it then displays the 
% areas of the brain with significant contrast on top of the anatomical scan.
% 
% The function will plot three figures:
%   - The 1st figure shows contrast Stat - Fix
%   - The 2nd figure shows contrast Natt - Stat
%   - The 3rd figure shows contrast Att - Natt
%
% Assumed data inside the file:
% - Y - 4-D matrix containing fMRI signal
% - ana - 3-D matrix containing anatomical scan signal
% - hrf - 1-D vector containing hemodynamic response function
% - att, natt, stat, fix - each a 1-D vector, containing the scan index at
% which the respective condition was presented
%
% Assumed custom functions available:
% - [X] = generateDesignMatrix(fix, stat, natt, att, hrf, n_scans)
% - [betas, Yhat, residuals] = computeBetaYhatResiduals(X,Y)
% - [contrast] = applyContrast(betas1, betas2)

% load the file
data = load(file_name);

% acquire number of scans from dimensions of data
[~,~,~,nr_scans] = size(data.Y);

% create a design matrix
X = generateDesignMatrix(data.fix, data.stat, data.natt, data.att, data.hrf, nr_scans);

% do regression on the data using the design matrix
% to obtain betas and residuals
[betas, ~, residuals] = computeBetaYhatResiduals(X,data.Y);


% compute the contrast of the betas in each voxel for the 3 conditions
% taking into account significance level (p=0.05, t=10)

% condition stat - fix
c1 = applyContrast(betas(:,:,:,3), betas(:,:,:,2), residuals); 
% condition natt - stat
c2 = applyContrast(betas(:,:,:,4), betas(:,:,:,3), residuals);
% condition att - natt
c3 = applyContrast(betas(:,:,:,5), betas(:,:,:,4), residuals);


% visualize the voxels with significant contrast (essentially where
% activity was observed) on top of the anatomical scan

% condition stat - fix
view_scan(data.ana, c1);
% condition natt - stat
view_scan(data.ana, c2);
% condition att - natt
view_scan(data.ana, c3);
end