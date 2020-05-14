clear; 
close all;
rng(1234)


%% === LCD Screens Quality Check Example ====

% Probability values to try:
m = 200;
p_star = linspace(0, 0.1, m)

% Observations:
N = 150; % number of screens sampled
k = 3;   % number of defective screens

% Calculate likelhood values 
% for different probability values:
% (see function at the bottom of this script)
y = zeros(m,1);
for i=1:m
    y(i) = L(p_star(i), N, k)
end

% Likelihood as a function of 
% probability parameter. 
% We want the value p* that 
% maximizes the likelihood:
plot(p_star,y, 'LineWidth',6)
grid()
set(gca, 'FontSize', 18)
xlabel('P'); ylabel('Likelihood')



%%  

% Simulate our observations:
good  = repmat(0,1,N-k);
defct = repmat(1,1,k);
data = [good defct];

%%
% Call the Maximum Likelihood Estimation function `mle`:
[p_star ci] = mle(data,'distribution','bernoulli','alpha',.01)

% p_star is the "point estimate" 
% and `ci` the confidence interval (here 99%CI, because alpha=0.01)


%% === Example with a more complex distribution ====

n_sample = 300;
dat = gamrnd(4, 1, n_sample, 1);
histogram(dat)

[p_star ci] = mle(dat,'distribution','Gamma', 'Alpha', 0.01)

% --> p_star returns the parameters (there are 2 for the gamma
% distribution) that best match (from a likelihood standpoint) the observed
% data.

%%
% Illustration of the gama fit:
figure
hold on
histogram(dat,'Normalization','probability');
x = 0:0.1:15;
y = gampdf(x, p_star(1), p_star(2));

plot(x,y,'LineWidth',6)


%% ============= FUNCTIONS ================

function y = L(p, N, k)
    y = nchoosek(N,k) * p^k * (1-p)^(N-k);
end


