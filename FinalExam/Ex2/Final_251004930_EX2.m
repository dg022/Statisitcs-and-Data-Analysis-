%Name: David George
%Student Number: 251004930


%%
   %Testing function
   
   %String length is 0
   TestOneString ='';
   [TestOneNumber, TestOnePos] = find_pos_occ(TestOneString, 'a');
   if TestOneNumber == 0 & length(TestOnePos) ==0
      
       disp("Test One Passed")
       
   else 
       
       disp("Test One Failed")
      
   end
   
   %Two occurences of the character in posistion 2 and 11
   TestTwoString ='Hey My naMe is David!     ';
   [TestTwoNumber, TestTwoPos] = find_pos_occ(TestTwoString, 'e');
   if TestTwoNumber == 2 & TestTwoPos(1) ==2 & TestTwoPos(2) ==11
      
       disp("Test Two Passed")
       
   else 
       
       disp("Test Two Failed")
      
   end
   
   % 0 occurences of the character in the string
   TestThreeString ='xxxxxxxxxxxUxxxxxK';
   [TestThreeNumber, TestThreePos] = find_pos_occ(TestThreeString, 'F');
   if TestThreeNumber == 0 & length(TestThreePos) ==0
      
       disp("Test Three Passed")
       
   else 
       
       disp("Test Three Failed")
      
   end
   
   


%% Function


function [number pos] = find_pos_occ(x, find) 

%Algorithim:
% If the character vector has no length, return 0 occurances and an empty list
% Otherwise, iteratre through the string, checking each character in the
%string against the single character. If they equal eachother, increment
%number, save the index in the list called pos. Rertuen number and pos
%after iterating through the entire string. 


 number = 0;
 pos = [];
    
    %if the length of the string is 0, return default values
    if length(x) == 0
      return 
    end
    
    %This var will be incremented so as to add postions to the pos array
    count = 1;
    
    %Iterating over the length of the string
    for idx = 1:length(x)
       
       if x(idx) == find
           %Incrementing the number of found occurances
           number = number +1;
           %saving the index posistion of the found occurance in the pos
           %array
           pos(count) = idx;
           count = count + 1;
       end 
    end
end