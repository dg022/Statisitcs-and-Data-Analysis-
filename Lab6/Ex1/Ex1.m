dat = readtable("titanic.csv"); 
% Select only what's needed:

% Here you take a subset of values and now it works
T = dat(:,{'survived', 'age', 'sex', 'pclass'});
% Convert to desired types:
T.age    = str2double(T.age);
T.sex    = categorical(T.sex);
T.pclass = categorical(T.pclass)

data = prop_age_missing(T); 


function tdat = prop_age_missing(T) 
V = unique(T.pclass);
ClassOne =[];
ClassTwo = []; 
ClassThree = [];
for idx = 1:length(V)
    %Now we are going through the length of the unqiue
    data(idx) = length(T.age(isnan(T.age) & T.pclass == V(idx))) / length(T.age(T.pclass == V(idx))); 
end

ClassOne =[data(1)];
ClassTwo = [data(2)]; 
ClassThree = [data(3)]; 
tdat = table(ClassOne, ClassTwo, ClassThree); 

end 


