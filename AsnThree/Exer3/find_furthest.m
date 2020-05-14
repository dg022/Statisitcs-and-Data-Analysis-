function T = find_furthest(Y, names, nf)

% For convenience, let's make a table:
tmp = array2table(Y);
tmp.city = names;

% Calculate "distance from origin" in order to
% identify easily the outlier cities:
tmp.d0 = tmp.Y1.^2 + tmp.Y2.^2;

% Number of outliers to identify:
tmp = sortrows(tmp, 4, 'descend');
tmp = tmp(1:nf,:);
T = tmp;
end
