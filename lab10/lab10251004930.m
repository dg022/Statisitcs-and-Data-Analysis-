
%Name: David George
%Student Num: 251004930



T = readtable("diabetes-pima.csv");
% Converting to binary 

d = string(T.diabetic);
binaryVal = d == "Yes";
T.binaryDiabetic = binaryVal;

T = changeToNaN(T); 

 


%% A) 

dp([1,2,6],["bmi","npreg","bp"],T);

%% B) 

ROC(["glu","npreg","bp"],T);

%% C) 
close all;
figure
subplot(1,2, 1);
ROC(["skin","npreg","age"],T)
subplot(1,2, 2);
ROC(["glu","npreg","bp","skin","age","bmi"],T)

% all is better as the area is higer



%% 

function [AUC,fpr,tpr,threshholds] = ROC(var,t)
    p=[];
    names = var;
    if ismember("npreg",var)
        p = t.npreg;
    end
  
    if ismember("bmi",var)
        p = [p, t.bmi];
    end
    if ismember("age",var)
        p = [p, t.age];
    end
    
    if ismember("glu",var)
        p = [p, t.glu];
    end
    if ismember("bp",var)
        p = [p, t.bp];
    end
    if ismember("skin",var)
        p = [p, t.skin];
    end
    
    
    v = p;
    a = zeros(length(v),1);
    
    i = 1; 
    
    while i <= length(v)
          row = v(i,:);
        prob = dp(row,names,t);
        a(i) = prob; 
        i = i+1; 
    end
    
    r = t.binaryDiabetic;
    [fpr,tpr,thresholds,AUC, opt] = perfcurve(r, a, 1);
    
    

    plotHelp(fpr,tpr);


    
end

function plotHelp(fpr, tpr)

    plot(fpr,tpr, 'LineWidth',6); 
    grid()
    xlabel("FPR")
    ylabel("TPR")
    title("ROC Curves")
    set(gca, 'FontSize', 20)



end


function y = dp(values,varName,t)
    
    p = [];
   
    if ismember("bp",varName)
        p = [p, t.bp];
    end

    if ismember("age",varName)
        p = [p, t.age];
    end
     if ismember("npreg",varName)
        p = t.npreg;
    end
    if ismember("glu",varName)
        p = [p, t.glu];
    end
    
     if ismember("skin",varName)
        p = [p, t.skin];
    end
    if ismember("bmi",varName)
        p = [p, t.bmi];
    end
    
    
    
    r = glmfit(p,t.binaryDiabetic,'binomial');
    
    be = r;
    
    zval = be(1);
 
    i =2; 
    
    while i <= length(be)
           bW = be(i);
        x = values(i-1);
        currentnum = x * bW;
        zval = zval + currentnum
        
    i = i+1;     
    end
    

 

    y = 1 ./ (1 + exp(-zval));

    
end

function T = changeToNaN(T)


for i = 1:6
        values = T(:,i);
        
        missing = ismissing(values,'NA');
        
        values = table2array(values);
        
        values(missing) = {NaN};
        T(:,i) = values;
     
end
 T.npreg = str2double(T.npreg);
 T.skin  = str2double(T.skin);
        T.bmi = str2double(T.bmi);
        T.age = str2double(T.age);
        T.glu = str2double(T.glu);
        T.bp  = str2double(T.bp);

end


