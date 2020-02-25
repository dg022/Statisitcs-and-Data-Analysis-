
%A) 
	dat = readtable("scores.csv"); 
    dat.score = uint32(dat.score); 
    dat.school =  string(dat.school); 
    dat.uid = string(dat.uid); 
     
%B) How many schoolsa are there here
    disp("There are"); 
    disp(length(unique(dat.school))); 
    disp("schools"); 
    
%C) Is there any outlier in the data? 

%This gives a an array of logical vals, corresponging to wheher or not the
%score dat.score >= 100

    
    outlier_rows = dat.score > 100;
    yolo = find(outlier_rows); 
    dat.score(yolo) = NaN; 
    

%D) 
    %Calualte the median for each school, in five lines of code 
    School_One = median(dat.score(dat.school == "Maple"),"omitnan"); 
    School_Two = median(dat.score(dat.school == "Mountainview"),"omitnan"); 
    School_Three = median(dat.score(dat.school == "Riverside"),"omitnan"); 