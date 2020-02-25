dat = readtable("scores.csv"); 

dat.school = string(dat.school); 
dat.score = uint32(dat.score); 
dat.uid  = string(dat.uid); 

disp("The number of schools rperesented in thsi data is"); 
disp(length(unique(dat.school))); 


outliers = dat.score > 100; 
idx = find(outliers); 
dat.score(idx) = NaN; 

Maple_Median = median(dat.score(dat.school == "Maple"), "omitnan"); 
MountainView_Median = median(dat.score(dat.school == "Mountainview"), "omitnan"); 
Riverside_Median = median(dat.score(dat.school == "Riverside"), "omitnan"); 






