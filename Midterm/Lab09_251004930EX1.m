

% A) 
load humanactivity.mat;

% B) 
nObs = table('Size', [1,5],'VariableTypes',{'int32','int32','int32','int32','int32'},'VariableNames',actnames);
nObs{1,1} = size((actid(actid == 1)),1);
nObs{1,2} = size((actid(actid == 2)),1);
nObs{1,3} = size((actid(actid == 3)),1);
nObs{1,4} = size((actid(actid == 4)),1);
nObs{1,5} = size((actid(actid == 5)),1);

% C) 
rng(1234);

n = size(feat,1);
idxNum = randi(n, 1, 1000);
dataTat = feat(idxNum,:);
id = actid(idxNum);

%% D) 

D = 1*squareform(pdist(dataTat));

% applying MDS analysis
MDS = cmdscale(D, 2);
figure;


scatter(MDS(:,1), MDS(:,2), id);

%% E) 

% 5 is the most logiical choice, as there are five activites. 

%% F) 


%Taken from lecutre script, doing all five algormoretive clustering
%anlaysis
% By putting it an array, adn iterating htoigh the options
waysofClustering = ["complete"  "single"  "average"  "centroid" "ward"];
subploti = 1;
figure;
for index = waysofClustering
    
    LonAnalysis = linkage(D,index);
    
    clusterx = cluster(LonAnalysis,'MaxClust',5);
    subplot(3,2,subploti);
    
    gscatter(MDS(:,1),MDS(:,2),clusterx);
    
    subploti = subploti + 1;
end

subplot(2,3,6);
gscatter(MDS(:,1), MDS(:,2), id);

%% G) 
close all;
figure;

clustersaNALYSIS = kmeans(D,5);
gscatter(MDS(:,1),MDS(:,2),clustersaNALYSIS);

%% H) 
%I couldnt not figure this one out

%% I) 
close all;

%Clustering is an intresting analyssi tool, in this caseif was not
%effective as it thought it would be. Only when the activites are differnt
%entirely, does clustering show relevent informaiton. Otherwise it is
%ineffective. 

