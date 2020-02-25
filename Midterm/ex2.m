% Name: David George
% Student Number: 251004930

%Excercise a)
    data = readtable("schools.csv"); 
    summary(data); 
    
%Excercise b) 
    data.GEO = string(data.GEO); 
    data.GRADE = string(data.GRADE); 
    data.SEX = string(data.SEX); 
    data.NUM = uint32(data.NUM); 
    data.YEAR = uint32(data.YEAR); 
    summary(data); 
    
%Excercise C)
    disp(unique(data.GEO)); 
    disp(unique(data.GRADE)); 
    disp(unique(data.SEX)); 
    
 %Ecvercise D)
 
  
 new_table = data(data.SEX == "Both sexes" & data.GRADE =="Total grades" & data.GEO =="Canada", :); 
  disp(new_table); 
  figure; 
  plot(new_table.YEAR, new_table.NUM, "LineWidth", 5); 
  title("Number of childern enrolled in all grades in Canada"); 
  
  
  % Excercise E) 
   figure
   subplot(4, 2, 1); 
   Ab = data(data.SEX == "Males" & data.GEO == "Alberta" & data.GRADE == "Grade 1", :);
   Ba = data(data.SEX == "Females" & data.GEO == "Alberta" & data.GRADE == "Grade 1", :);
   plot(Ab.YEAR, Ab.NUM); 
   hold on 
   plot(Ba.YEAR, Ba.NUM);
   title("Alberta; Grade 1"); 
   legend("Males", "Females"); 
   
   
   subplot(4, 2, 2); 
   Ab = data(data.SEX == "Males" & data.GEO == "Alberta" & data.GRADE == "Grade 6", :);
   Ba = data(data.SEX == "Females" & data.GEO == "Alberta" & data.GRADE == "Grade 6", :);
   plot(Ab.YEAR, Ab.NUM); 
   hold on 
   plot(Ba.YEAR, Ba.NUM);
   title("Alberta; Grade 6"); 
   legend("Males", "Females"); 
   
   subplot(4, 2, 3); 
   Ab = data(data.SEX == "Males" & data.GEO == "Nunavut" & data.GRADE == "Grade 1", :);
   Ba = data(data.SEX == "Females" & data.GEO == "Nunavut" & data.GRADE == "Grade 1", :);
   plot(Ab.YEAR, Ab.NUM); 
   hold on 
   plot(Ba.YEAR, Ba.NUM);
   title("Nunavut; Grade 1"); 
   legend("Males", "Females"); 
   
   
    subplot(4, 2, 4); 
   Ab = data(data.SEX == "Males" & data.GEO == "Nunavut" & data.GRADE == "Grade 6", :);
   Ba = data(data.SEX == "Females" & data.GEO == "Nunavut" & data.GRADE == "Grade 6", :);
   plot(Ab.YEAR, Ab.NUM); 
   hold on 
   plot(Ba.YEAR, Ba.NUM);
   title("Nunavut; Grade 6"); 
   legend("Males", "Females"); 
   
   subplot(4, 2, 5); 
   Ab = data(data.SEX == "Males" & data.GEO == "Ontario" & data.GRADE == "Grade 1", :);
   Ba = data(data.SEX == "Females" & data.GEO == "Ontario" & data.GRADE == "Grade 1", :);
   plot(Ab.YEAR, Ab.NUM); 
   hold on 
   plot(Ba.YEAR, Ba.NUM);
   title("Ontario; Grade 1"); 
   legend("Males", "Females"); 
   
   
   subplot(4, 2, 6); 
   Ab = data(data.SEX == "Males" & data.GEO == "Ontario" & data.GRADE == "Grade 6", :);
   Ba = data(data.SEX == "Females" & data.GEO == "Ontario" & data.GRADE == "Grade 6", :);
   plot(Ab.YEAR, Ab.NUM); 
   hold on 
   plot(Ba.YEAR, Ba.NUM);
   title("Ontario; Grade 6"); 
   legend("Males", "Females"); 
   
   
   subplot(4, 2, 7); 
   Ab = data(data.SEX == "Males" & data.GEO == "Nova Scotia" & data.GRADE == "Grade 1", :);
   Ba = data(data.SEX == "Females" & data.GEO == "Nova Scotia" &  data.GRADE == "Grade 1", :);
   plot(Ab.YEAR, Ab.NUM); 
   hold on 
   plot(Ba.YEAR, Ba.NUM);
   title("Nova Scotia; Grade 1"); 
   legend("Males", "Females"); 
   
   
      subplot(4, 2, 8); 
   Ab = data(data.SEX == "Males" & data.GEO == "Nova Scotia" & data.GRADE == "Grade 6", :);
   Ba = data(data.SEX == "Females" & data.GEO == "Nova Scotia" &  data.GRADE == "Grade 6", :);
   plot(Ab.YEAR, Ab.NUM); 
   hold on 
   plot(Ba.YEAR, Ba.NUM);
   title("Nova Scotia; Grade 6"); 
   legend("Males", "Females"); 
   
   
   
   
   
   
   
  
  
  
  
  
