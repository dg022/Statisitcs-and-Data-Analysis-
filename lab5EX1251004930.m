% Name: David George
% StuedntID: 251004930 

data = readtable("drugs-trial.csv");

data.id = uint32(data.id); 
data.age = uint32(data.age); 
data.type = string(data.type); 
data.VL = double(data.VL); 


% a) How many patietns are there in whole datas? How many were assignedQ: 

    array = data(data.type == 'placebo', :);
    N = size(data,1); 
    disp("There number of placebo patients in the array is"); 
    disp(N); 
    
 %B 
    
     median_array = data(data.type == 'drug', :);

     Median_drug = median(median_array.VL); 
     Median_placebo = median(array.VL); 
     disp("The median for drug group is"); 
     disp(Median_drug);
      disp("The median for placebo group is"); 
     disp(Median_placebo);
     
      Median_drug = mean(median_array.VL); 
     Median_placebo = mean(array.VL); 
     disp("The mean for drug group is"); 
     disp(Median_drug);
      disp("The mean for placebo group is"); 
     disp(Median_placebo);
     
     
   %c 
   
   figure
    subplot(2,1,1)
    x = data.age(data.type=='placebo');
    y = data.VL(data.type=='placebo');
    plot(x, y);
    hold on 
    title('Placebo')

    subplot(2,1,2)
    x1 = data.age(data.type=='drug');
    y1 = data.VL(data.type=='drug');
    plot(x1,y1)
    title('Drug')
    
    % I got stuck trying to properly plot both the age agaisnt VL valuues
      % I will confer with the professor to clear up my confusion. 

     
     
 
 
   
 


