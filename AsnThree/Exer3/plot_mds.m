function plot_mds(Y, T)
scatter(Y(:,1), Y(:,2),200, 'filled')
alpha(0.3)
grid()

text(table2array(T(:,1)), table2array(T(:,2)), T.city, 'FontSize', 16);
end
