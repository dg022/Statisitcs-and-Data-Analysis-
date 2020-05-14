%Name: David George
%StudentID:251004839
T = input_data(); 
%To conduct anova testing,the population must be normally distributed,
%independenat, and there most be homoegenity of vareinces between groups. 


%Checking to see if the population is normally distributed on the 12th and 21st day.
%Kolmogorov Smirnov Test:
% H0: "the data is normally distributed"

% Rescale data for Norm(0,1) comparison 12th day:
  
    
    day12TestD1 = (( T.weight(T.Time ==12 & T.Diet == 1)) - mean(T.weight(T.Time ==12 & T.Diet == 1))) / (sqrt(var(T.weight(T.Time ==12 & T.Diet ==1))));
    day12TestD2 = (( T.weight(T.Time ==12 & T.Diet == 2)) - mean(T.weight(T.Time ==12 & T.Diet == 2))) / (sqrt(var(T.weight(T.Time ==12 & T.Diet ==2))));
    day12TestD3 = (( T.weight(T.Time ==12 & T.Diet == 3)) - mean(T.weight(T.Time ==12 & T.Diet == 3))) / (sqrt(var(T.weight(T.Time ==12 & T.Diet ==3))));
    day12TestD4 = (( T.weight(T.Time ==12 & T.Diet == 4)) - mean(T.weight(T.Time ==12 & T.Diet == 4))) / (sqrt(var(T.weight(T.Time ==12 & T.Diet ==4))));
    
% H: 0 (cannot reject) or 1 (reject: data unlikely normal)

    [rejectday12D1 p12D1] = kstest(day12TestD1, 'Alpha', 0.05);
    [rejectday12D2 p12D2] = kstest(day12TestD2, 'Alpha', 0.05);
    [rejectday12D3 p12D3] = kstest(day12TestD3, 'Alpha', 0.05);
    [rejectday12D4 p12D4] = kstest(day12TestD4, 'Alpha', 0.05);
    
    
     if rejectday12D1 == 0 & rejectday12D2 == 0 & rejectday12D3 == 0 & rejectday12D4 == 0  
       
        disp("Population on the 12th day is normally distriubuted"); 
    end

    
% Rescale data for Norm(0,1) comparison 21th day:
  
    
    day21TestD1 = (( T.weight(T.Time ==21 & T.Diet == 1)) - mean(T.weight(T.Time ==21 & T.Diet == 1))) / (sqrt(var(T.weight(T.Time ==21 & T.Diet ==1))));
    day21TestD2 = (( T.weight(T.Time ==21 & T.Diet == 2)) - mean(T.weight(T.Time ==21 & T.Diet == 2))) / (sqrt(var(T.weight(T.Time ==21 & T.Diet ==2))));
    day21TestD3 = (( T.weight(T.Time ==21 & T.Diet == 3)) - mean(T.weight(T.Time ==21 & T.Diet == 3))) / (sqrt(var(T.weight(T.Time ==21 & T.Diet ==3))));
    day21TestD4 = (( T.weight(T.Time ==21 & T.Diet == 4)) - mean(T.weight(T.Time ==21 & T.Diet == 4))) / (sqrt(var(T.weight(T.Time ==21 & T.Diet ==4))));
    


    [rejectday21D1 p21D1] = kstest(day21TestD1, 'Alpha', 0.05);
    [rejectday21D2 p21D2] = kstest(day21TestD2, 'Alpha', 0.05);
    [rejectday21D3 p21D3] = kstest(day21TestD3, 'Alpha', 0.05);
    [rejectday21D4 p21D4] = kstest(day21TestD4, 'Alpha', 0.05);

% H: 0 (cannot reject) or 1 (reject: data unlikely normal)
    
    
     if rejectday21D1 == 0 & rejectday21D2 == 0 & rejectday21D3 == 0 & rejectday21D4 == 0 
       
        disp("Population on the 21st day is normally distriubuted"); 
    end

%Checking to determine homongenitity of variences between  diets on day 12
%and 21 using the levene test 

p12Var = vartestn(T.weight(T.Time ==12), T.Diet(T.Time ==12),'TestType','LeveneAbsolute', 'Display', 'off');
p21Var = vartestn(T.weight(T.Time ==21), T.Diet(T.Time ==21),'TestType','LeveneAbsolute', 'Display', 'off');

 if p12Var > 0.05
       
        disp("The groups of chicks on the 12th, divided by diets, have homogoenous variences"); 
 end
  
 if p21Var > 0.05
       
        disp("The groups of chicks on the 21st day, divided by diets, have homogoenous variences"); 
 end




% For both day 12 and day 21, the independence assumption holds up because
% the probaility of one event occuring in no away affects the probaility of
% another event. In this case, the weight of any given chick in any group,
% has no bearing on the weight of any given chick in another group, nor 
%does knowing the weight of one chick give insight into the probaility of
%any other chick beign a certain weight either. Therfore the indepdenace
%assumption holds up on both the 12th and 21st day.  

%Since all assumptions (normaility, independence, and homogenity of
%variences) are held up, anova testing can be performed, with post-hoc
%testing to determine the best diet.  

%Anova testing and Post Hoc testing for day 12:

    [pval12 tab12 stats12] = anova1(T.weight(T.Time ==12), T.Diet(T.Time ==12), 'off');

    figure 

    [c12,m12,h12,nms12] = multcompare(stats12, 'Alpha', 0.05, 'CType','bonferroni');
    title("Day 12");
    xlabel("Weight (grams)"); 
    ylabel("Diet Number"); 

%Anova testing and Post Hoc testing for day 21:

    [pval21 tab21 stats21] = anova1(T.weight(T.Time ==21), T.Diet(T.Time ==21), 'off');

    figure

    [c21,m21,h21,nms21] = multcompare(stats21, 'Alpha', 0.05, 'CType','bonferroni');
    title("Day 21");
    xlabel("Weight (grams)"); 
    ylabel("Diet Number");
    

    Day12statarray = grpstats(T(T.Time ==12, :),'Diet','mean','DataVars',{'weight'});
    Day21statarray = grpstats(T(T.Time ==21, :),'Diet','mean','DataVars',{'weight'});
    
    Day12statarray.Properties.VariableNames{'Diet'} = 'DietsForDay12';
    Day12statarray.Properties.VariableNames{'GroupCount'} = 'GroupCountDay12';
    Day12statarray.Properties.VariableNames{'mean_weight'} = 'mean_weight_day12';
       
    Day21statarray.Properties.VariableNames{'Diet'} = 'DietsForDay21';
    Day21statarray.Properties.VariableNames{'GroupCount'} = 'GroupCountDay21';
    Day21statarray.Properties.VariableNames{'mean_weight'} = 'mean_weight_day21';
    both  = [ Day12statarray Day21statarray ]; 
    disp(both);
    

%% Recomondations:
% If the farmer is to select a chick on day 12, I advice the farmer to
% choose either diet 3 or diet 4. Looking at the figure for day 12, diet 3
% and diet 4 are the only diets with statiscially differnt mean weights
% from diet 1, so either or works.  

%If the farmer is to select a chick on day 21, I advice the farmer to
%choose diet 3. Looking at the figure for day 21, diet 3 is the only diet
%that is statistically differnt from diet one. 



function T = input_data()


%This function reads the input file and casts the data properly
T = readtable("chicks.csv");
T.weight = double(T.weight); 
T.Time = double(T.Time); 
T.Chick = uint32(T.Chick); 
T.Diet = uint32(T.Diet); 
end