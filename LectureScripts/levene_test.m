clear; close all;

% Import results from clinical trial of 2 drugs
dat = readtable("multi-drugs.csv");
dat.drug = string(dat.drug);

% "effect" means the drug has a positive effect on patient

%%
unstack(dat,'effect', 'drug', 'AggregationFunction',@var)


%%
p = vartestn(dat.effect, dat.drug,'TestType','LeveneAbsolute')

% p = 0.74 ==> Cannot reject H0 with high confidence 
% (because we don't have p < 0.05, or 0.01, or anything "small")
% So cannot reject the assumption that all variances are equal.