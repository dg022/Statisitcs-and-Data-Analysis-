%Excercise Two


% This is Excercise 2 



%Part A) 


data = import_data();





function data = import_data()


data = readtable("titanic.csv", 'PreserveVariableNames', true); 

uint32(data.RowNames); 
uint32(data.pclass); 
double(data.survived); 
string(data.name); 
string(data.embarked);
string(data.homedest); 
string(data.room);
string(data.ticket); 
unit32(data.ticket);
string(data.sex); 


end
