
dat = readtable("xyz.csv"); 
dat.x = double(dat.x); 
dat.y = double(dat.y); 
dat.z = double(dat.z); 

%Plotting the empercial distrubutions for the hree varibles 
figure
subplot(2 , 3 , 1);
histogram(dat.x, "Normalization", 'probability'); 
subplot(2 , 3 , 2);
histogram(dat.y, "Normalization", 'probability'); 
subplot(2 , 3 , 3);
histogram(dat.z, "Normalization", 'probability'); 

subplot(2 , 3 , 4);
qqplot(dat.x)
subplot(2 , 3 , 5);
qqplot(dat.y); 
subplot(2 , 3 , 6);
qqplot(dat.z); 



% H0: "the data is normally distributed"
% Rescale x for Norm(0,1) comparison:
xx = (dat.x - mean(dat.x)) / sqrt(var(dat.x));
[rejx px] = kstest(xx, 'Alpha', 0.01)

% H: 0 (cannot reject) or 1 (reject: data unlikely normal)
yy = (dat.x - mean(dat.y)) / sqrt(var(dat.y));
[rejy py] = kstest(yy, 'Alpha', 0.01)


zz = (dat.z - mean(dat.z)) / sqrt(var(dat.z));
[rejz pz] = kstest(zz, 'Alpha', 0.01)




