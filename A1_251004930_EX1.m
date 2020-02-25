%Name: David George
%Student Number: 251004930


%Excerse a)
    disp("Excervise a) Converting 43 degrees"); 
    temp = TempConvert(43); 
    disp(temp); 

%Exercisse b) 
    disp("Excervise B) ..."); 
    M = [6 1 5 5; 2 7 1 5; 6 3 6 7; 1 2 4 1]; 
    v= [1 1 1 1];

    %Product of Mv
        disp("The product of Matrix v product M is:"); 
        disp(v*M); 

    %Product of M (v transpose)
        disp("The product of Matrix M product traspose v is:"); 
        v = v.'; 
        disp(M*v); 

%Excercise c) 

    %Testing English 
    English = sayHello("english"); 
    disp(strcat("english was inputted, the output is: ", English));

    %Testing French 
    French = sayHello("french"); 
    disp(strcat("french was inputted, the output is: ", French));

    %Testing Spanish 
    Spanish = sayHello("spanish"); 
    disp(strcat("spanish was inputted, the output is: ", Spanish));

    %Testing Japanese
    Japanese = sayHello("japanese"); 
    disp(strcat("japanese was inputted, the output is: ", Japanese));

    %Testing Incorrect Input
    incorrect = sayHello("blahblah"); 
    disp(strcat("blahblah was inputted, the output is: ", incorrect));

  
 %Excercise D
    
    MatrixOne = [ 7 7 7 7 ; 1 2  4 7]; 
    disp("Test One: Matrix before function call");
    disp(MatrixOne); 
    TestOne =  Replace7with0(MatrixOne);
    disp("Test One: Matrix after function call");
    disp(TestOne); 
    
    MatrixTwo = [ 7 7 7 7 7 7 7 7  7 7 7 7 7 7 7 7  7 7 7 7 7 7 7 7 ]; 
    disp("Test Two: Matrix before function call");
    disp(MatrixTwo); 
    TestTwo =  Replace7with0(MatrixTwo);
    disp("Test Twp: Matrix after function call");
    disp(TestTwo); 

 %Excercise E
     x = 1.234;
     y = 0.0000096;
     res = x / y ;
     s = " A123 ";
     disp("Excercise E) Printing exacrlty whats shown on the assignment"); 
     fprintf("When x=%.3f and y=%.4d the method named%sgives %.2f", x, y, s, res)







%Function for Excercist a)
    function number = TempConvert(x)
       %covnverting temperature calcualtion as specfied in the assignment
        number = (5/9)*(x-32); 
    end

%Function for Excercist b)
    function response = sayHello(x)

        %Comparing the string with each case as specfied, and saying hello
        %in the correct language. 
        if  1 == strcmp("english",x)
            response = "Hello"; 

        elseif 1 == strcmp("french",x)
            response = "Bonjour"; 

        elseif 1 == strcmp("spanish",x)
            response = "Ola"; 

        elseif 1 == strcmp("japanese",x)
            response = "Konichiwa"; 
        else 
            response = "Incorrect output, try again"; 

        end 
    end

%Function for Excercist D)

    function matrix = Replace7with0(x)
        matrix = x; 
        %Iterating over the entire matrix
        for idx = 1:numel(matrix)
            
            %if the entry is 7, replace it with a 0
            if 7 == matrix(idx)
                matrix(idx) = 0; 
    
            end
        
        end 
    
    end

