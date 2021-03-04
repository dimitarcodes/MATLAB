%% 6.5
load('testresult.mat')

%% 6.5 - a)
% dependent variable: test score
% predictive variables: everything else (so study duration, coffee, ADHD 
% medication intake, placebo drink units)
% 
% Personally, I think Study Time will show effect.

%% 6.5 - b)
D = [ones(100,1), ADHDmedicijn, Koffie, Placebo, Studietijd];

%% 6.5 - c)
[B, BINT] = regress(Testscore, D);

%% 6.5 - d) - CODE
disp(BINT);

%% 6.5 - d) - ANSWER
% only study time's confidence interval doesn't contain 0, so it is the 
% only significant predictor/influencer
%
% (the ones vector also
% returned an interval without 0 but that's not a predictor)
%
% since placebo's confidence interval contains 0, there probably was no
% placebo effect taking place

%% 6.5 - e) - CODE
disp(B(5));
disp(1/B(5));
disp(strcat( num2str(floor(1/B(5))), " hours and ",  num2str( round( 60* (1/B(5)-floor(1/B(5)) ) )) , " minutes"  ));

%% 6.5 - e - answer 
% Test Score = Variable * Variable's Regression Coefficient
%
% The Regression Coefficient of Study Time is equal to 0.1708 (given by
% B(5))
%
% therefore 1 Test Point = Study Time for 1 point * 0.1708
%
% Study Time for 1 point = 5.8560 hrs 
%
% around 5 hours and 51 minutes of studying are needed to get an 
% extra point on the test