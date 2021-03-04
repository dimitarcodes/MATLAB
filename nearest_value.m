function [V,I] = nearest_value(choices,value)
%[V,I] = nearest_value(choices,value)
% Determines which value from "choices" is closest to "value".
% Both the index (inside choices) and the value itself will be outputted.
%
 [~,I] = min(abs(choices - value)); 
 V = choices(I);