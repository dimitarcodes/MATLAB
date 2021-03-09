function [betas, Yhat, residuals] = computeBetaYhatResiduals(X,Y)
% function [betas, Yhat, residuals] = computeBetaYhatResiduals(X,Y)
% X = design matrix
% Y = data

[x,y,z,ts] = size(Y);
betas = zeros(x,y,z);
Yhat = zeros(x,y,z,ts);
residuals = zeros(x,y,z,ts);
for dx=1:x
    for dy=1:y
        for dz=1:z
            % WHAT THE FUCK IS WRONG WITH THIS STUPID LANGUAGE THEY ARE
            % SIZES
            rat = Y(dx,dy,dz,:);
            rat = rat(:);
            disp(size(rat)); % 360 1
            disp(size(X)); % 360 5
            betas(dx,dy,dz) = regress(X, rat); % COMPLAINS THAT ROWS DON'T
            %ALIGN BUT THEY OBVIOUSLY CLEARLY DO????????????
            Yhat(dx,dy,dz) = X*betas(dx,dy,dz);
            residuals(dx,dy,dz) = Y(dx,dy,dz) - Yhat(dx,dy,dz);
        end
    end
end
end
