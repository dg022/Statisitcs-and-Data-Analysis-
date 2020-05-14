%Name: David George
%Student Number: 251004930 



%%
  %Part A) 
  
    T = readtable("deca.csv"); 
    PlotHelper(T);
  
%%
  %Part B) 
  dat = TableCreater(T); 
  
%%
  %Part C)
  
    vnames = [string(T.Properties.VariableNames)];
    data = table2array(rmmissing(T(:, [1:10]))); 
    
    vnames(11) = []; 
    %Inverse-varience weights should be used for the PCA 
    % As the varibles are in differnt units. 
    
    [wcoeff,score,latent,tsquared,explained] = pca(data, ...
                                                   'VariableWeights','variance');
        pc1 = score(:,1);
        pc2 = score(:,2);
        
        %Visuauallly Showing results of PCA 
        figure 
        scatter(pc1, pc2, 10, 'MarkerFaceColor','blue')
        alpha(0.2)
        xlabel('1st Principal Component')
        ylabel('2nd Principal Component')
        grid()
        set(gca,'FontSize',20);                             
                                               
                                               
    var_by_2_first = sum(explained(1:2));
    fprintf("The first 2 principal components explain %d prct of the variance.", var_by_2_first);
    
    %The first two PC account for 60% of the vareince, this is greater than
    %half, this is acceptable. 
    
    coef_norm = inv(diag(std(data)))* wcoeff;
    biplot(coef_norm(:,1:2),'Scores',score(:,1:2), ...
    'Varlabels',vnames);
    %Interpretation: 
    % the direction and length of the vector indicate how each variable 
    % contributes to the two principal components in the plot. 

    % The largest coefficients in the first principal component 
    % correspond to the variables `R100` and `R110`. 

    % The second principal component, on the vertical axis, 
    % has POSITIVE coefficients for the variables highjump, pole, java,shotput etc.. 
    % and NEGATIVE coefficients for longjump. 

    % This indicates that the second component distinguishes among cars 
    % that have high values for the first set of variables (shotput, jave ,...) 
    % and low for the second (longjump, highjump,...)
    % and cars that have the opposite.
  
  
  
%%
  %Functions
  
    %Plotting funciton for Part A) 
      function PlotHelper(T)

          %Creates a list of all the  varible names to help plotting
          events = [string(T.Properties.VariableNames)]; 

          %Iterating through all the columns do plot the data
           figure
          for idx = 1:length(events) -1

              %Plotting the data, giving it the appropriate title and labels
              %Using subplot to create 2x5 figure
              subplot(2, 5, idx); 
              scatter(T.(events(idx)), T.score); 
              title( strcat("Score Versus ",events(idx)));
              xlabel(events(idx));
              ylabel("score");

          end


      end

  % Table Creating Function  
  function dat = TableCreater(T)
  
      %creating the list for the table
 
      correlation = []; 

      %List of event names in string format, removing the score column
      EventNames = [string(T.Properties.VariableNames)]; 
      EventNames(11) = []; 
   
       %Iterate through the column varibles, not inclduing score
       for idx = 1:length(EventNames)
                
    
           [rho p] = corr(T.score,T.(EventNames(idx))); 
           correlation(idx) = rho; 
           
       end
       
       EventNames = EventNames.'; 
       correlation = correlation.';
      %creating the table with names and assocaited correlations
      dat = table(EventNames, correlation); 
      %Sorting thw rows in decending absolute value order, as specfied. 
      dat   = sortrows(dat,2,'descend', 'ComparisonMethod','abs'); 
  
  
  end



