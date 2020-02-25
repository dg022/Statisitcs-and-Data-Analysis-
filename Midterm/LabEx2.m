clear;
close all;

dat =import_data("titanic.csv");

missing_logic = ismissing(dat.age);
Number_Missing  = length(dat.age(missing_logic));
Proportion = Number_Missing/length(missing_logic); 

missing =  ismissing(dat.embarked); 
Number_Of_Missing = length(dat.embarked(missing)); 
pro = Number_Of_Missing/length(missing); 








function dat = import_data(filename)
    y = readtable(filename);

    y.row_names = []; % Remove the variable `row_names`

    y.pclass   = categorical(y.pclass);
    
    y.embarked = categorical(y.embarked);
    y.sex      = categorical(y.sex);

    y.name      = string(y.name);
    y.home_dest = string(y.home_dest);

    y.age       = str2double(y.age);  
    
    y.survived = double(y.survived);
    
    dat = y;
end