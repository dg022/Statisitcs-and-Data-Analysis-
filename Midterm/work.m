%% Is the data Normally distributed?
clear;
close all;

% Same example as in "hypothesis testing":
rng(1234);
n = 20;
mean_obs = 101;    
speed_obs = mean_obs + 12 * randn(n,1);

figure
subplot(1,2,1)
histogram(speed_obs, 20)
subplot(1,2,2)
qqplot(speed_obs) 
grid;
%% Example when it's not normally distributed
rng(1234);

x = rand(1, 14);  % <-- Uniform distribution, so NOT normal
figure
qqplot(x)
grid()