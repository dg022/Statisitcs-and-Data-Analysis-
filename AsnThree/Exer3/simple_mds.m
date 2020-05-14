close all;
clear;


p = 9; % try with 3, then 9 to show how this can fail
d = 2;

D = ones(p) - eye(p)
%%
[Y ev] = cmdscale(D,d);
%%
%figure
%pareto(ev)
figure
scatter(Y(:,1), Y(:,2), 222, 'filled')



%% 