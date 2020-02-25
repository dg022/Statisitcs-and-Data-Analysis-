%Name: David George  
%Student Number: 251004930

%Start of Excercise 2 

  %Question C) 
 
  u = [1;7;3]; v = [-3;0;0]; w=[-4;2;9];
  
  
  %Question D) 
 z = u -2*v + w; 
 
 
 %Question E) 
 m=[u v w];
 
 
 %Question F) 
 temp = [-4;12;9];
 
 
 m=[u v temp];
 
 %Question G) 
 a =temp;
 b = [m(1);m(3)];
 
 %Question H)
 multplication = m([2 3], :);
 answer = m(:, [1 2]) * multplication;
 
 %Question I
 t = 1:-0.02:0 ;
 
 
 %Excercise j 
 
 x = [m(:,1); -8];
  x = x.';
  
  y = [m(:,1); w];
  y = y.';
  
  
  %Excercise 3- Multi Dimensional Matrix
  
  A = [7 3 1; 5 51 6; 0 1 2];
  A(:,:,2) = [12 1 2; 15 47 3; 3 6 2]; 
  
 


  
  %Excervist 4 - 
  
  %verifying its not a chracter
  var_char = '4';
  res =  var_char + 1; 
  
  var_num = str2num(var_char); 
  res = var_num + 1; 
  
  s_a = " The result is : ";
  s_b = " pi = 3.1459";
  strlength(s_a)
  res = strcat ( s_a , s_b );
  disp ( res ); 
  
 strlength(res); 
  sa = " The result is : ";
  sb = " pi = ";
  sc = pi;
  sc = num2str(sc); 
  disp(strcat(sa, sb, sc));
  
  %Vectors of strings
  a= 'tuesday'; 
  b=' morning'; 
  daysoftheweek = [ "Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday" "Sunday"]; 
  daysoftheweek(2) = daysoftheweek(6); 
  daysoftheweek(6) = "Tuesday"; 
   
 
  
  %Excercise 5- 
 year = 1999;
 q1 = " You are ";
 age = 2020 - year ;
 q2 = " years old .";
q1 = strcat(q1, " 21 ", q2); 
  
vectorDna = 'CGAATGCCGACTAGCGCAAT'; 

 lengths = numel(vectorDna); 
 vectorDna(5) = 'C';  
  
 
