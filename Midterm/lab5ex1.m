clear
dat = readtable("drugs-trial.csv")

dat.id = uint32(dat.id); 
dat.age = uint32(dat.age); 
dat.type = string(dat.type); 
dat.VL = double(dat.VL); 

%Total number of patients in the data-set
N = length(unique(dat.id)); 

% The number of  things in the placebo group
Placebo_Number = length(dat.id(dat.type == "placebo")); 


meanPlacebo = mean(dat.VL(dat.type == "placebo")); 
meanDrug = mean(dat.VL(dat.type == "drug")); 
medianPlacebo = median(dat.VL(dat.type == "placebo")); 
medianDrug = median(dat.VL(dat.type == "drug")); 
 
figure
subplot(1 , 2 , 1); 
%Plotting the emperical deistriubtion
histogram(dat.VL(dat.type == "placebo")); 

%Plotting the empeicla dsitrubtion of drugs
subplot(1 , 2 , 2);
histogram(dat.VL(dat.type == "drug")); 


%Creating a boxplot
figure
    x1 = dat.VL(dat.type == "placebo"); 
    x2 = dat.VL(dat.type == "drug"); 
    x = [x1;x2];
    g = [ones(size(x1)); 2*ones(size(x2))];
    boxplot(x,g)

% Doing a qq plot, checkign for lineararirit, MEH
    figure 
    subplot(1,2,1); 
    qqplot(x1); 
    
    subplot(1, 2,2);
    qqplot(x2); 

    
    
% Performing a z test at a 5% significance level
reject_H0_level_5 = ztest(x2, 6.1365, sqrt(var(x2)), "Alpha", 0.05);



% Linear Regression in MatLab

mdl = fitlm(dat, 'VL~age'); 
alpha_level = 0.05   
coefCI(mdl, alpha_level)





% Retrieve regression coefficients:
coef  = mdl.Coefficients


y0    = table2array(coef(1,1));
slope = table2array(coef(2,1));
x     = linspace(0,250,100);
y     = y0 + slope .* x;

figure
hold on;
scatter(dat.age, dat.VL, "MarkerFaceColor" , 'blue')
plot(x,y,'LineWidth',3);
axis([0 80 2 6]);
xlabel("age");
ylabel("VL");
set(gca,"FontSize", 18);
grid;




% build the regression line (for the plot):






















