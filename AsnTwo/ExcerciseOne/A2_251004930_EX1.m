

%Name: David George
%Student Number: 251004930
table_new = input_data(); 

%Part A) 
     disp("PART A ANSWER: "); 
     sumCounties(table_new); 
    
%Part B)
    text = text_data(); 
    %The table now has an extra variable, with the name of the full-name of
    %the state
    table_new = outerjoin(table_new,text,'MergeKeys',true);
    disp(" PART B) The new table, with the new column with the full name"); 
    disp(table_new); 
    
 %Part C) 
  
  subSet = table(table_new.name, table_new.democrat, table_new.republican, table_new.Perot, table_new.pop); 
  subSet.Properties.VariableNames = ["state", "democrat", "republican", "Perot","pop"];
  disp("Part C) TABLE THAT DISPLAYS MEDIAN OF EACH STATE, FOR EACH PARTY");
  disp(calculate(subSet));

  
 %Part D)
    figure
    plot_linereg(table_new,"democrat", "black"); 
    
 %Part E) 
  figure
  subplot_helper(table_new); 
  
  %Part F)
  
   %Exploring the relationship between income and college attendence
   figure
   
   % As the percentage of citizens who attend college rises, so does
   % income.
   plot_linereg(table_new,"income", "college");         
   
   
  
  




function table = input_data()
%This funciton will return a table with the correct data types 

table = readtable("US-election-counties.csv"); 
table.pop = uint32(table.pop);
table.state = string(table.state);
end

function sumCounties(table)

% This funciton will add up the population over all the counties
% And ensure 99% of the population is in the data set

populationOfAll = sum(table.pop); 
americasPopulation = 249620000;
if populationOfAll/americasPopulation  > 0.99
   
    disp(strcat("The counties present in this data set cover more than 99% of the U.S populaiton, with a coverage of: ",num2str(populationOfAll/americasPopulation)));
    return; 
end

disp("The counties present do not cover 99% of the population")

end

function textTable = text_data()


%Casting the text table data types to the correct value
%Changing the name of the column headers to allow for proper table joining
textTable = readtable("US-states-abbrev.txt"); 
textTable.name = string(textTable.name); 
textTable.abbreviation = string(textTable.abbreviation); 
textTable.Properties.VariableNames = ["name", "state"];

end

function table_return = calculate(data)

%This will return an array of all the unqiue county names
CountyList = string(unique(data.state)); 

state= [];
democrat = []; 
republican = [];
Perot = []; 
%Creating an empty table, to be concatenated onto 
Tout =table(state, democrat, republican, Perot);
        
        %Iterate over each unqiue country
        for i = 1:length(CountyList)
            state= [];
            democrat = []; 
            republican = [];
            Perot = []; 
            
            % Find all the rows, where County is equal to CountyList(i)
            rows_selected = data.state == CountyList(i); 

            % Create a temporary table, with only the rows with the specfic
            % county name
            tmp = data(rows_selected, :); 
            
            %Calcualting the median values for all parties
            democrat_median = nanmedian(tmp.democrat); 
            republican_median = nanmedian(tmp.republican); 
            Perot_median = nanmedian(tmp.Perot);
            
            %Putting these values into an array, to create a 1 x 4 table
            % This table, or row, will be concatenated onto the main table
            state= [CountyList(i)];
            democrat = [democrat_median]; 
            republican = [republican_median];
            Perot = [Perot_median]; 
         
            if ~isnan(democrat_median) | ~isnan(republican_median) | ~isnan(Perot_median)
                
                %Creating the 1x5 table, or Row
                T1 = table(state, democrat, republican, Perot);
                
                %Adding this row to the main table
                Tout = [Tout;T1];
            end
          
        end

        table_return = Tout;

end



function plot_linereg(T, party, var)
            %Given a party name, remove all NAN rows
            new_plot = T(~isnan(T.(party)) , :); 
            
            %Creating String in form of party~var, for linear regression
            xyName =strcat(party, "~",var); 
            mdl = fitlm(new_plot, xyName); 
            
            %Coefficents is a table of values inclduing slope and yIntecept
            coeffcients  = mdl.Coefficients;
            %Acessing both slope and y intercept
            yInt = table2array(coeffcients(1, 1)); 
            slope = table2array(coeffcients(2, 1)); 
            
            %Creating a 1000 data points for the line of best fit
            x = linspace(0,max(new_plot.(var)), 1000); 
            y = yInt + slope.* x; 
            
            %Plotting party verus var data
            scatter(new_plot.(var), new_plot.(party)); 
            hold on 
            plot(x, y,'LineWidth' , 3); 
            xlabel(var); 
            ylabel(party); 
            
            %Ensuring stanard title and labels fiven Party and var
            title(strcat("int = ", num2str(yInt,'%.1f'), ";", " slope = ", num2str(slope,'%.2f'), ";", " R2 = ", num2str(mdl.Rsquared.Ordinary, '%.1f')));         

end


function subplot_helper(plotTable)

    parties = ["democrat", "republican","Perot"];
    category = ["crime", "income", "college", "white", "black"]; 
    count = 1; 
    
    %For each party, make a subplot for each category  and plot it. 
    for party = 1:length(parties) 
        for cat = 1:length(category)
            subplot(3 , 5, count); 
            
            %Calling linReg as per assignment specfications
            plot_linereg(plotTable, parties(party), category(cat)); 
            count = count+1;
            
        end 

    end

end 









