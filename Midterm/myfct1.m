%% 
% This file defines the function `myfct1`
%

% The "function" line defines:
% - the name of the function (`myfct1`)
% - the name of the input variable (`x`)
% - the name of the output variable (`y`)
% Those names can be nearly anything!
%
function y = myfct1(x) 
fprintf("My input variable is %f\n",x);
a = 1;
y = x^2 + a;  
end   % <--- Ends the function definition









%% 

% move to new script named "myfct1b.m"
% at top to show 1st is called
function y = myfct1b(x) 
a = 3;      
b = a/10;
y = x^2 + b;
end
% Note that `a` in the function `myfct1b`
% has NO relation with `a` from function `myfct1`
% or any other `a` outside this function!!! 



function y = nosy_function(x)
    y = 9 + dummy(x);
end



function y = subfct1(x)
w = 2;
% t = avg([1 4]); <--- Cannot do that, avg is "private" inside "my_summary_stats"

% HERE, we can call ONLY `my_summary_stats` because 
% it is the main function of the script `my_summary_stats.m`
z = 10:20;
[the_avg,the_min,the_max] = my_summary_stats(z)

y = w*x;
end
