function [betas, Yhat, residuals] = computeBetaYhatResiduals(X,Y)
% function [betas, Yhat, residuals] = computeBetaYhatResiduals(X,Y)
% takes 2 variables:
%  - X - 2-D Design Matrix
%  - Y - 4-D fMRI data
% performs regression and returns for each voxel:
% - beta values
% - prediction based on beta values
% - residuals based on data and predictions 
% each variable returned being 4-D as well

[x,y,z,ts] = size(Y);
Yr = reshape(Y, [x*y*z, ts]);
betas = X\Yr';
Yhat = X*betas;
residuals = Yr' - Yhat;

betas = reshape(betas', [x,y,z,5]);
Yhat = reshape(Yhat', [x,y,z,ts]);
residuals = reshape(residuals', [x,y,z,ts]);
end
