clear;  close all;

%% ==== DATA IMPORTATION ====

% Let's import a dataset that contains how 329 US cities score on various
% metrics regarding the quality of life like education, health, 
% crime, housing cost, etc.

load cities

%% 
% Let's make a table out of the imported arrays

% Table of ratings only:
T   = array2table(ratings);
ctg = string(categories);
ctg = strtrim(ctg);
T.Properties.VariableNames = ctg;

% Table including city names:
Tc = T;
Tc.city = string(names);
head(Tc)


%% ==== DATA EXPLORATION ===

% Check for any missing value:
sum(ismissing(T))

summary(T)

%%

% Let's try to understand the data "manually". 

% Considering only 3 variables, hence dim = 3 (<9), 
% with "raw" data in the original coordinate system:
 scatter3(ratings(:,1), ratings(:,2), ratings(:,7) )
 
%% 
% Correlation between ratings:
ctg
corr(ratings)


 
 %%
 
 % Scatterplots to see the relationships between variables
 n_ctg = size(ctg,1);
 figure
 k = 1;
 for(i = 1:n_ctg)
     for(j = 1:n_ctg)
         if( i < j)
             %fprintf("i=%i j=%i \n",i,j);
             subplot(6,6,k)
             scatter(table2array(T(:,i)), table2array(T(:,j)))
             xlabel(T.Properties.VariableNames(i));
             ylabel(T.Properties.VariableNames(j));
             k = k+1;
         end
     end
 end
 
 %% a few empirical distributions
 subplot(1,2,1)
 histogram(T.arts)
 subplot(1,2,2)
 histogram(T.crime)

 
 % We start to fell that exploring this high-dimensional dataset
 % is going to be tedious, with no guarantee to find interesting
 % insights...
 
 
 
 
%% === PCA ===

% When the variables are in different units or the difference 
% in the variance of different columns is substantial (as in this case),
% scaling of the data or use of weights is often preferable.



figure()
boxplot(ratings,'Labels',categories)
set(gca, 'FontSize', 20)
grid()

% Perform the principal component analysis by using the inverse variances
% of the ratings as weights.:

[wcoeff,score,latent,tsquared,explained] = pca(ratings, ...
                                               'VariableWeights','variance');

%%
% The "weighted coefficients" are the 
% principal component vectors:    
ctg
wcoeff
c3 = wcoeff(:,1:3)

%%
% They are NOT normalized, but we can do this manually
% by dividing by the standard deviation of each variable:
ctg
coef_norm = inv(diag(std(ratings))) * wcoeff  % <== this is an efficient way to divide each column by its std dev. 

% STOPPED HERE =================

% Each column of `coef_norm` is the "eigenvector" of the covariance matrix,
% the first column is associated with the highest eigenvalue,
% the second column is associated with the second highest eigenvalue,
% etc.

% These eigenvectors define the new coordinates system that maximize
% the variance of the data along each (new) axis. 
% This new coordinates system gives us the "best perspective".

%%

% Let's print what the new coordinates system is made of,
% sorting by the largest (absolute value) components:

pc1_categ = table(string(categories), round(coef_norm(:,1),2));
fprintf("PC1")
sortrows(pc1_categ,2,'descend')

pc2_categ = table(string(categories), round(coef_norm(:,2),2));
pc2_categ.var2abs = abs (pc2_categ.Var2);
fprintf("PC2")
sortrows(pc2_categ,3,'descend')



%% ==== PLOTS =====


% the output `score` are the observations in
% the NEW coordinates system defined 
% by the principal component (eigenvectors).

% Let's look at the first 15 cities in the dataset.
% Note that in the NEW coordinates system, it is not 
% easy to INTERPRET what the coordinates mean 
% for one data point.
score(1:15,:)


%% --- Create a plot of the first two columns of `score`.

% In other words, we are going to represent the data in 2 dimensions,
% with the two dimensions being the 2 new coordinates that explain
% the most variance along their axis.


% Extract the first two "principal" components (coordinates):
pc1 = score(:,1);
pc2 = score(:,2);

%%
% For the plot onlym not part of the "core" PCA: 
% identify extremes in (PC1,PC2) space
% in order to annotate cities at the extremes:

n = 7; % will highlight `n` most "extreme" cities

[pc1max idxmax1] = maxk(pc1,n);
pc2_1max = pc2(idxmax1);

[pc1min idxmin1] = mink(pc1,n);
pc2_1min = pc2(idxmin1);

[pc2max idxmax2] = maxk(pc2,n);
pc1_2max = pc1(idxmax2);

[pc2min idxmin2] = mink(pc2,n);
pc1_2min = pc1(idxmin2);


%% Plot the PCA on the first 2 principal component

figure 
scatter(pc1, pc2,200, 'MarkerFaceColor','blue')
alpha(0.2)
xlabel('1st Principal Component')
ylabel('2nd Principal Component')
grid()
set(gca,'FontSize',20);


% Compare with scatter3 plot at the begining...

%%
text(pc1max, pc2_1max, names(idxmax1,:))
text(pc1min, pc2_1min, names(idxmin1,:))
text(pc1_2max, pc2max, names(idxmax2,:), 'Color','red')
text(pc1_2min, pc2min, names(idxmin2,:), 'Color','red')

%%
% Make a scree plot, that is
% how much variance is explained by the components
% is returned in the variable `explained`

explained % unit in percentage

figure()
pareto(explained)
set(gca, 'FontSize', 18)
xlabel('Principal Component')
ylabel('Variance Explained (%)')

%%  Importance of normalizing

% Not normalized:
subplot(1,2,1)
biplot(wcoeff(:,1:2), 'Varlabels',ctg)

% Normalized: 
subplot(1,2,2)
biplot(coef_norm(:,1:2), 'Varlabels',ctg)
ctg
coef_norm

%% Interpretation of the (normalized!) biplot:

% the direction and length of the vector indicate how each variable 
% contributes to the two principal components in the plot. 

% The largest coefficients in the first principal component 
% correspond to the variables `health` and `arts`. 

% The second principal component, on the vertical axis, 
% has POSITIVE coefficients for the variables education, health, arts, 
% and transportation, and NEGATIVE coefficients for the remaining five variables. 

% This indicates that the second component distinguishes among cities 
% that have high values for the first set of variables (education, health,...) 
% and low for the second (economics, recreation,...)
% and cities that have the opposite.

figure
biplot(coef_norm(:,1:2),'Scores',score(:,1:2), ...
    'Varlabels',categories);
