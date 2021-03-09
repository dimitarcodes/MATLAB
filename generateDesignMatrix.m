function [X] = generateDesignMatrix(fix, stat, natt, att, hrf, n_scans)
% function [X] = generateDesignMatrix(fix, stat, natt, att, hrf, n_scans)
D = zeros(n_scans, 5, 'single');
D(:,1) = 1;
D(fix,2) = 1;
D(stat,3) = 1;
D(natt,4) = 1;
D(att,5) = 1;
XD = conv2(D, hrf);
X = XD(1:360,:);
end
