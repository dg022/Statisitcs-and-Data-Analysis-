clear; 

% Import the Patients data set from 
% the file "patient.csv" saved in the same folder:

% Excercise A) 
    dat = readtable("schools.csv");
    
% Covnverting the collums to the correct  type 

    string(dat.GRADE); 
    string(dat.GEO); 
    string(dat.SEX); 
    uint32(dat.YEAR); 
    uint32(dat.NUM);
   
    

%Dispalying the inique values takne by GEO, GRAD, and Sex

    
    
    
 % Excerxcie D creating a new table tha i  s asubsry o the shiple dataset
 % acontaning for both sexrs all 
 
 
      
    Numbers_BothSexes = uint32(dat.NUM(dat.SEX == "Both sexes" & dat.GRADE=="Total grades" & dat.GEO == "Canada"));
    Years_BothSexes = uint32(dat.YEAR(dat.SEX == "Both sexes"  & dat.GRADE == "Total grades" & dat.GEO == "Canada"));

    figure
    plot(Years_BothSexes, Numbers_BothSexes, 'LineWidth',5); 
      xlabel("Years"); 
    ylabel("Number of people");
    title("Message from the hangman's twine"); 
    hold on 
    
    
   
 % Excerxcie E creating a new table tha i  s asubsry o the shiple dataset
 % acontaning for both sexrs all 
    
   

    subplot(2,3,1)
    x = uint32(dat.NUM(dat.SEX == "Males" & dat.GRADE=="Grade 1" & dat.GEO == "Alberta"));
    x10 = uint32(dat.NUM(dat.SEX == "Females" & dat.GRADE=="Grade 1" & dat.GEO == "Alberta"));
    y1 = uint32(dat.YEAR(dat.SEX == "Males"  & dat.GRADE == "Grade 1" & dat.GEO == "Alberta"));
    y10 = uint32(dat.YEAR(dat.SEX == "Females"  & dat.GRADE == "Grade 1" & dat.GEO == "Alberta"));
    plot(y1, x);
    hold on 
    plot(y10, x10); 
    hold off
    title('Alberta: Grade 1')

    subplot(2,3,2)
    x2 = uint32(dat.NUM(dat.SEX == "Both sexes" & dat.GRADE=="Grade 6" & dat.GEO == "Alberta"));
    y2 = uint32(dat.YEAR(dat.SEX == "Both sexes"  & dat.GRADE == "Grade 6" & dat.GEO == "Alberta"));
    plot(x2,y2)
    title('Alberta: Grade 6')

    subplot(2,3,3)
    x3 = uint32(dat.NUM(dat.SEX == "Both sexes" & dat.GRADE=="Grade 1" & dat.GEO == "Nunanvut"));
    y3 = uint32(dat.YEAR(dat.SEX == "Both sexes"  & dat.GRADE == "Grade 1" & dat.GEO == "Nunanvut"));
    plot(x3,y3)
    title('Nunavut : Grade 1')

    subplot(2,3,4)
    x4 = uint32(dat.NUM(dat.SEX == "Both sexes" & dat.GRADE=="Grade 6" & dat.GEO == "Nunanvut"));
    y4 =  uint32(dat.YEAR(dat.SEX == "Both sexes"  & dat.GRADE == "Grade 6" & dat.GEO == "Nunanvut"));
    plot(x4,y4)
    title('Nunavut: Grade 6')
    
    subplot(2,3,5)
    x5 = uint32(dat.NUM(dat.SEX == "Both sexes" & dat.GRADE=="Grade 1" & dat.GEO == "Ontario"));
    y5 = uint32(dat.YEAR(dat.SEX == "Both sexes"  & dat.GRADE == "Grade 1" & dat.GEO == "Ontario"));
    plot(x5,y5)
    title('Ontario: Grade 1')

    
    subplot(2,3,6)
    x6 = uint32(dat.NUM(dat.SEX == "Both sexes" & dat.GRADE=="Grade 6" & dat.GEO == "Ontario"));
    y6 = uint32(dat.YEAR(dat.SEX == "Both sexes"  & dat.GRADE == "Grade 6" & dat.GEO == "Ontario"));
    plot(x6,y6)
    title('Ontario: Grade 6')


    
 
 
 
 
 
 
 