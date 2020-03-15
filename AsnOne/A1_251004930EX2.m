%Name: David George
%Student Number: 251004930

% Excercise a) Testing Fucntion 
    disp("For excercise A, testing values 1 2 and 3 in the funciton f(x) ");     
    disp(f(1)); 
    disp(f(2)); 
    disp(f(3)); 
    
% Excercise b) Testing rimensum calcualtor
   disp(" Excercise B:Testing the riemann sum for values (1, 3, 3), (2, 4, 6), (2, 8, 9)");     
   disp("Test One:"); 
   disp(riemann_sum(1, 3, 3));  
   disp("Test TWO:"); 
   disp(riemann_sum(2, 4, 6));  
    disp("Test Three:");
   disp(riemann_sum(2, 8, 9));  
   
 %Excercise c) Calculating the error
   disp(" Excercise C:Testing the error on the riemann sum for values (1, 3, 3), (2, 4, 6), (2, 8, 9)");       
   disp("Test One:"); 
   disp(error_integ(1, 3, 3));  
   disp("Test TWO:"); 
   disp(error_integ(2, 4, 6));  
   disp("Test Three:");
   disp(error_integ(2, 8, 9));  
   
 %Excercise e) Finding the largest value of the subpartition between -20,
 %20 ,that is accurate between 10^-9 
 
      disp(" Excercise E: Finding the max parition length, and rieman value with given accuracy(10^-9, -20, 20) ");       
      disp("Test One:"); 
      [delta,  riemanvalue] = integrate_acc(10^(-9), -20, 20);  
      disp("The largest value of the suppartition length, when accurate within 10^-9 when the limits are between -20 and 20 is...");
      disp(delta); 
      disp(riemanvalue); 

%Function for Excercist a)

    function number = f(x)
        %Funciton as specfied by the assignment
        number = exp(1)^(-x*x); 
    end
    
%Fucntion for Excercise b) Riemen Sum

    function number = riemann_sum(xmin, xmax, delta)
        sum = 0; 

            %Sum up over the entire range (xmin and xmax)
            for m = xmin:delta:xmax

                % Using the funciton from eariler to make the calcualtion 
                sum = sum+ f(m)*delta; 

            end 

          % The number retunred is the riemann_summ
          number = sum; 
    end
    
% Function for Excercise c) Error calcualtion
    
    function error =  error_integ(xmin, xmax, delta)

            % The error is the absolute value between the I and our
            % approximatio, using riemann_summ(xmin, xmax, delta) 
            error = abs( sqrt(pi) - riemann_sum(xmin, xmax, delta)); 
    end
    

% Function for Excercise D) 
    
     function [delta_value, Riemann_value]  = integrate_acc(accuracy, xmin, xmax)

              % This is the starting delta value, which will divided each time 
              % The accuracy is off 
             delta_value = 1; 

             %Initalising the  Riemann_value with a sentinel value
              Riemann_value = -1; 

            % Loop forever until error_integ is less than accuracy

            while(3>2)

                % Break out of infinite for loop if its  less than the accuracy
                %
                if error_integ(xmin, xmax, delta_value) < accuracy
                    break; 
                end

                % Keep diving the delta by 10, to make the error_integ smaller
                % and smaaller
                delta_value = delta_value - 0.001; 
            end 

                % This is Rieman_value at the given accuracy
               Riemann_value = riemann_sum(xmin, xmax, delta_value);  
    end
        
  


