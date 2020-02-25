% Import the data: 
dat = readtable("fertility.csv");



% Re-arrange the data in a tall format:
% The countries are from the 2nd column until the end.
	
ncol = size(dat, 2);
dat_tall = stack(dat, 2:ncol, ...
                'NewDataVariableName','fertility_rate',...
                'IndexVariableName','country');
            
dat_recent = dat_tall(dat_tall.year >= 1990,:);

T = dat_recent;

% Remove the variable `year` before the summary stats:
T.year = [];
ss = grpstats(T, ...
    {'country'}, {'mean', 'median', 'min', 'max'});
