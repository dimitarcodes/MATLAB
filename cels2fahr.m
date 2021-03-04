function [fahr] = cels2fahr(cels)
% function [fahr] = celsius2fahr(cels)
% this function converts temperature 
% from celsius to fahrenheit
% returns the same type as input (number/vector/matrix)

fahr = cels * (9/5) + 32;