

dat = readtable("drugs-trial.csv"); 
dat.id = uint32(dat.id); 
dat.age = uint32(dat.age); 
dat.type = string(dat.type); 
dat.VL = double(dat.VL); 

% This creates a viral load measured from the blood sample and makes sense
% of this shit

%a) How many patietns arei in the whole data set 
n = length(unique(dat.id)); 
placebo = length(dat.type(dat.type == "placebo")); 

%b) What is the mean and median viral load for each group

mean_placebo = mean(dat.VL(dat.type == "placebo")); 
median_placebo = median(dat.VL(dat.type == "placebo"));

mean_drug = mean(dat.VL(dat.type=="drug")); 
median_drug  = median(dat.VL(dat.type=="drug")); 


%c Create a figure where each subplot dispalys the emperical disbution fo
%the viral load for one ttreatment type 

figure 
subplot(1 , 2 , 1); 
histogram(dat.VL(dat.type=="placebo"), 'Normalization', 'probability'); 
subplot(1 , 2 , 2); 
histogram(dat.VL(dat.type=="drug"), 'Normalization', 'probability');


%D creating a boxplot 
A = dat.VL(dat.type == "placebo"); 
B = dat.VL(dat.type == "drug"); 
group = [    ones(size(A));
         2 * ones(size(B));]; 
figure
boxplot([A; B],group)
set(gca,'XTickLabel',{'placebo','drug'})

%E) Checking that thatboth are normally dsituburted with a qq plot

figure
subplot(1, 2, 1); 
qqplot(A); 
subplot(1, 2, 2); 
qqplot(B)

%F) The null hypothesis is that the mean of the drug group is the same as
%plecebo
z_test= ztest(B,mean_placebo,std(A)); 
% The resutls is that that the mean between both groups is statisitcally
% significant 



%G Conducting a linear regression 
%This creates a subtable with the correct data 
T = dat(dat.type == "drug", :); 
mdl = fitlm(T, 'VL~age');


alpha_level = 0.05   
coefCI(mdl, alpha_level)

coef  = mdl.Coefficients

% build the regression line (for the plot):
y0    = table2array(coef(1,1));
slope = table2array(coef(2,1));
x     = linspace(20,70,100);
y     = y0 + slope .* x;

figure
scatter(T.age, T.VL); 
hold on 
plot(x, y);

       







