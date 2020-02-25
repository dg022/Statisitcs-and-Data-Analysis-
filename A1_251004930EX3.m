

%Name: David George
%Student Number: 251004930 


%exercise a) isMagic testing
matrix = magic(3); 
if isMagic(matrix) == 1
   disp("This is a magic matrix")

else
    disp("This is not a magic matrix "); 
end


%exercise b) Random Matrix Generator
disp("Excercise B) Displaying a random matrix"); 
matrix  = randomMatrix(3); 
disp(matrix); 


%Excercise c) ProbaMagic(n, mc_iter) 
    disp("Excvercise C, probability of magic with 1000000 iterations"); 
    disp(probaMagic(2, 10^7)); 


%Excercise d) Estimating probabilities
disp("The probability that n x n matrix for n =2 is magic, is...:");
disp(probaMagic(2, 10)); 
disp("The probability that n x n matrix for n =3 is magic, is...:");
disp(probaMagic(3, 10)); 



function number = isMagic(m)
        
        % Setting state to false, if happens to be magic, it will be set to
        % 1 afterwards
        number = 0; 
        
        % This returns a vector of the sums of each row 
        matrix = sum(m, 2);
        row_number_check = matrix(1); 
        %This checks if all the rows add up to row_number_check 
        % If they dont, return 
        
        if all(matrix == row_number_check) == 0
            return; 
        end
        
        
       % This returns a vector of the sums of each column
        matrix = sum(m, 1);
        column_number_check =  matrix(1); 
        
        % This checks if all the columns add up to the same number
        % if not, then return 
        if all(matrix == column_number_check) == 0
          
            return; 
        end
        
        %You can terminate early if the sums of both the rows and the
        %columns don't equal the same thing
 
        if column_number_check ~= row_number_check
           
           return;  
        end
        
        
        %If this point is reached, then it means both the rows and colums
        %Add up to the same number. Now check left and right diagonal
        
        %Left Diagonal
        
        summation = 0;
        r = 1;
            
         for x = 1:sqrt(numel(m))
                
            if x == 1
               %Starting at the left most entry, add it to the summation 
                summation = summation + m(1); 
            end
            if x ~= 1
                
                %The next diagonal entry  adding to it 
                summation =  summation + m(r);      
            end
            
            %Calculating the next idex posistion 
            r = r + sqrt(numel(m)) + 1;    
        end
            
        %if left diagonal sum is not equal to the entry in the vector
        %of constants, then we know it is not magic. Return here.   
        if summation ~= matrix(1)
            return; 
        end
            
            
       % If this part of the code is reached the left diagonal is
       % fine, move on to right diagonal
          
       %reset summation     
        summation = 0;
      
       for x = 1:sqrt(numel(m))
           
           
           if x == 1
                 %Starting at the right most entry, add it to the summation 
                 summation = summation+ m(sqrt(numel(m)));
                 
                 %This is for calcualting the next index posisiton 
                 number = sqrt(numel(m))+ sqrt(numel(m)) -1; 
           end
           if x~=1 
               
             %Adding the next the diagonal entry 
             summation = summation + m(number);
             %This is for calcualting the next index posisiton 
             number = number +  sqrt(numel(m)) -1;
          end

       end
       
      %if right diagonal sum is not equal to the entry in the vector
      %of constants, then we know it is not magic. Return here. 
      if summation ~= matrix(1)
              return; 
      end
    
     %If this point in code is reached, then it must be a magic matrix. 
     number =1; 
     return; 
      
        
end


function random = randomMatrix(n)

    %Generating a random a matrix
     matrix =  (n^2)*rand(n); 
  
     for idx = 1:numel(matrix)
       
        %Looping through all the values, converting them to integers
        %properly
        matrix(idx) = uint16(matrix(idx)); 
      
     end 
    
    %return the matri
    random = matrix; 
end



function prob = probaMagic(n, mc_iter)
     
     %Starting at k=0, increment when it is a magic matrix
     k =0;
     for idx = 1:mc_iter
       
       %Everytime it is a magic mantrix, incremnet k
       if isMagic(randomMatrix(n))== 1
          k = k +1; 
       end
     end 
   
   % As specfiec by the assignment, this is the montecarlo method. 
   prob = k/mc_iter; 

end


