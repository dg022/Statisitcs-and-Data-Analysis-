%Excercis a)
pat = readtable("scores.csv");

% Exvercise b) 
    disp(unique(pat.school))
    
% Exercise C) 
    
idx = find(pat.score > 100); 
disp(idx); 
pat.score(idx) = NaN;


arr = isoutlier(pat.score); 

disp(pat.score); 

for idx = 1:numel(pat.score)
   
    if arr(idx) == 1
       disp(pat.score(idx));  
    end
    
end

%Excercise D) 

SchoolThree = nanmedian(pat.score(pat.school == "Mountainview"));
SchoolTwo = nanmedian(pat.score(pat.school == "Maple"));
SchoolOne = nanmedian(pat.score(pat.school == "Riverside")); 





