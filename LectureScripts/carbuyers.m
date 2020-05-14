clear;
close all;
format long;

% Import data:
T = readtable("car-buyers.csv")
summary(T)
 
%%
% Reformat our 2 explanatory variables
% into an numerical array:
X = table2array( T(:, {'age','income'}) );

% Isolate the response variable:
Y = T.bought;

%%
% Fit the bivariate logistic regression:
b = glmfit(X, Y,'binomial')

%%
% The variable `b` stores the regression coefficients

% the probability to buy a car 
age = 44;
income = 98000;

proba = logistic_fct(age, income, b)


%%
n = 100
ages    = linspace(18,80,n);
incomes = linspace(1e4,2e5,n);
p = zeros(1,n);
for i=1:n
    p(i) = logistic_fct(20, incomes(i), b)
end
plot(incomes, p)
%%


function y = logistic_fct(x1,b)
    y = 1 / (1 + exp(-(b(1) + b(2) * x1)));
end
