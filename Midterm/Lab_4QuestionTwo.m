
dat = import_file("titanic.csv"); 

missing_data_age =  sum(sum(ismissing(dat.age), 1));

embarked_missing = sum(sum(ismissing(dat.embarked), 1));  

if missing_data_age > 0
   
    disp("there is missing data"); 
    disp("The proportion of missing data is"); 
    
    disp(missing_data_age/length(dat.age)); 
   disp(embarked_missing/length(dat.embarked)); 
    
    
end



figure 
histogram(dat.age);

T = table(dat.pclass, dat.sex, dat.survived, ...
    'VariableNames',{'pclass','sex','survived'});

  

    s = unstack(T, 'survived', 'sex', ...
                'AggregationFunction', @mean);
            
            
    figure 
    
    y = [s.female(s.pclass == "1st") s.male(s.pclass == "1st") ;s.female(s.pclass == "2nd") s.male(s.pclass == "2nd");s.female(s.pclass == "3rd") s.male(s.pclass == "3rd")];
    bar(y); 

  Tright = readtable("is_canada.csv"); 
Tright.home_dest = string(Tright.home_dest); 



L = outerjoin(dat,Tright,'MergeKeys',true, 'Type', 'left')
 

sr = unstack(L, 'survived', 'sex', 'home_dest' ...
                ,'AggregationFunction', @mean);

figure
  R = [sr.female(sr.pclass == "1st" & sr.home_dest == "Canada" ) sr.male(sr.pclass == "1st" & sr.home_dest == "Canada") ;sr.female(sr.pclass == "2nd" & sr.home_dest == "Canada") sr.male(sr.pclass == "2nd" & sr.home_dest == "Canada");sr.female(sr.pclass == "3rd" & sr.home_dest == "Canada") sr.male(sr.pclass == "3rd" & sr.home_dest == "Canada")];
    bar(R); 
    
    
    
function dat = import_file(filename) 

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







