%Name: David George
%Student Number: 251004930
T = readtable("speed-ligth.csv"); 
%%
%Since the population standard devation is not known, and the sameple size
% is less than 30, a t test will be conducted. 

%To conduct a t-test, the normality assumption must hold up, same with
%indepependece. 

%Checking for normality

%Kolmogorov Smirnov

% H0: "the data is normally distributed"

%Use speed oversvations
rng(1234)
x = T.speed; 

% Rescale x for Norm(0,1) comparison:
xx = (x - mean(x)) / sqrt(var(x));

[reject p] = kstest(xx, 'Alpha', 0.01)
% H: 0 (cannot reject) or 1 (reject: data unlikely normal)

if reject == 0
    disp("The data is normally distriubuted");
 
else
 disp("The data is NOT normally distriubuted");
end

% The data is normally distrubuted
% The independace assumption holds true as well, the measurements of one
% instrument do not in any way impact the measuremnt of another
% instrument. 

%The both normality and indpedence assumptions are holding up, therefore
% a one sample t-test can be conducted. 



%%

%H0: Mean speed = 299792458 
%HA: Mean speed != 299792458 

%clear;

%Mean speed of the null hypothesis:
mean_H0 = 299792458 

% t-test:
[t_reject t_pv] = ttest(x, mean_H0, "Alpha", 0.02)

if t_reject ==0
    
    disp("The instruments are well calibreated");
    
else
    
     disp("The instruments are NOT well calibreated");
end


% A one sample t-test in this scenario tests the mean of a single group
% agaisnt a known mean, the known mean being the theoretical quantity.
% Given a signifance level or alpha of 5%, the t test has determined that
% the means between the theroretical and oversavtion are not signnifacntly
% differnt, therefore the instruments are well calibreated. 



