function [X] = generateDesignMatrix(fix, stat, natt, att, hrf, n_scans)
% function [X] = generateDesignMatrix(fix, stat, natt, att, hrf, n_scans)
% creates a Design Matrix based on 6 variables:
% - fix, stat, natt, att - 4 1-D vectors, containing scan index of
% respective condition presentation
% - hrf - 1-D vector, containing the hemodynamic response function
% - n_scans - the number of scans in the fMRI data

D = zeros(n_scans, 5, 'single');
D(fix,2) = 1;
D(stat,3) = 1;
D(natt,4) = 1;
D(att,5) = 1;
XD = conv2(D, hrf);
X = XD(1:n_scans,:);
X(:,1) = 1;
end
