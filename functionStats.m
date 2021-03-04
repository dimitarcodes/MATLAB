function [means,maximums,minimums,standard_deviations] = functionStats(x,y)
% function [means,maximums,minimums,standard_deviations] = functionStats(x,y)
% a function that takes two vectors x and y of same size
% or a vector x and a matrix y, which has rows equal to size of vector x and
% multiple columns
% plots vector y (or columns of matrix y) as a function of vector x
% returns the means, maximums, minimums and standard_deviations of vector x
% and vector y (or columns of matrix y)
if size(x) == size(y)
    plot(x,y, '-or');
else
    plot(x,y, '-o');
end
means = [mean(x) mean(y)];
maximums = [max(x) max(y)];
minimums = [min(x) min(y)];
standard_deviations = [std(x) std(y)];