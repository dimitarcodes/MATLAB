function [total, priceVAT] = priceInclVAT(price, vat)
% function [priceVAT] = priceInclVAT(price, vat)
% this function calculates the price
% with vat given the price without vat 
% and the vat in percent

total = price' + price'.*(vat./100);
priceVAT = price'.*(vat./100);