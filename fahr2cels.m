function [cels] = fahr2cels(fahr)
% function [cels] = celsius2fahr(fahr)
% this function converts temperature 
% from fahrenheit to celsius
% returns the same type as input (number/vector/matrix)

cels = (fahr - 32) * (5/9);