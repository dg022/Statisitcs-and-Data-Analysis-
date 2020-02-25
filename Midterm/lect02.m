%
% LECTURE 02
%
% DATA TYPES
%


%% Numerical types

% First, let's clear the "Workspace"
% that is we delete everything (if any) that
% was stored in memory:
clear  % <-- this is a "keyword" of Matlab language

% Let's store a numerical value in a variable:
x = 27;

% The command "class(x)" tells us what 
% type of data is "x":
the_type_for_x = class(x);


%%
% Looking at the "Workspace" window we see that
% MATLAB automatically assign a "double".
% This is a safe choice, but expensive in terms of memory.

% We can "force" the "integer" type:
x_int8 = int8(27);

%% But be careful if you choose a type that 
% doesn't assign enough memory!!!
hugenumber_int8 = int8(271234567890);
disp("right here is what happens if you do not assign enoigh memory for a varible"); 
disp(hugenumber_int8);








