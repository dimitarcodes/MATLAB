function [slope, intercept, sqRes] = lin_regression(x, y)
% function [slope, intercept] = lin_regression(x, y)
% takes two vectors, performs linear regression on them, returns the 
% resulting slope, intercept and sum of squared residuals returned
% and plots the original data with the regression line as well as the
% residuals graph

[R,p] = corrcoef(x, y);
beta = polyfit(x, y, 1);

slope = beta(1);
intercept = beta(2);

yfit = polyval(beta, x);
res = y - yfit;

sqRes = sum(res.^2);

subplot(2,1,1);
scatter(x,y, 'DisplayName', 'data points');
hold on;
plot(x, yfit, 'r-', 'DisplayName', 'regression line');
title([{'original data + regression line'},
    {strcat('correlation coeficient = ', num2str(R(1,2)))}, 
    {strcat('p = ', num2str(p(1,2)))}]); 
xlabel('1st variable');
ylabel('2nd variable');
legend;

subplot(2,1,2);
scatter(x, res);
title('residuals of the data');
xlabel('1st variable');
ylabel('residuals of 2nd variable');
set(gcf,'position',[10,10,400,800]);
hold off