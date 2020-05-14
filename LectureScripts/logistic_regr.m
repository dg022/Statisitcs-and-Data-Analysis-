
clear; close all;

dat = readtable("age-surgery.csv");
dat.age = double(dat.age);
dat.surgery = double(dat.surgery);
summary(dat);

scatter(dat.age, dat.surgery,200, 'MarkerFaceColor','black')
alpha(0.5)
grid()

%% 

% Linear regression (the silly thing to do...):

lin_regr = fitlm(dat, 'surgery~age')

coef  = lin_regr.Coefficients;

% build the regression line (for the plot):
y0    = table2array(coef(1,1));
slope = table2array(coef(2,1));
x     = 0:100;
y     = y0 + slope .* x;

hold on
scatter(dat.age, dat.surgery, 'MarkerFaceColor','black')
set(gca,'FontSize',20)
grid()
plot(x,y,'LineWidth',3);



%%

% Logistic regression (the smart thing to do...)

% Logistic regression are actually part of a 
% large family of regressions, called 
% "Generalized Linear Model" (GLM), hence
% the name of the Matlab function. 
% The option `binomial` specifies that we
% want the logistic regression:

logistic_regr = glmfit(dat.age, dat.surgery,'binomial') 

beta_star = logistic_regr;
z = beta_star(1) + (x * beta_star(2));
z = 1 ./ (1 + exp(-z));


%%
% Using the logistic regression to make a prediction


% Plot (again) the data
figure
hold on
scatter(dat.age, dat.surgery, 100, 'MarkerFaceColor','black')
set(gca,'FontSize',20)
grid()
plot(x,z,'LineWidth',3);

% What is the probability that a 40 years-old individual
% ever had surgery?
new_age = 40;
proba_surgery = logistic_curve(new_age, beta_star(1), beta_star(2))

scatter(new_age, proba_surgery, 400, 'MarkerFaceColor','blue')
 

function y = logistic_curve(x, b0, b1)

    y = 1 / ( 1 + exp(-(b0 + b1*x))) ;

end

