%% 6.4
%% 6.4 load data

load('alcohol.mat');
%% 6.4 expectations
% i expect to find a positive correlation because a young brain is more 
% mallible and susceptable to manipulation by advertisement (citations 
% needed)

%% plot data
scatter(reclametijd, alcoholconsumptie);
xlabel('advertisement duration (min)');
ylabel('alcohol consumption by adolescents (dl)');
title([{'relationship between alcohol consumption'},
    {'of adolescents and advertisement duration'}]);

%% regression
[R,p] = corrcoef(reclametijd, alcoholconsumptie);
beta = polyfit(reclametijd, alcoholconsumptie, 1);
%% verify they are significantly correlated
% p < 0.05 therefore the findings are significant
% and the null hypothesis (no correlation) can be rejected

%% plot residuals

alcoholfit = polyval(beta, reclametijd);
res =  alcoholconsumptie - alcoholfit;
scatter(reclametijd, res, 'k');
xlabel('advertisement time (minutes)');
ylabel('residuals');
title('Residuals plot of alcohol consumption and advertisement time')
%% plot residuals - answer
% the residuals vary between a relatively tight domain [-3;3], so there is 
% indeed a linear relationship

%% predict 15 minutes
slope = beta(1);
intercept = beta(2);
prediction15 = 15*slope + intercept;
%% predict 15 minutes conclusion
% prediction15 = 4.3533, so we expect an adolescent to drink 4.3533 dl of
% alcohol on average after having watched 15 minutes of alcohol adverts

%% draw regression line
scatter(reclametijd, alcoholconsumptie, "DisplayName", "data points");
xlabel('advertisement duration (min)');
ylabel('alcohol consumption by adolescents (dl)');
title([{'relationship between alcohol consumption'},
    {'of adolescents and advertisement duration'}]);
hold on;
plot(reclametijd, alcoholfit, 'r-', "DisplayName", "regression line");
legend;

%% brief recommendation
% since the regression line shows a positive relationship between
% advertisement time and alcohol consumption amongst adolescents I would
% recommend the government limit the time alcohol ads can run or ban them
