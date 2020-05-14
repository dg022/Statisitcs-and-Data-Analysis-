clear; close all;

% Import results from clinical trial of 2 drugs
dat = readtable("multi-drugs.csv");
dat.drug = string(dat.drug);

% "effect" means the drug has a positive effect on patient


%% 

% A quick summary by group:
unstack(dat,'effect', 'drug', 'AggregationFunction',@mean)



%%  === Visualization ===

boxplot(dat.effect, dat.drug)
set(gca,'FontSize', 20)


%%
% Let's check if the data is normally distributed:
u = unique(dat.drug);
n = size(u,1);

figure
for i = 1:n
    subplot(1,n,i)
    qqplot(dat.effect(dat.drug == u(i)))
    title(u(i))
end



%% === ANOVA ====

% Returns a boxplot and a table in another window:
anova1(dat.effect, dat.drug)

%%
% Keeps output simple:
[pval tab stats] = anova1(dat.effect, dat.drug, 'off');

disp(pval)
disp(tab)
disp(stats)



%% === post hoc t-tests ===

% Matlab's `multcompare` wraps several kind of multiple comparison tests.
% For the multiple t-tests with Bonferroni's correction, 
% use the option `CType`, `bonferroni`

[c,m,h,nms] = multcompare(stats, 'Alpha', 0.05, 'CType','bonferroni');

% (See the interactive graph that pops out!)

% Display the results of the pairwise comparisons:
disp(c)

% From Matlab's documentation:
% Columns 1 and 2 contain the indices of the two samples being compared. 
% Column 3 contains the lower confidence interval, 
% column 4 contains the estimate, 
% and column 5 contains the upper confidence interval. 
% Column 6 contains the p-value for the hypothesis test that the corresponding mean difference is not equal to 0.


