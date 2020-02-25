clear 

% Name: David George
%Student Number: 251004930

% C) Creating the following column vectors
    
    u = [1;7;3];
    v = [-3; 0; 0]; 
    w = [-4; 2; 9] ; 
    
 %D) Vector arithemtic 
    z = u - 2*v + w; 
    
 %E)  Concatinting vectors 
 
   M = [1 -3 -4; 7 0 2; 3 0 9]; 
   
  %F 
    M(:,3) = [-4; 12; 9];
    
  %G)  
    a =  M(3, :); 
    b = M([1 3] , 1); 
    
  %H Multiply the 3 x 2 submatrix 
  
    val =  rand(3 , 2) .* M(:,[1 2]); 
    
  % I) Create the following row vector 
  
    t = 1:-0.02:0;
    
   
    % J) 
        u = u.'; 

        
 %Excercise 3 Multi-Fimmesnional Matrix 
 
     A = [12 1 2; 15 47 3; 3 6 2]; 
     A(:,:, 2) = [7 3 1; 5 51 6; 0 1 2]; 
     disp(A(:,:,1)); 
     
  % Excercise 4 - Characters and Strings
    x = 'A'; 
    y = '&'; 
    w = '+' 
    var_char = '4'; 
    res = var_char + 1; % This will not work, you cannot add a double to a character
    
   %str2num changes aeither a string ror char to a number 
   first = '4'; 
   res = str2num(first) + 1; 
   disp(res); 
   
   s_a = "The reuslt is: "; 
   s_b = "pi = 3.14159"; 
   res = strlength(s_a); 
   disp(res); 
   res = strcat(s_a, s_b); 
   disp(res); 
    
   
   u =['t' , 'o'];
   disp(u); 
   u = 'Tuesday';
   disp(u); 
 
    a = 'tueday';
    b = ' next is wedneday';
    disp([a b]); 
    
    a = "monday"; 
    b = "tuesday"; 
    disp("penis"); 
    disp(length([a b])); 
    
    v = 'CGAATGCCGACTAGCGCAAT'; 
    ans = length(v);
    disp(ans); 
    
  
    