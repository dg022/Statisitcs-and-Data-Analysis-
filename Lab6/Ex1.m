

data = input_data(); 
size = length(data.age); 
num_nan =  length(data.age(isundefined(data.age)));  


function data = input_data() 

data = readtable("titanic.csv"); 
data.age =  categorical(data.age); 

end