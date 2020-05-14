%%
%Name: David George
%Student Number: 251004930
%%
%Part A)
  
    T  = readtable("spam-train.csv");
    results = table2array(T(:, 58)); 
    A_T= table2array(T(:, 1:57));
    
    mod = fitglm(A_T,results,'Distribution', 'binomial');
    p = mod.Fitted.Probability;
    coef = mod.plotDiagnostics;
 
        %ROC analysis 
        [fpr,tpr,thresholds,AUC, opt] = perfcurve(results, p, 1);
        figure
        hold on
        plot(fpr,tpr, 'LineWidth',6);
        grid()
        xlabel("False Positive rate")
        ylabel("True Positive rate")
        title(["ROC ; AUC="; AUC])
        set(gca, 'FontSize', 16)
        
        BestFPR = fpr(fpr < 0.02 & fpr >= 0); 
        indexPos = find(fpr < 0.02 & fpr >= 0);
        
        %This returns the index posistions 1 through 316
        %I manually checked and picked the one with the highest tpr, this
        %occured at index. 
        BestyTpr = tpr(316);
        
        %Pick the corresponding threshdold

        BestThreshHold = thresholds(316); 
%% Part B) 
         mod = glmfit(A_T,results, 'binomial')
         Ttest  = readtable("spam-test.csv"); 
         A_Test= table2array(Ttest(:, [1:57]));

         count = 0;
         for idx = 1:length(Ttest.V1)
            if logistic_fct( A_Test(idx,:) , mod) > BestThreshHold
                count = count +1; 
            end
        end
    
   %There are 347 emails in this data
   disp("There are 347 spam emails in this data");
   disp(count);
   prop = count /length(Ttest.V1); 
   disp("There are 34.7% of the emails are spam in the data");
   
  
  

%% Part C

    %Run a bivariate logisitc regression on the data, perferm ROC analysis
    %Comapre the area under the curve to determine which did a better job 
    %of predicting whether or not something is spam. 
    TC= readtable("spam_comp.txt", 'ReadVariableNames', false);
    LC = TC; 
    TC = table2array(TC); 
    mod = fitglm(TC,results,'Distribution', 'binomial');
    pCompany = mod.Fitted.Probability;
    
      [fprC,tprC,thresholdsC,AUCC, optC] = perfcurve(results, pCompany, 1);
        figure
        hold on
        plot(fprC,tprC, 'LineWidth',6);
        grid()
        xlabel("False Positive rate")
        ylabel("True Positive rate")
        title(["ROC Company; AUC="; AUCC])
        set(gca, 'FontSize', 16)
    
    %Compaing both methods, although it is close, the spam predicitor built
    %by us is more accurate than the company. This can be asserted to be
    %true since the area undernath the ROC curve for our spam filter is
    %greater than the area under the curve for the spam filder of the
    %company, albeit this differnece is about 0.03, our model still
    %predicts better; higher area under the curve corresponds to be a
    %better predective model. 


%%
%Functions 

 function y = logistic_fct(x,b)
    %X is the value that is being inputed, b is the vlaue of logisitic
    %regression
    
    %Function used for logisitc regression
     y = 1/(1 +exp(-(b(1) +  sumHelper(x,b)     )));
  
 end

 function total = sumHelper(x ,b)
     total = 0
     
     %Since the logistic regresison requries 57 vairlbes, it is not
     %practical to write all of these out.
     for idx = 1:57

        total = total + b(idx+1)*x(idx); 

     end
 end 

 



