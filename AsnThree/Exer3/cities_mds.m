clear;
close all;

%% 

% Let's import the `cities` dataset, which consists 
% of quality-of-life ratings for 329 US cities
load cities


%% 

% Calculate the distance between cities from 
% the `ratings` numerical matrix. Here we use 
% `pdist` which calculates the Euclidian distance
% i.e., the sum of the squared difference by 
% categories (crime, education, arts, ...)

D = squareform(pdist(ratings));
% Note: Despite the square array being the natural 
% way to represent the pairwise distance, Matlab `pdist()`
% returns a vector, so we need to manually reshape
% it into a square matrix with `squareform()`

%% 
% We could look at a "heatmap" to try to make sense 
% of those different distance in order to assess which cities
% are similar or not. But unfortunatelly, that's not easy, as 
% shown here for the first 50 cities:
heatmap(D(1:50,1:50))



%% ==== MDS ===

%% Classical (metric) MDS 

% The command `cmdsscale()` performs a Classical MDS. 
% It returns 2 outputs: 
% 1) the matrix Y of the coordinates in the lower dimension space
%    that tries to preserve the original distances
% 2) the eigenvalues of the spectral decomposition used inside the MDS, that
%    indicates how large the lower dimension space should be.

[tmp ev] = cmdscale(D);

%%
% Let's look at the first 10 eigenvalues:
pareto(ev(1:10))

ev(1:10) / sum(ev(1:10))
% The first 2 eigenvalues explains about 88% of the distance variance. 
% Hence, it is relatively safe to project our original 9-dimensional data 
% onto a 2-dimensional lower space


%% 

[Y ev] = cmdscale(D, 2);
% Note: `Y` is simply the first 2 columns of `tmp`

%% Lower-dimension Map with classical MDS
nf = 40;
Tc = find_furthest(Y, names, nf); % see function script in `find_furthest.m`



%% Plot the MDS result in 2-dimension
plot_mds(Y,Tc);



%%  ==== Different types of MDS ====

Y    = cmdscale(D, 2);
Zms  = mdscale(D,2,'criterion','metricsstress');
Zs   = mdscale(D,2,'criterion','stress');
Zsam = mdscale(D,2,'criterion','sammon');

nf = 12;

Tc   = find_furthest(Y, names, nf);
Tms  = find_furthest(Zms, names, nf);
Ts   = find_furthest(Zs, names, nf);
Tsam = find_furthest(Zsam, names, nf);

names

figure
subplot(2,2,1)
plot_mds(Y,Tc);
title('Classical', 'FontSize', 20)

subplot(2,2,2)
plot_mds(Zs,Ts);
title('Stress', 'FontSize', 20)

subplot(2,2,3)
plot_mds(Zms,Tms);
title('Metric stress', 'FontSize', 20)

subplot(2,2,4)
plot_mds(Zsam,Tsam);
title('Sammon', 'FontSize', 20)

% We see that the different method give (slightly) different results. 


%% Example MDS in 3-dimension

% We can also project an MDS in a 3D space 
% (instead of the 2d space before):

Y3d = mdscale(D,3);
figure
scatter3(Y3d(:,1), Y3d(:,2),Y3d(:,3), 200, 'filled')
alpha(0.3)

% Adds more perspective (two points that 
% seemed very close in 2D may not be 
% that close in 3D)

%%  Example MDS in 4-dimension
%
% The 4th dimension is the color!

Y4d = mdscale(D,4);
figure
col = Y4d(:,4);
scatter3(Y3d(:,1), Y3d(:,2),Y3d(:,3),  200, col,'filled')
alpha(0.6)


%% === Checking the disparities for non-metric MDS ===

%  A non-metric MDS is concern about preserving the ORDER of the distances
%  from the full to lower dimension. We can check how good a job the MDS
%  did using the output `disparities` from `mdscale`:

[Z, stress, disparities] = mdscale(D,2,'criterion','sammon'); % Try 'stress' too

%%
% Let's look how the pairwise distances between data points
% are conserved by the MDS procedure:

DD =  pdist(ratings); % _not_ in square matrix form
[DD, idx] = sort(DD); % sort the original pairwise distances

Dlow = pdist(Z);      % pairwise distances in the lower-dimensional space

% Plot to compare the pairwise distances.
% Perfect preservation would result in points 
% on a line:
scatter(Dlow(idx),DD,200);
grid()


