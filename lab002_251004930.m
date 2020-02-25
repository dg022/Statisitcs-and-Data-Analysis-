%Name: David George
%Student Number: 251004930

%Excercise 1) 
    %Excercise a) 
    greetings("John", "Smith");


    %Excercise b) 
    disp(calc_id("John", "Smith"));

    %Excercise c) 
    greetings("John", "Smith");

%Excercise 2
   %part a) Using a for loop
    disp("Using the for loop to calcualte the fctorial, with an input of 5 the asnwer is"); 
        disp(myFactorial_for(5)); 
        
   % part b) using a while loop 
   
    disp("Using the while loop to calcualte the factorial, with an input of 5 the asnwer is"); 
         disp(myFactorial_while(5)); 
   
         
     disp("Checking mys asnwer with the inbuilt factorial method, from numbers 1-9 the result is"); 
     myFactorial_check(); 
     
     
   % Excercise 3  
   
       %This will count ht enumber of elemtns in a matrix 

        %Part a) 
        
           disp("Given some random matrix, the number of times the integer 3 showed was"); 
           disp(count_occurences(magic(10), 3)); 

         % Part b) 
         
            disp("A random matrix generated using random_matrix() is..."); 
            disp(random_matrix()); 


        % Part c) 
        
        disp("The number of times the integer 7 showed up in the matrix"); 
        disp(count_occurences(random_matrix(), 7)); 


         % Part d) 

         % This will ocunt the numbe rof smaller occurences
         
         disp("The number of integers that are smaller than 7 are..."); 
        disp(count_occurences_smaller(random_matrix(), 7)); 

     
     %Excercise 5  
     
        % All the following will be excercise   
        
        
        %part A) 
        
        % This will display the number of days in each month
        disp("This dispalys the daysInMonth() funciton"); 
        disp(daysInMonth(3)); 
        
        
        %part B) dayInYear(m,d) 
         disp("This dispalys the result o the day  Inyear funciton given an input of of 2, 20 "); 
        disp(dayInYear(2, 20)); 
        
        
        %Part C) 
        
         disp(dayInYear(7, 1)); 
          disp(dayInYear(3, 15)); 
           disp(dayInYear(11, 5)); 
           
           
        %Excercise 6
        
        
            % This will count the Number of integers between 25 adn 50
            
            disp(number_between_25_50()); 
            
        
        
        
      
            
     
     
     




%Functions for excercise 1

    %function a)
    function answer = greetings(FirstName, FamilyName)

    string =  strcat("Hello, ", FirstName, " ", FamilyName, "!", " How are you?");
    disp(string); 
    string = num2str(calc_id(FirstName, FamilyName));
    disp(strcat("Your id is: ", string)); 

    end

    %Funcntion b) 
    function number = calc_id(FirstName, FamilyName)

        string = strcat(FirstName, FamilyName); 
        chr = convertStringsToChars(string);

        chr = double(chr); 

        sum = 0; 
         for idx = 1:numel(chr)

             sum = sum + chr(idx); 

     end 
     
     number = sum; 
    end
    
%Functions for excercise 2
  %function a) 
  
      function number =  myFactorial_for(n)

        sum = 1;
        number =1;


        for idx = 1:n

           sum = sum*idx; 

        end  

        number = sum; 

      end 
  
  %Function b)
  
  function number =  myFactorial_while(n)

        sum = 1;
        fact = 1;
        i = 1; 


        while  i <= n

           fact = fact * i; 
           i = i +1; 

        end  

        number = fact; 

  end 
  

  % Function c_ 
  
   function number =  myFactorial_check()

        sum = 1;
        fact = 1;
        i = 1; 


        while  i <= 9

           if factorial(i) ~= myFactorial_while(i)
              
               string = num2str(i);
               disp(strcat("My while factorial function does not match with mat lab at value: ", string)); 
               return 
           end
           
           
           if factorial(i) ~= myFactorial_for(i)
              
               string = num2str(i);
               disp(strcat("My for factorial function does not match with mat lab at value: ", string));
               return; 
           end
               
               
           i = i +1; 

        end  

        disp("Every number from 1-9 matched with the matlab's factorial function");

   end 
  
   
   
   % Functions for excercise 3 
   
   
   
        %funciton a) 
        
        function number = count_occurences(M,x)
        
            sum = 0; 
        
         for idx = 1:numel(M)
        
            if M(idx) == x
               sum = sum+ 1; 
            end
      
         end 
         
         number = sum; 

        end
        
        
        %function b) 
        
        function matrix = random_matrix() 
        
        M = zeros(1000, 25);
        
        
        for idx = 1:numel(M) 
           
            M(idx) = randi([0 50]); 
            
  
        end
        
        
        
        matrix = M; 
        
        
        
        
        end
        
        
        
        
        
        %function d) 
        
        %This will count the number of smaller occurences
        
            function number = count_occurences_smaller(M,x)

            number = 0; 
            
              sum = 0; 
        
         for idx = 1:numel(M)
        
            if M(idx) < x
               sum = sum+ 1; 
            end
      
         end 
         
         number = sum; 



            end
            
            
            
       % Excercise 4
       
            %Function a) 
            
            function vector = secret_code(s) 
            
            
            % s is the vector of characters
            index = 1; 
            for character = s
                
                
                if character == 'a'
                    
                    s(index) = 'z'; 
                 
                end 
                
                 if character == 'e'
                    
                    s(index) = '%'; 
                 
                 end 
                
                  if character == 'f'
                    
                    s(index) = '%'; 
                 
                  end 
                
                   if character == 'i'
                    
                    s(index) = 'k'; 
                 
                   end 
                
                    if character == 't'
                    
                    s(index) = 'i'; 
                 
                    end 
                
                     if character == 'm'
                    
                    s(index) = 'i'; 
                 
                     end 
                     
                     
                       if character == 's'
                    
                    s(index) = '+'; 
                 
                       end 
                     
                       if character == 's'
                    
                    s(index) = '+'; 
                 
                       end 
                     
                  
                
                
              
                
            end
            
            
            vector = s; 
            
            
            end
                
            
     % Excercise 5 
     
            %part A) 
            
            
            function number = daysInMonth(m) 
            
            
            
            
                if m == 1
                    
                    number = 31;
                    return; 
                 
                end 
                
                  if m == 2
                    
                   number = 28;
                   return; 
                 
                  end 
                
                    if m == 3
                    
                     number = 31;
                   return; 
                 
                 
                    end 
                
                      if m == 4
                    
                      number = 30;
                          return; 
                 
                      end 
                  if m == 5
                    
                       number = 31;
                          return; 
                 
                 
                  end 
                  if m == 6
                    
                    number = 30;
                          return; 
                 
                  end 
                
                  
                    if m == 7
                    
                     number = 31;
                          return; 
                 
                    end 
               
                  if m == 8
                    
                    number = 31;
                          return; 
                 
                  end 
               
                
                    if m == 9
                    
                   number = 30;
                          return; 
                 
                    end 
               
                  if m == 10
                    
                    number = 31;
                          return;
                 
                  end 
                
                  
                  
                  if m == 11
                    
                  number = 30;
                          return;
                 
                  end 
               
               
                  
                  if m == 12
                    
                     number = 31;
                          return
                 
                end 

            
            end
            
            
            
            % Part B)
            
                function day = dayInYear(m, d)


                % You have to iterate over the ht enumebvr of days of the eyar
                % Then add the number of days 

                sum = 0; 
                for idx = 1:m-1

                    sum = sum + daysInMonth(idx); 



                end

                sum = sum + d; 

                day = sum; 




                end
            
            
         
        %Excercise 6
        
        
        function number = number_between_25_50()
        
        
             M = zeros(1, 30);


            for idx = 1:numel(M) 

                M(idx) = randi([1 100]); 


            end
            
            sum = 0; 
            
             for idx = 1:numel(M) 

                 if M(idx) <  50
                     
                     if M(idx) > 25
                         
                         sum = sum +1; 
                    
                     end
                    
                    
                end


             end
            
             
             number = sum; 
        
        
        
        end
                
        
        
        
        




