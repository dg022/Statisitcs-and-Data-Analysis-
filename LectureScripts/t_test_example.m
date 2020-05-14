clear;

% Mean speed of the null hypothesis:
mean_H0 = 100;

% Generate (fake) speed observations:
rng(1234);
n = 20;
mean_obs = 101;    
speed_obs = mean_obs + 12 * randn(n,1); % Norm(101, sigma=12) = 101 + 12*N(0,1)

% Checking:
mean(speed_obs)
sd_data = sqrt(var(speed_obs))


%%
% Z-test:
[z_reject z_pv] = ztest(speed_obs, mean_H0, sd_data, "Alpha", 0.02)

% t-test:
[t_reject t_pv] = ttest(speed_obs, mean_H0, "Alpha", 0.02)




%% === TWO-SAMPLE t-TEST ===


% Generate speed observations for 2 groups:
% - new drivers
% - experienced drivers

rng(1234)
n_new = 9;  % Number of new drivers
n_xpr = 11; % Number of experienced drivers
speed_new = 101 + 7 * randn(n_new,1);
speed_xpr = 107 + 12 * randn(n_xpr,1);

mean(speed_new)
mean(speed_xpr)

spd = [speed_new' speed_xpr'];
grp = [repmat("new",1,n_new) repmat("xpr",1,n_xpr)];
boxplot(spd, grp)
%%

confidence_level = 0.95;
alpha = 1 - confidence_level;

% Assuming both groups have the SAME variance (Student t-test):
[reject pval] = ttest2(speed_new, speed_xpr, 'Alpha', alpha)

%%
% Assuming both groups do NOT have the samevariance (Welch t-test):
[reject pval] = ttest2(speed_new, speed_xpr, 'Vartype','unequal', 'Alpha', alpha)




%% === WILCOXON TEST ====

rng(1234);
n = 20;

% Make up a distribution that is definitely _not_ normal:
speed_new = [normrnd(90, 3, 1, n/2) normrnd(105, 4, 1, n/2) ]
speed_xpr = [normrnd(103, 6, 1, n/2) normrnd(115, 12, 1, n/2) ]

histogram(speed_new, 70:2:120)

%%
% Checking if distributions are normal:
figure
subplot(1,2,1)
qqplot(speed_new)
subplot(1,2,2)
qqplot(speed_xpr)

%%
% Run the Wilcoxon test:

[pval rej stats] = ranksum(speed_new, speed_xpr, 'alpha', 0.01)



