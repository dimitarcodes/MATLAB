function [Y] = removeOutliers(X, nr_stds)
% function [Y] = removeOutliers(X);
% removes outliers from an array X
% returns new array Y without outliers
% an outlier is defined as an element
% that sits 'nr_stds' standard
% deviations away from the data mean

x_mean = mean(X);
x_std = std(X);
Y = X(abs(X-x_mean)/x_std < nr_stds);
