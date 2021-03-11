function [contrast] = applyContrast(betas1, betas2, residuals)
% function [contrast] = applyContrast(betas1, betas2)
% calculates the significant contrast between two conditions/explanatory 
% variables' beta values
%
% takes  3 values:
%  - betas1 - the beta values of first explanatory variable
%  - betas2 - the beta values of second explanatory variable
%  - residuals - the residuals computed by subtracting the values predicted
%  from betas from the actual recorded data

contrast = betas1-betas2;
[~,~,~,ts] = size(residuals);
sq_std = sum((residuals.^2), [4]) / (ts-1);
t = contrast./sqrt(sq_std./ts);
contrast(abs(t)<10) = 0;
end